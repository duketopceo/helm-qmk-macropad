# Landscape: single-knob macropads

Written 2026-10-11 from one round of web searches plus the repo. "Vendor" marks a vendor's own claims. The README already carries a competitor table (Stream Deck Mini, Stream Deck +, Logitech MX Creative Console, Work Louder Creator Micro); those entries are the owner's claims and were not re-verified here.

## Others in the space
- **Elgato Stream Deck**: LCD keys with app plugins; its own comparison says macropads send shortcuts from static keys and give no on-device layer indication. [Elgato](https://www.elgato.com/us/zh/explorer/products/stream-deck/stream-deck-vs-macropad-whats-the-difference/) (vendor).
- **Adafruit MacroPad RP2040**: 12 keys, OLED, one encoder; community QMK port. [QMK readme](https://git.poz.pet/poz/qmk_firmware/raw/branch/master/keyboards/adafruit/macropad/readme.md), [board page](https://circuitpython.org/blinka/adafruit_macropad_rp2040/).
- **Little Big Scroll**: 4 hot-swap Cherry MX keys and a clickable encoder, low cost. [Lectronz](https://www.lectronz.com/products/macropad-little-big-scroll-4-v2).
- **Vial**: GUI remapping on top of QMK; a keymap folder named `vial` marks a ported keyboard. [Vial docs](https://get.vial.today/docs/porting-to-vial.html).

## What they do better
Screens or layer indication; shipped, tested firmware; hot-swap sockets (Helm is hand-soldered).

## Unique here
Locked, documented hardware spec (15 degree wedge, 1.5 mm plate, threaded EC11) with parametric OpenSCAD sources, and Linux/Hyprland as the stated wedge market.

## Findings from reading the code
- `keymaps/vial/keymap.c`: layers 1-3 contain no layer-switch key (`MO`/`TO`), so they are unreachable except through Vial remapping; layers 2-3 are placeholders (`KC_F1`.. and all `KC_NO`).
- `rules.mk` sets `VIAL_INSECURE = yes`, which turns off Vial's unlock protection; fine for a personal board, worth a note before selling units.
- The README opened with "Private." but the repo is public; `keyboard.json` `url` points at `github.com/duketopceo/helm`, not this repo's name.
- `LICENSE` is MIT with copyright "lukedaduke" (stale handle); firmware derived from QMK carries GPL obligations.
- A prebuilt `.uf2` is committed; its source commit is unrecorded.
