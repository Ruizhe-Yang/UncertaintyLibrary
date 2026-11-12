within UncertaintyLibrary.Examples;
model BoundedMeasurement "Select deterministic additive and gain disturbances for a nominal value of ten"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant nominal(k=10) annotation(Placement(transformation(origin={-155,63},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Blocks.Sources.RealExpression coordinate(y=if time<1 then -1 elseif time<2 then 0 else 1) annotation(Placement(transformation(origin={-155,-64},extent={{-12,-12},{12,12}},rotation=0)));
  UncertaintyLibrary.Perturbations.AdditiveBound additive(useCoordinateInput=true,range=UncertaintyLibrary.Sets.Interval(-0.2,0.2)) annotation(Placement(transformation(origin={-5,65},extent={{-16,-16},{16,16}},rotation=0)));
  UncertaintyLibrary.Perturbations.GainBound gain(useCoordinateInput=true,range=UncertaintyLibrary.Sets.Interval(-0.02,0.02)) annotation(Placement(transformation(origin={-5,-58},extent={{-16,-16},{16,16}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput additiveValue annotation(Placement(transformation(origin={153,65},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput gainValue annotation(Placement(transformation(origin={153,-58},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(nominal.y,additive.u) annotation(Line(points={{-141.8,63},{-81.4,63},{-81.4,65},{-21,65}},color={0,0,127}));
  connect(coordinate.y,additive.coordinate) annotation(Line(points={{-141.8,-64},{-81.4,-64},{-81.4,76.2},{-21,76.2}},color={0,0,127}));
  connect(additive.y,additiveValue) annotation(Line(points={{11,76.2},{153,76.2},{153,65}},color={0,0,127}));
  connect(nominal.y,gain.u) annotation(Line(points={{-141.8,63},{-81.4,63},{-81.4,-58},{-21,-58}},color={0,0,127}));
  connect(coordinate.y,gain.coordinate) annotation(Line(points={{-141.8,-64},{-81.4,-64},{-81.4,-46.8},{-21,-46.8}},color={0,0,127}));
  connect(gain.y,gainValue) annotation(Line(points={{11,-46.8},{153,-46.8},{153,-58}},color={0,0,127}));
  annotation(experiment(StartTime=0,StopTime=4,Interval=0.008,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true)),
    Documentation(info="<html><p><b>Purpose</b> Select deterministic additive and gain disturbances for a nominal value of ten</p><p><b>Interfaces</b> Instances and connections are shown in the Diagram layer.</p><p><b>Parameters</b> Default values are shown in the component modifiers.</p><p><b>Behavior</b> The coordinate takes -1, 0 and 1. Both outputs are 9.8, 10 and 10.2 across the three stages.</p><p><b>Initialization</b> All initial conditions are explicit in the source and component modifiers.</p><p><b>Activation and recovery</b> The given time windows follow the simulation time axis.</p><p><b>Limitations</b> This demonstration uses the declared inputs, initial conditions and idealized components.</p><p><b>Observables</b> additiveValue, gainValue and each block lower/upper.</p></html>"));
end BoundedMeasurement;
