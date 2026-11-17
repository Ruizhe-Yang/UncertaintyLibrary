within UncertaintyLibrary.Sets.Asymmetric;
function RelativeTolerance "Interval from separate fractions of the nominal magnitude"
  input Real nominal = 100 "Signed nominal value";
  input Real lowerFraction = 0.05 "Nonnegative fraction of nominal magnitude for the lower allowance";
  input Real upperFraction = 0.05 "Nonnegative fraction of nominal magnitude for the upper allowance";
  output UncertaintyLibrary.Sets.Interval bounds "Closed interval with the two relative allowances";
algorithm
  assert(lowerFraction>=0 and upperFraction>=0,"Tolerance fractions must be nonnegative.");
  bounds := UncertaintyLibrary.Sets.Interval(nominal-abs(nominal)*lowerFraction,nominal+abs(nominal)*upperFraction);
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(bounds),"Invalid tolerance endpoints.");
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-37,-10},{40.7,-10}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-37,-18.88},{-37,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{40.7,-18.88},{40.7,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Ellipse(extent={{-3.7,-13.7},{3.7,-6.3}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18.5,28.48},{18.5,2.58}}, textString="%", textColor={108,88,49}, fontSize=0),
        Text(extent={{-24.42,-25.54},{24.42,-48.48}}, textString="|x|", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Subtract <code>abs(nominal)*lowerFraction</code> from the nominal value and add <code>abs(nominal)*upperFraction</code>. Both dimensionless fractions must be nonnegative.</p><p>The signed nominal value sets the centre reference, while its magnitude sets each allowance. At nominal=0 the interval has zero width.</p></html>"));
end RelativeTolerance;
