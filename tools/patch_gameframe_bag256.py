"""Rebuild GameFrame.swf with a 256-slot backpack using RABCDAsm 1.18."""

import argparse
import shutil
import subprocess
import tempfile
from pathlib import Path


def replace_once(source: str, old: str, new: str, description: str) -> str:
    count = source.count(old)
    if count != 1:
        raise ValueError(f"{description}: expected one match, found {count}")
    return source.replace(old, new, 1)


def patch_class(source: str) -> str:
    source = replace_once(
        source,
        'findproperty        QName(PackageNamespace(""), "MAX_VOLUME")\n'
        '    pushbyte            72\n'
        '    initproperty        QName(PackageNamespace(""), "MAX_VOLUME")',
        'findproperty        QName(PackageNamespace(""), "MAX_VOLUME")\n'
        '    pushshort           256\n'
        '    initproperty        QName(PackageNamespace(""), "MAX_VOLUME")',
        "backpack capacity initializer",
    )
    source = replace_once(
        source,
        '"MAX_VOLUME") slotid 1 type QName(PackageNamespace(""), "int") value Integer(72)',
        '"MAX_VOLUME") slotid 1 type QName(PackageNamespace(""), "int") value Integer(256)',
        "backpack capacity constant",
    )
    source = replace_once(
        source,
        'findproperty        QName(PackageNamespace(""), "ROW_COUNT")\n'
        '    pushbyte            9\n'
        '    initproperty        QName(PackageNamespace(""), "ROW_COUNT")',
        'findproperty        QName(PackageNamespace(""), "ROW_COUNT")\n'
        '    pushbyte            32\n'
        '    initproperty        QName(PackageNamespace(""), "ROW_COUNT")',
        "backpack row initializer",
    )
    source = replace_once(
        source,
        '"ROW_COUNT") slotid 2 type QName(PackageNamespace(""), "int") value Integer(9)',
        '"ROW_COUNT") slotid 2 type QName(PackageNamespace(""), "int") value Integer(32)',
        "backpack row constant",
    )

    start = source.index('  trait method QName(PackageNamespace(""), "setBagData")')
    end = source.index('  trait method QName(PrivateNamespace(null, "view.game.backpack:BackPackWin"), "updateLockPanelStatus")', start)
    method = source[start:end]
    method = replace_once(
        method,
        '      pushbyte            8\n      setlocal            11',
        '      pushbyte            0\n      setlocal            11',
        "disable obsolete VIP5 tail lock",
    )
    method = replace_once(
        method,
        '      pushbyte            16\n      setlocal            11',
        '      pushbyte            0\n      setlocal            11',
        "disable obsolete VIP6 tail lock",
    )
    method = replace_once(
        method,
        '      getlocal            11\n      iflt                L79\n\n      getlocal1',
        '      getlocal            11\n      iflt                L79\n\n'
        '      getlex              QName(PackageNamespace("common"), "GlobalData")\n'
        '      getproperty         QName(PackageNamespace(""), "role")\n'
        '      getproperty         QName(PackageNamespace(""), "bagGridCount")\n'
        '      convert_i\n'
        '      setlocal            5\n'
        '      jump                L9991\n\n'
        'L9990:\n'
        '      label\n'
        '      getlocal2\n'
        '      getlocal            5\n'
        '      callproperty        QName(PackageNamespace(""), "getByIndex"), 1\n'
        '      coerce              QName(PackageNamespace("view.game.backpack.cell"), "BagSpecItemGridCell")\n'
        '      setlocal            4\n'
        '      getlocal            4\n'
        '      pushtrue\n'
        '      setproperty         QName(PackageNamespace(""), "lock")\n'
        '      getlocal            4\n'
        '      pushstring          "尚未开启的背包格子"\n'
        '      setproperty         QName(PackageNamespace(""), "lockTip")\n'
        '      inclocal_i          5\n\n'
        'L9991:\n'
        '      getlocal            5\n'
        '      getlocal2\n'
        '      getproperty         QName(PackageNamespace(""), "maxCount")\n'
        '      iflt                L9990\n\n'
        '      getlocal1',
        "lock unopened cells according to server capacity",
    )
    source = source[:start] + method + source[end:]

    start = source.index('  trait method QName(PrivateNamespace(null, "view.game.backpack:BackPackWin"), "onProNumberChange")')
    end = source.index('  trait method QName(PrivateNamespace(null, "view.game.backpack:BackPackWin"), "onProLevelChange")', start)
    method = source[start:end]
    method = replace_once(method, '     maxstack 2', '     maxstack 3', "capacity refresh stack")
    method = replace_once(
        method,
        '      initproperty        QName(PrivateNamespace(null, "view.game.backpack:BackPackWin"), "maxVolume")\n\n'
        '      getlocal0\n      callpropvoid        QName(PrivateNamespace(null, "view.game.backpack:BackPackWin"), "updateLockPanelStatus"), 0',
        '      initproperty        QName(PrivateNamespace(null, "view.game.backpack:BackPackWin"), "maxVolume")\n\n'
        '      getlocal0\n'
        '      getlocal0\n'
        '      getproperty         QName(PrivateNamespace(null, "view.game.backpack:BackPackWin"), "_currentTypeItems")\n'
        '      getlocal0\n'
        '      getproperty         QName(PrivateNamespace(null, "view.game.backpack:BackPackWin"), "_gridAll")\n'
        '      callpropvoid        QName(PackageNamespace(""), "setBagData"), 2\n\n'
        '      getlocal0\n'
        '      callpropvoid        QName(PrivateNamespace(null, "view.game.backpack:BackPackWin"), "updateLockPanelStatus"), 0',
        "refresh grid locks after capacity changes",
    )
    return source[:start] + method + source[end:]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("original_swf", type=Path)
    parser.add_argument("rabcdasm_dir", type=Path)
    parser.add_argument("output_swf", type=Path)
    args = parser.parse_args()
    if args.original_swf.resolve() == args.output_swf.resolve():
        parser.error("original and output must be different files")
    with tempfile.TemporaryDirectory(prefix="bag256-") as temp:
        work = Path(temp)
        swf = work / "GameFrame.swf"
        shutil.copy2(args.original_swf, swf)

        def run(exe: str, *argv: Path | str) -> None:
            subprocess.run([str(args.rabcdasm_dir / exe), *(str(arg) for arg in argv)], cwd=work, check=True)

        run("abcexport.exe", swf)
        abc = work / "GameFrame-0.abc"
        run("rabcdasm.exe", abc)
        asm_dir = work / "GameFrame-0"
        class_file = asm_dir / "view/game/backpack/BackPackWin.class.asasm"
        class_file.write_text(patch_class(class_file.read_text(encoding="utf-8")), encoding="utf-8")
        main_asm = asm_dir / "GameFrame-0.main.asasm"
        run("rabcasm.exe", main_asm)
        run("abcreplace.exe", swf, "0", asm_dir / "GameFrame-0.main.abc")
        args.output_swf.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(swf, args.output_swf)


if __name__ == "__main__":
    main()
