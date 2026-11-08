# Helm Assembly Procedure

Date: 2026-11-08. Read PRODUCT_SPEC.md pin table and WIRING.md before starting. No step assumes physical fit that has not passed the fit tests in VALIDATION_STATUS.md.

## Bench bring-up (before assembling the full device)

1. Inspect the XIAO board and components; record board ID and component IDs on the unit record.
2. Build flying leads: ONE 5-pin MX switch (D0/GP26 to one terminal, other terminal to GND) + ONE threaded encoder (A=D9/GP4, B=D10/GP3, push=D8/GP2 to GND, nut+washer on plate).
3. With power disconnected, check: switch terminal continuity to listed GPIO; GND rail continuity; NO power-to-GND shorts.
4. Flash reproducibly built firmware (see firmware reproducibility notes in VALIDATION_STATUS.md; do not trust the checked-in UF2 until a build reproduces it).
5. Confirm USB enumeration on the host.
6. Confirm key press and release; encoder push; rotation both directions.
7. Test Vial remap and persistence after power-cycle.
8. Record: date, tester, board + component IDs, wiring rev, firmware rev, host OS/version, procedure, expected, actual, evidence, pass/fail. If any step fails, stop and diagnose; do not continue to full assembly.

## Full assembly

1. Assign a serial number. Create a unit record from `production/unit-record-template.md`.
2. Collect and inspect parts against `hardware/bom.csv`. Reject wrong variants (3-pin switches, snap-in/SMT encoder, charge-only cable, M3 inserts).
3. Print plate and bottom per the print profile. Inspect for layer separation, warping, and dimensional shrinkage. Measure key cutouts (target 14.0 mm), peg holes (1.8 mm), encoder hole (7.2 mm), XIAO pocket (21.2 x 17.7), and USB opening (10 x 3.6) with calipers; record actuals.
4. Install M2 heat-set inserts from the plate side of the bosses (README says ~200C iron, vertical, no twisting). Only after coupon test passes for the selected insert OD vs 3.2 mm CAD hole. Inspect: insert flush, no spinning, no cracked boss (boss 6.8 mm OD at 5.0 inset = 1.6 mm nominal CAD wall).
5. Test-fit without solder: switches snap into plate clips (1.5 mm land); encoder body on shelf (14 mm body + shelf cutout) + nut/washer on plate top; XIAO in pocket, USB-C through rear wall; cable plug fully inserts and clears opening.
6. Prepare wires: cut 26-28 AWG stranded to measured lengths (record lengths per run); strip minimal exposed conductor (twist, tin, no fray).
7. Solder per the pin table. Trim EC11 legs after soldering so the body clears the shelf. Keep D+/D- pads clear.
8. Inspect every joint. With power disconnected, check continuity per wire and no shorts, especially GND vs adjacent GPIOs and power vs GND.
9. Flash and test with the case open (same checks as bench bring-up, all 6 keys + encoder).
10. Secure the XIAO in the pocket (method TBD - pocket depth only 1.2 mm; do not glue over BOOT/RESET or castellated pads without a documented reason). Route wires clear of screw bosses and the encoder body.
11. Fit the strain-relief zip-tie through the 4.0 x 2.2 mm slot above the USB opening. Yank-test gently.
12. Close the case. Check alignment pins (2.0 mm) seat. Drive M2 screws until the plate seats evenly; no bottoming, no cracked bosses, no pinched wires. There is no validated torque spec; use the minimum that closes the case and note the driver setting.
13. Install keycaps, knob, and feet. Check knob push travel does not hit the plate bottom; check keycaps clear the plate when pressed.
14. Final QC per `docs/QC_PLAN.md`. Any failure = rework loop, not a pass.
15. Clean, label with serial + revision, package.

## Rework rules

- Spinning insert: stop, do not force. Record burst/void and coupon-test a larger-hole insert or upsize boss in CAD after review.
- Cracked plate retention clip: reject that plate; do not glue.
- Shorted joint: desolder, inspect pad, re-solder; re-run continuity/shorts before power.
- Repair access after closure requires removing M2 screws; leave that path clear (no adhesive over screws, no cable through screw path).
