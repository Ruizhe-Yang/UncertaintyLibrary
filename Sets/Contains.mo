within UncertaintyLibrary.Sets;
function Contains "Membership test including both interval endpoints"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval a "Finite ordered interval";
  input Real value "Value to test in the interval unit";
  output Boolean contains "True when the value lies within the inclusive endpoints";
algorithm
  assert(UncertaintyLibrary.Utilities.Functions.Valid(a),"Invalid closed interval a.");
  contains:=value>=a.lo and value<=a.hi;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-40.7,-10},{40.7,-10}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-40.7,-18.88},{-40.7,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{40.7,-18.88},{40.7,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Ellipse(extent={{5.18,-14.44},{14.06,-5.56}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-1.48,21.82},{6.956,12.94},{23.384,34.252}}, color={75,138,73}, thickness=1.5, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Return true when <code>a.lo &lt;= value &lt;= a.hi</code>. The interval is checked for finite ordered endpoints before the comparison.</p><p>Use the same physical unit for value and both endpoints. Equality with either endpoint is included.</p></html>"));
end Contains;
