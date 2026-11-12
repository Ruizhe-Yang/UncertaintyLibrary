within UncertaintyLibrary.Examples;
model FiniteCandidateWorstCase "Compare the observed maxima with and without the midpoint"
  extends Modelica.Icons.Example;
  UncertaintyLibrary.Utilities.Views.ExtremaView computed annotation(Placement(transformation(origin={-90,0},extent={{-23,-23},{23,23}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput endpointMaximum annotation(Placement(transformation(origin={155,38},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput enrichedMaximum annotation(Placement(transformation(origin={155,0},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.IntegerOutput enrichedIndex annotation(Placement(transformation(origin={155,-38},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(computed.endpointMaximum,endpointMaximum) annotation(Line(points={{-67,16.1},{155,16.1},{155,38}},color={0,0,127}));
  connect(computed.enrichedMaximum,enrichedMaximum) annotation(Line(points={{-67,0},{155,0}},color={0,0,127}));
  connect(computed.enrichedIndex,enrichedIndex) annotation(Line(points={{-67,-16.1},{155,-16.1},{155,-38}},color={255,127,0}));
  annotation(experiment(StartTime=0,StopTime=1,Interval=0.002,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true),graphics={Text(extent={{-192,137},{8,123}},textString="Computed values",textColor={34,61,73})}),
    Documentation(info="<html><p><b>Purpose</b> Compare the observed maxima with and without the midpoint</p><p><b>Interfaces</b> Instances and connections are shown in the Diagram layer.</p><p><b>Parameters</b> Default values are shown in the component modifiers.</p><p><b>Behavior</b> Endpoint observations reach zero. Adding the midpoint yields one. These maxima refer to the two explicitly evaluated sets.</p><p><b>Initialization</b> All initial conditions are explicit in the source and component modifiers.</p><p><b>Activation and recovery</b> The given time windows follow the simulation time axis.</p><p><b>Limitations</b> This demonstration uses the declared inputs, initial conditions and idealized components.</p><p><b>Observables</b> endpointMaximum, enrichedMaximum, enrichedIndex</p></html>"));
end FiniteCandidateWorstCase;
