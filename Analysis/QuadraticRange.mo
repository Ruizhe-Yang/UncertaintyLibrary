within UncertaintyLibrary.Analysis;
function QuadraticRange "二次函数在有界区间上的极值传播"
  input UncertaintyLibrary.Sets.Interval x;
  input Real a = 1;
  input Real b = 0;
  input Real c = 0;
  output UncertaintyLibrary.Sets.Interval bounds;
protected
  Real y1;
  Real y2;
  Real vertex;
  Real yVertex;
algorithm
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(x) and max(abs({a,b,c}))<Modelica.Constants.inf,"Invalid quadratic data.");
  y1 := (a*x.lo+b)*x.lo+c;
  y2 := (a*x.hi+b)*x.hi+c;
  bounds := UncertaintyLibrary.Sets.Interval(min(y1,y2),max(y1,y2));
  if abs(a)>0 then
    vertex := -0.5*b/a;
    if vertex>x.lo and vertex<x.hi then
      yVertex := (a*vertex+b)*vertex+c;
      bounds := UncertaintyLibrary.Sets.Interval(min(bounds.lo,yVertex),max(bounds.hi,yVertex));
    end if;
  end if;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,29.22},{-45.14,-41.08},{46.62,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-40.7,23.3},{-38.7619,18.14},{-36.8239,13.2323},{-34.8858,8.5755},{-32.9478,4.171},{-31.0097,0.0174},{-29.0716,-3.8839},{-27.1336,-7.5336},{-25.1955,-10.9317},{-23.2575,-14.0774},{-21.3194,-16.9723},{-19.3806,-19.6148},{-17.4425,-22.0058},{-15.5045,-24.1458},{-13.5664,-26.0336},{-11.6284,-27.6697},{-9.6903,-29.0535},{-7.7522,-30.1865},{-5.8142,-31.0671},{-3.8761,-31.6968},{-1.9381,-32.0742},{0,-32.2},{1.9381,-32.0742},{3.8761,-31.6968},{5.8142,-31.0671},{7.7522,-30.1865},{9.6903,-29.0535},{11.6284,-27.6697},{13.5664,-26.0336},{15.5045,-24.1458},{17.4425,-22.0058},{19.3806,-19.6148},{21.3194,-16.9723},{23.2575,-14.0774},{25.1955,-10.9317},{27.1336,-7.5336},{29.0716,-3.8839},{31.0097,0.0174},{32.9478,4.171},{34.8858,8.5755},{36.8239,13.2323},{38.7619,18.14},{40.7,23.3}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{-42.92,23.3},{42.92,23.3}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Line(points={{-42.92,-32.2},{42.92,-32.2}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Ellipse(extent={{-2.96,-35.16},{2.96,-29.24}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-43.66,20.34},{-37.74,26.26}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{37.74,20.34},{43.66,26.26}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 二次函数在有界区间上的极值传播</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval x; input Real a = 1; input Real b = 0; input Real c = 0; output UncertaintyLibrary.Sets.Interval bounds</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 二次函数在有界区间上的极值传播</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.LocalSensitivity\">UncertaintyLibrary.Examples.LocalSensitivity</a></p>
<p>二次函数在有界区间上的极值传播</p>
<p><b>行为</b> 检查两个端点及区间内顶点。a=0 时退化为线性。</p>
<p><b>最小用法</b> 平方、动压或储能计算可调用 QuadraticRange(x,1,0,0)。</p>
<p><b>适用边界</b> 系数和自变量需有相容单位。结果使用工具的普通浮点舍入。</p>
<p>接口及方向</p>
<ul>
<li><code>input UncertaintyLibrary.Sets.Interval x</code></li>
<li><code>input Real a = 1</code></li>
<li><code>input Real b = 0</code></li>
<li><code>input Real c = 0</code></li>
<li><code>output UncertaintyLibrary.Sets.Interval bounds</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">ElectricalResistanceInterval</a> 提供同域宿主参考。</p>
</html>"));
end QuadraticRange;
