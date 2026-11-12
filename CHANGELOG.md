# Changelog

## 0.2.0

- Rename `UncertaintyModelingLibrary` to `UncertaintyLibrary`.
- Provide closed interval arithmetic, fixed-order grids, filtering and supplied-run comparisons.
- Define symmetric tolerance constructors and retain the distinct asymmetric forms under Sets.Asymmetric.
- Replace repeated legacy demonstrations with connected computation views.

### Migration

- Map the former SelectIntervalPoint fraction to Sets.SelectPoint xi with xi=2*fraction-1.
- Use Sets.Asymmetric for independent lower and upper tolerances. The standard AbsoluteTolerance and RelativeTolerance use symmetric tolerances.
