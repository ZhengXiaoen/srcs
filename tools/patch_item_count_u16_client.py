"""Matching client candidate for the version-locked Logic/DB uint16 patch.

Count high8 is encoded in the existing btReserve. Install only together with
the matching Logic/DB candidates after runtime validation. Copies are written
only beneath an explicitly selected output folder.
"""
from __future__ import annotations

import argparse
import importlib
import os
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
import struct
import sys
import zlib

_SUPPORT_DIRECTORY: Path | None = None
_SUPPORT_MODULES = {
    "patch_bag_client": ("ABCReader", "encode_u30"),
    "patch_drop_pickup_retry": ("instructions", "relocate"),
    "patch_guild_quest_config": ("read_cbp", "write_cbp", "read_pack", "write_pack"),
    "patch_box_stacking": ("server_items", "stack_limit", "DUP", "ITEM_BLOCK"),
}


def configure_dependencies(tools_dir: Path | str | None = None) -> Path:
    """Use sibling project tools, or an explicit argument/environment path.

    For a module placed inside project/tools, no configuration is needed.
    For a standalone temporary copy, call configure_dependencies(tools_dir)
    or set SRCS_PATCH_TOOLS_DIR before calling any patch/build function.
    Imports do not run the other patch scripts' main functions.
    """
    global _SUPPORT_DIRECTORY
    requested = tools_dir or os.environ.get("SRCS_PATCH_TOOLS_DIR")
    directory = Path(requested).resolve() if requested else Path(__file__).resolve().parent
    if _SUPPORT_DIRECTORY is not None:
        if directory != _SUPPORT_DIRECTORY:
            raise ValueError("Support directory cannot change within one loaded module")
        return directory
    for name in _SUPPORT_MODULES:
        if not (directory / (name + ".py")).is_file():
            raise ValueError("Required sibling project tools are missing; pass tools_dir "
                             "or set SRCS_PATCH_TOOLS_DIR: " + str(directory))
        previous = sys.modules.get(name)
        if previous is not None and Path(previous.__file__).resolve().parent != directory:
            raise ValueError("A different project support module is already imported: " + name)
    # Existing project support modules use unqualified sibling imports internally.
    # Prepending their verified common directory makes direct and package imports work.
    sys.path.insert(0, str(directory))
    loaded = {}
    for name, members in _SUPPORT_MODULES.items():
        module = importlib.import_module(name)
        if Path(module.__file__).resolve().parent != directory:
            raise ValueError("Support module resolved outside the selected directory")
        for member in members:
            loaded[member] = getattr(module, member)
    globals().update(loaded)
    _SUPPORT_DIRECTORY = directory
    return directory


def _ensure_support() -> None:
    if _SUPPORT_DIRECTORY is None:
        configure_dependencies()

