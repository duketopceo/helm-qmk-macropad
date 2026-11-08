# Helm v1 Product Specification

Document date: 2026-11-08
Status labels: see `docs/VALIDATION_STATUS.md` for definitions.

## 1. Mission

One working, documented desktop controller, then five repeatable pilot units.
VERIFIED_REPO: Repository states this as the goal in README ("First working build" sequence).

## 2. Frozen V1 scope

| Item | Specification | Status |
|------|---------------|--------|
| Layout | 6x MX-compatible, 2 rows x 3 | VERIFIED_REPO (README, WIRING.md, CAD) |
| Encoder | 1x clickable rotary encoder | VERIFIED_REPO |
| Transport | Wired USB-C data | VERIFIED_REPO |
| Controller | Seeed Studio XIAO RP2040 (standard, un-soldered headers) | VERIFIED_REPO + VERIFIED_SOURCE (Seeed page 2026-11-08) |
| Firmware | QMK/Vial (vial-qmk direction) | VERIFIED_REPO |
| Wiring style | Hand-wired prototype, direct-pin | VERIFIED_REPO |
| Enclosure | Two-piece PETG, 15-degree desk wedge | VERIFIED_REPO |
| Fastening | M2 heat-set inserts + M2 screws | VERIFIED_REPO |
| Purchased externals | Switches, keycaps, knob, cable, feet | VERIFIED_REPO |

## 3. Dimensions (derived from CAD source, VERIFIED_REPO)

Recomputed from `cad/helm_parameters.scad` on 2026-11-08 (arithmetic, not a render):

- Plate in key plane: 75.12 x 64.60 mm
- Desk footprint: 75.12 x 62.40 mm (desk_depth = plate_depth * cos(15 deg))
- Rear wall height: 25.72 mm; front lip: 9.0 mm (desk to plate underside)
- Wedge angle: 15 deg
- Key pitch: 19.05 mm; MX cutout 14.0 mm, corner radius 0.5 mm
- 5-pin peg holes: 1.8 mm diameter at +/-5.08 mm from key center
- Plate thickness: 1.5 mm (Cherry clip land; do not thicken past 1.6 mm per README)
- Encoder bushing opening: 7.2 mm diameter; encoder body clearance in bottom: 14.0 mm body + 1.5 mm clearance cylinder
- XIAO pocket: 21.2 x (17.7 * cos15) x 1.2 mm deep, at xiao_x=5.4, xiao_y=wall+0=2.4 (bottom.scad)
- USB opening: 10.0 x 3.6 mm at rear wall; zip-tie slot 4.0 x 2.2 mm directly above USB opening
- Insert feature: 3.2 mm diameter x 4.5 mm height blind hole (m2_insert); through-hole 2.2 mm in plate (m2_through)
- Boss diameter: 6.8 mm at 5.0 mm inset from plate edges (1.6 mm nominal wall remaining to plate edge in CAD coordinates)
- Screw positions: 4x at (5.0,5.0) inset, spacing 65.1 x 54.6 mm
- Alignment pins: 2x, 2.0 mm diameter, 2.0 mm height, mid-left/right
- Rubber foot recess: 10.0 mm diameter, 0.8 mm height at 8.0 mm inset
- Outer wall: 2.4 mm; case floor 2.0 mm; outer corner radius 3.0 mm

ASSUMPTION (unverified physically):
- Plate stiffness/retention at 1.5 mm PETG with 100% infill (README print profile).
- Encoder shelf (the bottom cut `ec11_body + 1.5 = 25.72 mm` diameter cylinder) correctly supports the selected EC11 body.
- Encoder center is 9.0 mm from the plate right edge (computed). A standard EC11 threaded-bushing nut is ~11 mm across flats; nut-to-edge clearance is NOT verified and is a fit-test item.
- USB opening 10 x 3.6 mm clears the actual cable connector housing. NOT verified without the selected cable.
- XIAO pocket depth 1.2 mm retains the 1.6 mm PCB thickness (XIAO spec 21.0 x 17.8 mm naming vs 21.2 x 17.7 pocket). Close fit by design; verify no rocking / no pocket interference with castellated pads.

## 4. Electrical specification (from firmware, VERIFIED_REPO)

| Function | XIAO silk | RP2040 GPIO | Notes |
|----------|-----------|-------------|-------|
| Key 1 | D0 | GP26 | Direct pin to switch, other terminal GND |
| Key 2 | D1 | GP27 | |
| Key 3 | D2 | GP28 | |
| Key 4 | D3 | GP29 | |
| Key 5 | D4 | GP6 | |
| Key 6 | D5 | GP7 | |
| Encoder push | D8 | GP2 | Matrix position [1,3] |
| Encoder A | D9 | GP4 | Resolution 4 in keyboard.json |
| Encoder B | D10 | GP3 | |
| GND | GND | - | Shared rail |

- Pins match `firmware/qmk/keyboards/handwired/helm/keyboard.json` `matrix_pins.direct` and `encoder.rotary`.
- QMK RP2040 pull-up configuration: enabled internally; no external resistors (README/WIRING).
- Direct-pin topology: no matrix, no diodes.
- Encoder direction and steps-per-detent: resolution 4 per keyboard.json. Actual direction (CW = volume up) is PHYSICALLY_VERIFIED only after bench test; ASSUMPTION until then.
- USB VID/PID in firmware: 0x484D / 0x0001, device version 1.0.0.

Pin-mapping cross-check: XIAO RP2040 D0-D10 to GPIO mapping confirmed via TinyGo reference (VERIFIED_SOURCE, tinygo.org xiao-rp2040 page, accessed 2026-11-08): D0=GP26, D1=GP27, D2=GP28, D3=GP29, D4=GP6, D5=GP7, D8=GP2, D9=GP4, D10=GP3. Matches WIRING.md.

## 5. Out of V1 (do not add)

Bluetooth/Wi-Fi, batteries, displays, per-key RGB, 5-knob layout, custom remapping app, cloud services, OpenRouter calls from firmware, injection molding, large inventory. FiveByFive is a separate concept; do not merge firmware/layout/requirements without explicit approval.

## 6. Unknowns / BLOCKED items

1. BLOCKED (owner): Exact printer model, filament color/brand, caliper availability, solder station ownership. Needed for print profile freezing.
2. BLOCKED (fit test): Selected EC11 exact variant (bushing thread, nut across-flats, body depth, shaft length) and selected knob dimensions. No locked encoder SKU yet (Adafruit 377 is out of stock at Adafruit as of 2026-11-08, $4.50, qty breaks 1-4/$4.50, 5-49/$4.05, 50+/$3.60; package includes knob but mechanical compatibility not approved).
3. BLOCKED (fit test): Selected M2 insert OD vs 3.2 mm CAD hole. BOM says ~3.5 mm OD; CAD hole is 3.2 mm. Owner fit test + insert supplier install guidance required before declaring compatible.
4. BLOCKED: Cable choice (USB-C data cable with connector housing dimensions). Needed for USB opening clearance.
5. ASSUMPTION: PETG plate at 1.5 mm is stiff/retentive enough. Requires physical retention + keycap clearance test.
6. ASSUMPTION: Existing UF2 binary (`firmware/handwired_helm_vial.uf2`, 80384 bytes, sha256 288d8132...) matches the checked-in source and vial-qmk at some revision. Not build-verified; no provenance recorded in repo. Treat as untrusted until a reproducible build succeeds.
