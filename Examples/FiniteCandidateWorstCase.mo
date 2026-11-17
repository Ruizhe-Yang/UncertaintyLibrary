within UncertaintyLibrary.Examples;
model FiniteCandidateWorstCase "Compare sampled maxima before and after adding a midpoint"
  extends Modelica.Icons.Example;
  UncertaintyLibrary.Utilities.Views.ExtremaView computed  "Comparison of two finite response sets" annotation(Placement(transformation(origin={-90,0},extent={{-23,-23},{23,23}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput endpointMaximum  "Largest response among the two endpoints" annotation(Placement(transformation(origin={155,38},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput enrichedMaximum  "Largest response after including the midpoint" annotation(Placement(transformation(origin={155,0},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.IntegerOutput enrichedIndex  "Original index of the largest enriched response" annotation(Placement(transformation(origin={155,-38},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(computed.endpointMaximum,endpointMaximum) annotation(Line(points={{-67,16.1},{155,16.1},{155,38}},color={0,0,127}));
  connect(computed.enrichedMaximum,enrichedMaximum) annotation(Line(points={{-67,0},{155,0}},color={0,0,127}));
  connect(computed.enrichedIndex,enrichedIndex) annotation(Line(points={{-67,-16.1},{155,-16.1},{155,-38}},color={255,127,0}));
  annotation(experiment(StartTime=0,StopTime=1,Interval=0.002,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true),graphics={Text(extent={{-192,137},{8,123}},textString="Computed values",textColor={34,61,73})}),
    Documentation(info="<html><p>Evaluate 1-p*p at endpoints {-1,1} and at the enriched set {-1,0,1}. The observed maximum changes from zero to one when the midpoint is included.</p><p>Plot endpointMaximum, enrichedMaximum and enrichedIndex. The enriched maximum is at candidate index 2. The example illustrates candidate coverage; CandidateExtrema only compares the responses supplied to it.</p></html>"));
end FiniteCandidateWorstCase;
