within UncertaintyLibrary;
package Constraints "Closed-box and linear candidate feasibility"
  extends Modelica.Icons.Package;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-52.44,-39.56},{52.44,39.56}}, lineColor={128,128,128}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Polygon(points={{-52.44,-39.56},{-52.44,39.56},{-33.12,39.56},{52.44,-31.28},{52.44,-39.56},{-52.44,-39.56}}, lineColor={128,128,128}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-33.12,39.56},{52.44,-31.28}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Ellipse(extent={{-29.44,-17.48},{-20.24,-8.28}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{22.08,31.28},{33.12,20.24}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{22.08,20.24},{33.12,31.28}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid)
      }), Documentation(info="<html><p>Test one point against coordinate intervals or linear upper inequalities, or apply both tests to a supplied finite candidate matrix. Masks and original row indices retain the link to the supplied data.</p></html>"));
end Constraints;
