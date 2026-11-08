# Commercial Release Readiness

Date: 2026-11-08. This repository update does NOT complete compliance work. Each item below needs an authoritative source and a dated record before any sale.

## Checklist

| Item | Status | Source needed |
|------|--------|---------------|
| Applicable equipment authorization (FCC / CE / UKCA as applicable) | BLOCKED - no authorization claimed or verified | FCC equipment authorization guidance; CE/UKCA conformity route for the destination market. Do not assume an exemption because the device is wired, small-batch, hand-built, or based on a purchased dev board. |
| Labeling and instructions | NOT STARTED | Marking rules for the chosen authorization path; user instructions in the shipped package |
| USB identification (VID/PID legitimacy) | BLOCKED - firmware uses 0x484D/0x0001 without recorded provenance | USB-IF assignment rules. A dev-board or test VID is not a commercial VID. Resolve before selling; do not borrow a vendor ID without justification. |
| Firmware and design licenses | NOT VERIFIED - repo carries MIT LICENSE; QMK/Vial upstream licenses must be checked at the pinned commit | Upstream license texts at the exact build commit; include/substitute review for non-MIT components |
| Source-distribution obligations | NOT VERIFIED | QMK/Vial source availability terms and any copyleft consequences of modifications |
| Supplier traceability | PARTIAL - bom.csv tracks SKUs; most SKUs still BLOCKED | Locked SKU + supplier + batch for every shipped unit |
| Support and returns | NOT STARTED | Support contact, warranty/returns terms, batch availability disclosure |
| Shipping and fulfillment | NOT STARTED | Carrier, customs, and tax handling per destination |
| Unresolved costs | Under COST_MODEL.md; no net-profit claims | Measured supplier quotes |

## Rule

No certification or compliance claim may be made from component selection alone. Record every unresolved item separately. Public sales, Stripe Payment Links, and customer contact require a separate owner approval after this checklist is worked through with authoritative sources.
