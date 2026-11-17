within UncertaintyLibrary;
package Perturbations "Deterministic signal perturbations and measurement intervals"
  extends Modelica.Icons.Package;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Polygon(points={{-55.2,24.84},{-55.2,-24.84},{-8.28,0},{-55.2,24.84}}, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-46.92,15.64},{-22.08,-15.64}}, textString="k", textColor={0,0,127}, fontSize=0),
        Line(points={{-7.36,0},{6.44,0}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Ellipse(extent={{8.28,-21.16},{50.6,21.16}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{12.88,16.56},{46,-16.56}}, textString="+", textColor={0,0,127}, fontSize=0),
        Line(points={{50.6,0},{62.56,0}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{-47.84,50.6},{47.84,50.6}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-47.84,39.56},{-47.84,61.64}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{47.84,39.56},{47.84,61.64}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid)
      }),
    Documentation(info="<html><p>Apply selected additive, gain, calibration or basis-scaled discrepancies, or reconstruct compatible measurement intervals. Signal blocks expose selected values and, where declared, pointwise bounds.</p><p>Signed coordinate blocks use [-1,1]; BoundedParameterTrace uses [0,1] with a validity output and midpoint fallback. These relations specify deterministic values and ranges without random sampling or probability distributions.</p></html>"));
end Perturbations;
