# UncertaintyLibrary

## Name and purpose

Closed intervals, deterministic candidates and finite-set comparisons.

## Scope and non-goals

Closed intervals, deterministic candidates, feasibility and finite-set or local comparisons.

## Requirements

- Modelica Standard Library 4.0.0.
- Tested with OpenModelica 1.25.5 (64-bit), DASSL and relative tolerance 1e-6. 8/8 default examples completed in the recorded runs.
- Other Modelica tools are compatibility targets pending separate verification.

## Installation

Extract the source tree, load Modelica 4.0.0, then open `UncertaintyLibrary/package.mo`. Confirm the Modelica version in your tool. Open an example from the package tree and use its declared experiment settings.

## Package structure

```text
UncertaintyLibrary/
    UsersGuide/
    Sets/
    Candidates/
    Constraints/
    Perturbations/
    Analysis/
    Utilities/
    Examples/
```

The model catalog lists each class, its interfaces, an example and its recorded validation level.

## Core concepts and usage

- Construct Sets.Interval(lo,hi) in consistent units. Use SelectPoint with a signed coordinate and check the separate emptiness flag of Intersection.
- Build the declared grid or corners and apply the feasibility function. Preserve candidate row order and validity.
- Provide evaluated values to CandidateExtrema or aligned time rows to EnvelopeAtSamples. Interpret bounds and extrema using the declared availability flags.

## Examples

| Example | Stop time (s) | Purpose | Suggested observables |
|---|---:|---|---|
| ToleranceAndSelection | 1 | Evaluate endpoints and midpoint for two tolerance constructions | relativeLo, relativeHi, absoluteLo, mid, absoluteHi |
| CandidateGrids | 1 | Inspect one-dimensional, corner and Cartesian candidate grids | corners, gridPoints, singleton, secondCornerY, middleX |
| CoupledAndConstrainedCandidates | 1 | Filter a finite grid and vary a common coordinate | acceptedCount, sharedLower, sharedMiddle, sharedUpper |
| BoundedMeasurement | 4 | Select deterministic additive and gain disturbances for a nominal value of ten | additiveValue, gainValue and each block lower/upper. |
| IntervalArithmetic | 1 | Check interval addition, subtraction, product, division and negative scaling | sumLower, sumUpper, differenceLower, differenceUpper, productLower, productUpper, ratioLower, ratioUpper, mappedLower, mappedUpper |
| LocalSensitivity | 1 | Evaluate the local sensitivity of a squared response | slope, normalized, available |
| FiniteCandidateWorstCase | 1 | Compare the observed maxima with and without the midpoint | endpointMaximum, enrichedMaximum, enrichedIndex |
| InitialConditionEnvelope | 3 | Collect a common-grid envelope of three initial conditions | lower, upper, nValid and run1.y through run3.y. |

## Limitations and numerical assumptions

- Ordinary floating-point arithmetic and caller-owned units apply. No probability interpretation.
- Division requires an interval denominator separated from zero. Empty intersections and no feasible candidates are explicitly represented.
- Finite candidate extrema apply only to evaluated rows. Nonlinear interior responses can exceed endpoint observations.

## Version and license

Version 0.2.0. See LICENSE for the terms supplied with the original source.
