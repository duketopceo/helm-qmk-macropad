# Helm v1 BOM

| Item | Qty | Notes |
|------|-----|-------|
| Seeed Studio XIAO RP2040 | 2 | One for the build, one spare |
| Gateron (or Cherry) **PCB-mount 5-pin** MX | 6 | Buy a 10-pack. 3-pin plate-only switches skip the anti-rotation pegs |
| EC11 with **threaded bushing + nut + washer**, push switch | 1 | ~7 mm bushing. Skip Alps parts with no collar |
| Aluminum knob | 1 | 6 mm D-shaft |
| 1u PBT blank keycaps | 6 | MX stem |
| M2 brass heat-set inserts | 4 | Length 3–4 mm, OD ~3.5 mm. Iron ~200 °C in PETG |
| M2 pan-head screws | 4 | **8–10 mm** (insert + 1.5 mm plate) |
| Small nylon zip-tie | 1 | Strain relief through the rear-wall slot |
| 26–28 AWG stranded wire | ~2 m | Direct-pin flying leads |
| Dark PETG | ~50 g | Plate + bottom |
| Rubber feet | 4 | Optional, 10 mm, sit in the recesses |

## Optional but recommended

- USB-C **data** cable (charge-only will not enumerate). Plug is reversible.
- Flux and no-clean solder for the XIAO castellated pads
- Flush cutters for EC11 legs
- Spare M2 inserts in case one spins

Do not substitute a snap-in-only encoder or a uniform plate thicker than 1.6 mm.

## Update 2026-11-08 (audit)

Authoritative machine-readable BOM: `hardware/bom.csv`. This file is a readable summary only; if they conflict, `hardware/bom.csv` wins.

- XIAO RP2040 (Seeed part 102010428): $3.99 at Seeed, accessed 2026-11-08 (VERIFIED_SOURCE). One consumed per unit, one development spare.
- Encoder Adafruit 377: candidate only, out of stock at Adafruit 2026-11-08; mechanical fit not verified; treat as BLOCKED until a threaded variant with a datasheet drawing is locked.
- Insert OD conflict: BOM above says ~3.5 mm OD; CAD hole (`m2_insert`) is 3.2 mm. Do not install a 3.5 mm insert in the 3.2 mm feature until the selected insert's install guidance + coupon test are recorded.
