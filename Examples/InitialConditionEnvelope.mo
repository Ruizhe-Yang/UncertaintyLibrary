within UncertaintyLibrary.Examples;
model InitialConditionEnvelope "Sample the envelope of three initial-state responses"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant zero(k=0)  "Common zero input for the three runs" annotation(Placement(transformation(origin={-183,0},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder run1(T=0.5,y_start=-0.1,initType=Modelica.Blocks.Types.Init.InitialState)  "First-order response with a negative initial value" annotation(Placement(transformation(origin={-75,90},extent={{-14,-14},{14,14}},rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder run2(T=0.5,y_start=0,initType=Modelica.Blocks.Types.Init.InitialState)  "First-order response with zero initial value" annotation(Placement(transformation(origin={-75,0},extent={{-14,-14},{14,14}},rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder run3(T=0.5,y_start=0.1,initType=Modelica.Blocks.Types.Init.InitialState)  "First-order response with a positive initial value" annotation(Placement(transformation(origin={-75,-90},extent={{-14,-14},{14,14}},rotation=0)));
  UncertaintyLibrary.Utilities.Views.EnvelopeView envelope(samplePeriod=0.1)  "Common-time sampling of the three supplied responses" annotation(Placement(transformation(origin={65,0},extent={{-20,-20},{20,20}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput lower  "Held minimum of the three sampled responses" annotation(Placement(transformation(origin={174,58},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput upper  "Held maximum of the three sampled responses" annotation(Placement(transformation(origin={174,0},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.IntegerOutput nValid  "Reported input count, without validity filtering" annotation(Placement(transformation(origin={174,-62},extent={{-7,-7},{7,7}},rotation=0)));
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
    Documentation(info="<html><p>Drive three first-order models with zero input and a common 0.5 s time constant. Their initial outputs are -0.1, 0 and 0.1. Sample their minimum and maximum every 0.1 s and hold the reported envelope between samples.</p><p>At each sample instant the bounds are -0.1*exp(-time/0.5) and 0.1*exp(-time/0.5). EnvelopeView reports nValid=3 because three inputs are supplied; it performs no validity filtering. The result describes these three runs at the common sample instants.</p></html>"));
end InitialConditionEnvelope;
