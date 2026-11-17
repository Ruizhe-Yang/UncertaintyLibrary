within UncertaintyLibrary.Sets.Asymmetric;
function AbsoluteTolerance "Interval from separate lower and upper absolute tolerances"
  input Real nominal = 1 "Signed nominal value";
  input Real lowerTolerance = 0.1 "Nonnegative allowance subtracted from the nominal value";
  input Real upperTolerance = 0.1 "Nonnegative allowance added to the nominal value";
  output UncertaintyLibrary.Sets.Interval bounds "Closed interval with the two absolute allowances";
algorithm
  assert(lowerTolerance>=0 and upperTolerance>=0,"Tolerances must be nonnegative.");
  bounds := UncertaintyLibrary.Sets.Interval(nominal-lowerTolerance,nominal+upperTolerance);
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
        Text(extent={{-43.66,24.04},{-6.66,4.06}}, textString="-a", textColor={108,88,49}, fontSize=0),
        Text(extent={{6.66,24.04},{45.88,4.06}}, textString="+b", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Return <code>[nominal-lowerTolerance,nominal+upperTolerance]</code>. Each allowance must be nonnegative and use the nominal quantity's unit.</p><p>The result is checked for finite ordered endpoints. The two allowances need not be equal, and the nominal value may have either sign.</p></html>"));
end AbsoluteTolerance;
