within UncertaintyLibrary.Utilities.Views;
block ExtremaView "Compare observed maxima on two finite point sets"
parameter Real endpoints[2]={-1,1} "Two coordinates used for the endpoint-only calculation";
  parameter Real enriched[3]={-1,0,1} "Three coordinates used for the enriched calculation";
    Modelica.Blocks.Interfaces.RealOutput endpointMaximum  "Largest finite response on the two supplied points" annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput enrichedMaximum  "Largest finite response on the three supplied points" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.IntegerOutput enrichedIndex  "First enriched row attaining the maximum, or zero if unavailable" annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
  Real minimumA "Minimum on the two-point set";
  Real minimumB "Minimum on the three-point set";
  Integer ia "Index of the two-point minimum";
  Integer ib "Index of the three-point minimum";
  Integer ja "Index of the two-point maximum";
  Boolean availableA "At least one finite two-point response is available";
  Boolean availableB "At least one finite three-point response is available";
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
    Documentation(info="<html><p>Evaluate <code>1-p*p</code> at two supplied endpoints and at three enriched points, then call CandidateExtrema for each set. The defaults {-1,1} give maximum 0; adding zero gives maximum 1 at enriched index 2.</p><p>The outputs describe these evaluated points. Adding a point can change the observed maximum without establishing coverage of a continuous domain.</p></html>"));
end ExtremaView;
