within UncertaintyLibrary.Examples;
model CoupledAndConstrainedCandidates "Filter a finite grid and compare shared-coordinate selections"
  extends Modelica.Icons.Example;
  UncertaintyLibrary.Utilities.Views.ConstraintView computed  "Constraint masks and shared-coordinate calculations" annotation(Placement(transformation(origin={-90,0},extent={{-23,-23},{23,23}},rotation=0)));
  Modelica.Blocks.Interfaces.IntegerOutput acceptedCount  "Number of accepted original grid rows" annotation(Placement(transformation(origin={155,57},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput sharedLower  "Second coupled value at coordinate minus one" annotation(Placement(transformation(origin={155,19},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput sharedMiddle  "Second coupled value at coordinate zero" annotation(Placement(transformation(origin={155,-19},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput sharedUpper  "Second coupled value at coordinate plus one" annotation(Placement(transformation(origin={155,-57},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(computed.acceptedCount,acceptedCount) annotation(Line(points={{-67,16.1},{47,16.1},{47,57},{155,57}},color={255,127,0}));
  connect(computed.sharedLower,sharedLower) annotation(Line(points={{-67,5.36666},{155,5.36666},{155,19}},color={0,0,127}));
  connect(computed.sharedMiddle,sharedMiddle) annotation(Line(points={{-67,-5.36666},{155,-5.36666},{155,-19}},color={0,0,127}));
  connect(computed.sharedUpper,sharedUpper) annotation(Line(points={{-67,-16.1},{47,-16.1},{47,-57},{155,-57}},color={0,0,127}));
  annotation(experiment(StartTime=0,StopTime=1,Interval=0.002,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true),graphics={Text(extent={{-192,137},{8,123}},textString="Computed values",textColor={34,61,73})}),
    Documentation(info="<html><p>Filter a three-by-three grid on [0,2] by [0,2] using the inequality x1+x2&lt;=2. Six rows are accepted; the view preserves their original indices through the filter outputs.</p><p>A separate shared-coordinate calculation uses nominal values {2,5} and radii {0.1,0.3}. The displayed second component is 4.7, 5 and 5.3 at coordinates -1, 0 and 1 respectively. This shared coordinate defines a particular coupled variation.</p></html>"));
end CoupledAndConstrainedCandidates;
