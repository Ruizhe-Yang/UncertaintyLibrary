within UncertaintyLibrary.Examples;
model InitialConditionEnvelope "Collect a common-grid envelope of three initial conditions"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant zero(k=0) annotation(Placement(transformation(origin={-183,0},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder run1(T=0.5,y_start=-0.1,initType=Modelica.Blocks.Types.Init.InitialState) annotation(Placement(transformation(origin={-75,90},extent={{-14,-14},{14,14}},rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder run2(T=0.5,y_start=0,initType=Modelica.Blocks.Types.Init.InitialState) annotation(Placement(transformation(origin={-75,0},extent={{-14,-14},{14,14}},rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder run3(T=0.5,y_start=0.1,initType=Modelica.Blocks.Types.Init.InitialState) annotation(Placement(transformation(origin={-75,-90},extent={{-14,-14},{14,14}},rotation=0)));
  UncertaintyLibrary.Utilities.Views.EnvelopeView envelope(samplePeriod=0.1) annotation(Placement(transformation(origin={65,0},extent={{-20,-20},{20,20}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput lower annotation(Placement(transformation(origin={174,58},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput upper annotation(Placement(transformation(origin={174,0},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.IntegerOutput nValid annotation(Placement(transformation(origin={174,-62},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(zero.y,run1.u) annotation(Line(points={{-169.8,0},{-130.8,0},{-130.8,90},{-91.8,90}},color={0,0,127}));
  connect(zero.y,run2.u) annotation(Line(points={{-169.8,0},{-91.8,0}},color={0,0,127}));
  connect(zero.y,run3.u) annotation(Line(points={{-169.8,0},{-130.8,0},{-130.8,-90},{-91.8,-90}},color={0,0,127}));
  connect(run1.y,envelope.u[1]) annotation(Line(points={{-59.6,90},{-53.6,90},{-53.6,0},{45,0}},color={0,0,127}));
  connect(run2.y,envelope.u[2]) annotation(Line(points={{-59.6,0},{45,0}},color={0,0,127}));
  connect(run3.y,envelope.u[3]) annotation(Line(points={{-59.6,-90},{-53.6,-90},{-53.6,0},{45,0}},color={0,0,127}));
  connect(envelope.lower,lower) annotation(Line(points={{85,14},{174,14},{174,58}},color={0,0,127}));
  connect(envelope.upper,upper) annotation(Line(points={{85,0},{174,0}},color={0,0,127}));
  connect(envelope.nValid,nValid) annotation(Line(points={{85,-14},{174,-14},{174,-62}},color={255,127,0}));
  annotation(experiment(StartTime=0,StopTime=3,Interval=0.006,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true)),
    Documentation(info="<html><p><b>Purpose</b> Collect a common-grid envelope of three initial conditions</p><p><b>Interfaces</b> Instances and connections are shown in the Diagram layer.</p><p><b>Parameters</b> Default values are shown in the component modifiers.</p><p><b>Behavior</b> The envelope at sample times is plus or minus 0.1 exp(-2t). All three initial-condition responses are represented.</p><p><b>Initialization</b> All initial conditions are explicit in the source and component modifiers.</p><p><b>Activation and recovery</b> The given time windows follow the simulation time axis.</p><p><b>Limitations</b> This demonstration uses the declared inputs, initial conditions and idealized components.</p><p><b>Observables</b> lower, upper, nValid and run1.y through run3.y.</p></html>"));
end InitialConditionEnvelope;
