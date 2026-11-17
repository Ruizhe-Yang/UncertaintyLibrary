within UncertaintyLibrary.Sets;
function StoredElectricalEnergy "Combined capacitive and inductive energy bounds"
  input UncertaintyLibrary.Sets.Interval capacitance "Nonnegative capacitance interval in farads";
  input UncertaintyLibrary.Sets.Interval voltage "Signed voltage interval in volts";
  input UncertaintyLibrary.Sets.Interval inductance "Nonnegative inductance interval in henries";
  input UncertaintyLibrary.Sets.Interval current "Signed current interval in amperes";
  output UncertaintyLibrary.Sets.Interval energy "Combined electrical-energy interval in joules";
protected
  UncertaintyLibrary.Sets.Interval ec "Interval for capacitance multiplied by squared voltage";
  UncertaintyLibrary.Sets.Interval el "Interval for inductance multiplied by squared current";
algorithm
  assert(capacitance.lo>=0 and inductance.lo>=0,"Energy storage coefficients must be nonnegative.");
  ec := UncertaintyLibrary.Sets.Multiply(capacitance,UncertaintyLibrary.Analysis.QuadraticRange(voltage,1,0,0));
  el := UncertaintyLibrary.Sets.Multiply(inductance,UncertaintyLibrary.Analysis.QuadraticRange(current,1,0,0));
  energy := UncertaintyLibrary.Sets.Interval(0.5*(ec.lo+el.lo),0.5*(ec.hi+el.hi));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-42.55,4.8},{-26.27,4.8}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-18.13,4.8},{-1.85,4.8}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-26.27,-4.561},{-26.27,14.161}}, color={0,0,127}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-18.13,-4.561},{-18.13,14.161}}, color={0,0,127}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{5.92,4.8},{6.1427,7.2901},{6.7954,9.61},{7.8344,11.6021},{9.1886,13.1309},{10.7648,14.0922},{12.4572,14.42},{14.1488,14.0922},{15.725,13.1309},{17.0792,11.6021},{18.1182,9.61},{18.7708,7.2901},{18.9936,4.8},{18.9936,4.8},{19.2163,7.2901},{19.869,9.61},{20.908,11.6021},{22.2622,13.1309},{23.8384,14.0922},{25.5307,14.42},{27.2224,14.0922},{28.7986,13.1309},{30.1528,11.6021},{31.1917,9.61},{31.8444,7.2901},{32.0672,4.8},{32.0672,4.8},{32.2899,7.2901},{32.9426,9.61},{33.9815,11.6021},{35.3357,13.1309},{36.9119,14.0922},{38.6043,14.42},{40.296,14.0922},{41.8722,13.1309},{43.2264,11.6021},{44.2653,9.61},{44.918,7.2901},{45.1407,4.8}}, color={0,0,127}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{-35.52,-36.64},{35.52,-36.64}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-35.52,-45.52},{-35.52,-27.76}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{35.52,-45.52},{35.52,-27.76}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-25.9,35.88},{25.9,19.6}}, textString="E0", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Evaluate <code>0.5*C*V^2+0.5*L*I^2</code> using nonnegative capacitance and inductance ranges. QuadraticRange computes each square, including its zero minimum when the signed voltage or current interval contains zero.</p><p>Supply farads, volts, henries and amperes; the result is in joules. Coefficient and state intervals are combined as a Cartesian product. The function returns data and does not initialise electrical components.</p></html>"));
end StoredElectricalEnergy;
