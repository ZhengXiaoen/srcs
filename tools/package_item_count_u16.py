"""Archive verified candidates and all patch source without installing anything."""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import zipfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE_FILES = (
    "patch_item_count_u16.py", "build_count_pe_candidate.py",
    "patch_item_count_u16_db.py", "patch_item_count_u16_client.py",
    "package_item_count_u16.py", "item_count_u16_requirements.txt",
    "item_count_u16_db_preflight.sql", "item_count_u16_sites.json",
    "item_count_u16_tail_audit.json", "item_count_u16_range_guards.json",
    "item_count_u16_db_audit.json", "item_count_u16_client_audit.json",
    "item_count_u16_jumptable_audit.json", "test_item_count_u16_fragments.py",
    "test_item_count_u16_native.py", "test_item_count_u16_paging.py",
    "test_item_count_u16_ranges.py", "test_item_count_u16_client_auction.py",
    "test_item_count_u16_allocation.py", "verify_item_count_u16_current.py",
    "test_count_builder_unwind.py", "verify_count_helpers_unwind.py",
    # Existing project parsers; importing these does not invoke their CLI.
    "patch_bag_client.py", "patch_drop_pickup_retry.py",
    "patch_god_equip_state.py", "patch_guild_quest_config.py", "patch_box_stacking.py",
)
EVIDENCE_FILES = (
    "patch-evidence.json", "verification.json", "client-candidate-evidence.json",
    "native-core-tests.json", "native-paging-tests.json", "native-range-tests.json",
    "client-auction-verification.json", "windows-unwind-evidence.json",
    "native-allocation-tests.json", "current-version-verification.json",
)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def read_json(path):
    return json.loads(path.read_text(encoding="utf-8"))


def checked(condition, message):
    if not condition:
        raise ValueError(message)


