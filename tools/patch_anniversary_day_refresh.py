"""Keep anniversary contents through midnight and activate only the selected page."""
from __future__ import annotations

import argparse

from patch_activity_entries import q
from patch_activity_reminders import Code, call, get, number, prop, put, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_super_anniversary import (CLIENT, abc_section, assemble, normalize,
                                    inspect_abc, instructions, bytecode_requirements)
from patch_anniversary_reopen import DISPLAY_IDS

METHODS = {22159, 22160, 22162, 22163, 22164}


def active_page():
    return prop(get(0), 23810) + prop(get(0), 23811) + q(0x66, 48308)


def select_page():
    c = Code(); c.add(b'\xd0\x30' + active_page() + put(2))
    # Resolve a valid page before changing the visible content. A retired nav
    # index must not hide the current page or stop its event listeners.
    c.add(call(get(0), 23817) + put(3))
    c.add(get(3)); c.branch(0x12, 'done')
    c.add(get(2)); c.branch(0x12, 'show')
    c.add(call(get(2), 3113, void=True))
    c.add(get(2) + get(3)); c.branch(0x13, 'show')
    c.add(get(2) + b'\x27' + q(0x61, 1832))
    c.label('show')
    c.add(get(0) + call(q(0x60, 42709), 43280, prop(get(0), 23809, 6136)) + q(0x68, 23811))
    # Attach/cache/position in createPage, show here, then activate. Methods
    # such as login infoBack and material setSelect can request data or throw;
    # they must never leave the selected content invisible.
    c.add(get(3) + b'\x26' + q(0x61, 1832))
    c.add(call(get(3), 3112, void=True) + call(get(3), 2070, void=True))
    c.label('done'); c.add(b'\x47')
    return c.finish()


def refresh_day():
    c = Code(); c.add(b'\xd0\x30' + prop(get(0), 23809, 6136) + put(2))
    listen = lambda add: call(prop(get(0), 23809), 13671 if add else 13672,
                             prop(q(0x60, 2), 39383), prop(get(0), 23815), void=True)
    c.add(listen(False))
    # Build navigation with the current saved selection; each window owns its
    # cache, so another instance consuming DAY_CHANGE cannot invalidate it.
    c.add(prop(get(0), 23809) + b''.join(number(i) for i in DISPLAY_IDS)
          + q(0x56, len(DISPLAY_IDS)) + q(0x61, 6138))
    c.add(call(prop(get(0), 23809, 6138), 43280, get(2)) + put(3))
    c.add(get(3) + number(0)); c.branch(0x18, 'select')
    c.add(number(0) + put(3))
    c.label('select'); c.add(prop(get(0), 23809) + get(3) + q(0x61, 6104))
    c.add(listen(True) + q(0x5e, 42708) + b'\x27' + q(0x61, 42708))
    c.add(call(q(0x60, 11028), 37584, number(0), number(2), void=True))
    c.add(call(q(0x60, 11028), 37584, number(0), number(8), void=True))
    c.add(call(get(0), 23815, b'\x20', void=True) + b'\x47')
    return c.finish()


def patch_swf(source):
    raw, (_, _, a, b) = abc_section(source)
    abc, positions = normalize(raw[a:b]); names, classes, bodies = inspect_abc(abc)
    if classes['YearActiveWin']['instance']['onChange'][0] != 22162:
        raise ValueError('Unexpected anniversary window methods')
    code = lambda mid: abc[bodies[mid][0]:sum(bodies[mid][:2])]
    changes = {22162: select_page(), 22163: refresh_day()}
    if code(22162) == changes[22162] and code(22163) == changes[22163]: return source
    added = code(22159)
    first_list = next(o.start for o in instructions(added) if o.opcode == 0xd0 and o.start > 13
                      and added[o.start:o.start + 5] == prop(get(0), 23809))
    # Stop reinitializing all cached pages before the window has chosen what
    # to show. Hidden pages stay inactive until the user selects them.
    changes[22159] = relocate(added, [(13, first_list, b'')])[0]
    for index in (2, 8):
        query = call(q(0x60, 11028), 37584, number(0), number(index), void=True)
        start = changes[22159].index(query)
        changes[22159] = relocate(changes[22159], [(start, start + len(query), b'')])[0]
    removed = code(22160)
    event = next(o.start for o in instructions(removed) if o.start > 33 and o.opcode == 0x60)
    c = Code(); c.add(active_page() + put(2))
    c.add(get(0) + number(-1) + q(0x68, 23811))
    c.add(get(2)); c.branch(0x12, 'done')
    c.add(call(get(2), 3113, void=True))
    c.label('done'); c.add(b'\x09')
    changes[22160] = relocate(removed, [(33, event, c.finish())])[0]
    create = code(22164); init = call(get(2), 3112, void=True)
    if create.count(init) != 1: raise ValueError('Unexpected page initialization')
    at = create.index(init)
    changes[22164] = relocate(create, [(at, at + len(init), b'')])[0]
    replacements = []
    for mid, updated in changes.items():
        start, size, limits = bodies[mid]
        required = bytecode_requirements(updated, names, limits[2])
        current = (max(limits[0], required[0]), max(limits[1], required[1]),
                   limits[2], max(limits[3], required[2]))
        r = ABCReader(abc); r.pos = start + size
        if r.u30(): raise ValueError('Unexpected window exception handlers')
        header = b''.join(encode_u30(v) for v in (mid, *limits, size))
        if abc[start - len(header):start] != header: raise ValueError('Unexpected window method header')
        value = b''.join(encode_u30(v) for v in (mid, *current, len(updated))) + updated + b'\0'
        replacements.append((start - len(header), r.pos, value))
    result = bytearray(abc)
    for lo, hi, value in sorted(replacements, reverse=True): result[lo:hi] = value
    _, _, after = inspect_abc(result)
    for mid, (start, size, limits) in bodies.items():
        now, length, current = after[mid]
        if mid not in METHODS and (limits != current or abc[start:start + size] != result[now:now + length]):
            raise ValueError(f'Unrelated method {mid} changed')
    restored = bytearray(result); shift = 0; undo = []
    for lo, hi, value in sorted(replacements):
        undo.append((lo + shift, lo + shift + len(value), abc[lo:hi])); shift += len(value) - (hi - lo)
    for lo, hi, value in reversed(undo): restored[lo:hi] = value
    if restored != abc: raise ValueError('Unrelated ABC metadata changed')
    for pos in positions: result[pos] = 0
    return assemble(source, bytes(result))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument('--check', action='store_true')
    args = parser.parse_args(); before = CLIENT.read_bytes(); after = patch_swf(before)
    if patch_swf(after) != after: raise ValueError('Non-idempotent midnight patch')
    if args.check:
        if before != after: raise ValueError('Anniversary midnight patch missing')
    elif before != after: CLIENT.write_bytes(after)
    print('Anniversary midnight cache and selected-page activation verified.')
