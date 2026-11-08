# AGENTS.md

Local instructions for this repo. The constitution in `luke-agents/AGENTS.md` still applies.

## Read first

- Evidence/status definitions and the current audit: `docs/VALIDATION_STATUS.md`.
- Product scope and dimensions: `docs/PRODUCT_SPEC.md`.
- Single BOM authority: `hardware/bom.csv` (BOM.md is a summary only). Never record a price without a supplier URL and access date.
- Wiring vs firmware: `WIRING.md` must stay in sync with `firmware/qmk/keyboards/handwired/helm/keyboard.json`. CAD changes go through `cad/helm_parameters.scad` only.

## Rules for this repo

- Keep BOM, wiring, firmware, and CAD synchronized. If you change one, update the others in the same commit or record the divergence as BLOCKED.
- Generated files (`stl/*.stl`, `firmware/*.uf2`) are outputs. Source of authority is `cad/*.scad` and `firmware/qmk/`. Never hand-edit an STL or UF2. Regenerate and record tool version, command, and resulting hashes.
- Do not fabricate physical validation. A build or render is not a test. Physical results require a dated owner test record (use `production/unit-record-template.md`); blank fields mean not run.
- Preserve revision history. Committed STL/UF2 hashes are recorded in `docs/VALIDATION_STATUS.md`; any regeneration must update that record.
- Do not introduce speculative features. V1 scope is frozen in `docs/PRODUCT_SPEC.md` section 5; FiveByFive stays separate.
- Run available checks before declaring completion: at minimum, re-verify WIRING.md against keyboard.json, recompute CAD derived dimensions, and confirm `hardware/bom.csv` rows match PROCUREMENT.md statuses. Record the actual command output.
- No secrets, API keys, or customer data in the repo.

## Code graph index (optional accelerator)

This repo may be indexed by `codebase-memory-mcp` (CBM) on an agent's local
machine — `.codebase-memory/` is gitignored. If your harness exposes CBM
tools (`search_graph`, `trace_path`, `get_architecture`, `detect_changes`),
prefer them for structural questions — symbol lookup, caller/callee traces,
impact analysis — instead of grep/read loops. Reindex after large refactors
(`index_repository`); treat `.codebase-memory/graph.db.zst` as a local cache
artifact, never commit it.

## Build quick reference (from README, VERIFIED_REPO)

```bash
cd cad
openscad -o ../stl/helm_plate.stl helm_plate.scad
openscad -o ../stl/helm_bottom.stl helm_bottom.scad
```

Firmware: clone `vial-kb/vial-qmk`, pin the commit, copy `firmware/qmk/keyboards/handwired/helm/` into `keyboards/handwired/`, then `qmk compile -kb handwired/helm -km vial`. Record the upstream commit and resulting UF2 sha256 in `docs/VALIDATION_STATUS.md`.
