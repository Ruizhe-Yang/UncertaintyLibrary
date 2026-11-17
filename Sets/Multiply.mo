within UncertaintyLibrary.Sets;
function Multiply "Product range from all four endpoint combinations"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval a "First finite ordered interval";
  input UncertaintyLibrary.Sets.Interval b "Second finite ordered interval";
  output UncertaintyLibrary.Sets.Interval bounds "Minimum and maximum of the four endpoint products";
protected
  Real products[4] "All combinations of one endpoint from each interval";
algorithm
  assert(UncertaintyLibrary.Utilities.Functions.Valid(a),"Invalid closed interval a.");
  assert(UncertaintyLibrary.Utilities.Functions.Valid(b),"Invalid closed interval b.");
  products:={a.lo*b.lo,a.lo*b.hi,a.hi*b.lo,a.hi*b.hi};
  bounds:=UncertaintyLibrary.Sets.Interval(min(products),max(products));
  assert(UncertaintyLibrary.Utilities.Functions.Valid(bounds),"Invalid closed interval bounds.");
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-40.7,9.98},{40.7,9.98}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-40.7,1.1},{-40.7,18.86}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{40.7,1.1},{40.7,18.86}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-40.7,-29.98},{40.7,-29.98}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-40.7,-38.86},{-40.7,-21.1}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{40.7,-38.86},{40.7,-21.1}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-7.4,-17.4},{7.4,-2.6}}, color={108,88,49}, thickness=1.3, pattern=LinePattern.Solid),
        Line(points={{-7.4,-2.6},{7.4,-17.4}}, color={108,88,49}, thickness=1.3, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Evaluate all four products of the endpoints of a and b, then return their minimum and maximum. Both input intervals and the resulting bounds must be finite and ordered.</p><p>Call <code>Multiply(a,b)</code>. The two inputs represent a Cartesian product. For the square of one dependent quantity, use <code>Analysis.QuadraticRange(a,1,0,0)</code> to retain that dependence.</p></html>"));
end Multiply;
