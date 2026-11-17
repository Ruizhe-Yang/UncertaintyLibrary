within UncertaintyLibrary.Sets;
function Midpoint "Weighted midpoint of a closed interval"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval a "Finite ordered interval";
  output Real value "Arithmetic midpoint in the interval unit";
algorithm
  assert(UncertaintyLibrary.Utilities.Functions.Valid(a),"Invalid closed interval a.");
  value:=0.5*a.lo+0.5*a.hi;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-42.18,-10},{42.18,-10}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-42.18,-18.88},{-42.18,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{42.18,-18.88},{42.18,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Ellipse(extent={{-3.7,-13.7},{3.7,-6.3}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{0,26.26},{0,0.36}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-25.9,-25.54},{25.9,-46.26}}, textString="mid", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Return <code>0.5*a.lo+0.5*a.hi</code> after checking a. Halving each endpoint before addition avoids forming the full endpoint sum.</p><p>Call <code>Midpoint(a)</code>; the returned value uses the interval's physical unit.</p></html>"));
end Midpoint;
