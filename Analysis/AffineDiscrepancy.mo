within UncertaintyLibrary.Analysis;
function AffineDiscrepancy "传播已知模型输出的缩放和偏置差异"
  input Real prediction;
  input UncertaintyLibrary.Sets.Interval scale = UncertaintyLibrary.Sets.Interval(0.95,1.05);
  input UncertaintyLibrary.Sets.Interval bias = UncertaintyLibrary.Sets.Interval(-0.01,0.01);
  output UncertaintyLibrary.Sets.Interval response;
protected
  UncertaintyLibrary.Sets.Interval scaled;
algorithm
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(bias),"Invalid discrepancy bias range.");
  scaled := UncertaintyLibrary.Sets.Multiply(UncertaintyLibrary.Sets.Interval(prediction,prediction),scale);
  response := UncertaintyLibrary.Sets.Interval(scaled.lo+bias.lo,scaled.hi+bias.hi);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,29.22},{-45.14,-41.08},{46.62,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Polygon(points={{-39.96,-23.32},{42.92,25.52},{42.92,1.84},{-39.96,-41.08},{-39.96,-23.32}}, lineColor={128,128,128}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-39.96,-23.32},{42.92,25.52}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-39.96,-41.08},{42.92,1.84}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-39.96,-31.46},{42.92,9.98}}, color={128,128,128}, thickness=0.7, pattern=LinePattern.Dash),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 传播已知模型输出的缩放和偏置差异</p><p><b>Interfaces</b> input Real prediction; input UncertaintyLibrary.Sets.Interval scale = UncertaintyLibrary.Sets.Interval(0.95,1.05); input UncertaintyLibrary.Sets.Interval bias = UncertaintyLibrary.Sets.Interval(-0.01,0.01); output UncertaintyLibrary.Sets.Interval response</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 传播已知模型输出的缩放和偏置差异</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.LocalSensitivity\">UncertaintyLibrary.Examples.LocalSensitivity</a></p>
<p>传播已知模型输出的缩放和偏置差异</p>
<p><b>行为</b> 先传播预测值乘以缩放区间，再加偏置区间。</p>
<p><b>最小用法</b> 由实验或设计给出误差上下界，可在结果输出侧表达简化模型偏差。</p>
<p><b>适用边界</b> 模型只传播给定区间。偏差边界的依据由使用者提供。</p>
<p>接口及方向</p>
<ul>
<li><code>input Real prediction</code></li>
<li><code>input UncertaintyLibrary.Sets.Interval scale = UncertaintyLibrary.Sets.Interval(0.95,1.05)</code></li>
<li><code>input UncertaintyLibrary.Sets.Interval bias = UncertaintyLibrary.Sets.Interval(-0.01,0.01)</code></li>
<li><code>output UncertaintyLibrary.Sets.Interval response</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">CorrelatedWorstCase</a> 提供同域宿主参考。</p>
</html>"));
end AffineDiscrepancy;
