within UncertaintyLibrary.Analysis;
function LipschitzEnvelope "Coordinatewise derivative envelope about a nominal point"
  input Real nominalResponse "Model response at nominalPoint";
  input Real nominalPoint[:] "Reference point inside the coordinate box";
  input UncertaintyLibrary.Sets.Interval ranges[size(nominalPoint,1)] "Finite ordered range for each coordinate";
  input Real derivativeBounds[size(nominalPoint,1)] "Nonnegative absolute coordinate derivatives bounded over the whole box";
  output UncertaintyLibrary.Sets.Interval response "Nominal response expanded by the combined derivative radius";
protected
  Real radius "Sum of coordinate derivative bounds times maximum displacement";
algorithm
  radius := 0;
  for i in 1:size(nominalPoint,1) loop
    assert(UncertaintyLibrary.Utilities.Internal.validInterval(ranges[i]) and nominalPoint[i]>=ranges[i].lo and nominalPoint[i]<=ranges[i].hi and derivativeBounds[i]>=0,
      "Nominal point must lie in the box and derivative bounds must be nonnegative.");
    radius := radius+derivativeBounds[i]*max(nominalPoint[i]-ranges[i].lo,ranges[i].hi-nominalPoint[i]);
  end for;
  response := UncertaintyLibrary.Sets.Interval(nominalResponse-radius,nominalResponse+radius);
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(response),"Nonfinite discrepancy envelope.");
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Polygon(points={{-41.44,-35.9},{0,-10},{-41.44,15.9},{-41.44,-35.9}}, lineColor={128,128,128}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Polygon(points={{41.44,-35.9},{0,-10},{41.44,15.9},{41.44,-35.9}}, lineColor={128,128,128}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-41.44,-35.9},{0,-10},{41.44,15.9}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{-41.44,15.9},{0,-10},{41.44,-35.9}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Ellipse(extent={{-3.7,-13.7},{3.7,-6.3}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-14.8,42.54},{14.8,20.34}}, textString="L", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Expand nominalResponse by the sum of each derivative bound times the largest distance from nominalPoint to either endpoint of its coordinate range. The nominal point must lie within every finite ordered range, and derivative bounds must be nonnegative.</p><p>Supply a response evaluated at that nominal point and coordinatewise derivative bounds valid throughout the box. The function uses those bounds as assumptions; local finite-difference slopes alone do not establish them.</p></html>"));
end LipschitzEnvelope;
