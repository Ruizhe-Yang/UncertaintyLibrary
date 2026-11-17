within UncertaintyLibrary.Utilities.Views;
block SensitivityView "Display central slope and normalised local sensitivity"
parameter Real center=2 "Nominal parameter at the centre of the perturbations";
  parameter Real step=0.001 "Positive symmetric perturbation magnitude";
  parameter Real responseNominal=4 "Nominal response used for normalisation";
    Modelica.Blocks.Interfaces.RealOutput slope  "Central finite-difference slope of the squared response" annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput normalized  "Normalised local sensitivity or zero when unavailable" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput available  "Nominal-response magnitude meets the normalisation threshold" annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
equation
  slope=UncertaintyLibrary.Analysis.FiniteDifference((center-step)^2,(center+step)^2,step);
  (normalized,available)=UncertaintyLibrary.Analysis.NormalizedSensitivity(center,responseNominal,slope);
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-72,-52},{72,66}}, lineColor={128,128,128}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-48,-65},{48,-65}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,-52},{0,-65}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-46.97,48.81},{-46.97,-24.34},{48.51,-24.34}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-36.96,-9.71},{36.96,34.18}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{-36.96,-9.71},{36.96,-9.71},{36.96,34.18}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Ellipse(extent={{-40.81,-13.56},{-33.11,-5.86}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{33.11,30.33},{40.81,38.03}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{39,83},{72,59}}, textString="S*", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Evaluate the squared response at <code>center-step</code> and <code>center+step</code>, form the central finite difference and normalise it using the supplied nominal parameter and response.</p><p>The defaults give slope 4 and normalised sensitivity 2. Keep <code>responseNominal</code> consistent with the intended reference response when changing the centre; it is an independent parameter. Read <code>available</code> with the normalised result.</p></html>"));
end SensitivityView;