INPUT_SHA256 = "e36673328f5324a57e038a3887757d3b38e048182de81a856c90497c702bd70c"
SUPPORTED_INPUT_SHA256 = {
    INPUT_SHA256,
    # Current client retains all four audited count method bodies unchanged.
    "6226c471fb93fd231cca330303a20a71cb5436646732f65c09d6f1de9f2611f8",
}
METHOD_SHA256 = {
    5252: "a65ecd4137d8c45e5348f78dc25e4f60ffc612163ad7e70737f9e6395336324f",
    14531: "65d4b02318e36a08c01875f3b8dd15f0a928a57aa56fcf8d1df89de7b8c2107d",
    14702: "b53fb761307995c6bf0f02238a30365e65f5f026cf9ea2c6c42c34231744766c",
    21134: "5968baa2d4b0ae58714e9e4aa3a5d1bebe0f67777e99379597d3dbab4c575a38",
}
STACK_LIMIT = 9999
Q = {"btCount": 6385, "readUnsignedByte": 43441, "readByte": 43492,
     "readUnsignedShort": 43481, "position": 13530}


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def inspect_abc_full(data: bytes) -> dict:
    """Read the entire ABC, retaining constructor/static method identities."""
    _ensure_support()
    r = ABCReader(data)
    r.skip(4)
    for _ in range(2):
        for _ in range(r.u30() - 1):
            r.u30()
    r.skip(8 * (r.u30() - 1))
    strings = [""]
    for _ in range(r.u30() - 1):
        size = r.u30()
        strings.append(data[r.pos:r.pos + size].decode("utf-8"))
        r.skip(size)
    for _ in range(r.u30() - 1):
        r.byte(); r.u30()
    for _ in range(r.u30() - 1):
        for _ in range(r.u30()):
            r.u30()
    names = [""]
    for _ in range(r.u30() - 1):
        kind = r.byte()
        if kind in (7, 13):
            r.u30(); name = r.u30()
        elif kind in (15, 16, 9, 14):
            name = r.u30()
            if kind in (9, 14):
                r.u30()
        elif kind in (17, 18):
            name = 0
        elif kind in (27, 28):
            r.u30(); name = 0
        elif kind == 29:
            base = r.u30()
            for _ in range(r.u30()):
                r.u30()
            names.append(names[base]); continue
        else:
            raise ValueError(f"Unsupported multiname {kind}")
        names.append(strings[name])
    for _ in range(r.u30()):
        count = r.u30(); r.u30()
        for _ in range(count):
            r.u30()
        r.u30(); flags = r.byte()
        if flags & 8:
            for _ in range(r.u30()):
                r.u30(); r.byte()
        if flags & 128:
            for _ in range(count):
                r.u30()
    for _ in range(r.u30()):
        r.u30()
        for _ in range(r.u30()):
            r.u30(); r.u30()

    def traits():
        result = {}
        for _ in range(r.u30()):
            name = r.u30(); attrs = r.byte(); kind = attrs & 15
            r.u30(); value = r.u30()
            if kind in (0, 6):
                if r.u30():
                    r.byte()
            elif kind in (1, 2, 3):
                result[names[name]] = value
            elif kind not in (4, 5):
                raise ValueError(f"Unsupported trait {kind}")
            if attrs & 64:
                for _ in range(r.u30()):
                    r.u30()
        return result

    count = r.u30(); classes = []; by_class = {}
    for _ in range(count):
        name = r.u30(); r.u30(); flags = r.byte()
        if flags & 8:
            r.u30()
        for _ in range(r.u30()):
            r.u30()
        init = r.u30(); methods = traits(); methods["<init>"] = init
        classes.append((names[name], methods))
        if names[name] in by_class and names[name] in {"UserItem", "StorageCC", "BagSplitItemBox", "ShopCC"}:
            raise ValueError("Class identity collision")
        by_class[names[name]] = methods
    for name, methods in classes:
        methods["<cinit>"] = r.u30(); methods.update(traits())
    for _ in range(r.u30()):
        r.u30(); traits()
    body_section = r.pos; bodies = {}
    for _ in range(r.u30()):
        record_start = r.pos; method = r.u30()
        limits = tuple(r.u30() for _ in range(4)); length_pos = r.pos
        size = r.u30(); start = r.pos; r.skip(size)
        exceptions = [tuple(r.u30() for _ in range(5)) for _ in range(r.u30())]
        body_traits_start = r.pos; traits(); end = r.pos
        if method in bodies:
            raise ValueError("Duplicate ABC method body")
        bodies[method] = dict(record_start=record_start, length_pos=length_pos,
                             start=start, size=size, end=end, limits=limits,
                             code=data[start:start + size], exceptions=exceptions,
                             body_traits=data[body_traits_start:end])
    if r.pos != len(data):
        raise ValueError("ABC did not parse completely")
    return dict(strings=strings, names=names, classes=by_class, bodies=bodies,
                body_section=body_section, prefix=data[:body_section])


