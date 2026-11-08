# Helm Procurement

Date: 2026-11-08. All prices are VERIFIED_SOURCE only where a URL + access date are given. Everything else is ASSUMPTION or BLOCKED. Do not treat supplier list prices as delivered cost; shipping and tax are separate (see `docs/COST_MODEL.md`).

## Verified items (VERIFIED_SOURCE, accessed 2026-11-08)

### H1: Controller — Seeed Studio XIAO RP2040
- Manufacturer: Seeed Technology Co., Ltd.
- Manufacturer part: 102010428
- URL: https://www.seeedstudio.com/XIAO-RP2040-v1-0-p-5026.html (accessed 2026-11-08)
- Price: USD $3.99 each (qty 10+: $3.50). Un-soldered headers, 1pc pack, in stock on page.
- Dimensions per Seeed: 21 x 17.8 mm. USB-C, 5 V input.
- Status: VERIFIED_SOURCE for existence/price/page. NOT physically received. Do NOT substitute XIAO RP2040 Plus (larger, 8 MB flash, charge header) or RP2350 without re-checking pocket dimensions and pins.

### E1 (candidate only, NOT locked): Adafruit 377 rotary encoder + extras
- URL: https://www.adafruit.com/product/377 (accessed 2026-11-08)
- Price: $4.50 (1-4), $4.05 (5-49), $3.60 (50+). Out of stock at Adafruit on 2026-11-08. DigiKey listed as alternate.
- Datasheet linked by Adafruit: PEC11-4215F-S24 (Bourns PEC11), 24 detents, threaded bushing family.
- Package includes: encoder + nut + washer + knob (per Adafruit description).
- Status: BLOCKED. Mechanical compatibility with 7.2 mm CAD hole and 14 mm body shelf not verified. Not approved until: (a) threaded bushing diameter confirmed at 7 mm class, (b) nut across-flats vs 9.0 mm edge clearance, (c) body depth vs shelf, (d) back in stock or a named alternate with a datasheet drawing. Never substitute snap-in-only or SMT encoder.

## Items without a locked SKU (BLOCKED, do not invent)

The following have NO supplier SKU, price, or URL verified in this update. They are purchasing blockers, not blanks to fill in.

| ID | Item | Need | Approved substitute rule |
|----|------|------|--------------------------|
| S1 | 5-pin MX switches, 6/unit, buy 10-pack | MX-compatible PCB-mount 5-pin, plate thickness 1.5 mm lock. Gateron 5-pin 10-packs exist (multiple sellers found 2026-11-08) but no single locked SKU/price chosen yet — select and record exact SKU + URL + date before purchase. | 3-pin plate-only switches are NOT approved (skip anti-rotation pegs vs 1.8 mm leg holes). |
| K1 | Knob (if not bundled with encoder) | 6 mm D-shaft, fits selected encoder shaft without touching plate when pushed. |
| C1 | 1u MX keycaps, 6/unit | MX stem, 1u height profile compatible with 1.5 mm plate retention. No SKU locked. |
| F1 | M2 heat-set inserts, 4/unit | OD must match CAD 3.2 mm hole + supplier install guidance. ruthex RX-M2x4 and generic M2x4 / 3.5 mm OD / 3.2 mm OD listings exist; do NOT buy until owner confirms which OD/grade and runs coupon test. M3 inserts never. |
| F2 | M2 pan-head screws, 4/unit, 8-10 mm | Length must engage insert without bottoming through 4.5 mm insert feature + 1.5 mm plate. No SKU locked. |
| W1 | 26-28 AWG stranded wire, ~2 m | Stranded only (solid tears). No SKU locked. |
| SR1 | Cable strain relief | Small nylon zip-tie (existing BOM) through CAD zip slot. Confirm zip width vs 4.0 x 2.2 slot. |
| FT1 | Rubber feet, 4/unit, 10 mm dia | Match CAD foot recess. No SKU locked. |
| CAB1 | USB-C data cable | Must be data (charge-only will not enumerate). Connector housing dimensions required for 10 x 3.6 mm opening. No SKU locked. |
| FIL1 | PETG filament | Dark PETG, ~50 g/unit (existing estimate). Brand/temp profile owner-dependent. No SKU locked. |
| PK1 | Packaging (pilot) | Not needed for prototype; do not buy until pilot freeze. |

## Purchasing sequence

1. Order controller x2 (one consumed per unit, one development spare) + wire + zip ties.
2. Order encoder only after locking exact threaded variant and confirming dimensional fit.
3. Order switches + keycaps together; verify 5-pin, 1u, MX stem in writing on the listing.
4. Order inserts + screws only after coupon fit test passes at 3.2 mm hole.
5. Order cable only after measuring connector housing against CAD 10 x 3.6 mm opening (or pad STL/cut coupon).
6. Filament and feet can wait until print plan is frozen.

Every purchase must record supplier, SKU, URL, access date, unit price, qty tier, stock status, and delivered cost per usable part in `hardware/bom.csv` before ordering. Do not overwrite VERIFIED_SOURCE rows with estimated prices.
