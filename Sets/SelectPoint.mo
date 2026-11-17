within UncertaintyLibrary.Sets;
function SelectPoint "Deterministic interval point from a signed coordinate"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval a "Finite ordered interval";
  input Real xi(min=-1,max=1) "Signed deterministic coordinate in [-1,1]";
  output Real value "Selected point in the interval";
algorithm
  assert(UncertaintyLibrary.Utilities.Functions.Valid(a),"Invalid closed interval a.");
  assert(xi>=-1 and xi<=1,"Coordinate outside [-1,1].");
  value:=((1-xi)*0.5)*a.lo+((1+xi)*0.5)*a.hi;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-42.18,-10},{42.18,-10}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-42.18,-18.88},{-42.18,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{42.18,-18.88},{42.18,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Ellipse(extent={{7.03,-14.07},{15.17,-5.93}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{11.1,24.04},{11.1,0.36}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-51.06,-26.28},{-25.16,-47}}, textString="-1", textColor={108,88,49}, fontSize=0),
        Text(extent={{-11.1,-26.28},{11.1,-47}}, textString="0", textColor={108,88,49}, fontSize=0),
        Text(extent={{25.16,-26.28},{51.06,-47}}, textString="+1", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Return <code>((1-xi)/2)*a.lo+((1+xi)/2)*a.hi</code>. The coordinate must lie in [-1,1]: -1 selects the lower endpoint, zero the midpoint and 1 the upper endpoint.</p><p>Call <code>SelectPoint(a,xi)</code>. The coordinate is asserted rather than clipped and does not specify a probability or random draw.</p></html>"));
end SelectPoint;