def patch_abc(data: bytes) -> tuple[bytes, dict]:
    before = inspect_abc_full(data)
    for name, index in Q.items():
        if before["names"][index] != name:
            raise ValueError(f"Unexpected QName {name}")
    user = before["classes"]["UserItem"]["<init>"]
    storage = before["classes"]["StorageCC"]["doItemCountChange"]
    auction = before["classes"]["ShopCC"]["doAuctionItemInfoBack"]
    split = before["classes"]["BagSplitItemBox"]["onTextInput"]
    if (user, storage, auction, split) != (5252, 14531, 14702, 21134):
        raise ValueError("Client method identities changed")
    for method, digest in METHOD_SHA256.items():
        if sha(before["bodies"][method]["code"]) != digest:
            raise ValueError(f"Client code fingerprint changed: {method}")

    b = before["bodies"][user]
    if b["limits"] != (4, 7, 4, 5):
        raise ValueError("UserItem constructor limits changed")
    # Preserve count byte at offset 45 and every other serialized field.
    # At offset 128, replace the ignored reserve-byte skip with high-byte read.
    old = b"\xd1\xd1\x66" + encode_u30(Q["position"]) + b"\x24\x01\xa0\x61" + encode_u30(Q["position"])
    new = (b"\xd0\xd0\x66" + encode_u30(Q["btCount"]) +
           b"\xd1\x46" + encode_u30(Q["readUnsignedByte"]) +
           b"\x00\x24\x08\xa5\xa9\x61" + encode_u30(Q["btCount"]))
    if b["code"][584:595] != old or b["code"].count(old) != 1:
        raise ValueError("UserItem reserve-byte skip changed")
    edits = {user: [(584, 595, new)]}

    b = before["bodies"][storage]
    old = b"\x46" + encode_u30(Q["readUnsignedByte"]) + b"\x00"
    new = b"\x46" + encode_u30(Q["readUnsignedShort"]) + b"\x00"
    if b["code"][24:29] != old or b["limits"] != (4, 5, 3, 4):
        raise ValueError("Storage item-count reader changed")
    edits[storage] = [(24, 29, new)]

    # CGameStoreMgr.SendAuctionItemData writes ItemOPParam.wCount @+6.
    # The paired native candidate widens only that writer from BYTE to WORD.
    b = before["bodies"][auction]
    old = b"\x46" + encode_u30(Q["readByte"]) + b"\x00"
    new = b"\x46" + encode_u30(Q["readUnsignedShort"]) + b"\x00"
    if b["code"][32:37] != old or b["limits"] != (3, 2, 3, 4):
        raise ValueError("Auction item-count reader changed")
    if before["names"][3270] != "itemCount" or b["code"][37:40] != b"\x61" + encode_u30(3270):
        raise ValueError("Auction count target changed")
    edits[auction] = [(32, 37, new)]

    b = before["bodies"][split]; ops = instructions(b["code"])
    comparisons = [op for op in ops if op.opcode == 0x25 and op.operands == (249,)]
    strings = before["strings"]
    if strings.count("9999") != 1 or strings.count("249") != 1:
        raise ValueError("Expected unique preexisting split-limit strings")
    old_string = strings.index("249"); new_string = strings.index("9999")
    displays = [op for op in ops if op.opcode == 0x2c and op.operands == (old_string,)]
    if len(comparisons) != 1 or len(displays) != 1:
        raise ValueError("Split-window limit changed")
    edits[split] = [(comparisons[0].start, comparisons[0].end, b"\x25" + encode_u30(STACK_LIMIT)),
                    (displays[0].start, displays[0].end, b"\x2c" + encode_u30(new_string))]

    replacements = []; patched_methods = {}
    for method, changes in edits.items():
        b = before["bodies"][method]
        code, moved = relocate(b["code"], changes)
        exceptions = [(moved(a), moved(z), moved(t), kind, var)
                      for a, z, t, kind, var in b["exceptions"]]
        suffix = encode_u30(len(exceptions)) + b"".join(
            encode_u30(x) for row in exceptions for x in row) + b["body_traits"]
        replacements.append((b["length_pos"], b["end"], encode_u30(len(code)) + code + suffix))
        patched_methods[method] = dict(code=code, exceptions=exceptions)
    output = bytearray(data)
    for start, end, content in sorted(replacements, reverse=True):
        output[start:end] = content
    output = bytes(output); after = inspect_abc_full(output)
    if before["prefix"] != after["prefix"] or before["classes"] != after["classes"]:
        raise ValueError("Unrelated ABC constant pools/metadata/traits changed")
    if before["bodies"].keys() != after["bodies"].keys():
        raise ValueError("ABC method inventory changed")
    for method, original in before["bodies"].items():
        updated = after["bodies"][method]
        if original["limits"] != updated["limits"] or original["body_traits"] != updated["body_traits"]:
            raise ValueError("ABC method limits/traits changed")
        if method in patched_methods:
            expected = patched_methods[method]
            if updated["code"] != expected["code"] or updated["exceptions"] != expected["exceptions"]:
                raise ValueError("Candidate ABC code did not round-trip")
        elif original["code"] != updated["code"] or original["exceptions"] != updated["exceptions"]:
            raise ValueError("Unrelated ABC method changed")
    evidence = {str(m): dict(before_size=before["bodies"][m]["size"],
                            after_size=after["bodies"][m]["size"],
                            before_sha256=sha(before["bodies"][m]["code"]),
                            after_sha256=sha(after["bodies"][m]["code"])) for m in edits}
    return output, evidence


