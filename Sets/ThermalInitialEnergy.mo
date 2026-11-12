within UncertaintyLibrary.Sets;
function ThermalInitialEnergy "按不确定热容量和初温计算相对储热"
  input UncertaintyLibrary.Sets.Interval capacity "J/K";
  input UncertaintyLibrary.Sets.Interval temperature "Initial K";
  input Modelica.Units.SI.Temperature referenceTemperature = 293.15;
  output UncertaintyLibrary.Sets.Interval energy "Relative J";
algorithm
  assert(capacity.lo>=0 and temperature.lo>0 and referenceTemperature>0 and UncertaintyLibrary.Utilities.Internal.validInterval(temperature),"Invalid initial thermal conditions.");
  energy := UncertaintyLibrary.Sets.Multiply(capacity,UncertaintyLibrary.Sets.Interval(temperature.lo-referenceTemperature,temperature.hi-referenceTemperature));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Rectangle(extent={{-20.128,-12.96},{-9.472,25.52}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=4.144),
        Ellipse(extent={{-27.232,-28.944},{-2.368,-5.264}}, lineColor={64,64,64}, fillColor={191,0,0}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-14.8,-14.144},{-14.8,17.232}}, color={191,0,0}, thickness=1.6, pattern=LinePattern.Solid),
        Text(extent={{5.18,17.38},{43.66,-4.82}}, textString="E0", textColor={108,88,49}, fontSize=0),
        Line(points={{-35.52,-45.52},{35.52,-45.52}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-35.52,-54.4},{-35.52,-36.64}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{35.52,-54.4},{35.52,-36.64}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 按不确定热容量和初温计算相对储热</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval capacity \"J/K\"; input UncertaintyLibrary.Sets.Interval temperature \"Initial K\"; input Modelica.Units.SI.Temperature referenceTemperature = 293.15; output UncertaintyLibrary.Sets.Interval energy \"Relative J\"</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 按不确定热容量和初温计算相对储热</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">UncertaintyLibrary.Examples.ToleranceAndSelection</a></p>
<p>按不确定热容量和初温计算相对储热</p>
<p><b>行为</b> 储热相对于参考温度，温差跨零时允许负下界。</p>
<p><b>最小用法</b> 从热容公差和温度初始化区间评估初始能量。</p>
<p><b>适用边界</b> 热容视为常值，未考虑相变或温度相关比热。</p>
<p>接口及方向</p>
<ul>
<li><code>input UncertaintyLibrary.Sets.Interval capacity \"J/K\"</code></li>
<li><code>input UncertaintyLibrary.Sets.Interval temperature \"Initial K\"</code></li>
<li><code>input Modelica.Units.SI.Temperature referenceTemperature = 293.15</code></li>
<li><code>output UncertaintyLibrary.Sets.Interval energy \"Relative J\"</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">ThermalCapacityInterval</a> 提供同域宿主参考。</p>
</html>"));
end ThermalInitialEnergy;
