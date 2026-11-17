within UncertaintyLibrary.Analysis;
function WindPressureBounds "Dynamic-pressure interval from signed speed and density"
  input UncertaintyLibrary.Sets.Interval speed "Signed flow-speed interval in metres per second";
  input UncertaintyLibrary.Sets.Interval density "Nonnegative density interval in kilograms per cubic metre";
  output UncertaintyLibrary.Sets.Interval pressure "Nonnegative dynamic-pressure interval in pascals";
protected
  UncertaintyLibrary.Sets.Interval p "Density interval multiplied by the squared-speed interval";
algorithm
  assert(density.lo>=0,"Density cannot be negative.");
  p := UncertaintyLibrary.Sets.Multiply(density,UncertaintyLibrary.Analysis.QuadraticRange(speed,1,0,0));
  pressure := UncertaintyLibrary.Sets.Interval(p.lo/2,p.hi/2);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-44.4,12.2},{11.1,12.2},{18.5,21.08},{28.86,19.6},{31.82,9.98},{25.9,3.32}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-44.4,-6.3},{28.86,-6.3},{37.74,-12.96},{34.04,-23.32}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{30.34,29.96},{47.36,8.5}}, textString="p", textColor={0,0,127}, fontSize=0),
        Line(points={{-35.52,-39.6},{35.52,-39.6}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-35.52,-48.48},{-35.52,-30.72}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{35.52,-48.48},{35.52,-30.72}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Evaluate <code>0.5*density*speed^2</code> using QuadraticRange for the squared-speed interval. When the speed range contains zero, its squared lower bound is zero rather than the smaller squared endpoint.</p><p>Use speed in metres per second and nonnegative density in kilograms per cubic metre. The result is a nonnegative dynamic-pressure interval in pascals; it carries no flow direction and supplies no aerodynamic force or coefficient model.</p></html>"));
end WindPressureBounds;