def swf_tags(source: bytes) -> tuple[bytes, list[tuple[int, bytes, bytes]]]:
    if source[:3] != b"CWS":
        raise ValueError("Expected zlib compressed SWF")
    data = source[:8] + zlib.decompress(source[8:])
    if len(data) != struct.unpack_from("<I", data, 4)[0]:
        raise ValueError("SWF uncompressed size mismatch")
    p = 8 + (5 + (data[8] >> 3) * 4 + 7) // 8 + 4
    prefix = data[:p]; tags = []
    while p < len(data):
        start = p; h = struct.unpack_from("<H", data, p)[0]; p += 2
        size = h & 63
        if size == 63:
            size = struct.unpack_from("<I", data, p)[0]; p += 4
        end = p + size
        if end > len(data):
            raise ValueError("Truncated SWF tag")
        tags.append((h >> 6, data[start:p], data[p:end])); p = end
    return prefix, tags


def patch_swf(source: bytes) -> tuple[bytes, dict]:
    if sha(source) not in SUPPORTED_INPUT_SHA256:
        raise ValueError("Candidate accepts only the audited client SHA-256")
    prefix, tags = swf_tags(source); output_tags = []; changes = 0; evidence = {}
    for kind, header, payload in tags:
        if kind != 82:
            output_tags.append(header + payload); continue
        start = payload.index(b"\0", 4) + 1
        abc, evidence = patch_abc(payload[start:]); changes += 1
        replacement = payload[:start] + abc
        output_tags.append(struct.pack("<HI", (82 << 6) | 63, len(replacement)) + replacement)
    if changes != 1:
        raise ValueError("Expected one DoABC tag")
    raw = prefix + b"".join(output_tags)
    raw = raw[:4] + struct.pack("<I", len(raw)) + raw[8:]
    result = raw[:8] + zlib.compress(raw[8:], 9)
    after_prefix, after_tags = swf_tags(result)
    if prefix[:4] + prefix[8:] != after_prefix[:4] + after_prefix[8:]:
        raise ValueError("Unrelated SWF header changed")
    if len(tags) != len(after_tags):
        raise ValueError("SWF tag inventory changed")
    for original, updated in zip(tags, after_tags):
        if original[0] != updated[0]:
            raise ValueError("SWF tag type changed")
        if original[0] != 82 and original != updated:
            raise ValueError("Unrelated SWF asset changed")
        if original[0] == 82:
            i = original[2].index(b"\0", 4) + 1
            if original[2][:i] != updated[2][:i]:
                raise ValueError("DoABC flags/name changed")
    return result, evidence


def patch_item_text(source: bytes, canonical: dict[int, int]) -> bytes:
    _ensure_support()
    before = server_items(source)
    def replace(match):
        item = int(match[1]); block = match[0]
        if canonical.get(item, 1) <= 1:
            return block
        return DUP.sub(lambda m: m[1] + b"9999" + m[3], block)
    output = ITEM_BLOCK.sub(replace, source); after = server_items(output)
    if before.keys() != after.keys():
        raise ValueError("Item IDs changed")
    for item, b in before.items():
        a = after[item]
        if canonical.get(item, 1) <= 1:
            if a != b:
                raise ValueError("Nonstackable item changed")
        elif stack_limit(a) != STACK_LIMIT or DUP.sub(rb"\1LIMIT\3", a) != DUP.sub(rb"\1LIMIT\3", b):
            raise ValueError("Unrelated item text field changed")
    return output


def patch_cbp(source: bytes, canonical: dict[int, int]) -> tuple[bytes, set[int]]:
    _ensure_support()
    header, tree = read_cbp(source); _, original = read_cbp(source); ids = set()
    for row in tree.children:
        item = int(row.child("id").number())
        if item in ids or item not in canonical:
            raise ValueError("Unexpected/duplicate client item ID")
        ids.add(item)
        if canonical[item] > 1:
            row.child("dup").set_number(STACK_LIMIT)
    for b, a in zip(original.children, tree.children):
        item = int(b.child("id").number())
        if canonical[item] > 1:
            b.child("dup").set_number(STACK_LIMIT)
        if b != a:
            raise ValueError("Unrelated CBP item field changed")
    output = write_cbp(header, tree)
    if read_cbp(output)[1] != tree:
        raise ValueError("CBP did not round-trip")
    return output, ids