def package(root, candidate, destination):
    root, candidate, destination = root.resolve(), candidate.resolve(), destination.resolve()
    checked(candidate != root and root not in candidate.parents,
            "Candidate must be isolated outside the deployed project")
    checked(destination.suffix.lower() == ".zip", "Output must be a ZIP file")
    evidence = read_json(candidate / "patch-evidence.json")
    verification = read_json(candidate / "verification.json")
    checked(evidence["deployable"] is False and evidence["capacity"] == 65535
            and evidence["stack_limit"] == 9999, "Unexpected candidate status or limits")
    runtime_files = dict(evidence["client"]["files"])
    for name, relative in (("logic", "Server/S1001/x64/LogicServerCQ64_R.exe"),
                           ("db", "Server/common/x64/DBServer64_R.exe")):
        manifest = evidence[name]
        checked(sha((root / relative).read_bytes()) == manifest["original_sha256"],
                "Current project input changed: " + relative)
        runtime_files[relative] = manifest["candidate_sha256"]
    checked(sha((root / "web/GameFrame.swf").read_bytes())
            == evidence["client"]["swf_before_sha256"], "Current SWF input changed")
    checked(len(runtime_files) == 15, "Expected 15 matching runtime/configuration files")
    logic_sha = evidence["logic"]["candidate_sha256"]
    client_sha = evidence["client"]["swf_after_sha256"]
    for section, expected in (("core", 52), ("paging", 111), ("ranges", 36), ("allocation", 105)):
        result = verification[section]
        checked(result["sha256"] == logic_sha and result["case_count"] == expected,
                "Incorrect verification target or count: " + section)
        standalone = read_json(candidate / ("native-" + ("range" if section == "ranges" else section) + "-tests.json"))
        checked(standalone == result, "Standalone evidence differs: " + section)
    checked(verification["fragments"]["status"] == "passed"
            and verification["fragments"]["vectors"] == 4628
            and verification["fragments"]["source_sha256"] == evidence["logic"]["original_sha256"],
            "Quantity fragment evidence does not match")
    db_tests = evidence["db_tests"]
    checked(db_tests["test_vectors"] == 216
            and all(row["status"] == "passed" for row in db_tests["results"]),
            "DB fragment checks did not pass")
    checked(read_json(candidate / "client-candidate-evidence.json") == evidence["client"],
            "Client candidate evidence differs")
    auction = verification["client_auction"]
    checked(auction["native_candidate_sha256"] == logic_sha
            and auction["client_candidate_sha256"] == client_sha
            and auction["native_replay_cases"] == 14
            and auction["avm2_high_byte_values"] == 65536
            and auction["avm2_stack_balanced"] is True, "Client/auction checks do not match")
    standalone_auction = read_json(candidate / "client-auction-verification.json")
    checked({k: v for k, v in standalone_auction.items() if k != "native_boundaries"} == auction,
            "Standalone auction evidence differs")
    unwind = verification["windows_unwind"]
    checked(unwind["total_boundaries"] >= 2145 and unwind["image_executed"] is False,
            "Unwind evidence does not match")
    for name in ("logic", "db"):
        checked(unwind["targets"][name]["candidate_sha256"] == evidence[name]["candidate_sha256"]
                and unwind["targets"][name]["status"] == "passed", "Unwind target differs")
    checked(read_json(candidate / "windows-unwind-evidence.json") == unwind,
            "Standalone unwind evidence differs")
    table = read_json(root / "tools/item_count_u16_jumptable_audit.json")
    checked(table["candidate_sha256"] == logic_sha and table["blocks"] == len(evidence["logic"]["blocks"])
            and not table["jump_table_middle_targets"]
            and not table["rip_or_immediate_code_address_middle_references"],
            "Indirect branch audit does not match")

    entries = {}
    inventory = []
    for relative, digest in sorted(runtime_files.items()):
        path = Path(relative)
        checked(not path.is_absolute() and ".." not in path.parts, "Invalid runtime path")
        data = (candidate / path).read_bytes()
        checked(sha(data) == digest, "Candidate fingerprint changed: " + relative)
        entries["candidate/" + path.as_posix()] = data
        inventory.append(dict(path=path.as_posix(), bytes=len(data),
                              original_sha256=sha((root / path).read_bytes()),
                              candidate_sha256=digest))
    for name in EVIDENCE_FILES:
        entries["candidate/" + name] = (candidate / name).read_bytes()
    for name in SOURCE_FILES:
        entries["tools/" + name] = (root / "tools" / name).read_bytes()
    entries["README.md"] = (root / "物品数量扩容补丁.使用说明.md").read_bytes()
    manifest = dict(format_version=1, deployable=False, capacity=65535, stack_limit=9999,
                    runtime_validation="save/relogin, startup, database and gameplay integration not performed",
                    install_mode="cold start; all 15 candidate runtime/configuration files together",
                    files=inventory, verification=dict(native_functional_cases=304,
                    quantity_fragment_vectors=4628, db_fragment_vectors=216,
                    auction_cases=14, client_values=65536, windows_unwind_boundaries=unwind["total_boundaries"]))
    entries["delivery-manifest.json"] = json.dumps(manifest, ensure_ascii=False, indent=2).encode("utf-8")
    checksums = {name: sha(data) for name, data in sorted(entries.items())}
    entries["SHA256SUMS.json"] = json.dumps(checksums, ensure_ascii=False, indent=2).encode("utf-8")
    destination.parent.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(destination, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9) as archive:
        for name, data in sorted(entries.items()):
            info = zipfile.ZipInfo(name, date_time=(2026, 10, 12, 0, 0, 0))
            info.compress_type = zipfile.ZIP_DEFLATED
            info.external_attr = 0o100644 << 16
            archive.writestr(info, data, compresslevel=9)
    # Verify the actual saved archive, including every decompressed byte.
    with zipfile.ZipFile(destination) as archive:
        checked(archive.testzip() is None and set(archive.namelist()) == set(entries),
                "Archive integrity check failed")
        for name, digest in checksums.items():
            checked(sha(archive.read(name)) == digest, "Archive entry changed: " + name)
    zip_digest = sha(destination.read_bytes())
    destination.with_suffix(".zip.sha256").write_text(
        zip_digest + "  " + destination.name + "\n", encoding="utf-8", newline="\n")
    return dict(path=str(destination), sha256=zip_digest, bytes=destination.stat().st_size,
                entries=len(entries), runtime_files=len(inventory), deployable=False)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--project-root", type=Path, default=ROOT)
    parser.add_argument("--candidate-dir", type=Path, required=True)
    parser.add_argument("--zip", type=Path, required=True, dest="destination")
    args = parser.parse_args()
    print(json.dumps(package(args.project_root, args.candidate_dir, args.destination), ensure_ascii=False))


if __name__ == "__main__":
    main()
