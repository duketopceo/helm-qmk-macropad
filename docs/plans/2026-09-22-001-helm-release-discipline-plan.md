# Plan: helm-qmk-macropad → 10/10

**Date:** 2026-09-22 · **Status:** proposed · **Depth:** lightweight
**Origin:** repo scorecard pass — engineering rigor 7, docs 5.

## Problem frame

Helm is a hand-soldered 6-key + EC11 knob macropad (Seeed XIAO RP2040, QMK/Vial) with a
locked spec and genuinely good docs (`BOM.md`, `WIRING.md`, CAD in `cad/`). But the
firmware story is weak: a compiled `handwired_helm_vial.uf2` is committed as a binary,
nothing verifies the QMK source still builds, and there is no release process — so "which
firmware is on my board?" has no answer.

## Scope

**In:** firmware build verification, releases-over-binaries, assembly guide, hardware
revision tracking.
**Out:** new PCB revisions, changes to the locked spec, keymap redesigns.

## Implementation units

### U1 — Firmware build check
**Files:** `.github/workflows/firmware.yml` (new), `docs/BUILDING.md` (new, if needed)
- Build `firmware/qmk/keyboards/handwired/helm` with the QMK CLI (container or documented
  local steps) on push + PR touching `firmware/`; fail on build error.
**Test scenarios:** a PR that breaks `keymap.c` → workflow fails before merge.

### U2 — Releases over binaries
**Files:** `.gitignore` (extend for `*.uf2`), `CHANGELOG.md` (new)
- Ship compiled `.uf2` via **GitHub Releases** with version tags (`v1.0.0`, …); stop
  committing binaries to git (keep or remove the existing one — owner's call, record it).
- `CHANGELOG.md`: what changed per firmware release.
**Test scenarios:** n/a — review criterion: README's "get firmware" path points at a
Release, not a blob in the repo.

### U3 — Assembly guide
**Files:** `docs/ASSEMBLY.md` (new), `README.md` (link)
- Step-by-step build: soldering order, encoder mounting (threaded EC11 + nut + washer),
  case assembly, first-flash. Photos where they disambiguate.
**Test scenarios:** n/a — review criterion: a second unit could be built from the doc.

### U4 — Hardware revision tracking
**Files:** `README.md`, `BOM.md` (extend)
- A `rev` field: what changed per hardware revision (plate thickness, standoffs, …).

## Key decisions

- GitHub Releases for binaries; `.scad` stays the CAD source, `.stl` the generated artifact.
- The locked spec in the README stays locked — this plan adds process, not redesign.
- Build verification before release discipline (U1 before U2).

## Assumptions / open questions

- Relationship to `fivebyfive` (5-key + 5-knob, same author): does Helm stay maintained,
  or does fivebyfive supersede it? Record the answer in both READMEs.
- Whether to keep the existing committed `.uf2` for history or purge it.
