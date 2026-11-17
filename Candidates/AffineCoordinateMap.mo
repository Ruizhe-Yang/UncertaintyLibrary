within UncertaintyLibrary.Candidates;
function AffineCoordinateMap "Affine mapping of shared coordinates to coupled parameters"
  input Real origin[:] "Reference parameter vector";
  input Real directions[size(origin,1),:] "Parameter changes by row, with one column per shared coordinate";
  input Real coordinate[size(directions,2)] "Deterministic shared coordinates in the inclusive interval [-1,1]";
  output Real values[size(origin,1)] "Affine-mapped coupled parameter vector";
algorithm
  assert(size(origin,1)>0 and size(coordinate,1)>0,"An affine map needs input and output dimensions.");
  for i in 1:size(coordinate,1) loop
    assert(coordinate[i]>=-1 and coordinate[i]<=1,"Shared coordinate outside [-1,1].");
  end for;
  values := origin+directions*coordinate;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-44.4,25.52},{-44.4,-41.08},{45.14,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Polygon(points={{-31.82,-31.46},{12.58,-31.46},{34.04,16.64},{-10.36,16.64},{-31.82,-31.46}}, lineColor={108,88,49}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-10.36,-31.46},{11.84,16.64}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid),
        Line(points={{-20.72,-7.78},{23.68,-7.78}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid),
        Ellipse(extent={{-24.05,-11.11},{-17.39,-4.45}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-1.85,-11.11},{4.81,-4.45}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{20.35,-11.11},{27.01,-4.45}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Return <code>origin+directions*coordinate</code>, with one directions column for each shared coordinate in [-1,1]. Both input and output dimensions must be positive.</p><p>Use signed direction coefficients to express same-direction or opposing parameter changes. Supply finite origin and matrix entries in the output parameter units. The map defines deterministic coupling, not a statistical correlation model.</p></html>"));
end AffineCoordinateMap;
