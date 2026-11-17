within UncertaintyLibrary.Sets;
function Width "Difference between upper and lower endpoints"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval a "Finite ordered interval";
  output Real value "Nonnegative representable interval width";
algorithm
  assert(UncertaintyLibrary.Utilities.Functions.Valid(a),"Invalid closed interval a.");
  value:=a.hi-a.lo;
  assert(abs(value)<Modelica.Constants.inf,"Unrepresentable interval width.");
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-39.96,-2.6},{39.96,-2.6}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-39.96,-11.48},{-39.96,6.28}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{39.96,-11.48},{39.96,6.28}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-39.96,-33.68},{39.96,-33.68}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid, arrow={Arrow.Filled,Arrow.Filled}),
        Text(extent={{-14.8,41.06},{14.8,21.08}}, textString="w", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Return <code>a.hi-a.lo</code>. The interval must be finite and ordered; a singleton has zero width.</p><p>The calculated width is checked for finiteness. Very widely separated finite endpoints can still produce an unrepresentable width and trigger the assertion.</p></html>"));
end Width;
