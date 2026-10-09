"""Keep original native templates intact and apply per-BOSS overrides at load."""
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
path=ROOT/'Server/S1001/data/config/monster/StdMonster.txt'
patch=b'''\n-- BOSS equipment override; shared templates remain unchanged.\ndo\n    local LocalDT = {}\n--#include "BossEquipmentDropCfg.lua"\n    for _, monster in ipairs(StdMonster) do\n        local rule = LocalDT.BossEquipmentDrop.monsters[monster.entityid]\n        if rule then\n            for _, index in ipairs(rule.disabled) do\n                monster.drops[index].propability = 0\n            end\n        end\n    end\nend\n'''
source=path.read_bytes()
if patch not in source:path.write_bytes(source+patch)
path=ROOT/'Server/S1001/data/config/monster/AdvanceMonsterEquipCfg.lua'
patch=b'''\n-- Add the same existing equipment IDs as the client BOSS award preview.\ndo\n    local LocalDT = {}\n--#include "BossEquipmentPreviewCfg.lua"\n    for _, monster in ipairs(AdvanceMonsterEquipCfg) do\n        for _, awards in ipairs(monster.awards or {}) do\n            for _, id in ipairs(LocalDT.BossEquipmentPreview[monster.id] or {}) do\n                local present = false\n                for _, item in ipairs(awards) do if item.id == id then present = true; break end end\n                if not present then table.insert(awards, {type=0, id=id, count=1, bind=0}) end\n            end\n        end\n    end\nend\n'''
source=path.read_bytes()
if patch not in source:path.write_bytes(source+patch)
