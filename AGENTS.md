# AGENTS.md — Helm

A made-to-order USB-C macropad: 6 MX keys (2×3) + one clickable EC11 knob, on a
Seeed XIAO RP2040, QMK/Vial firmware, PETG two-piece 15° case. 21 tracked
files, no build system, no CI.

Most of this repo is **physical engineering**, not software. The constraints
that matter are manufacturing and fit, and several are one-sided in a way that
is not obvious from the geometry.

## `cad/helm_parameters.scad` is the single source of truth

```
cad/helm_parameters.scad     # every dimension; all three models derive from it
cad/helm_plate.scad          # include <helm_parameters.scad>
cad/helm_bottom.scad         # include <helm_parameters.scad>
stl/helm_plate.stl           # GENERATED output
stl/helm_bottom.stl          # GENERATED output
```

Both models include the parameters file and nothing else. If you need to change
a dimension, change it in `helm_parameters.scad` — never in the `.scad` models,
which only consume it.

`stl/*.stl` are **generated artifacts** checked in for printing. Editing an STL
by hand loses the parametric source and the next regeneration discards it.

### The parameters that must not move, and why

These carry the reason inline. Preserve the reason if you ever move the value.

| Parameter | Value | Why it is fixed |
|---|---|---|
| `plate_thickness` | `1.5` | Cherry MX clip land. The comment says **do not go thicker** — thicker and the clips do not latch. |
| `mx_corner_r` | `0.5` | Stops PETG cracking at square hole corners. This is a printability fix, not cosmetics. |
| `mx_cutout` / `mx_pitch` | `14.0` / `19.05` | MX spec, 19.05 mm pitch. |
| `mx_peg_d` / `mx_peg_x` | `1.8` / `5.08` | 5-pin plastic legs, KiCad positions at ±5.08 mm. See `BOM.md` — **5-pin** MX only. |
| `ec11_bushing` | `7.2` | Buy the threaded-bushing encoder plus nut and washer. No snap-in-only encoder. |
| `desk_angle` | `15` | Front low, rear high. `rear_h` is *derived* from `front_h` and this angle — change one and the other follows. |
| `xiao_pocket_depth` | `1.2` | Pocket is a shallow shelf, not a through-slot. |
| `m2_insert` | `3.2` | Heat-set insert, not a through-hole. |

Two other build-relevant notes:

- **`screw_positions` and `align_positions` are independent.** The 4 M2 screws
  go at the corners; the 2 alignment pins sit mid-left and mid-right, in the key
  plane. The pins locate the plate against the bottom shell. They are not
  redundant with the screws and must stay mid-span.
- **`foot_positions` uses `desk_depth`, not `plate_depth`.** Feet sit on the
  *desk* footprint, which is `plate_depth * cos(desk_angle)`. Copying
  `plate_depth` into a foot position puts the rear feet past the back edge.

## Firmware: QMK data-driven definition, not `info.mk`

```
firmware/qmk/keyboards/handwired/helm/
  keyboard.json                       # data-driven definition (no info.mk)
  config.h                            # VIAL_KEYBOARD_NAME + UID only
  rules.mk                            # MCU = RP2040, BOOTLOADER = rp2040
  keymaps/vial/keymap.c               # 4 layers
  keymaps/vial/vial.json
  keymaps/vial/rules.mk               # VIA/VIAL/ENCODER_MAP/LTO
firmware/handwired_helm_vial.uf2      # PREBUILT — flash this, it works
```

There is **no `info.mk`**. `keyboard.json` is the definition and it is
authoritative: matrix pins, encoder pins, USB VID/PID, features and the
`LAYOUT` macro all live there. `config.h` holds only the Vial name and UID —
do not move definitions into it.

### The matrix has a deliberate hole

```json
"matrix_pins": { "direct": [
    ["GP26", "GP27", "GP28", null],
    ["GP29", "GP6",  "GP7",  "GP2"]
]},
"layouts": { "LAYOUT": { "layout": [
    ... {"matrix": [0,0]}, {"matrix": [0,1]}, {"matrix": [0,2]},
    ... {"matrix": [1,0]}, {"matrix": [1,1]}, {"matrix": [1,2]},
    {"matrix": [1,3], "x": 3, "y": 1, "label": "KNOB"}
]}}
```

