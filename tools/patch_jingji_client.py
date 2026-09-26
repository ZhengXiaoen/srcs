"""Keep the Jingji special-deal client prices aligned with the server config."""

from pathlib import Path

from patch_daily_recharge_client import read_cbp, read_pack, write_cbp, write_pack


# Client entries are zero based; server SpecilDeal entries are one based.
PRICES = [
    (1000, 700),    # 坐骑丹
    (1000, 700),    # 火龙结晶(小)
    (3000, 2100),   # 九龍珠
    (10000, 7000),  # 宝石结晶(1000)
    (10000, 7000),  # 圣珠结晶(1000)
    (10000, 7000),  # 特戒结晶(1)
    (1000, 700),    # 1级羽毛
    (750, 525),     # 神魂
    (1000, 700),    # 斗笠精华(小)
    (1000, 700),    # 戒灵粉尘(100)
    (10000, 7000),  # 元神丹(小)
    (5000, 3500),   # 转生修为丹(小)
]
ORIGINAL_PRICES = [
    (10000, 7000), (10000, 7000), (30000, 21000),
    (100000, 70000), (100000, 70000), (100000, 70000),
    (10000, 7000), (10000, 7000), (10000, 7000),
    (10000, 7000), (100000, 70000), (50000, 35000),
]


def main() -> None:
    directory = Path(__file__).resolve().parents[1] / "web/v2/lang/zh-cn"
    config_path = directory / "activityjingji.cbp"
    pack_path = directory / "zh-cn.dat"
    config = config_path.read_bytes()
    pack = pack_path.read_bytes()
    entries = read_pack(pack)
    if write_pack(entries) != pack:
        raise ValueError("Language pack did not round-trip")
    matches = [i for i, (name, data) in enumerate(entries)
               if name == config_path.name and data == config]
    if len(matches) != 1:
        raise ValueError("Packed and standalone activityjingji.cbp differ")

    header, root = read_cbp(config)
    deals = root.child("SpecilDeal").children
    if len(deals) != len(PRICES):
        raise ValueError("Unexpected Jingji deal count")
    for index, (deal, (money, need_money)) in enumerate(zip(deals, PRICES)):
        if deal.name != str(index):
            raise ValueError(f"Unexpected Jingji deal index: {deal.name}")
        old_money = deal.child("Money").number()
        old_need_money = deal.child("needMoney").number()
        if (old_money, old_need_money) not in (ORIGINAL_PRICES[index], (money, need_money)):
            raise ValueError(f"Unexpected prices for deal {index}")
        deal.child("Money").set_number(money)
        deal.child("needMoney").set_number(need_money)

    patched = write_cbp(header, root)
    read_cbp(patched)
    entries[matches[0]] = (config_path.name, patched)
    patched_pack = write_pack(entries)
    if read_pack(patched_pack)[matches[0]][1] != patched:
        raise ValueError("Patched language pack is inconsistent")
    config_path.write_bytes(patched)
    pack_path.write_bytes(patched_pack)


if __name__ == "__main__":
    main()
