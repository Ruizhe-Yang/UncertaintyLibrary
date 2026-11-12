within UncertaintyLibrary.Sets;
function Width "Compute upper endpoint minus lower endpoint"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval a;
  output Real value;
algorithm
  assert(UncertaintyLibrary.Utilities.Functions.Valid(a),"Invalid closed interval a.");
  value:=a.hi-a.lo;
  assert(abs(value)<Modelica.Constants.inf,"Unrepresentable interval width.");
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-39.96,-2.6},{39.96,-2.6}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-39.96,-11.48},{-39.96,6.28}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{39.96,-11.48},{39.96,6.28}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-39.96,-33.68},{39.96,-33.68}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid, arrow={Arrow.Filled,Arrow.Filled}),
        Text(extent={{-14.8,41.06},{14.8,21.08}}, textString="w", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Compute upper endpoint minus lower endpoint.</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval a; output Real value</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Compute upper endpoint minus lower endpoint</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> value</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">UncertaintyLibrary.Examples.ToleranceAndSelection</a></p></html>"));
end Width;
