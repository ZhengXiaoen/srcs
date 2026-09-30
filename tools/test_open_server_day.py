"""Check open days with the shipped engine, without starting a game server.

Requires Windows x64, pefile and the bundled server DLL dependencies. The DLL
copy has no entry point. All server objects and the fake clock belong to this
worker; no running process, system clock, database or runtime file is changed.
"""

import argparse
import ctypes as c
import datetime as dt
import hashlib
import os
import subprocess
import sys
import tempfile
import zlib
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
ENGINE = ROOT / "Server/S1001/x64/LogicServerCQ64_R.exe"
ENGINE_HASH = "6c3dc87475d4e04bb7dcc5301ec47689480fab987298dffbb09943a214ee63cf"

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--engine-deps", type=Path, help="Directory containing pefile")
parser.add_argument("--worker", type=Path, help=argparse.SUPPRESS)
args = parser.parse_args()
if os.name != "nt" or c.sizeof(c.c_void_p) != 8:
    raise SystemExit("Requires Windows x64")
if args.engine_deps:
    sys.path.insert(0, str(args.engine_deps))
import pefile

if hashlib.sha256(ENGINE.read_bytes()).hexdigest() != ENGINE_HASH:
    raise SystemExit("Engine changed: audit internal addresses before running")
if args.worker is None:
    with tempfile.TemporaryDirectory(prefix="SRCS-OpenDay-") as directory:
        command = [sys.executable, str(Path(__file__).resolve()), "--worker", directory]
        if args.engine_deps:
            command.extend(("--engine-deps", str(args.engine_deps)))
        result = subprocess.run(command, cwd=ROOT)
    raise SystemExit(result.returncode)


def report_failure(kind, value, traceback):
    sys.__excepthook__(kind, value, traceback)
    sys.stderr.flush()
    os._exit(1)


sys.excepthook = report_failure
pe = pefile.PE(str(ENGINE))
pe.FILE_HEADER.Characteristics |= 0x2000
pe.OPTIONAL_HEADER.AddressOfEntryPoint = 0
copy = args.worker / "open-day.dll"
pe.write(str(copy))
search = os.add_dll_directory(str(ENGINE.parent))
library = c.WinDLL(str(copy))
base = library._handle


def native(rva, result, *signature):
    return c.WINFUNCTYPE(result, *signature)(base + rva)


# Audited against this engine's instructions; its bundled .map is stale.
# Only fields read by CalcDaysSinceOpenServer and isCrossServer are needed.
server = c.create_string_buffer(0x500)
engine = c.create_string_buffer(0x6000)
c.c_void_p.from_address(base + 0x4ACDB8).value = c.addressof(server)
c.c_void_p.from_address(c.addressof(server) + 0x218).value = c.addressof(engine)
open_value = c.c_uint32.from_address(c.addressof(server) + 0x2A4)
encode = native(0x2DDE0, c.c_void_p, c.c_void_p, *([c.c_uint32] * 6))
decode = native(0x3FB20, None, c.c_void_p, c.c_void_p)
calculate = native(0x2BFA30, c.c_int, c.c_void_p)
clock = [dt.datetime(2026, 10, 1)]


@c.WINFUNCTYPE(None, c.c_void_p)
def fake_local_time(pointer):
    now = clock[0]
    values = (now.year, now.month, (now.weekday() + 1) % 7, now.day,
              now.hour, now.minute, now.second, 0)
    system_time = (c.c_uint16 * 8).from_address(pointer)
    for index, value in enumerate(values):
        system_time[index] = value


# Replace GetLocalTime only in the isolated DLL's import table.
kernel = c.WinDLL("kernel32", use_last_error=True)
kernel.VirtualProtect.argtypes = [c.c_void_p, c.c_size_t, c.c_uint32, c.POINTER(c.c_uint32)]
kernel.VirtualProtect.restype = c.c_bool
protection = c.c_uint32()
assert kernel.VirtualProtect(base + 0x3F7298, 8, 0x40, c.byref(protection))
c.c_void_p.from_address(base + 0x3F7298).value = c.cast(fake_local_time, c.c_void_p).value


def set_open(value):
    encode(c.byref(open_value), value.year, value.month, value.day,
           value.hour, value.minute, value.second)
    decoded = (c.c_uint16 * 8)()
    decode(c.byref(open_value), c.byref(decoded))
    assert tuple(decoded[i] for i in (0, 1, 3, 4, 5, 6)) == (
        value.year, value.month, value.day, value.hour, value.minute, value.second)


def days_at(now):
    clock[0] = now
    return calculate(c.addressof(server))


# This is the existing compiled client's complete getOpenServerDate body.
# It derives the start date from sectionOpenDays - 1, so an engine day 2 on
# launch day necessarily displays the previous date. Verify the shipped
# resource still uses that calculation before checking the resulting dates.
client_body = bytes.fromhex(
    "d0305dd6f80146d6f80100802ad5d1668dd30273d6d166cd7473d7"
    "60e0f801937363045d2ad1668ed302d2d34a2a03802a2a2a630566801b"
    "62042418a2243ca2243ca225e807a2a161801b6205668ed3022c86aa02a0"
    "6205668dd3022401a0a02c87aa02a0620566cd74a02c88aa02a048"
)
client = (ROOT / "web/GameFrame.swf").read_bytes()
assert client[:3] == b"CWS"
assert zlib.decompress(client[8:]).count(client_body) == 1, "Client date logic changed"

midnight = dt.datetime(2026, 10, 1)
set_open(midnight)
assert days_at(midnight) == 2, "Baseline no longer reproduces day 2"
displayed = midnight.date() - dt.timedelta(days=days_at(midnight) - 1)
assert displayed == dt.date(2026, 9, 30), "Baseline client date was not reproduced"
print("PASS: original midnight config reproduces engine day 2 and client date 9/30")

for midnight in (dt.datetime(2026, 9, 30), dt.datetime(2026, 10, 1),
                 dt.datetime(2026, 12, 31), dt.datetime(2027, 1, 1),
                 dt.datetime(2028, 2, 28), dt.datetime(2028, 2, 29)):
    set_open(midnight + dt.timedelta(seconds=1))
    assert days_at(midnight) == 0, "Open date should not start before configured second"
    assert days_at(midnight + dt.timedelta(seconds=1)) == 1
    assert days_at(midnight + dt.timedelta(hours=12)) == 1
    assert days_at(midnight + dt.timedelta(days=1, seconds=-1)) == 1
    for offset in (1, 2, 7):
        now = midnight + dt.timedelta(days=offset)
        day = days_at(now)
        assert day == offset + 1, (midnight, offset, day)
        assert now.date() - dt.timedelta(days=day - 1) == midnight.date()
print("PASS: one-second config, day changes, client start dates, month/year/leap-day boundaries")

sys.stdout.flush()
os._exit(0)
