within UncertaintyLibrary.Candidates;
function Grid1D "Uniform closed-interval grid with a midpoint singleton"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval a "Finite ordered interval to sample";
  input Integer n(min=1)=3 "Positive number of deterministic grid points";
  output Real grid[n] "Uniform values including endpoints, or a midpoint singleton";
algorithm
  assert(UncertaintyLibrary.Utilities.Functions.Valid(a),"Invalid closed interval a.");
  assert(n>=1,"Grid needs at least one point.");
  for i in 1:n loop grid[i]:=UncertaintyLibrary.Sets.SelectPoint(a,if n==1 then 0 else -1+2.0*(i-1)/(n-1)); end for;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-44.4,-10},{44.4,-10}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-44.4,-18.88},{-44.4,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{44.4,-18.88},{44.4,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Ellipse(extent={{-47.73,-13.33},{-41.07,-6.67}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-25.53,-13.33},{-18.87,-6.67}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-3.33,-13.33},{3.33,-6.67}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{18.87,-13.33},{25.53,-6.67}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{41.07,-13.33},{47.73,-6.67}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-13.32,29.96},{13.32,8.5}}, textString="n", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Return n equally spaced points on a finite ordered interval. For n=1, return its midpoint; for n&gt;1, include both endpoints in ascending order.</p><p>The points are deterministic selections. No probability distribution, integration weight or candidate response is assigned by this function.</p></html>"));
end Grid1D;
