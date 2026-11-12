within UncertaintyLibrary.Utilities.Functions;
function Valid "Check finite and ordered endpoints"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval x;
  output Boolean valid;
algorithm
  valid := abs(x.lo)<Modelica.Constants.inf and abs(x.hi)<Modelica.Constants.inf and x.lo<=x.hi;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-39.96,-23.32},{39.96,-23.32}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-39.96,-32.2},{-39.96,-14.44}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{39.96,-32.2},{39.96,-14.44}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-12.95,7.76},{-3.108,-2.6},{16.058,22.264}}, color={75,138,73}, thickness=1.5, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Check finite and ordered endpoints.</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval x; output Boolean valid</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Check finite and ordered endpoints</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> valid</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p></html>"));
end Valid;
