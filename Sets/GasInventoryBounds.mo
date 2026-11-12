within UncertaintyLibrary.Sets;
function GasInventoryBounds "根据理想气体容积压力和温度计算初始质量范围"
  input UncertaintyLibrary.Sets.Interval pressure "Absolute Pa";
  input UncertaintyLibrary.Sets.Interval volume "m3";
  input UncertaintyLibrary.Sets.Interval temperature "Absolute K";
  input Real specificGasConstant(unit="J/(kg.K)") = 287.05;
  output UncertaintyLibrary.Sets.Interval mass "kg";
protected
  UncertaintyLibrary.Sets.Interval pv;
algorithm
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(pressure) and UncertaintyLibrary.Utilities.Internal.validInterval(volume) and UncertaintyLibrary.Utilities.Internal.validInterval(temperature) and min(pressure.lo,min(volume.lo,temperature.lo))>0
    and specificGasConstant>0,"Gas inventory requires positive absolute data.");
  pv := UncertaintyLibrary.Sets.Multiply(pressure,volume);
  mass := UncertaintyLibrary.Sets.Divide(pv,UncertaintyLibrary.Sets.Interval(specificGasConstant*temperature.lo,specificGasConstant*temperature.hi));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Rectangle(extent={{-20.72,-18.066},{20.72,23.374}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Ellipse(extent={{-20.72,17.158},{20.72,29.072}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-22.94,13.68},{22.94,-7.78}}, textString="m0", textColor={0,0,127}, fontSize=0),
        Line(points={{-35.52,-41.82},{35.52,-41.82}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-35.52,-50.7},{-35.52,-32.94}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{35.52,-50.7},{35.52,-32.94}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 根据理想气体容积压力和温度计算初始质量范围</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval pressure \"Absolute Pa\"; input UncertaintyLibrary.Sets.Interval volume \"m3\"; input UncertaintyLibrary.Sets.Interval temperature \"Absolute K\"; input Real specificGasConstant(unit=\"J/(kg.K)\") = 287.05; output UncertaintyLibrary.Sets.Interval mass \"kg\"</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 根据理想气体容积压力和温度计算初始质量范围</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">UncertaintyLibrary.Examples.ToleranceAndSelection</a></p>
<p>根据理想气体容积压力和温度计算初始质量范围</p>
<p><b>行为</b> 使用 pV/(R·T)，分母区间远离零。</p>
<p><b>最小用法</b> 为理想气体储罐估算不确定初始库存质量。</p>
<p><b>适用边界</b> 只适用于定比气体常数的理想气体。实际介质初始化由宿主求解。</p>
<p>接口及方向</p>
<ul>
<li><code>input UncertaintyLibrary.Sets.Interval pressure \"Absolute Pa\"</code></li>
<li><code>input UncertaintyLibrary.Sets.Interval volume \"m3\"</code></li>
<li><code>input UncertaintyLibrary.Sets.Interval temperature \"Absolute K\"</code></li>
<li><code>input Real specificGasConstant(unit=\"J/(kg.K)\") = 287.05</code></li>
<li><code>output UncertaintyLibrary.Sets.Interval mass \"kg\"</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">FluidRestrictionInterval</a> 提供同域宿主参考。</p>
</html>"));
end GasInventoryBounds;
