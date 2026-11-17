within UncertaintyLibrary.Perturbations;
function QuantizationInterval "Closed measurement bin for rounding to the nearest code"
  input Real reading "Rounded code value in the measurement unit";
  input Real resolution = 0.01 "Positive full width of the nearest-code bin";
  output UncertaintyLibrary.Sets.Interval compatible "Closed interval extending half a resolution to each side";
algorithm
  assert(resolution>0,"Resolution must be positive.");
  compatible := UncertaintyLibrary.Sets.Interval(reading-resolution/2,reading+resolution/2);
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(compatible),"Invalid reading or resolution.");
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,29.22},{-45.14,-41.08},{46.62,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-39.96,-31.46},{-17.76,-31.46},{-17.76,-12.96},{5.18,-12.96},{5.18,5.54},{28.12,5.54},{28.12,23.3},{45.88,23.3}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-17.76,-50.7},{5.18,-50.7}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-17.76,-59.58},{-17.76,-41.82}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{5.18,-59.58},{5.18,-41.82}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Return <code>[reading-resolution/2,reading+resolution/2]</code> for a positive resolution. The supplied reading represents a rounded code value and resolution is its full bin width.</p><p>The function reconstructs a compatible closed bin; it does not quantise the input reading. Both endpoints are included, so adjacent bins share their boundary.</p></html>"));
end QuantizationInterval;
