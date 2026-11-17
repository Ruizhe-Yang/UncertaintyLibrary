within UncertaintyLibrary.Sets;
function Subtract "Difference of two closed intervals"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval a "First finite ordered interval";
  input UncertaintyLibrary.Sets.Interval b "Second finite ordered interval";
  output UncertaintyLibrary.Sets.Interval bounds "Interval containing the endpoint combination results";
algorithm
  assert(UncertaintyLibrary.Utilities.Functions.Valid(a),"Invalid closed interval a.");
  assert(UncertaintyLibrary.Utilities.Functions.Valid(b),"Invalid closed interval b.");
  bounds:=UncertaintyLibrary.Sets.Interval(a.lo-b.hi,a.hi-b.lo);
  assert(UncertaintyLibrary.Utilities.Functions.Valid(bounds),"Invalid closed interval bounds.");
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-40.7,11.46},{40.7,11.46}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-40.7,2.58},{-40.7,20.34}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{40.7,2.58},{40.7,20.34}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-40.7,-31.46},{40.7,-31.46}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-40.7,-40.34},{-40.7,-22.58}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{40.7,-40.34},{40.7,-22.58}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-16.28,5.54},{16.28,-25.54}}, textString="-", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Return <code>[a.lo-b.hi,a.hi-b.lo]</code> after checking both input intervals. The calculated endpoints are also checked for finiteness and ordering.</p><p>The operation admits the full Cartesian product of the input ranges. It does not retain dependence between repeated occurrences of the same uncertain quantity.</p></html>"));
end Subtract;
