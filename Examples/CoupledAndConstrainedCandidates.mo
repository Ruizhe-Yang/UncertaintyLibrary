within UncertaintyLibrary.Examples;
model CoupledAndConstrainedCandidates "Filter a finite grid and vary a common coordinate"
  extends Modelica.Icons.Example;
  UncertaintyLibrary.Utilities.Views.ConstraintView computed annotation(Placement(transformation(origin={-90,0},extent={{-23,-23},{23,23}},rotation=0)));
  Modelica.Blocks.Interfaces.IntegerOutput acceptedCount annotation(Placement(transformation(origin={155,57},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput sharedLower annotation(Placement(transformation(origin={155,19},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput sharedMiddle annotation(Placement(transformation(origin={155,-19},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput sharedUpper annotation(Placement(transformation(origin={155,-57},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(computed.acceptedCount,acceptedCount) annotation(Line(points={{-67,16.1},{47,16.1},{47,57},{155,57}},color={255,127,0}));
  connect(computed.sharedLower,sharedLower) annotation(Line(points={{-67,5.36666},{155,5.36666},{155,19}},color={0,0,127}));
  connect(computed.sharedMiddle,sharedMiddle) annotation(Line(points={{-67,-5.36666},{155,-5.36666},{155,-19}},color={0,0,127}));
  connect(computed.sharedUpper,sharedUpper) annotation(Line(points={{-67,-16.1},{47,-16.1},{47,-57},{155,-57}},color={0,0,127}));
  annotation(experiment(StartTime=0,StopTime=1,Interval=0.002,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true),graphics={Text(extent={{-192,137},{8,123}},textString="Computed values",textColor={34,61,73})}),
    Documentation(info="<html><p><b>Purpose</b> Filter a finite grid and vary a common coordinate</p><p><b>Interfaces</b> Instances and connections are shown in the Diagram layer.</p><p><b>Parameters</b> Default values are shown in the component modifiers.</p><p><b>Behavior</b> Exactly six rows satisfy x+y&lt;=2. Shared coordinates give second dimensions 4.7, 5 and 5.3.</p><p><b>Initialization</b> All initial conditions are explicit in the source and component modifiers.</p><p><b>Activation and recovery</b> The given time windows follow the simulation time axis.</p><p><b>Limitations</b> This demonstration uses the declared inputs, initial conditions and idealized components.</p><p><b>Observables</b> acceptedCount, sharedLower, sharedMiddle, sharedUpper</p></html>"));
end CoupledAndConstrainedCandidates;
