"""Replay complete AddItem allocation failures and capacity limits offline.

Uses the candidate's actual x64 AddItem and overlap traversal. Allocator,
container pointer operations, notification methods and property setup use
the existing controlled Machine model; no server or database is started.
"""
import argparse
import hashlib
import json
import random
import struct
import sys
from pathlib import Path

if '--deps' in sys.argv:
    sys.path.insert(0, str(Path(sys.argv[sys.argv.index('--deps') + 1]).resolve()))
from test_item_count_u16_native import (
    BASE, HEAP, STOP, Machine, UC_X86_REG_R8, UC_X86_REG_RSP, unpack, unchanged,
)


class AllocationMachine(Machine):
    def __init__(self, binary):
        self.allocation_failures = 0
        self.completion_notifications = []
        super().__init__(binary)

    def hook(self, machine, address, size, data):
        if address == BASE + 0xa1060:
            if self.allocfail is not None and self.allocated >= self.allocfail:
                self.allocation_failures += 1
        # Machine installs each vtable entry as STOP + 0x100 + its offset.
        if address == STOP + 0x150:
            stack = machine.reg_read(UC_X86_REG_RSP)
            self.completion_notifications.append({
                "accepted": machine.reg_read(UC_X86_REG_R8),
                "last_item": unpack(self.read(stack + 0x28, 8)),
            })
        super().hook(machine, address, size, data)


def replay(binary, total, targets, free, fail_after=None, binding=5, dup=200):
    model = AllocationMachine(binary)
    model.u.mem_write(model.std + 0x31, bytes([dup]))
    existing = [(model.add(value, index + 1, binding), value)
                for index, value in enumerate(targets)]
    saved = {address: model.read(address, 129) for address, _ in existing}
    model.freegrids = free
    model.allocfail = fail_after
    parameter = HEAP + 0x7000
    fields = bytearray(36)
    fields[2:4] = struct.pack("<H", 1000)
    fields[4] = binding
    fields[6:8] = struct.pack("<H", total)
    model.u.mem_write(parameter, bytes(fields))

    returned = model.run(0x2a63f0, model.container, parameter, 0, 0, 0)
    per_grid = 9999 if dup > 1 else 1
    overlap_capacity = sum(per_grid - value for value in targets) if dup > 1 else 0
    overlap = min(total, overlap_capacity)
    allocation_limit = free if fail_after is None else min(free, fail_after)
    expected = overlap + min(total - overlap, allocation_limit * per_grid)
    assert returned == expected, (total, targets, free, fail_after, returned, expected)
    active_counts = [model.count(address) for address in model.items.values()]
    actual_added = sum(active_counts) - sum(targets)
    assert actual_added == returned
    assert 0 <= returned <= total
    assert actual_added + (total - returned) == total
    assert all(1 <= value <= per_grid for value in active_counts)
    assert len(model.items) - len(targets) <= free
    assert model.freegrids >= 0
    assert model.read(parameter, 36) == bytes(fields), "Requested count/attributes changed"
    assert not model.destroyed, "Inserted AddItem item was unexpectedly destroyed"
    for address, _ in existing:
        unchanged(saved[address], model.read(address, 129))
    for address in model.items.values():
        assert model.read(address + 0x2e, 1)[0] == binding
        assert unpack(model.read(address + 8, 2)) == 1000

    allocations = [call[1] for call in model.calls if call[0] == "AllocateItem"]
    assert all(address in model.items.values() for address in allocations)
    needs_failed_allocation = (fail_after is not None and fail_after < free
                               and total - overlap > fail_after * per_grid)
    assert model.allocation_failures == int(needs_failed_allocation)
    assert len(model.completion_notifications) == 1
    notification = model.completion_notifications[0]
    assert notification["accepted"] == returned
    assert notification["last_item"] == (allocations[-1] if allocations else 0)
    return {
        "requested": total, "existing_counts": targets, "free_grids": free,
        "allocation_fail_after": fail_after, "allocation_failure_reached": needs_failed_allocation,
        "binding": binding, "stack_limit": per_grid, "accepted": returned,
        "unaccepted": total - returned, "active_counts": active_counts,
        "completion_last_item_preserved": True, "quantity_conserved": True,
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--deps", type=Path)
    parser.add_argument("--binary", type=Path, required=True)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    results = []
    for total in (255, 256, 9999, 10000, 65535):
        for fail in (0, 1, 3):
            results.append(replay(args.binary, total, [], 7, fail))
        for free in (0, 1, 2, 6, 7):
            results.append(replay(args.binary, total, [], free))
    for targets in ([9998], [255, 256], [1, 255, 256, 9998], [9999]):
        for fail in (0, 1, 3):
            results.append(replay(args.binary, 65535, targets, 7, fail))
        results.append(replay(args.binary, 65535, targets, 0))
    for binding in (0, 1, 2, 5, 255):
        results.append(replay(args.binary, 65535, [9998], 7, 1, binding))
    for total, free, fail in ((3, 1, None), (10, 7, 0), (10, 7, 1), (10, 7, 3)):
        results.append(replay(args.binary, total, [], free, fail, dup=1))
    randomizer = random.Random(19999)
    for _ in range(40):
        results.append(replay(
            args.binary, randomizer.randrange(1, 65536),
            [randomizer.randrange(1, 10000) for _ in range(randomizer.randrange(5))],
            randomizer.randrange(8), randomizer.choice((None, 0, 1, 3)),
        ))
    report = {
        "binary": str(args.binary.resolve()),
        "sha256": hashlib.sha256(args.binary.read_bytes()).hexdigest(),
        "case_count": len(results), "tests": results,
        "status": "passed",
        "execution": "Complete candidate AddItem x64 code under Unicorn; no server process started",
        "limitations": [
            "Allocator returns fresh synthetic GUIDs or null; real allocator failure frequency is unknown",
            "Container insertion always succeeds; insertion failure and real notification side effects are not modeled",
            "Unaccepted units are verified against the returned accepted count; caller award retry policy is not executed",
            "No real database transaction, save, restart or client session is exercised",
        ],
    }
    if args.output:
        args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps({"case_count": len(results), "sha256": report["sha256"]}))


if __name__ == "__main__":
    main()
