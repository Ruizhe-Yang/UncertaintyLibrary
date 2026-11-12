within UncertaintyLibrary.Sets.Asymmetric;
function RelativeTolerance "按名义值幅值定义非对称比例公差"
  input Real nominal = 100;
  input Real lowerFraction = 0.05 "Nonnegative relative tolerance";
  input Real upperFraction = 0.05 "Nonnegative relative tolerance";
  output UncertaintyLibrary.Sets.Interval bounds;
algorithm
  assert(lowerFraction>=0 and upperFraction>=0,"Tolerance fractions must be nonnegative.");
  bounds := UncertaintyLibrary.Sets.Interval(nominal-abs(nominal)*lowerFraction,nominal+abs(nominal)*upperFraction);
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(bounds),"Invalid tolerance endpoints.");
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-37,-10},{40.7,-10}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-37,-18.88},{-37,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{40.7,-18.88},{40.7,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Ellipse(extent={{-3.7,-13.7},{3.7,-6.3}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18.5,28.48},{18.5,2.58}}, textString="%", textColor={108,88,49}, fontSize=0),
        Text(extent={{-24.42,-25.54},{24.42,-48.48}}, textString="|x|", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 按名义值幅值定义非对称比例公差</p><p><b>Interfaces</b> input Real nominal = 100; input Real lowerFraction = 0.05 \"Nonnegative relative tolerance\"; input Real upperFraction = 0.05 \"Nonnegative relative tolerance\"; output UncertaintyLibrary.Sets.Interval bounds</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 按名义值幅值定义非对称比例公差</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">UncertaintyLibrary.Examples.ToleranceAndSelection</a></p>
<p>按名义值幅值定义非对称比例公差</p>
<p><b>行为</b> 使用 abs(nominal) 保持负名义值的上下界方向。名义值为零时区间退化。</p>
<p><b>最小用法</b> 以 0.05 表示 5% 制造容差，可在参数阶段求值。</p>
<p><b>适用边界</b> 仅表达幅值比例公差。零名义量的绝对误差另行给出。</p>
<p>接口及方向</p>
<ul>
<li><code>input Real nominal = 100</code></li>
<li><code>input Real lowerFraction = 0.05 \"Nonnegative relative tolerance\"</code></li>
<li><code>input Real upperFraction = 0.05 \"Nonnegative relative tolerance\"</code></li>
<li><code>output UncertaintyLibrary.Sets.Interval bounds</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">ElectricalResistanceInterval</a> 提供同域宿主参考。</p>
</html>"));
end RelativeTolerance;
