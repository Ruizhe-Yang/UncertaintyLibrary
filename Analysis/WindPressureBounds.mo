within UncertaintyLibrary.Analysis;
function WindPressureBounds "由风速密度范围计算风动压界"
  input UncertaintyLibrary.Sets.Interval speed "Signed flow speed in m/s";
  input UncertaintyLibrary.Sets.Interval density "kg/m3";
  output UncertaintyLibrary.Sets.Interval pressure "Dynamic pressure in Pa";
protected
  UncertaintyLibrary.Sets.Interval p;
algorithm
  assert(density.lo>=0,"Density cannot be negative.");
  p := UncertaintyLibrary.Sets.Multiply(density,UncertaintyLibrary.Analysis.QuadraticRange(speed,1,0,0));
  pressure := UncertaintyLibrary.Sets.Interval(p.lo/2,p.hi/2);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-44.4,12.2},{11.1,12.2},{18.5,21.08},{28.86,19.6},{31.82,9.98},{25.9,3.32}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-44.4,-6.3},{28.86,-6.3},{37.74,-12.96},{34.04,-23.32}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{30.34,29.96},{47.36,8.5}}, textString="p", textColor={0,0,127}, fontSize=0),
        Line(points={{-35.52,-39.6},{35.52,-39.6}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-35.52,-48.48},{-35.52,-30.72}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{35.52,-48.48},{35.52,-30.72}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 由风速密度范围计算风动压界</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval speed \"Signed flow speed in m/s\"; input UncertaintyLibrary.Sets.Interval density \"kg/m3\"; output UncertaintyLibrary.Sets.Interval pressure \"Dynamic pressure in Pa\"</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 由风速密度范围计算风动压界</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.LocalSensitivity\">UncertaintyLibrary.Examples.LocalSensitivity</a></p>
<p>由风速密度范围计算风动压界</p>
<p><b>行为</b> 以 ρv²/2 传播，风速跨零时可能得到零下界。</p>
<p><b>最小用法</b> 把气体密度和风速范围用于载荷估计。</p>
<p><b>适用边界</b> 仅为动压，实际阻力方向及系数由宿主计算。</p>
<p>接口及方向</p>
<ul>
<li><code>input UncertaintyLibrary.Sets.Interval speed \"Signed flow speed in m/s\"</code></li>
<li><code>input UncertaintyLibrary.Sets.Interval density \"kg/m3\"</code></li>
<li><code>output UncertaintyLibrary.Sets.Interval pressure \"Dynamic pressure in Pa\"</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">MechanicalInertiaInterval</a> 提供同域宿主参考。</p>
</html>"));
end WindPressureBounds;
