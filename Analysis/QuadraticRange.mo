within UncertaintyLibrary.Analysis;
function QuadraticRange "Quadratic range including an interior vertex"
  input UncertaintyLibrary.Sets.Interval x "Finite ordered interval of the independent variable";
  input Real a = 1 "Quadratic coefficient";
  input Real b = 0 "Linear coefficient";
  input Real c = 0 "Constant term";
  output UncertaintyLibrary.Sets.Interval bounds "Extrema from endpoints and any interior vertex";
protected
  Real y1 "Value at the lower endpoint";
  Real y2 "Value at the upper endpoint";
  Real vertex "Stationary coordinate for a nonzero quadratic coefficient";
  Real yVertex "Value at an interior stationary coordinate";
algorithm
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(x) and max(abs({a,b,c}))<Modelica.Constants.inf,"Invalid quadratic data.");
  y1 := (a*x.lo+b)*x.lo+c;
  y2 := (a*x.hi+b)*x.hi+c;
  bounds := UncertaintyLibrary.Sets.Interval(min(y1,y2),max(y1,y2));
  if abs(a)>0 then
    vertex := -0.5*b/a;
    if vertex>x.lo and vertex<x.hi then
      yVertex := (a*vertex+b)*vertex+c;
      bounds := UncertaintyLibrary.Sets.Interval(min(bounds.lo,yVertex),max(bounds.hi,yVertex));
    end if;
  end if;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,29.22},{-45.14,-41.08},{46.62,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-40.7,23.3},{-38.7619,18.14},{-36.8239,13.2323},{-34.8858,8.5755},{-32.9478,4.171},{-31.0097,0.0174},{-29.0716,-3.8839},{-27.1336,-7.5336},{-25.1955,-10.9317},{-23.2575,-14.0774},{-21.3194,-16.9723},{-19.3806,-19.6148},{-17.4425,-22.0058},{-15.5045,-24.1458},{-13.5664,-26.0336},{-11.6284,-27.6697},{-9.6903,-29.0535},{-7.7522,-30.1865},{-5.8142,-31.0671},{-3.8761,-31.6968},{-1.9381,-32.0742},{0,-32.2},{1.9381,-32.0742},{3.8761,-31.6968},{5.8142,-31.0671},{7.7522,-30.1865},{9.6903,-29.0535},{11.6284,-27.6697},{13.5664,-26.0336},{15.5045,-24.1458},{17.4425,-22.0058},{19.3806,-19.6148},{21.3194,-16.9723},{23.2575,-14.0774},{25.1955,-10.9317},{27.1336,-7.5336},{29.0716,-3.8839},{31.0097,0.0174},{32.9478,4.171},{34.8858,8.5755},{36.8239,13.2323},{38.7619,18.14},{40.7,23.3}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{-42.92,23.3},{42.92,23.3}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Line(points={{-42.92,-32.2},{42.92,-32.2}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Ellipse(extent={{-2.96,-35.16},{2.96,-29.24}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-43.66,20.34},{-37.74,26.26}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{37.74,20.34},{43.66,26.26}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Evaluate <code>a*x^2+b*x+c</code> at both interval endpoints. If a is nonzero and the vertex -b/(2*a) lies strictly inside the interval, include its value in the returned extrema. With a=0, endpoint evaluation gives the linear range.</p><p>Supply a finite ordered interval and finite fixed coefficients. This uses the quadratic structure to include interior extrema; the coefficients themselves are not uncertain inputs.</p></html>"));
end QuadraticRange;