def build_candidate(project_root: Path, output_root: Path, tools_dir: Path | str | None = None) -> dict:
    if tools_dir is not None:
        configure_dependencies(tools_dir)
    _ensure_support()
    project_root = project_root.resolve(); output_root = output_root.resolve()
    if output_root == project_root or project_root in output_root.parents:
        raise ValueError("Candidate output must be outside the deployed project")
    item_dir = project_root / "Server/S1001/data/config/item"
    canonical = {i: stack_limit(b) for i, b in server_items((item_dir / "StdItems.txt").read_bytes()).items()}
    resources = project_root / "web/v2/lang/zh-cn"
    outputs = {}; source_swf = (project_root / "web/GameFrame.swf").read_bytes()
    patched_swf, method_evidence = patch_swf(source_swf)
    outputs[Path("web/GameFrame.swf")] = patched_swf
    for path in [item_dir / "StdItems.txt", item_dir / "StdItems - 副本.txt",
                 *sorted((item_dir / "stdItemForClient").glob("StdItems*.txt"))]:
        source = path.read_bytes()
        if not ITEM_BLOCK.search(source):
            continue
        outputs[path.relative_to(project_root)] = patch_item_text(source, canonical)
    pack_path = resources / "zh-cn.dat"; source_pack = pack_path.read_bytes()
    entries = read_pack(source_pack); packed = dict(entries)
    if len(packed) != len(entries) or write_pack(entries) != source_pack:
        raise ValueError("Invalid language-pack round-trip")
    replacements = {}; all_seen = set()
    for path in sorted(resources.glob("stditems*.cbp")):
        source = path.read_bytes()
        if packed.get(path.name) != source:
            raise ValueError("Standalone/packed client resource mismatch")
        updated, seen = patch_cbp(source, canonical)
        replacements[path.name] = updated; all_seen |= seen
        outputs[path.relative_to(project_root)] = updated
    if all_seen != canonical.keys():
        raise ValueError("Client/server item inventory mismatch")
    updated_entries = [(name, replacements.get(name, content)) for name, content in entries]
    updated_pack = write_pack(updated_entries)
    if read_pack(updated_pack) != updated_entries:
        raise ValueError("Candidate language-pack did not round-trip")
    if any(a != b for a, b in zip(entries, updated_entries) if a[0] not in replacements):
        raise ValueError("Unrelated language-pack entry changed")
    outputs[pack_path.relative_to(project_root)] = updated_pack
    report = dict(deployable=False, reason="Matching Logic/DB/client candidates require runtime save/relogin validation before deployment",
                  count_encoding="low byte @45 + high byte in btReserve @128; serialized size stays 129",
                  capacity=65535, stack_limit=STACK_LIMIT,
                  server_items=len(canonical), stackable_items=sum(v > 1 for v in canonical.values()),
                  original_dup_distribution=dict(Counter(canonical.values())),
                  swf_before_sha256=sha(source_swf), swf_after_sha256=sha(patched_swf),
                  methods=method_evidence, language_pack_entries=len(entries),
                  unrelated_pack_entries_verified=len(entries) - len(replacements),
                  known_prior_config_mismatch_fixed={"6369": "server 200/client 1 -> both 9999"},
                  files={str(path): sha(data) for path, data in outputs.items()})
    for relative, data in outputs.items():
        target = output_root / relative; target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(data)
    output_root.mkdir(parents=True, exist_ok=True)
    (output_root / "client-candidate-evidence.json").write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    return report


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--project-root", type=Path, default=Path(os.environ.get("SRCS_PROJECT_ROOT", str(Path.cwd()))))
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--tools-dir", type=Path, help="Project tools directory; defaults to sibling tools or SRCS_PATCH_TOOLS_DIR")
    args = parser.parse_args()
    print(json.dumps(build_candidate(args.project_root, args.output_dir, args.tools_dir), ensure_ascii=False, indent=2))
