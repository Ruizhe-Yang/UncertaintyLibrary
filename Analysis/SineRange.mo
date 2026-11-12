within UncertaintyLibrary.Analysis;
function SineRange "传播角度区间的正弦并包含内部峰谷"
  input UncertaintyLibrary.Sets.Interval angle "Radians";
  output UncertaintyLibrary.Sets.Interval bounds;
protected
  Real cycle = 2*Modelica.Constants.pi;
  Real peak = Modelica.Constants.pi/2;
  Real valley = -Modelica.Constants.pi/2;
algorithm
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(angle) and max(abs({angle.lo,angle.hi}))<=1e8,"Invalid or poorly scaled angle range.");
  bounds := UncertaintyLibrary.Sets.Interval(min(sin(angle.lo),sin(angle.hi)),max(sin(angle.lo),sin(angle.hi)));
  if angle.hi-angle.lo>=cycle or ceil((angle.lo-peak)/cycle)<=floor((angle.hi-peak)/cycle) then
    bounds.hi := 1;
  end if;
  if angle.hi-angle.lo>=cycle or ceil((angle.lo-valley)/cycle)<=floor((angle.hi-valley)/cycle) then
    bounds.lo := -1;
  end if;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,29.22},{-45.14,-41.08},{46.62,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-40.7,-4.08},{-38.7619,-0.2202},{-36.8239,3.5538},{-34.8858,7.1576},{-32.9478,10.5098},{-31.0097,13.5364},{-29.0716,16.1694},{-27.1336,18.3501},{-25.1955,20.0299},{-23.2575,21.1703},{-21.3194,21.7475},{-19.3806,21.7475},{-17.4425,21.1703},{-15.5045,20.0299},{-13.5664,18.3501},{-11.6284,16.1694},{-9.6903,13.5364},{-7.7522,10.5098},{-5.8142,7.1576},{-3.8761,3.5538},{-1.9381,-0.2202},{0,-4.08},{1.9381,-7.9398},{3.8761,-11.7138},{5.8142,-15.3176},{7.7522,-18.6698},{9.6903,-21.6964},{11.6284,-24.3294},{13.5664,-26.5101},{15.5045,-28.1899},{17.4425,-29.3303},{19.3806,-29.9075},{21.3194,-29.9075},{23.2575,-29.3303},{25.1955,-28.1899},{27.1336,-26.5101},{29.0716,-24.3294},{31.0097,-21.6964},{32.9478,-18.6698},{34.8858,-15.3176},{36.8239,-11.7138},{38.7619,-7.9398},{40.7,-4.08}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{-42.92,21.82},{42.92,21.82}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Line(points={{-42.92,-29.98},{42.92,-29.98}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Ellipse(extent={{-23.31,18.86},{-17.39,24.78}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{17.39,-32.94},{23.31,-27.02}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 传播角度区间的正弦并包含内部峰谷</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval angle \"Radians\"; output UncertaintyLibrary.Sets.Interval bounds</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 传播角度区间的正弦并包含内部峰谷</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.LocalSensitivity\">UncertaintyLibrary.Examples.LocalSensitivity</a></p>
<p>传播角度区间的正弦并包含内部峰谷</p>
<p><b>行为</b> 端点和所有可能的正弦峰谷同时考虑，完整周期给出 [-1,1]。</p>
<p><b>最小用法</b> 用于坡度或摆角不确定范围传到力的正弦系数。</p>
<p><b>适用边界</b> 输入单位为弧度。极大角度需先检查相位表示精度。</p>
<p>接口及方向</p>
<ul>
<li><code>input UncertaintyLibrary.Sets.Interval angle \"Radians\"</code></li>
<li><code>output UncertaintyLibrary.Sets.Interval bounds</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">MechanicalInertiaInterval</a> 提供同域宿主参考。</p>
</html>"));
end SineRange;
