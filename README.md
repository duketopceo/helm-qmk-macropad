# Helm

Private. Made-to-order USB-C macropad. Developer-first command surface, QMK/Vial shortcuts second, real Linux (Omarchy/Hyprland) as the wedge Elgato and Logitech skip.

**First working build:** 6 MX keys (2×3) + one clickable aluminum EC11 knob. Hand-soldered. Seeed XIAO RP2040. PETG two-piece. No custom app until it enumerates on macOS, Windows, and Linux.

This repo is empty of CAD/firmware until a cloud agent can land files (Cursor on-demand). Local CAD experiments (5+5 test plate) are *not* the product.

## Locked spec

| | |
|---|---|
| Layout | 6× MX 2×3 + 1× EC11 click-knob |
| MCU | Seeed XIAO RP2040, USB-C rear, wired |
| Firmware v1 | QMK + Vial (`vial.rocks`) |
| Case | PETG, 2.4 mm walls, M2 heat-set inserts |
| Out of v1 | ESP32, RGB, screen, wireless, 5 knobs, companion app, Stripe |

MX cutout 14.0 mm @ 19.05 mm pitch. EC11 bushing 7.2 mm. XIAO pocket 21.2×17.7×1.2 mm.

## First-working sequence

1. Flying-lead **one key + one encoder**, flash Vial, confirm HID on all three OSes.
2. Print the 6+1 plate.
3. Solder the other five keys, close the shell.
4. Daily-drive a week. If the knob is only volume, we keep one knob forever.

## Buy list (v1)

- Seeed XIAO RP2040 ×2
- Gateron MX 10-pack
- 1× EC11 with push + aluminum knob
- 6× 1u PBT blanks
- M2 heat-set inserts + screws, 26–28 AWG wire, PETG you already have

## Competition (why not 5 knobs)

- Stream Deck Mini — 6 keys, still the compact one people love
- Stream Deck + — 8 LCD + 4 dials; 4 knobs is the ceiling
- Logitech MX Creative Console — 9 LCD + **one** big dial (media/Adobe)
- OpenAI Codex Micro / Work Louder Creator Micro 2 — 13 keys + **one** reasoning dial, $230

Helm's gap: cheap QMK MX + one knob + Linux that actually works.
