within UncertaintyLibrary.Utilities.Types;
type MarginStatus = enumeration(GUARANTEED "Every margin in the supplied interval is nonnegative", VIOLATED "Every margin in the supplied interval is strictly negative", UNRESOLVED "The supplied interval contains both permitted and violating margins") "Classification of a supplied signed-margin interval"
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-85,-85},{85,85}}, lineColor={128,128,128}, fillColor={160,160,164}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=18),
        Text(extent={{-66,68},{-13,20}}, textString="E", textColor={255,255,255}, fontSize=0),
        Line(points={{-54,-38},{54,-38}}, color={255,255,255}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-54,-50},{-54,-26}}, color={255,255,255}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{54,-50},{54,-26}}, color={255,255,255}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{6,-58},{6,-12}}, color={255,255,255}, thickness=0.8, pattern=LinePattern.Solid)
      }),
    Documentation(info="<html><p>MarginRange returns GUARANTEED when the lower margin is nonnegative, VIOLATED when the upper margin is strictly negative, and UNRESOLVED otherwise. Equality with the requirement is permitted.</p><p>These labels classify the supplied response bounds. They do not independently establish that the bounds enclose every possible model response.</p></html>"));