- The `null` in row 0 is the **XIAO bay**. It is not a missing wire to fix.
- There are **7 matrix positions for 6 keys**: the EC11 click is a matrix
  position labelled `KNOB`, which is why layer 0 in `keymap.c` has seven
  entries ending in `KC_ENT`. Six keys plus the knob click.
- `bootmagic.matrix` is `[0, 0]`, so **the top-left key enters the bootloader**.
  That is how you flash, and it is why the prebuilt `.uf2` is usable without a
  build.

### Two things in the Vial keymap that look like bugs and are not

1. **Layer 3 is entirely `KC_NO`.** That is the spare layer Vial exposes for
   user remapping. It is not an unfinished layer.
2. **`encoder_map` is only meaningful on layer 0.** Layers 1–3 set
   `{ ENCODER_CCW_CW(KC_NO, KC_NO) }`, which is the QMK idiom for "no encoder
   action on this layer". Do not "fix" the `KC_NO`s.

### `VIAL_INSECURE = yes` is deliberate — but know what it means

`keymaps/vial/rules.mk` sets `VIAL_INSECURE = yes`. That lets Vial reset the
stored layout over USB. It is the normal choice for a personal board and it is
why the keymap can be reconfigured without reflashing.

It does mean **anyone with USB access can overwrite the layout**. That is
acceptable for a BYO device on your own desk. If this board is ever shared or
publicly exhibited, revisit that flag.

`keyboard.json` sets `"url": "https://github.com/duketopceo/helm"`, which GitHub
redirects to this repo. It resolves; the name is just stale.

## You probably cannot rebuild either artifact here

Verified absent in the development environment used to write this file:

```
$ which qmk      -> not found
$ which openscad -> not found
```

So:

- **`firmware/handwired_helm_vial.uf2` (80384 bytes) is the only flashable
  firmware.** Flash it as-is. Changing `keymap.c` or `keyboard.json` does not
  change the `.uf2` — it is a prebuilt binary and there is no CI here that
  rebuilds it.
- **`stl/*.stl` cannot be regenerated** without OpenSCAD. `cad/*.scad` and
  `stl/*.stl` were last touched in the same commit, so they are currently in
  sync, but nothing enforces that.

If you change `cad/helm_parameters.scad`, say explicitly in the commit that the
STLs are now stale and need a local OpenSCAD export. Do not let a parameter
change land looking complete when the printable output no longer matches it.

## No tests, no CI, no build

There is no build step, no test suite, and no workflow. The gates that exist:

```bash
python scripts/luke-index-watcher.py --check   # INDEX.md freshness
```

`--check` **currently fails** — `INDEX.md` was last synced 2026-09-10. That is
pre-existing. Regenerating produces a large diff; keep it in its own commit.

For CAD, "testing" means rendering in OpenSCAD and measuring. For firmware, it
means flashing and enumerating as HID on macOS, Windows and Linux — the README's
first-working sequence deliberately does that with a single flying-lead key and
one encoder *before* printing anything.

## Identity constraints

Made-to-order and private. `README.md` states the locked spec and the buy list;
`BOM.md` is the parts list; `WIRING.md` is the pinout and assembly notes. These
four documents overlap, but not uniformly — update the ones your change actually
affects:

| Change | Update |
|---|---|
| A part, quantity, or spec in `cad/helm_parameters.scad` | `BOM.md`, and `README.md` if it is in the locked-spec table |
| A pin, matrix position, or encoder pin in `keyboard.json` | `WIRING.md` |
| A documented fit constraint, e.g. `plate_thickness` or `mx_corner_r` | the document that states that constraint, plus the SCAD comment |
| Assembly order or tooling | `WIRING.md` |

A change that alters a part without a matching `BOM.md` entry produces a board
that cannot be ordered, and a pin change without a `WIRING.md` update produces a
board that cannot be assembled. Those two are the failures worth catching; a CAD
change does not automatically require touching all three documents.
