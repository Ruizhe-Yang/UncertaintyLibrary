within UncertaintyLibrary.Analysis;
function FiniteDifferenceJacobian "Central response Jacobian from matched perturbation matrices"
  input Real minusValues[:,:] "Negative-perturbation responses, with metrics by row and parameters by column";
  input Real plusValues[size(minusValues,1),size(minusValues,2)] "Matching positive-perturbation response matrix";
  input Real steps[size(minusValues,2)] "Finite positive perturbation for each parameter column";
  output Real jacobian[size(minusValues,1),size(minusValues,2)] "Central derivative of each metric with respect to each parameter";
algorithm
  for j in 1:size(steps,1) loop
    assert(steps[j]>0 and steps[j]<Modelica.Constants.inf,"A central perturbation step must be finite and positive.");
    for i in 1:size(minusValues,1) loop
      assert(abs(plusValues[i,j])<Modelica.Constants.inf and abs(minusValues[i,j])<Modelica.Constants.inf,
        "All matched metrics must be finite.");
      jacobian[i,j] := (plusValues[i,j]-minusValues[i,j])/(2*steps[j]);
    end for;
  end for;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-42.18,25.52},{-48.1,25.52},{-48.1,-45.52},{-42.18,-45.52}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{42.18,25.52},{48.1,25.52},{48.1,-45.52},{42.18,-45.52}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{-36.26,18.12},{-14.06,-1.12}}, textString="a", textColor={108,88,49}, fontSize=0),
        Text(extent={{-11.1,18.12},{11.1,-1.12}}, textString="b", textColor={108,88,49}, fontSize=0),
        Text(extent={{14.06,18.12},{36.26,-1.12}}, textString="c", textColor={108,88,49}, fontSize=0),
        Text(extent={{-36.26,-15.18},{-14.06,-34.42}}, textString="d", textColor={108,88,49}, fontSize=0),
        Text(extent={{-11.1,-15.18},{11.1,-34.42}}, textString="e", textColor={108,88,49}, fontSize=0),
        Text(extent={{14.06,-15.18},{36.26,-34.42}}, textString="f", textColor={108,88,49}, fontSize=0),
        Text(extent={{-15.54,46.98},{15.54,29.22}}, textString="J", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Use rows for response metrics and columns for perturbed parameters. For column j, compute each derivative as <code>(plusValues[i,j]-minusValues[i,j])/(2*steps[j])</code>.</p><p>Supply paired model results with only the selected parameter perturbed in each column and all other settings held consistent. Every step must be finite and positive and every observation finite. The function assembles local numerical derivatives; it does not perform the model evaluations.</p></html>"));
end FiniteDifferenceJacobian;
