"""Route the existing cross-activity buttons to the local game server."""
import argparse

from patch_activity_entries import CLIENT, q, relocate
from patch_appearance_upgrade import inspect_abc
from patch_auto_medicine_frequency import Block
from patch_drop_pickup_retry import abc_section
from patch_merge_feature_gates import assemble, replace_body


# pushshort preserves the unsigned system ID 151 on the operand stack.
SERVICE_COMMAND = q(0x25, 151) + bytes((0x24, 101))


def patch_swf(source):
    data, (_, _, a, b) = abc_section(source)
    original = data[a:b]
    names, classes, bodies = inspect_abc(original)
    symbols = {
        10883: "PacketTypes", 35929: "Service", 10968: "ClientPacketTypes",
        37056: "Service_signUp", 37057: "Service_return", 3227: "writeCmd",
        43439: "writeByte", 1507: "GlobalData", 31206: "serviceWarDataMgr",
        3329: "serviceType", 7279: "kuafuYabiaoPanel", 7308: "_activeQuestPanelToggle2",
        1576: "parent", 1869: "removeChild", 1560: "GameNavigator",
        1506: "GameNavigateType", 31014: "Win_KuaFyaBiao", 31015: "Win_KuaFyaBiaoSucces",
        31816: "hideWin", 20059: "_tempIndex", 31301: "isSpaning",
    }
    if any(names[i] != expected for i, expected in symbols.items()):
        raise ValueError("Unexpected cross activity symbols")

    abc = original
    allowed = set()

    def update(class_name, kind, name, transform, min_stack=0):
        nonlocal abc
        mid = classes[class_name][kind][name][0]
        start, size, limits = inspect_abc(abc)[2][mid]
        code = abc[start:start + size]
        result, move = transform(code)
        if result != code:
            limits = (max(min_stack, limits[0]), *limits[1:])
            abc = replace_body(abc, mid, result, limits, move)
        allowed.add(mid)

    def local_command(code, name):
        command = q(0x4f, 3227, 2)
        old = q(0x60, 10883) + q(0x66, 35929) + q(0x60, 10968) + q(0x66, name) + command
        new = SERVICE_COMMAND + command
        if name == 37057:
            # Sessions that actually changed servers still need the original return packet.
            exit_payload = b"\xd1\x24\x05" + q(0x4f, 43439, 1)
            block = Block()
            block.emit(q(0x60, 1507) + q(0x66, 31301))
            block.branch(0x12, "local")
            block.emit(b"\xd1" + old)
            block.branch(0x10, "send")
            block.label("local")
            block.emit(b"\xd1" + new + exit_payload)
            block.label("send")
            routed, _ = block.finish()
            if routed in code:
                return code, lambda offset: offset
            old = b"\xd1" + old
            new = routed
        elif code.count(new) == 1:
            return code, lambda offset: offset
        if code.count(old) != 1:
            raise ValueError("Unexpected cross activity command")
        start = code.index(old)
        return relocate(code, [(start, start + len(old), new)])

    update("ServiceWarCC", "static", "sendSignUp", lambda code: local_command(code, 37056))
    update("ServiceWarCC", "static", "sendReturnBackServer", lambda code: local_command(code, 37057))

    def reset_escort_panel(code):
        # Clear the escort panel on return to the main city in the same client session.
        if len(code) < 118 or code[:2] != b"\xd0\x30" or code[-1] != 0x47:
            raise ValueError("Unexpected escort panel handler")
        reset = Block()
        reset.emit(q(0x60, 1507) + q(0x66, 31206) + q(0x66, 3329))
        reset.branch(0x11, "done")
        panel = b"\xd0" + q(0x66, 7279)
        reset.emit(panel + q(0x66, 1576))
        reset.branch(0x12, "done")
        for child in (7279, 7308):
            reset.emit(b"\xd0\xd0" + q(0x66, child) + q(0x4f, 1869, 1))
        for window in (31014, 31015):
            reset.emit(q(0x60, 1560) + q(0x60, 1506) + q(0x66, window) + q(0x4f, 31816, 1))
        reset.label("done")
        block, _ = reset.finish()
        if code[2:2 + len(block)] == block:
            return code, lambda offset: offset
        if len(code) != 118:
            raise ValueError("Unexpected escort panel handler length")
        return relocate(code, [(2, 2, block)])

    update("GameScene", "instance", "onServiceType", reset_escort_panel)

    def escort_preview(code):
        # The four upper tiers share a deposit but grant different point amounts.
        tier = Block()
        for index, thousands in ((16, 8000), (15, 5000), (14, 2500), (13, 2000)):
            tier.emit(b"\xd2" + q(0x25, thousands) + q(0x25, 1000) + b"\xa2")
            tier.branch(0x15, f"below_{index}")
            tier.emit(bytes((0x24, index, 0xd7)))
            tier.branch(0x10, "done")
            tier.label(f"below_{index}")
        tier.emit(b"\x24\x0c\xd7")
        tier.label("done")
        replacement, _ = tier.finish()
        tail = b"\xd0\xd3" + q(0x68, 20059)
        if code.count(replacement + tail) == 1:
            return code, lambda offset: offset
        old = b"\x24\x0c\xd7"
        if code.count(old + tail) != 1:
            raise ValueError("Unexpected escort point preview")
        at = code.index(old + tail)
        return relocate(code, [(at, at + len(old), replacement)])

    update("ServiceWarYaSongPage", "instance", "fmtPowerIndex", escort_preview, min_stack=3)
    new_names, new_classes, new_bodies = inspect_abc(abc)
    if new_names != names or new_classes != classes or new_bodies.keys() != bodies.keys():
        raise ValueError("Client structure changed")
    for mid, (start, size, limits) in bodies.items():
        at, length, actual_limits = new_bodies[mid]
        if mid not in allowed and (limits != actual_limits or original[start:start + size] != abc[at:at + length]):
            raise ValueError(f"Unrelated client method changed: {mid}")
    return source if abc == original else assemble(source, abc)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    source = CLIENT.read_bytes()
    patched = patch_swf(source)
    if patch_swf(patched) != patched:
        raise ValueError("Client patch is not idempotent")
    if patched != source:
        if args.check:
            raise SystemExit("Local cross activity patch is missing")
        CLIENT.write_bytes(patched)
    print("Local cross activity client patch verified")
