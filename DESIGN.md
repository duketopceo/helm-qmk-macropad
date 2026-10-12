# Helm design direction: Wedge

Status: proposal, 2026-10-11. The owner signs off logos. There is no app UI. Surfaces: README, assembly and wiring docs, CAD previews, the printed case.

## Direction
**Wedge**: the product's one distinctive physical fact is the 15 degree desk angle, so the identity is a plan view of the pad plus a 15 degree wedge. Dark-PETG ink on cool paper, one vermillion accent used for the knob and for nothing else. Engineering-drawing tone: plain sans headings, monospace for dimensions and pins.

Research: no Refero MCP on this machine (fallback allowed). References: the Stream Deck / Adafruit / Little Big Scroll pages in `docs/research/`. Reference lock: borrow the spare product-page restraint; reject LCD-style glossy gradients and RGB gamer styling. Decision ledger: the accent marks the knob only; angles drawn true (15 degrees); dimensions in mm, monospace.

## Tokens
| Token | Light | Dark |
|---|---|---|
| paper / night | `#EEF2F4` | `#0F161C` |
| ink | `#14202B` | `#E6EDF2` |
| muted | `#4B5B68` | `#9AABB8` |
| accent | `#B5361A` | `#FF8F6B` |

Contrast (computed): ink/paper 14.66, muted/paper 6.22, accent/paper 5.32; ink/night 15.42, muted/night 7.72, accent/night 8.16. All pass AA for body text.

Type: system sans for prose; JetBrains Mono for dimensions, pins, keycodes.

## Glyphs and motion
Rounded-square keys (2-unit radius), solid disc knob, right-triangle wedge. No motion.

## Surfaces
README header and spec table; `BOM.md`/`WIRING.md` tables (monospace numerics); `cad/preview*.png` stay as the visual record. Assets in `assets/brand/`.
