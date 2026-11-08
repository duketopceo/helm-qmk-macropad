# Risks and Decisions

Date: 2026-11-08.

## Decisions table

| ID | Decision | Basis | Status |
|----|----------|-------|--------|
| D1 | 6x MX 2x3 + 1x encoder; no 5-knob layout | README; V1 scope freeze | VERIFIED_REPO, locked for V1 |
| D2 | 15 deg desk wedge | README vs Stream Deck Mini 45 deg argument | VERIFIED_REPO; physical ergonomics untested |
| D3 | 1.5 mm PETG plate, 5-pin PCB-mount switches | Cherry clip land; plate thicker than 1.6 mm = clip no-latch | VERIFIED_REPO; retention untested |
| D4 | Direct-pin, no matrix/diodes, RP2040 internal pull-ups | keyboard.json + WIRING.md | VERIFIED_REPO; electrical behavior untested |
| D5 | Threaded EC11 + nut/washer; no snap-in-only | README plate failure mode (Bento) | VERIFIED_REPO; selected part BLOCKED |
| D6 | M2 heat-set inserts + screws, no structural snaps | README + CAD boss geometry | VERIFIED_REPO; insert OD BLOCKED |
| D7 | Zip-tie cable strain relief | README + CAD slot geometry | VERIFIED_REPO; tie fit untested |
| D8 | VID 0x484D / PID 0x0001 | keyboard.json + vial.json | Present; commercial legitimacy not reviewed (RELEASE_READINESS.md) |
| D9 | FiveByFive kept separate | Brief section 2 | Locked unless owner approves merge |

## Top risks

| Risk | Impact | Mitigation |
|------|--------|------------|
| Nut does not fit in 9.0 mm to plate edge | Encoder unmountable or plate cracks | Measure selected nut before printing plate; coupon-test 7.2 mm hole |
| 3.5 mm insert melts oversize hole in 3.2 mm CAD feature | Loose inserts, cracked bosses, case won't close | Coupon-test exact insert at CAD hole size; adjust `m2_insert` in CAD and re-export STL if needed |
| Plate too flexible at 1.5 mm PETG | Switches pop, shelf deflects | Physical retention/pull test at print-profile settings; consider 100% infill + 4+ walls (README) |
| USB cable housing too large for 10 x 3.6 mm | Cable won't insert / strain relief fails | Measure housing, test opening before committing cable |
| UF2 not reproducible from checked-in source | Build drift, unverified behavior | Pin vial-qmk commit, build locally, record sha256; treat old UF2 as untrusted |
| VID/PID legitimacy / compliance for sale | Commercial blocker | RELEASE_READINESS.md review; do not sell until resolved |
| Solder joints on castellated XIAO pads / encoder legs | Shorts, open joints, shelf interference | Bench continuity + shorts check before power; trim legs after solder |

## Change log

- 2026-11-08: Audit update. Added docs/, hardware/bom.csv, production/ templates. No CAD or firmware source modified. Existing STL/UF2 untouched (hashes in VALIDATION_STATUS.md).
