![UncertaintyLibrary: bounded assumptions, finite candidates and interpretable comparisons](docs/assets/overview.svg)

# UncertaintyLibrary

**Deterministic uncertainty representation and finite-candidate analysis in Modelica.**

**English** · [简体中文](README_zh.md)

<!-- learning-guide:start -->
> **[Detailed bilingual learning and usage guide](docs/LearningGuide.html)** — Chinese and British English in one offline-readable HTML file, with a complete component reference and every example explained. Download the HTML and open it in a browser to use language switching and search.
<!-- learning-guide:end -->

[![Source version 0.2.0](https://img.shields.io/badge/source-v0.2.0-127c83)](package.mo)
[![Modelica Standard Library 4.0.0](https://img.shields.io/badge/MSL-4.0.0-536478)](package.mo)

[Purpose](#purpose) · [Model organisation](#model-organisation) · [Quick start](#quick-start) · [Examples](#examples) · [Interpreting results](#interpreting-results)

## Purpose

UncertaintyLibrary provides explicit representations of bounded engineering assumptions: tolerances, uncertain initial conditions, calibration errors and selected model discrepancies. It combines closed intervals, reproducible candidate construction, feasibility checks, bounded signal perturbations and analysis of supplied response values.

The library is useful when a study needs to explain **which values were considered, how they were selected and what the resulting evidence covers**. It supports controlled comparisons and local sensitivity studies without requiring a probability distribution. Candidate generation and response analysis are separate: the researcher connects or executes the host models and supplies their responses to the analysis functions.

| At a glance | Current source |
| :--- | :--- |
| Modelica package | `UncertaintyLibrary` |
| Package version | **0.2.0**, declared in [package.mo](package.mo) |
| Declared library dependency | Modelica Standard Library **4.0.0** |
| Example models | **8**, in [Examples](Examples) |
| Reviewed source baseline | [`453dafe`](https://github.com/Ruizhe-Yang/UncertaintyLibrary/commit/453dafe8a87a2382811637ff00b030e6858dc9b6), 12 November 2026 |

## How it works

**Represent a bounded quantity.** [`Sets.Interval`](Sets/Interval.mo) stores inclusive lower and upper endpoints. Functions construct absolute or relative tolerances and implement interval arithmetic. [`Sets.SelectPoint`](Sets/SelectPoint.mo) maps a coordinate `xi` in `[-1, 1]` to the interval: `-1`, `0` and `1` select its lower endpoint, midpoint and upper endpoint. Units are the caller's responsibility.

**Construct and constrain an explicit candidate set.** One-dimensional grids, box corners and Cartesian grids use deterministic ordering. A one-point axis selects its midpoint; the last dimension changes fastest in a Cartesian product. [`Candidates.CartesianGrid`](Candidates/CartesianGrid.mo) is bounded to at most **4,096 points**. [`Constraints.FilterCandidates`](Constraints/FilterCandidates.mo) returns a mask, retained indices, a count and an availability flag, keeping fixed-size arrays. Use only the first `nAccepted` indices. [`Candidates.SharedCoordinate`](Candidates/SharedCoordinate.mo) expresses a chosen common variation across quantities; it does not estimate a statistical correlation.

**Apply a selected perturbation.** Additive, gain, calibration and discrepancy blocks expose bounded changes to an input signal. Bounds and coordinates remain explicit model inputs or parameters. This makes a selected case reproducible and allows nominal and perturbed settings to be compared directly.

**Analyse the supplied responses.** The Analysis package computes observed extrema, sample-aligned envelopes, finite-difference slopes, normalised sensitivity, signed margins and observed monotonicity. [`Analysis.EnvelopeAtSamples`](Analysis/EnvelopeAtSamples.mo) requires identical sample grids and reports the number of valid values at each sample. It does not interpolate misaligned trajectories or generate additional simulations.

## Model organisation

| Package | Role | Representative classes |
| :--- | :--- | :--- |
| [Sets](Sets) | Closed intervals, tolerance construction and arithmetic | `Interval`, `RelativeTolerance`, `SelectPoint`, `Divide` |
| [Candidates](Candidates) | Reproducible finite candidate construction and selection | `Grid1D`, `BoxCorners`, `CartesianGrid`, `SharedCoordinate` |
| [Constraints](Constraints) | Box and linear feasibility checks | `BoxFeasibility`, `LinearFeasibility`, `FilterCandidates` |
| [Perturbations](Perturbations) | Selected bounded changes to signals | `AdditiveBound`, `GainBound`, `CalibrationBound` |
| [Analysis](Analysis) | Comparisons and local analysis of supplied results | `CandidateExtrema`, `EnvelopeAtSamples`, `FiniteDifference` |
| [Utilities](Utilities) | Validation functions, types and example views | `Functions.Valid`, `Views.ExtremaView` |
| [Examples](Examples) | Connected demonstrations of assumptions and analysis | `BoundedMeasurement`, `FiniteCandidateWorstCase` |
| [UsersGuide](UsersGuide) | In-tool information pages | `Overview` |

The [model catalogue](model-catalog.csv) provides the wider class inventory. Its evidence labels should be interpreted per class, rather than as a blanket claim of tool compatibility.

## Quick start

```bash
git clone https://github.com/Ruizhe-Yang/UncertaintyLibrary.git
cd UncertaintyLibrary
```

Load **Modelica 4.0.0**, open the root `package.mo`, then select `UncertaintyLibrary.Examples.BoundedMeasurement`. The example declares a **0–4 s** experiment, **0.008 s** output interval and **1e-6** tolerance.

From the repository directory, the corresponding OpenModelica script is:

```modelica
loadModel(Modelica, {"4.0.0"});
loadFile("package.mo");
getErrorString();
simulate(UncertaintyLibrary.Examples.BoundedMeasurement,
  startTime=0, stopTime=4, numberOfIntervals=500, tolerance=1e-6);
getErrorString();
```

Plot `coordinate.y`, `additiveValue` and `gainValue`. The nominal value is **10**. The coordinate changes from **−1** to **0** at 1 s and to **1** at 2 s. The configured additive interval is **[−0.2, 0.2]**, and the gain-error interval is **[−0.02, 0.02]**. Both definitions therefore produce the code-derived levels **9.8, 10 and 10.2** in this example. These are analytical expectations for reproducing the example, not newly measured simulation results.

## Examples

| Example | Investigate | Useful variables | Declared stop |
| :--- | :--- | :--- | ---: |
| [ToleranceAndSelection](Examples/ToleranceAndSelection.mo) | Absolute and relative tolerances; endpoint and midpoint selection | `relativeLo`, `relativeHi`, `absoluteLo`, `mid`, `absoluteHi` | 1 s |
| [IntervalArithmetic](Examples/IntervalArithmetic.mo) | Addition, subtraction, product, division and negative affine scaling | `sumLower`, `productUpper`, `ratioLower`, `mappedUpper` | 1 s |
| [CandidateGrids](Examples/CandidateGrids.mo) | Grid sizes, ordering and singleton midpoint behaviour | `corners`, `gridPoints`, `singleton`, `secondCornerY`, `middleX` | 1 s |
| [CoupledAndConstrainedCandidates](Examples/CoupledAndConstrainedCandidates.mo) | Feasibility filtering and a common variation coordinate | `acceptedCount`, `sharedLower`, `sharedMiddle`, `sharedUpper` | 1 s |
| [BoundedMeasurement](Examples/BoundedMeasurement.mo) | Selected additive and gain errors | `additiveValue`, `gainValue`, `coordinate.y` | 4 s |
| [InitialConditionEnvelope](Examples/InitialConditionEnvelope.mo) | Three first-order responses with different initial states | `lower`, `upper`, `nValid` | 3 s |
| [FiniteCandidateWorstCase](Examples/FiniteCandidateWorstCase.mo) | How adding an interior candidate changes an observed maximum | `endpointMaximum`, `enrichedMaximum`, `enrichedIndex` | 1 s |
| [LocalSensitivity](Examples/LocalSensitivity.mo) | Central difference and normalised local sensitivity of a squared response | `slope`, `normalized`, `available` | 1 s |

## Interpreting results

The name `FiniteCandidateWorstCase` deliberately refers to a finite set. Its [implementation](Utilities/Views/ExtremaView.mo) evaluates `1 - p*p`: the endpoint set `{-1, 1}` gives an observed maximum of **0**, whereas adding the midpoint gives **1**. This example illustrates why evaluating endpoints alone can miss an interior extremum. Neither result is, by itself, a general proof over an arbitrary continuous uncertainty domain.

Similarly, an envelope covers the supplied trajectories on the specified common grid. An observed monotonic sequence does not establish global monotonicity. A shared coordinate imposes a selected dependency structure; it does not supply a probability law. These distinctions make the evidence easier to reuse and accurately report.

For a research study, record interval endpoints and units, candidate construction and ordering, constraints, retained rows, host-model revision, solver settings, sample grid and response validity. Report the candidate count alongside any observed maximum or minimum. For finite differences, state the perturbation size and reference response, and check the availability flag before interpreting a normalised result.

When citing the software, identify **UncertaintyLibrary, version 0.2.0**, the repository URL and the commit used. See the [change log](CHANGELOG.md) and [commit history](https://github.com/Ruizhe-Yang/UncertaintyLibrary/commits/main/) for maintenance context.

## Scope and assumptions

The current library concerns deterministic bounds and finite comparisons. It does not provide random sampling, probability estimation, automatic campaign execution or a global optimisation guarantee. Interval operations have explicit preconditions—for example, division requires the denominator interval to exclude zero. Reusing a quantity in interval arithmetic can introduce dependency overestimation. The selected candidate set, host-model assumptions and response qualification determine what a reported comparison supports.

## Licence and contributions

The repository contains the [GNU General Public License, version 3](LICENSE). Issues and contributions should include the source revision, Modelica tool and version, interval or candidate definition, expected result and a minimal reproducing example. Boundary cases, validity handling and clearer candidate-selection examples are useful areas for contribution.
