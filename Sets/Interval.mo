within UncertaintyLibrary.Sets;
record Interval "Ordered closed interval with caller-owned units"
  extends Modelica.Icons.Record;
Real lo=0 "Inclusive lower endpoint";
Real hi=0 "Inclusive upper endpoint";
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-100,48},{100,48}}, color={108,88,49}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-45.76,-5},{45.76,-5}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-45.76,-15.56},{-45.76,5.56}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{45.76,-15.56},{45.76,5.56}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-54.56,-22.6},{-10.56,-47.24}}, textString="lo", textColor={108,88,49}, fontSize=0),
        Text(extent={{10.56,-22.6},{54.56,-47.24}}, textString="hi", textColor={108,88,49}, fontSize=0),
        Text(extent={{-70,80},{70,52}}, textString="[lo, hi]", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Ordered closed interval with caller-owned units.</p><p><b>Interfaces</b> The declared record fields or function arguments form the interface.</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Ordered closed interval with caller-owned units</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Consumers reject reversed or non-finite bounds. A zero-width interval is valid.</p><p><b>Observables</b> Public outputs and the stated input conditions.</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">UncertaintyLibrary.Examples.ToleranceAndSelection</a></p></html>"));
end Interval;
