within UncertaintyLibrary;
package Analysis "Response ranges, observed extrema and local sensitivity"
  extends Modelica.Icons.Package;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Line(points={{-56.12,48.76},{-56.12,-38.64},{57.96,-38.64}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-39.56,-22.08},{-39.56,28.52}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{-46,-22.08},{-33.12,-22.08}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{-46,28.52},{-33.12,28.52}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{0,-10.12},{0,41.4}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{-6.44,-10.12},{6.44,-10.12}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{-6.44,41.4},{6.44,41.4}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{39.56,-28.52},{39.56,19.32}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{33.12,-28.52},{46,-28.52}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{33.12,19.32},{46,19.32}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Ellipse(extent={{-42.78,7.82},{-36.34,14.26}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-42.78,-5.06},{-36.34,1.38}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-3.22,5.98},{3.22,12.42}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-3.22,25.3},{3.22,31.74}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{36.34,-10.58},{42.78,-4.14}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{36.34,4.14},{42.78,10.58}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5)
      }), Documentation(info="<html><p>Functions and blocks for finite-candidate extrema, aligned sample envelopes, local finite differences, declared requirement margins and explicit mathematical response bounds. Select the operation by its input contract and coverage assumptions.</p><p>Observed candidate extrema and local slopes do not establish continuous-domain bounds. Range formulas rely on their stated model structure or supplied derivative bounds.</p></html>"));
end Analysis;
