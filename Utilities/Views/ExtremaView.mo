within UncertaintyLibrary.Utilities.Views;
block ExtremaView "Compare maxima on two supplied candidate sets"
parameter Real endpoints[2]={-1,1};
  parameter Real enriched[3]={-1,0,1};
    Modelica.Blocks.Interfaces.RealOutput endpointMaximum annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput enrichedMaximum annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.IntegerOutput enrichedIndex annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
  Real minimumA;
  Real minimumB;
  Integer ia;
  Integer ib;
  Integer ja;
  Boolean availableA;
  Boolean availableB;
equation
  (minimumA,endpointMaximum,ia,ja,availableA)=UncertaintyLibrary.Analysis.CandidateExtrema({1-p*p for p in endpoints});
  (minimumB,enrichedMaximum,ib,enrichedIndex,availableB)=UncertaintyLibrary.Analysis.CandidateExtrema({1-p*p for p in enriched});
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-72,-52},{72,66}}, lineColor={128,128,128}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-48,-65},{48,-65}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,-52},{0,-65}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-44.66,-20.49},{44.66,-20.49}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-26.95,-20.49},{-26.95,14.16}}, color={108,88,49}, thickness=5, pattern=LinePattern.Solid),
        Line(points={{23.87,-20.49},{23.87,36.49}}, color={108,88,49}, thickness=5, pattern=LinePattern.Solid),
        Text(extent={{-40.04,48.04},{-13.09,25.71}}, textString="A", textColor={108,88,49}, fontSize=0),
        Text(extent={{10.01,63.44},{37.73,42.65}}, textString="B", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Compare maxima on two supplied candidate sets.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput endpointMaximum; Modelica.Blocks.Interfaces.RealOutput enrichedMaximum; Modelica.Blocks.Interfaces.IntegerOutput enrichedIndex</p><p><b>Parameters</b> parameter Real endpoints[2]={-1,1}; parameter Real enriched[3]={-1,0,1}</p><p><b>Behavior</b> Compare maxima on two supplied candidate sets</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> endpointMaximum, enrichedMaximum, enrichedIndex</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">UncertaintyLibrary.Examples.FiniteCandidateWorstCase</a></p></html>"));
end ExtremaView;
