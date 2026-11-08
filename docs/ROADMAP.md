# Helm Roadmap

Date: 2026-11-08. Priority = blocking unknowns first (brief section 21).

## Phase A - Inspect and reconcile (done 2026-11-08)

- [x] Repository audit (VALIDATION_STATUS.md)
- [x] BOM reconciliation with SKUs / blockers (hardware/bom.csv)
- [x] Wiring vs firmware cross-check
- [ ] Owner decisions: encoder, insert OD, cable, printer/filament (RISKS_AND_DECISIONS.md, TOOLS_AND_SOFTWARE.md)

## Phase B - Research exact purchases and dimensions

- [ ] Lock encoder SKU from a datasheet drawing
- [ ] Lock insert + screw SKUs; coupon-test insert installation
- [ ] Lock switch + keycap + knob + cable + feet SKUs and prices with URL + date

## Phase C - Verify builds

- [ ] Install OpenSCAD, export STLs, record version + warnings; compare to committed hashes
- [ ] Install pinned vial-qmk, build UF2, record commit + toolchain versions + sha256
- [ ] Print fit-test coupons (MX, encoder, insert, XIAO pocket, USB opening)

## Phase D - Bench bring-up (owner, physical)

- [ ] Flying-lead proof: 1 key + encoder, flash, HID on all 3 OSes (GitHub issue #2)
- [ ] Record dated test per ASSEMBLY.md bench section

## Phase E - Prototype assembly + QC

- [ ] Print plate + bottom; assemble (issue #3); run QC_PLAN.md screen
- [ ] Daily-drive one week (issue #4); record defects in unit record

## Phase F - Pilot (5 identical units)

- [ ] Freeze BOM/CAD/firmware/print profile/QC; build 5 units per batch record
- [ ] Measure yield, rework, hands-on time, unit cost

## Stop / continue / redesign criteria

- Continue to pilot only if: prototype passes QC, encoder+insert+cable fit confirmed, UF2 reproducible.
- Redesign if: plate retention fails, nut/edge clearance fails, or insert installation fails at CAD hole size.
- Stop if: bench bring-up reveals unfixable pin/firmware mismatch or repeated joint failures. No data has been collected yet; do not declare success by document count.
