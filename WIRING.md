# Helm wiring

Helm is direct-pin: every switch terminal goes straight to a GPIO on the Seeed XIAO RP2040; the other terminal goes to GND. No matrix, no diodes.

## XIAO RP2040 pin map

| Helm function | XIAO silk | RP2040 GPIO | QMK `info.json` pin |
|---------------|-----------|-------------|---------------------|
| Key 1 (top left)     | D0 | GP26 | `GP26` |
| Key 2 (top middle)   | D1 | GP27 | `GP27` |
| Key 3 (top right)    | D2 | GP28 | `GP28` |
| Key 4 (bottom left)  | D3 | GP29 | `GP29` |
| Key 5 (bottom middle)| D4 | GP6  | `GP6`  |
| Key 6 (bottom right) | D5 | GP7  | `GP7`  |
| EC11 click (push)    | D8 | GP2  | `GP2`  |
| EC11 encoder A       | D9 | GP4  | `GP4`  |
| EC11 encoder B       | D10| GP3  | `GP3`  |
| Ground rail          | GND| —    | —      |

## Flying-lead first (1 key + 1 encoder)

1. Solder a 26–28 AWG wire from one terminal of any MX switch to **D0 (GP26)**.
2. Solder the other switch terminal to **GND**.
3. Solder the EC11 **A** pin to **D9 (GP4)** and the **B** pin to **D10 (GP3)**.
4. Solder the EC11 click switch: one terminal to **D8 (GP2)**, the other to **GND**.
5. Flash the QMK/Vial firmware, open `vial.rocks`, and confirm that the single key, click, and both rotation directions all register.

## Remaining 5 keys

Solder one terminal of each remaining switch to its GPIO and the other terminal to the common GND rail:

- D1 (GP27)
- D2 (GP28)
- D3 (GP29)
- D4 (GP6)
- D5 (GP7)

Tin the XIAO GND pad and fan a short bare-copper or wire rail to each switch. No external pull-up resistors are required; QMK enables the RP2040 internal pull-ups for direct pins by default.

## Tips

- Cut the encoder legs and pins to length after soldering; the body sits inside the bottom shell.
- Keep the D+/D- USB pads clear; the XIAO is mounted in the `helm_bottom.stl` pocket with the USB-C connector exiting the rear wall.
- The two small holes in `helm_bottom.stl` align with the XIAO BOOT and RESET buttons for a paperclip reset.
