within UncertaintyLibrary.Analysis;
function FiniteDifference "Central finite difference from two supplied responses"
  extends Modelica.Icons.Function;
input Real fMinus "Response at the negative parameter perturbation";
  input Real fPlus "Response at the positive parameter perturbation";
  input Real step(min=0) "Positive perturbation magnitude in the parameter unit";
  output Real slope "Central response slope per unit parameter";
algorithm
  assert(step>0,"The finite difference step must be positive.");
  slope:=(fPlus-fMinus)/(2*step);
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,29.22},{-45.14,-41.08},{46.62,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-35.52,-27.02},{35.52,15.16}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{-35.52,-27.02},{35.52,-27.02},{35.52,15.16}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Ellipse(extent={{-39.22,-30.72},{-31.82,-23.32}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{31.82,11.46},{39.22,18.86}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Return <code>(fPlus-fMinus)/(2*step)</code> for responses at symmetric parameter perturbations. The parameter step must be positive.</p><p>Supply finite matched observations and a finite step in the parameter unit. Only step positivity is asserted internally. The result is a local numerical slope; the function does not evaluate the underlying model.</p></html>"));
end FiniteDifference;
