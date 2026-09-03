# Helm

Private. Made-to-order USB-C macropad. Developer-first command surface, QMK/Vial second, real Linux (Omarchy/Hyprland) as the wedge Elgato and Logitech skip.

**First working build:** 6 MX keys (2×3) + one clickable aluminum EC11 knob. Hand-soldered. Seeed XIAO RP2040. PETG two-piece, 15° desk wedge. No custom app until it enumerates as HID on macOS, Windows, and Linux.

## Locked spec

| | |
|---|---|
| Layout | 6× MX 2×3 + 1× EC11 click-knob |
| Angle | **15°** wedge, front low, USB at the tall rear. Not Stream Deck Mini's 45° (that's for LCDs) |
| Keys | **PCB-mount / 5-pin** MX. Plate is **1.5 mm** at the clips (Cherry spec; thicker and they do not latch) |
| Knob | **Threaded** EC11 + nut + washer. Body sits on a printed shelf. No snap-in-only encoder |
| MCU | Seeed XIAO RP2040, USB-C rear, wired. Cable zip-tied at the rear wall |
| Firmware v1 | QMK + Vial (`vial.rocks`). Prebuilt: `firmware/handwired_helm_vial.uf2` |
| Case | Dark PETG, 2.4 mm walls, 4× M2 heat-set inserts, 2 alignment pins. No structural snaps |
| Out of v1 | ESP32, RGB, screen, wireless, 5 knobs, companion app, Stripe |

MX cutout 14.0 mm @ 19.05 mm pitch, 0.5 mm corner radii, 1.8 mm holes at ±5.08 mm for the plastic legs. EC11 bushing 7.2 mm. XIAO pocket 21.2×17.7×1.2 mm. Plate ~75×65 mm in the key plane; desk footprint ~75×62 mm. Rear wall ~26 mm tall.

USB-C on the XIAO is reversible (plug either flip). The board only faces rear.

## First-working sequence

1. Flying-lead **one key + one encoder**, flash Vial, confirm HID on all three OSes.
2. Print the 15° shell + 1.5 mm plate.
3. Seat 5-pin MX, nut the encoder, zip-tie the USB cable, solder the other five keys, close with M2.
4. Daily-drive a week. If the knob is only volume, we keep one knob forever.

## Buy list (v1)

See `BOM.md`. Short version: XIAO ×2, **5-pin** Gateron MX 10-pack, **threaded** EC11 + nut + washer + aluminum knob, 6× 1u PBT blanks, M2 inserts + M2×8–10 screws, zip-tie, 26–28 AWG, PETG you already have.

## Competition (why not 5 knobs)

- Stream Deck Mini — 6 keys, 45° LCD stand, still the compact one people love
- Stream Deck + — 8 LCD + 4 dials; 4 knobs is the ceiling
- Logitech MX Creative Console — 9 LCD + **one** big dial
- OpenAI Codex Micro / Work Louder Creator Micro 2 — 13 keys + **one** reasoning dial, $230

Helm's gap: cheap QMK MX + one knob + Linux that actually works. Free 3×3 Arduino STLs (e.g. SNASA on Printables) are the hobby floor, NC-licensed, and not this product.

## Repo layout

```
├── cad/             # Parametric OpenSCAD (edit helm_parameters.scad)
│   ├── helm_parameters.scad
│   ├── helm_plate.scad
│   └── helm_bottom.scad
├── stl/             # Generated plate and bottom
├── firmware/
│   ├── handwired_helm_vial.uf2
│   └── qmk/keyboards/handwired/helm/
├── WIRING.md
└── BOM.md
```

## How to print (Ender V3, PETG)

1. Slice `stl/helm_plate.stl` and `stl/helm_bottom.stl`.
2. **Plate:** flat on the bed, switch-face up. **100% infill, ≥4 walls**, 0.15–0.20 mm layers. No supports. Do not thicken the plate past 1.6 mm or MX clips will not lock.
3. **Bottom:** desk-face on the bed (USB slot in the tall rear wall, bosses up). No supports. 4 walls, 25–30% infill is fine.
4. ~240 °C PETG / 80 °C bed, 45 mm/s outer walls.
5. Rebuild STLs after CAD edits (run from `cad/` so the include resolves):

```bash
cd cad
openscad -o ../stl/helm_plate.stl helm_plate.scad
openscad -o ../stl/helm_bottom.stl helm_bottom.scad
```

6. Heat-set four M2 inserts from the **plate side** of the bosses (~200 °C iron, vertical, no twisting). Alignment pins locate the plate. M2 screws, not snaps.

Hold XIAO **BOOT while plugging USB** to flash. There are no underside button holes.

## How to flash

Fast path: hold BOOT, plug USB, copy `firmware/handwired_helm_vial.uf2` onto the `RPI-RP2` drive.

Rebuild:

1. Clone `vial-kb/vial-qmk` and run `qmk setup` against it.
2. Copy `firmware/qmk/keyboards/handwired/helm/` into `keyboards/handwired/`.
3. `qmk compile -kb handwired/helm -km vial`
4. Same UF2 copy as above.

## Verify HID

- **macOS** — System Settings > Keyboard should list "Helm". The first key emits `KC_MUTE`.
- **Windows** — HID Keyboard, VID `0x484D` PID `0x0001`.
- **Omarchy / Hyprland** — `lsusb` / `dmesg`. Open `vial.rocks`, authorize, test all 6 keys, knob click, and both rotate directions.
