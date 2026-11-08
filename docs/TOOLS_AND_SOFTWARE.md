# Tools and Software

Date: 2026-11-08. Owner must confirm what they already have; do not assume ownership.

## A. Required tools already owned (owner to confirm)

- [ ] 3D printer (exact model: ___)
- [ ] Existing PETG filament (brand/color/qty: ___)
- [ ] Temperature-controlled soldering iron + suitable tip
- [ ] Solder (no-clean) + flux
- [ ] Ventilation / fume extraction
- [ ] Wire stripper
- [ ] Flush cutters
- [ ] Multimeter with continuity mode
- [ ] Calipers (for all fit measurements)
- [ ] Work holder / small vise
- [ ] Tweezers or small pliers
- [ ] M2 screwdriver
- [ ] Magnification + work light
- [ ] Heat-set insert method (iron ~200C per README; confirm tip contact method)

## B. Required tools missing (purchase before assembly)

To be filled after owner answers A. Do not prescribe an oscilloscope or CNC machine; no demonstrated need.

## C. Optional productivity tools

- Slicer software matching the actual printer (existing README assumes Ender V3-class; owner to confirm)
- Spare M2 inserts, spare solder wire, spare wire lengths

## D. Later-stage equipment (out of V1 pilot)

KiCad + custom PCB, injection-mold tooling, commercial test fixtures. Not required for prototype.

## Software

Required:
- Git
- OpenSCAD (version to record on build host; none installed on audit machine 2026-11-08)
- Slicer supporting the actual printer
- Pinned vial-qmk toolchain (upstream repo + commit + qmk CLI version to record; none installed on audit machine 2026-11-08)
- Vial configuration interface (vial.rocks)
- Input-event testing method (host OS key viewer / vial live test)
- CSV/spreadsheet records (unit records in `production/`)

Later-stage / optional:
- KiCad (only if moving from hand-wired to PCB)
- Custom desktop software (out of V1; see OPTIONAL_SOFTWARE.md)

## Host OSes for compatibility testing (owner to confirm)

- [ ] Linux (Omarchy/Hyprland) — dev box
- [ ] macOS (version ___)
- [ ] Windows (version ___)

Record tested versions in VALIDATION_STATUS.md after bench bring-up.
