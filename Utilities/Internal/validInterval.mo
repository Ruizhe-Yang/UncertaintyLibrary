within UncertaintyLibrary.Utilities.Internal;
function validInterval "检验区间端点顺序和工程量级"
  input UncertaintyLibrary.Sets.Interval x;
  output Boolean valid;
algorithm
  valid := x.lo<=x.hi and abs(x.lo)<Modelica.Constants.inf and abs(x.hi)<Modelica.Constants.inf;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-39.96,-23.32},{39.96,-23.32}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-39.96,-32.2},{-39.96,-14.44}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{39.96,-32.2},{39.96,-14.44}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-12.95,7.76},{-3.108,-2.6},{16.058,22.264}}, color={75,138,73}, thickness=1.5, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<p>检验区间端点顺序和工程量级</p>
<p><b>行为</b> 检验区间端点顺序和工程量级。</p>
<p><b>最小用法</b> 由本库组件按源码中的参数和接口装配。</p>
<p><b>适用边界</b> 实现细节随本库版本演进。</p>
<p>接口及方向</p>
<ul>
<li><code>input UncertaintyLibrary.Sets.Interval x</code></li>
<li><code>output Boolean valid</code></li>
</ul>
</html>"));
end validInterval;
