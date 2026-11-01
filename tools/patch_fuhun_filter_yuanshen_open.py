"""Exclude immortal equipment from soul lists and open the spirit tab on day 8."""
import argparse

from patch_activity_entries import q
from patch_activity_reminders import relocate
from patch_appearance_upgrade import inspect_abc
from patch_auto_medicine_frequency import Block
from patch_drop_pickup_retry import abc_section, instructions
from patch_fuhun_all import CLIENT
from patch_merge_feature_gates import assemble, replace_body


def patch_swf(source):
    data, (_, _, a, b) = abc_section(source)
    original = data[a:b]
    abc = original
    names, classes, bodies = inspect_abc(abc)
    symbols = {'StdItemType': 14262, 'stdItem': 6407, 'type': 6015,
               'isXianZhuangEquip': 40396, 'push': 43315,
               'GlobalFunc': 1561, 'sectionOpenDays': 31840}
    if any(names[index] != name for name, index in symbols.items()):
        raise ValueError('Unexpected client symbol table')
    mid = classes['EquipBoostFuHunPage']['instance']['getEquips'][0]
    start, size, limits = bodies[mid]
    code = abc[start:start + size]
    guards = [o for o in instructions(code) if o.opcode == 0x46 and
              o.operands == (symbols['isXianZhuangEquip'], 1)]
    if not guards:
        push = b'\xd1\xd3' + q(0x4f, symbols['push'], 1)
        positions = [o.start for o in instructions(code) if code[o.start:o.start + len(push)] == push]
        if len(positions) != 4:
            raise ValueError('Unexpected soul equipment list paths')
        block = Block()
        block.emit(q(0x60, symbols['StdItemType']) + b'\xd3' + q(0x66, symbols['stdItem'])
                   + q(0x66, symbols['type']) + q(0x46, symbols['isXianZhuangEquip'], 1))
        block.branch(0x11, 'done')
        block.emit(push)
        block.label('done')
        guarded, _ = block.finish()
        updated, moved = relocate(code, [(pos, pos + len(push), guarded) for pos in positions])
        abc = replace_body(abc, mid, updated, limits, moved)
    elif len(guards) != 4:
        raise ValueError('Incomplete soul immortal equipment filter')

    _, _, bodies = inspect_abc(abc)
    mid = classes['PropertyRoleEquipPage']['instance']['initEvent'][0]
    start, size, limits = bodies[mid]
    code = abc[start:start + size]
    predicate = q(0x60, symbols['GlobalFunc']) + q(0x66, symbols['sectionOpenDays'])
    old = predicate + b'\x24\x0e\xb0'
    new = predicate + b'\x24\x08\xb0'
    # The earlier day-14 expression belongs to ornaments. The last one gates
    # the spirit tab and is followed by the unchanged four-turn requirement.
    positions = [o.start for o in instructions(code)
                 if code[o.start:o.start + len(predicate)] == predicate]
    if not positions:
        raise ValueError('Spirit tab opening gate not found')
    pos = positions[-1]
    if not any(o.opcode == 0x60 and names[o.operands[0]] == '_yuanShen'
               for o in instructions(code) if pos < o.start < pos + 100):
        raise ValueError('Unexpected spirit tab gate position')
    if code[pos:pos + len(old)] == old:
        updated, moved = relocate(code, [(pos, pos + len(old), new)])
        abc = replace_body(abc, mid, updated, limits, moved)
    elif code[pos:pos + len(new)] != new:
        raise ValueError('Spirit tab opening gate not found')

    after_names, after_classes, after_bodies = inspect_abc(abc)
    if names != after_names or classes != after_classes:
        raise ValueError('Client constants or class traits changed')
    allowed = {classes['EquipBoostFuHunPage']['instance']['getEquips'][0],
               classes['PropertyRoleEquipPage']['instance']['initEvent'][0]}
    _, _, before_bodies = inspect_abc(original)
    for mid, (at, size, limits) in before_bodies.items():
        nat, nsize, nlimits = after_bodies[mid]
        if mid not in allowed and (limits != nlimits or original[at:at + size] != abc[nat:nat + nsize]):
            raise ValueError(f'Unrelated client method changed: {mid}')
    return source if abc == original else assemble(source, abc)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    source = CLIENT.read_bytes()
    updated = patch_swf(source)
    if patch_swf(updated) != updated:
        raise ValueError('Client patch is not idempotent')
    if args.check:
        if source != updated:
            raise SystemExit('Client soul filter and spirit gate patch is not installed')
    elif updated != source:
        CLIENT.write_bytes(updated)
    print('Soul immortal filter and day-8 spirit tab verified')
