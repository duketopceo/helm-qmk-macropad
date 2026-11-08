# Optional Desktop Software (out of V1 scope)

Date: 2026-11-08. V1 must remain fully useful without a custom app or internet connection. Nothing here is implemented.

## Later-stage feature candidates

- Application-aware profiles (different layouts per foreground app)
- Workflow configuration (one-device remapping or macros beyond QMK/Vial layers)
- Optional AI actions via a computer-side script only

## Proposed AI architecture (experiment, not a plan to build now)

Controller input -> computer-side script/companion -> OpenRouter -> result preview.

Rules:
- Never embed a customer or developer API key in firmware, public client code, or repository files. Keys stay user-side.
- No unlimited-AI promise. Require deliberate text submission and review before any consequential action (send, delete, purchase).
- Run exactly one script-based experiment before considering an application. A script is not an app, and an app is not a V1 requirement.

## What is explicitly not done

- No OpenRouter calls from firmware. The RP2040 has no network path; any AI feature must go through the host computer.
- No custom desktop app in V1. Vial at vial.rocks is the remapping interface.
- No required cloud services. Helm HID works offline.

## Trigger to revisit

The one-week daily-drive verdict (issue #4) and the pilot support record. If volume/mute/media workflows dominate use, a script experiment becomes justified. Until then, keep the firmware as HID + Vial.
