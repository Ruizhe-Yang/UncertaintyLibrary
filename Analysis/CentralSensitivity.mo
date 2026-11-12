within UncertaintyLibrary.Analysis;
function CentralSensitivity "由三点结果估计中心灵敏度和曲率"
  input Real minusValue;
  input Real centerValue;
  input Real plusValue;
  input Real step = 0.1 "Positive perturbation in the parameter unit";
  output Real slope "Metric unit / parameter unit";
  output Real curvature "Metric unit / parameter unit squared";
algorithm
  assert(step>0 and step<Modelica.Constants.inf and max(abs({minusValue,centerValue,plusValue}))<Modelica.Constants.inf,
    "Finite central observations and a positive step are required.");
  slope := (plusValue-minusValue)/(2*step);
  curvature := ((plusValue-centerValue)/step-(centerValue-minusValue)/step)/step;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,29.22},{-45.14,-41.08},{46.62,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-40.7,-26.28},{-38.7619,-25.5171},{-36.8239,-24.7445},{-34.8858,-23.9616},{-32.9478,-23.169},{-31.0097,-22.3661},{-29.0716,-21.5529},{-27.1336,-20.73},{-25.1955,-19.8968},{-23.2575,-19.0539},{-21.3194,-18.2007},{-19.3806,-17.3371},{-17.4425,-16.4639},{-15.5045,-15.5803},{-13.5664,-14.6864},{-11.6284,-13.7829},{-9.6903,-12.8697},{-7.7522,-11.9455},{-5.8142,-11.0116},{-3.8761,-10.0681},{-1.9381,-9.1142},{0,-8.15},{1.9381,-7.1762},{3.8761,-6.192},{5.8142,-5.1974},{7.7522,-4.1932},{9.6903,-3.1787},{11.6284,-2.1545},{13.5664,-1.12},{15.5045,-0.0751},{17.4425,0.9794},{19.3806,2.0442},{21.3194,3.1187},{23.2575,4.2036},{25.1955,5.298},{27.1336,6.4036},{29.0716,7.518},{31.0097,8.6436},{32.9478,9.7787},{34.8858,10.9242},{36.8239,12.0794},{38.7619,13.2449},{40.7,14.42}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-38.48,-29.98},{38.48,10.72}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Ellipse(extent={{-34.41,-27.39},{-27.75,-20.73}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-3.33,-11.48},{3.33,-4.82}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{27.75,4.43},{34.41,11.09}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-42.18,44.02},{45.88,24.04}}, textString="dy/dx", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 由三点结果估计中心灵敏度和曲率</p><p><b>Interfaces</b> input Real minusValue; input Real centerValue; input Real plusValue; input Real step = 0.1 \"Positive perturbation in the parameter unit\"; output Real slope \"Metric unit / parameter unit\"; output Real curvature \"Metric unit / parameter unit squared\"</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 由三点结果估计中心灵敏度和曲率</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.LocalSensitivity\">UncertaintyLibrary.Examples.LocalSensitivity</a></p>
<p>由三点结果估计中心灵敏度和曲率</p>
<p><b>行为</b> 用对称两侧差分及中心二阶差分。</p>
<p><b>最小用法</b> 同一宿主分别在参数 x−h、x、x+h 计算同一指标。</p>
<p><b>适用边界</b> 为局部近似。时间窗、初始化与工况应一致，步长过小会放大数值误差。</p>
<p>接口及方向</p>
<ul>
<li><code>input Real minusValue</code></li>
<li><code>input Real centerValue</code></li>
<li><code>input Real plusValue</code></li>
<li><code>input Real step = 0.1 \"Positive perturbation in the parameter unit\"</code></li>
<li><code>output Real slope \"Metric unit / parameter unit\"</code></li>
<li><code>output Real curvature \"Metric unit / parameter unit squared\"</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">MechanicalInertiaInterval</a> 提供同域宿主参考。</p>
</html>"));
end CentralSensitivity;
