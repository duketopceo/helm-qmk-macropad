# Launch Plan (lightweight)

Date: 2026-11-08. Do not sell until RELEASE_READINESS.md items are resolved. This plan covers presentation only.

## Storefront and content rules

- Real photos of the actual device. No renders presented as product photos.
- Real workflow demonstration (video or GIF of the keys/knob driving an actual app on an actual OS).
- Verified specifications only (from VALIDATION_STATUS.md statuses; never invented specs).
- Compatibility and setup requirements stated plainly (wired USB-C data cable, Vial for remapping, no app needed).
- Shipping and support information, returns terms, batch availability.
- Waitlist before commercial readiness. Stripe Payment Links only after the readiness review, never before.
- Three.js presentation is optional; a static fallback must exist. Animation is never a dependency for checkout.

## Content sequence

Problem -> Experiment -> Failure -> Improvement -> Measured result. Every claim must trace to a unit record, build log, or QC run. No invented benefits, testimonials, or deadlines.

## Tracking (fill from real data only)

| Metric | Source | Value |
|--------|--------|-------|
| Qualified visits | Analytics or manual count | |
| Waitlist signups | Waitlist backend | |
| Checkout starts | Payment links | |
| Purchases | Payment links | |
| Support burden | Support inbox / unit records | |
| Content-production labor | Time tracking | |

## Three.js note

If a 3D preview is added, it must degrade to static images and must not block checkout. It is decoration, not evidence.
