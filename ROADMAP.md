# Roadmap

Program roadmap, 2026-10-11. Extends the open plan in
[`docs/plans/2026-09-22-001-helm-release-discipline-plan.md`](docs/plans/2026-09-22-001-helm-release-discipline-plan.md)
(U1-U4 keep their IDs). No hardware flashing is part of this pass; no QMK toolchain is installed here, so nothing below was compiled.

## Now

### P1 - Make layers reachable (status: found)
Evidence: `keymap.c` layers 1-3 have no `MO()`/`TO()` key.
- **Difficulty:** easy (one keycode in layer 0 or a knob-click layer cycle). **Feasibility:** the locked spec has 6 keys + 1 knob; spending one on layer switching is an owner decision.
- **Simpler alternative:** delete layers 2-3 (placeholders) and ship two layers, or leave one layer and let Vial users add more.

### U1 - Firmware build check (existing plan)
- **Difficulty:** medium (QMK CLI in CI, vial-qmk checkout). **Feasibility:** public repo, hosted Actions run; vial-qmk submodules make the checkout slow.
- **Simpler alternative:** build only in a pinned container image and skip a matrix.

### U2 - Releases over binaries (existing plan)
- **Difficulty:** easy. **Feasibility:** needs the owner to decide whether to purge the committed `.uf2` (history rewrite is out of scope: leave it, stop adding).
- **Simpler alternative:** keep the `.uf2` and add a `FIRMWARE.md` with its source commit; delete `scripts/luke-index-watcher.py` and `INDEX.md` if the grounding index is not wanted in a hardware repo.

## Next

### U3 - Assembly guide (existing plan)
- **Difficulty:** medium (photos needed from a real build). **Feasibility:** needs the owner's build.
- **Simpler alternative:** promote the README's "How to print" and "First-working sequence" into `docs/ASSEMBLY.md` unchanged first.

### P2 - Metadata hygiene
Fix README "Private." line (done in this pass), `keyboard.json` URL, `LICENSE` holder, and decide `VIAL_INSECURE`.
- **Difficulty:** easy. **Feasibility:** owner decisions on licence and Vial unlock.
- **Simpler alternative:** none, these are one-line edits.

### U4 - Hardware revision tracking (existing plan)
- **Difficulty:** easy. **Feasibility:** none. **Simpler alternative:** a `rev` column in `BOM.md` only.

## Later

### P3 - Resolve Helm vs fivebyfive
Say in both READMEs whether the 5-key/5-knob board supersedes Helm. **Difficulty:** easy. **Feasibility:** owner decision.

### P4 - Hot-swap or PCB revision
Out of scope of the locked spec. **Difficulty:** hard (PCB design, fabrication). **Feasibility:** cost and lead time. **Simpler alternative:** keep hand-wired, document it well.
