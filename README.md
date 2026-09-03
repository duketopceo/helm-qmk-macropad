# Helm

Private. Made-to-order USB-C macropad. Developer-first command surface, QMK/Vial shortcuts second, real Linux (Omarchy/Hyprland) as the wedge Elgato and Logitech skip.

**First working build:** 6 MX keys (2×3) + one clickable aluminum EC11 knob. Hand-soldered. Seeed XIAO RP2040. PETG two-piece. No custom app until it enumerates on macOS, Windows, and Linux.

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

## Repo layout

```
├── cad/             # Parametric OpenSCAD source
│   ├── helm_parameters.scad
│   ├── helm_plate.scad
│   └── helm_bottom.scad
├── stl/             # Generated plate and bottom STLs
├── firmware/qmk/keyboards/handwired/helm/
│   ├── keyboard.json
│   ├── rules.mk
│   ├── config.h
│   └── keymaps/vial/
│       ├── keymap.c
│       ├── rules.mk
│       └── vial.json
├── WIRING.md
└── BOM.md
```

## How to print (Ender V3, PETG)

Parts are ~75 × 65 mm. They fit a 220 bed with room to spare.

1. Slice `stl/helm_plate.stl` and `stl/helm_bottom.stl`.
2. Plate: switch-face up, no supports. Bottom: floor on the bed (XIAO pocket and bosses face up). No supports.
3. 0.2 mm layers, 0.4 mm nozzle, 4 walls, 25–30% infill, ~240 °C PETG / 80 °C bed, 45 mm/s outer walls.
4. Rebuild STLs after CAD edits: `openscad -o stl/helm_plate.stl cad/helm_plate.scad` and the same for `helm_bottom.scad`.
5. Heat-set four M2 inserts in the bottom bosses, then screw the plate on from the top.

Hold XIAO BOOT while plugging USB to flash. No underside button holes; they wouldn't reach the switches.

## How to flash

1. Clone `qmk_firmware` (the Vial fork is `vial-kb/vial-qmk`) and set it up locally.
2. Copy the `firmware/qmk/keyboards/handwired/helm/` directory into `qmk_firmware/keyboards/handwired/`.
3. Build with `qmk compile -kb handwired/helm -km vial`.
4. Hold the XIAO BOOT button while plugging in USB, or double-tap RESET, to get the `RPI-RP2` UF2 drive.
5. Copy the generated `handwired_helm_vial.uf2` to the `RPI-RP2` drive. The XIAO will reboot and enumerate as a HID keyboard.

## Verify HID

- **macOS** — System Settings > Keyboard should list "Helm". The first key should emit `KC_MUTE`.
- **Windows** — Device Manager should show a HID Keyboard and the QMK/Vial VID `0x484D` PID `0x0001`.
- **Omarchy / Hyprland** — `lsusb` and `dmesg | tail` should show the new keyboard. Open a browser and go to `vial.rocks`; authorize the device, then press each of the 6 keys, the knob click, and turn the knob in each direction. All events should register in the Vial test tab.

