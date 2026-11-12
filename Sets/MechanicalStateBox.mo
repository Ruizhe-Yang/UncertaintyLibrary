within UncertaintyLibrary.Sets;
function MechanicalStateBox "在位置速度初值盒内生成一致的平动初态"
  input UncertaintyLibrary.Sets.Interval positionRange "Position bounds in m";
  input UncertaintyLibrary.Sets.Interval speedRange "Velocity bounds in m/s";
  input Real fractions[2] = {0.5,0.5};
  output Modelica.Units.SI.Position position;
  output Modelica.Units.SI.Velocity velocity;
algorithm
  position := UncertaintyLibrary.Sets.SelectPoint(positionRange,fractions[1]);
  velocity := UncertaintyLibrary.Sets.SelectPoint(speedRange,fractions[2]);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-46.62,29.22},{-46.62,-44.04},{45.88,-44.04}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Rectangle(extent={{-29.6,-27.02},{31.08,15.9}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Text(extent={{-45.88,46.24},{-11.84,29.22}}, textString="v0", textColor={108,88,49}, fontSize=0),
        Text(extent={{14.8,-47},{48.1,-61.8}}, textString="s0", textColor={108,88,49}, fontSize=0),
        Ellipse(extent={{2.22,-5.56},{11.1,3.32}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 在位置速度初值盒内生成一致的平动初态</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval positionRange \"Position bounds in m\"; input UncertaintyLibrary.Sets.Interval speedRange \"Velocity bounds in m/s\"; input Real fractions[2] = {0.5,0.5}; output Modelica.Units.SI.Position position; output Modelica.Units.SI.Velocity velocity</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 在位置速度初值盒内生成一致的平动初态</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">UncertaintyLibrary.Examples.ToleranceAndSelection</a></p>
<p>在位置速度初值盒内生成一致的平动初态</p>
<p><b>行为</b> 两条坐标各自选择闭区间内的点。用于宿主参数初始化。</p>
<p><b>最小用法</b> 把 position、velocity 映射到 MSL Mass 的状态初值与 fixed。</p>
<p><b>适用边界</b> 该盒允许独立组合。机械约束或关联初值需要先筛选。</p>
<p>接口及方向</p>
<ul>
<li><code>input UncertaintyLibrary.Sets.Interval positionRange \"Position bounds in m\"</code></li>
<li><code>input UncertaintyLibrary.Sets.Interval speedRange \"Velocity bounds in m/s\"</code></li>
<li><code>input Real fractions[2] = {0.5,0.5}</code></li>
<li><code>output Modelica.Units.SI.Position position</code></li>
<li><code>output Modelica.Units.SI.Velocity velocity</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">MechanicalInertiaInterval</a> 提供同域宿主参考。</p>
</html>"));
end MechanicalStateBox;
