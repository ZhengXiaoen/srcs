"""Sync the equipment summon-strength rule in the packed client tooltip."""
from pathlib import Path

import patch_golden_boss_crit_tooltip as tooltip_patch
from patch_activity_entries import strings_of
from patch_drop_pickup_retry import abc_section


ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / "web/GameFrame.swf"
OLD_RULE = "单件装备最高附加6点召唤强度。"
NEW_RULE = "所有装备固定附加6点召唤强度。"


def main():
    source = CLIENT.read_bytes()
    data, (_, _, start, end) = abc_section(source)
    strings = strings_of(data[start:end])
    matches = [value for value in strings if OLD_RULE in value]
    if not matches and sum(NEW_RULE in value for value in strings) == 1:
        print("Fixed equipment summon-strength tooltip already updated")
        return
    if len(matches) != 1:
        raise ValueError("Expected one equipment summon-strength rule")
    tooltip_patch.ORIGINAL = matches[0]
    tooltip_patch.UPDATED = matches[0].replace(OLD_RULE, NEW_RULE)
    result = tooltip_patch.patch_swf(source)
    CLIENT.write_bytes(result)
    print("Updated the fixed +6 summon-strength rule; unrelated client content preserved")


if __name__ == "__main__":
    main()
