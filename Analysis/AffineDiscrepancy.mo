within UncertaintyLibrary.Analysis;
function AffineDiscrepancy "Scaled prediction with an additive discrepancy interval"
  input Real prediction "Nominal scalar prediction";
  input UncertaintyLibrary.Sets.Interval scale = UncertaintyLibrary.Sets.Interval(0.95,1.05) "Dimensionless multiplicative discrepancy interval";
  input UncertaintyLibrary.Sets.Interval bias = UncertaintyLibrary.Sets.Interval(-0.01,0.01) "Additive discrepancy interval in the prediction unit";
  output UncertaintyLibrary.Sets.Interval response "Prediction interval after scale and bias";
protected
  UncertaintyLibrary.Sets.Interval scaled "Intermediate scaled-prediction interval";
algorithm
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(bias),"Invalid discrepancy bias range.");
  scaled := UncertaintyLibrary.Sets.Multiply(UncertaintyLibrary.Sets.Interval(prediction,prediction),scale);
  response := UncertaintyLibrary.Sets.Interval(scaled.lo+bias.lo,scaled.hi+bias.hi);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,29.22},{-45.14,-41.08},{46.62,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Polygon(points={{-39.96,-23.32},{42.92,25.52},{42.92,1.84},{-39.96,-41.08},{-39.96,-23.32}}, lineColor={128,128,128}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-39.96,-23.32},{42.92,25.52}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-39.96,-41.08},{42.92,1.84}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-39.96,-31.46},{42.92,9.98}}, color={128,128,128}, thickness=0.7, pattern=LinePattern.Dash),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Multiply the point interval [prediction,prediction] by scale, then add the lower and upper bias endpoints to the corresponding product endpoints. Negative predictions are handled by the interval product.</p><p>Supply a dimensionless scale interval and a bias in the prediction unit. The two ranges are treated independently; no coupling relation or probability distribution is represented.</p></html>"));
end AffineDiscrepancy;
