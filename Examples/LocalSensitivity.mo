within UncertaintyLibrary.Examples;
model LocalSensitivity "Evaluate the local sensitivity of a squared response"
  extends Modelica.Icons.Example;
  UncertaintyLibrary.Utilities.Views.SensitivityView computed annotation(Placement(transformation(origin={-90,0},extent={{-23,-23},{23,23}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput slope annotation(Placement(transformation(origin={155,38},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput normalized annotation(Placement(transformation(origin={155,0},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.BooleanOutput available annotation(Placement(transformation(origin={155,-38},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(computed.slope,slope) annotation(Line(points={{-67,16.1},{155,16.1},{155,38}},color={0,0,127}));
  connect(computed.normalized,normalized) annotation(Line(points={{-67,0},{155,0}},color={0,0,127}));
  connect(computed.available,available) annotation(Line(points={{-67,-16.1},{155,-16.1},{155,-38}},color={255,0,255}));
  annotation(experiment(StartTime=0,StopTime=1,Interval=0.002,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true),graphics={Text(extent={{-192,137},{8,123}},textString="Computed values",textColor={34,61,73})}),
    Documentation(info="<html><p><b>Purpose</b> Evaluate the local sensitivity of a squared response</p><p><b>Interfaces</b> Instances and connections are shown in the Diagram layer.</p><p><b>Parameters</b> Default values are shown in the component modifiers.</p><p><b>Behavior</b> The central slope is 4 and the normalized sensitivity is 2. Zero reference response marks normalized sensitivity unavailable.</p><p><b>Initialization</b> All initial conditions are explicit in the source and component modifiers.</p><p><b>Activation and recovery</b> The given time windows follow the simulation time axis.</p><p><b>Limitations</b> This demonstration uses the declared inputs, initial conditions and idealized components.</p><p><b>Observables</b> slope, normalized, available</p></html>"));
end LocalSensitivity;
