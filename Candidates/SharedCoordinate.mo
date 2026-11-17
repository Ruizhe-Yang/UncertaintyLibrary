within UncertaintyLibrary.Candidates;
function SharedCoordinate "Common or per-parameter deterministic coordinate selection"
  extends Modelica.Icons.Function;
input Real center[:] "Reference parameter values";
  input Real scale[size(center,1)] "Nonnegative half-width for each parameter";
  input Real xi(min=-1,max=1)=0 "Common signed unit coordinate, checked in both modes";
  input Boolean shared=true "Use xi for every parameter rather than individual coordinates";
  input Real coordinates[size(center,1)]=fill(xi,size(center,1)) "Individual signed unit coordinates used when shared=false";
  output Real candidate[size(center,1)] "Selected deterministic parameter vector";
algorithm
  assert(xi>=-1 and xi<=1 and min(scale)>=0,"Invalid shared coordinate or scale.");
  for i in 1:size(center,1) loop
    assert(shared or (coordinates[i]>=-1 and coordinates[i]<=1),"Coordinate outside [-1,1].");
    candidate[i]:=center[i]+scale[i]*(if shared then xi else coordinates[i]);
  end for;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Ellipse(extent={{-7.4,-17.4},{7.4,-2.6}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-44.4,-10},{-8.88,-10}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{7.4,-10},{22.2,-35.16}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{7.4,-10},{22.2,-10}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{7.4,-10},{22.2,15.16}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{25.16,-35.16},{46.62,-35.16}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{25.16,-44.04},{25.16,-26.28}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{46.62,-44.04},{46.62,-26.28}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{25.16,-10},{46.62,-10}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{25.16,-18.88},{25.16,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{46.62,-18.88},{46.62,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{25.16,15.16},{46.62,15.16}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{25.16,6.28},{25.16,24.04}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{46.62,6.28},{46.62,24.04}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-48.1,20.34},{-17.76,1.84}}, textString="xi", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Return <code>center[i]+scale[i]*xi</code> when shared=true. Otherwise use coordinates[i] in place of xi. Scales are nonnegative and the selected coordinates lie in [-1,1]; xi is checked even when shared=false.</p><p>A shared coordinate moves all parameters with the same orientation according to their scales. Use finite arrays in consistent parameter units. For signed multi-coordinate coupling, use AffineCoordinateMap. Neither choice defines statistical dependence.</p></html>"));
end SharedCoordinate;
