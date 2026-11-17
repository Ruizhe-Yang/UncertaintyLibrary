within UncertaintyLibrary.Utilities;
package Internal "Internal interval-validity support"
  extends Modelica.Icons.Package;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-47.84,-47.84},{47.84,47.84}}, lineColor={64,64,64}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-25.76,-25.76},{25.76,25.76}}, color={128,128,128}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-25.76,25.76},{25.76,-25.76}}, color={128,128,128}, thickness=1.2, pattern=LinePattern.Solid)
      }), Documentation(info="<html><p>Supporting finite-endpoint and ordering checks used by interval calculations. The predicate does not assign units or repair input data.</p></html>"));
end Internal;
