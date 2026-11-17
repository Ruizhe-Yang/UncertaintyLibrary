within;
package UncertaintyLibrary "Closed intervals, deterministic candidates and bounded variations"
  extends Modelica.Icons.Package;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Line(points={{-53.36,15.64},{53.36,15.64}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-53.36,4.6},{-53.36,26.68}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{53.36,4.6},{53.36,26.68}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-35.88,-22.08},{35.88,-22.08}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-35.88,-33.12},{-35.88,-11.04}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{35.88,-33.12},{35.88,-11.04}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Ellipse(extent={{-5.52,10.12},{5.52,21.16}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5)
      }),
    uses(Modelica(version="4.0.0")), version="1.0.0", Documentation(info="<html><p>UncertaintyLibrary provides interval operations, deterministic perturbations, finite candidate construction, constraints and response analysis for Modelica simulations. Its only library dependency is Modelica Standard Library 4.0.0.</p><p>Begin with <a href=\"modelica://UncertaintyLibrary.UsersGuide\">UsersGuide</a> and <a href=\"modelica://UncertaintyLibrary.Examples.BoundedMeasurement\">Examples.BoundedMeasurement</a>. Interpret each result using the supplied bounds, candidates and validity conditions.</p></html>"));
end UncertaintyLibrary;
