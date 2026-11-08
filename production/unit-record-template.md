# Helm Unit Record (template - do not fill as example)

Status: TEMPLATE. All fields start blank. Never submit a pre-filled copy as a passed record.

- Serial: ______
- Date started: ______
- Assembler: ______
- Hardware revision (CAD rev / STL hash): ______
- Firmware revision (source rev + UF2 sha256): ______
- Print profile (slicer/mats/temp/layers): ______
- Parts batch IDs: ______

## Checks (blank = not run)

| # | Check | Procedure | Expected | Actual | Pass/Fail |
|---|-------|-----------|----------|--------|-----------|
| 1 | Continuity, unpowered | Each switch terminal to listed GPIO; grounds to GND rail | Open key open, closed = continuity | | |
| 2 | Shorts | Power-to-GND resistance, unpowered short check | No near-zero shorts | | |
| 3 | HID enumerate | Plug USB, check host | Helm HID appears | | |
| 4 | 6 keys | Press/release each x20 | Correct code each press | | |
| 5 | Encoder push | x20 | Correct click | | |
| 6 | Rotation | Slow + normal both directions | Correct volume/mapping per layer | | |
| 7 | Remap persist | Remap in Vial, power-cycle, recheck | Mapping holds | | |
| 8 | Disconnects | Unplug/replug x10 | No stuck inputs | | |
| 9 | 2-hour soak | Periodic operation while connected | No resets/stuck | | |
| 10 | Mechanical | Rubbing, encoder play, base rock, cable full insertion, wire trap, closure, feet | None of the QC failures in docs/QC_PLAN.md | | |

- Rework performed (date, cause, fix): ______
- Final disposition (PASS / REWORK / FAIL): ______
- Evidence (photos, logs, or "none"): ______
- Tester signature/date: ______

Print time (machine): ____ Assembly time: ____ Flash time: ____ Test time: ____ Rework time: ____ Packaging time: ____
