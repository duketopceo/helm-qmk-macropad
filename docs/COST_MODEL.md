# Helm Cost Model (framework; no supplier quotes yet)

Date: 2026-11-08. This is a measured-cost framework, not a price list. Earlier figures ($17-$34 materials, $69-$79 selling price, 30 min at $20/h) are assumptions from the original README era and are NOT supplier quotes.

## What is verified today

- Controller XIAO RP2040: $3.99 each (1 pc), $3.50 at 10+ (VERIFIED_SOURCE, Seeed, 2026-11-08). Shipping/tax not included.
- Adafruit 377 (candidate, out of stock): $4.50 / $4.05 / $3.60 tiers (VERIFIED_SOURCE, 2026-11-08). Shipping/tax not included.
- Everything else: BLOCKED (no locked SKU). Do not fill these cells with invented prices.

## Categories to fill after locking SKUs (hardware/bom.csv)

| Category | Prototype (1 unit + spare) | Pilot (5 units) |
|----------|----------------------------|-----------------|
| Components (per BOM, qty from csv) | TBD | TBD |
| Inbound shipping + tax (allocated per usable part) | TBD | TBD |
| Print material (~50 g PETG) + failed-print allowance | TBD | TBD |
| Electricity + printer wear allocation | TBD | TBD |
| Packaging | N/A (not needed for prototype) | TBD |
| Payment processing on selling price | N/A | TBD |
| Refund / rework / support allowance | N/A | TBD |
| Outbound shipping subsidy | N/A | TBD |
| **Materials-only cost** | **TBD** | **TBD** |
| Hands-on labor (print prep + assembly + flash + test + rework + packaging) | Measured (minutes) x $20/h or owner rate | Measured per unit |
| **Fully loaded variable cost** | **TBD** | **TBD** |
| Selling price (experiment, not a quote) | N/A for prototype | TBD |
| **Contribution per unit (not net profit)** | N/A | TBD |
| **Contribution %** | N/A | TBD |

## Cash needed

- One prototype (consumed parts + spare controller + tools already owned): TBD after SKUs lock.
- Five pilot units (5x consumed parts + shared tools/spare): TBD after SKUs lock.
- Keep development spares (2nd controller) separate from recurring unit cost. Keep minimum-checkout pack waste separate from per-unit consumption. Keep freight, packaging, and refunds from double-counting.
- Scenarios: compute Low/Base/High after at least two supplier quotes or measured shipping. Do not publish scenarios with invented prices.

## Time measurement (required per unit)

Machine print time, hands-on print prep, assembly, flashing, testing, rework, packaging. Record actuals on the unit record; a model without measured times is not a cost model.
