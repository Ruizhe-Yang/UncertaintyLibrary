within UncertaintyLibrary;
package Utilities "Supporting predicates, types and graphical views"
  extends Modelica.Icons.Package;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Line(points={{-50.6,-45.08},{40.48,46}}, color={128,128,128}, thickness=3, pattern=LinePattern.Solid),
        Ellipse(extent={{14.72,23},{59.8,68.08}}, lineColor={128,128,128}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=1.2),
        Rectangle(extent={{-60.72,-55.2},{-34.96,-29.44}}, lineColor={64,64,64}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0)
      }), Documentation(info="<html><p>Functions provides interval validation and bounded grid sizing; Types defines deterministic result labels. Views exposes selected calculations through signal connectors for the examples. Internal contains a supporting interval predicate.</p></html>"));
end Utilities;
