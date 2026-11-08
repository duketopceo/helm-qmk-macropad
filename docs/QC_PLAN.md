# Helm QC and Acceptance

Date: 2026-11-08. Reference sample = first unit that passes all of this plan. No "looks good" passes.

## Functional (each item: blank unit-record field = not run)

1. Each of 6 keys: 20 press/release cycles. Correct HID code every press, no chatter/stuck.
2. Encoder push: 20 cycles. Correct click every press.
3. Encoder rotation: slow and normal speed, both directions. Correct count/direction per layer mapping.
4. Simultaneous inputs: press intended combinations (e.g., key + encoder push, multiple keys per host expectations).
5. Reconnect: unplug/replug 10 times. No stuck inputs, no lost remap.
6. Persistence: remap in Vial, power-cycle, recheck.
7. Soak: 2 hours connected with periodic operation. No unexplained resets or stuck inputs.

Fail = reject. Record cause and rework on the unit record.

## Mechanical

- No rubbing controls (keys, knob, push).
- No loose encoder (nut holds, no plate flex/crack).
- No cracked mounting features (clips, bosses, shelf).
- Base does not rock on a flat surface.
- Cable fully inserts.
- No trapped wires after closure.
- Case closes evenly and consistently.
- Feet secure.
- Repair path accessible (M2 screws reachable, BOOT reachable by holding BOOT while plugging USB).

## Compatibility (record OS + version + app for each)

- [ ] Linux / Omarchy-Hyprland
- [ ] macOS (version ___)
- [ ] Windows (version ___)

Prototype evidence must include dates and tester. Do not claim universal OS or application compatibility. After any CAD, wiring, or firmware revision, re-run the functional screen and at least the Omarchy/Hyprland check.

## Limits

These checks do not establish lifetime durability, key/encoder wear life, or regulatory compliance. See RELEASE_READINESS.md for commercial gating.

## Production records

Per unit: serial, hardware rev, firmware rev, CAD rev, print profile, parts batch, assembler, test results, rework, final disposition. Use `production/unit-record-template.md`. Never pre-fill a completed pass record as an example.
