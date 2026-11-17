within UncertaintyLibrary.Utilities.Functions;
function Valid "Check finite ordered interval endpoints"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval x "Interval to be checked";
  output Boolean valid "True for finite endpoints in nondecreasing order";
algorithm
  valid := abs(x.lo)<Modelica.Constants.inf and abs(x.hi)<Modelica.Constants.inf and x.lo<=x.hi;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-39.96,-23.32},{39.96,-23.32}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-39.96,-32.2},{-39.96,-14.44}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{39.96,-32.2},{39.96,-14.44}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-12.95,7.76},{-3.108,-2.6},{16.058,22.264}}, color={75,138,73}, thickness=1.5, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Return true when both endpoint magnitudes are below infinity and <code>x.lo &lt;= x.hi</code>. A singleton interval is valid.</p><p>The function reports a Boolean result without changing the interval. It does not check physical units or application-specific limits.</p></html>"));
end Valid;
