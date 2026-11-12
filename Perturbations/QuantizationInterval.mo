within UncertaintyLibrary.Perturbations;
function QuantizationInterval "按舍入量化步长恢复可兼容真值区间"
  input Real reading;
  input Real resolution = 0.01 "Nearest-code interval width, reading unit";
  output UncertaintyLibrary.Sets.Interval compatible;
algorithm
  assert(resolution>0,"Resolution must be positive.");
  compatible := UncertaintyLibrary.Sets.Interval(reading-resolution/2,reading+resolution/2);
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(compatible),"Invalid reading or resolution.");
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,29.22},{-45.14,-41.08},{46.62,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-39.96,-31.46},{-17.76,-31.46},{-17.76,-12.96},{5.18,-12.96},{5.18,5.54},{28.12,5.54},{28.12,23.3},{45.88,23.3}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-17.76,-50.7},{5.18,-50.7}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-17.76,-59.58},{-17.76,-41.82}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{5.18,-59.58},{5.18,-41.82}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 按舍入量化步长恢复可兼容真值区间</p><p><b>Interfaces</b> input Real reading; input Real resolution = 0.01 \"Nearest-code interval width, reading unit\"; output UncertaintyLibrary.Sets.Interval compatible</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 按舍入量化步长恢复可兼容真值区间</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.BoundedMeasurement\">UncertaintyLibrary.Examples.BoundedMeasurement</a></p>
<p>按舍入量化步长恢复可兼容真值区间</p>
<p><b>行为</b> 对最近码量化，读数±半步长给闭区间，包含两侧平局。</p>
<p><b>最小用法</b> 传入量化的角度或电压读数和分辨率。</p>
<p><b>适用边界</b> 只覆盖未饱和的最近码量化。截断、过量程和标定偏差由独立输入描述。</p>
<p>接口及方向</p>
<ul>
<li><code>input Real reading</code></li>
<li><code>input Real resolution = 0.01 \"Nearest-code interval width, reading unit\"</code></li>
<li><code>output UncertaintyLibrary.Sets.Interval compatible</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">ElectricalResistanceInterval</a> 提供同域宿主参考。</p>
</html>"));
end QuantizationInterval;
