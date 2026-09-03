# Helm wiring

Direct-pin: each switch terminal goes to one GPIO on the Seeed XIAO RP2040; the other terminal goes to GND. No matrix, no diodes. Pins match `firmware/qmk/keyboards/handwired/helm/keyboard.json`.

Looking at the plate, USB at the rear (away from you):

## Pin map

| Helm function | XIAO silk | RP2040 GPIO |
|---------------|-----------|-------------|
| Key 1 top left | D0 | GP26 |
| Key 2 top middle | D1 | GP27 |
| Key 3 top right | D2 | GP28 |
| Key 4 bottom left | D3 | GP29 |
| Key 5 bottom middle | D4 | GP6 |
| Key 6 bottom right | D5 | GP7 |
| EC11 click | D8 | GP2 |
| EC11 A | D9 | GP4 |
| EC11 B | D10 | GP3 |
| Ground rail | GND | — |

## Flying-lead first (1 key + 1 encoder)

1. Snap a **5-pin** MX into the plate (plastic legs into the 1.8 mm holes). Wire one terminal to **D0 (GP26)**, the other to **GND**.
2. Seat the EC11 from below. **Nut + washer on top of the plate.** Body rests on the printed shelf. A to **D9 (GP4)**, B to **D10 (GP3)**, click to **D8 (GP2)** and GND.
3. Drop the XIAO into the rear floor pocket, USB-C through the rear wall. Cable plugs either flip. **Zip-tie the cable in the slot above the USB hole** before you yank-test it.
4. Flash (`firmware/handwired_helm_vial.uf2` or rebuild). `vial.rocks`: one key, click, both rotate directions.

## Remaining 5 keys

Same as key 1: one terminal to D1 / D2 / D3 / D4 / D5, other to the GND rail. Tin the XIAO GND pad and fan a short rail. QMK enables RP2040 pull-ups; no extra resistors.

## Do not

- Mount the encoder on the 7.2 mm hole with no nut. Knob torque will crack the plate (Bento's failure mode).
- Skip the zip-tie. A USB yank pulls the XIAO out of the pocket.
- Rely on snaps to close the case. M2 inserts only.
- Expect underside BOOT holes. Hold **BOOT while plugging in**.

Keep D+/D- pads clear. Trim EC11 legs after soldering so the body clears the shelf.
