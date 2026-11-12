within UncertaintyLibrary.Sets.Asymmetric;
function AbsoluteTolerance "由有符号名义值和非对称绝对公差构造闭区间"
  input Real nominal = 1;
  input Real lowerTolerance = 0.1 "Nonnegative subtraction in the nominal unit";
  input Real upperTolerance = 0.1 "Nonnegative addition in the nominal unit";
  output UncertaintyLibrary.Sets.Interval bounds;
algorithm
  assert(lowerTolerance>=0 and upperTolerance>=0,"Tolerances must be nonnegative.");
  bounds := UncertaintyLibrary.Sets.Interval(nominal-lowerTolerance,nominal+upperTolerance);
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
        Text(extent={{-43.66,24.04},{-6.66,4.06}}, textString="-a", textColor={108,88,49}, fontSize=0),
        Text(extent={{6.66,24.04},{45.88,4.06}}, textString="+b", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 由有符号名义值和非对称绝对公差构造闭区间</p><p><b>Interfaces</b> input Real nominal = 1; input Real lowerTolerance = 0.1 \"Nonnegative subtraction in the nominal unit\"; input Real upperTolerance = 0.1 \"Nonnegative addition in the nominal unit\"; output UncertaintyLibrary.Sets.Interval bounds</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 由有符号名义值和非对称绝对公差构造闭区间</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">UncertaintyLibrary.Examples.ToleranceAndSelection</a></p>
<p>由有符号名义值和非对称绝对公差构造闭区间</p>
<p><b>行为</b> 名义值减下侧公差并加上侧公差，端点均包含。</p>
<p><b>最小用法</b> 在参数声明中使用 AbsoluteTolerance(2,0.1,0.2)。</p>
<p><b>适用边界</b> 输入与输出端点同单位。绝对公差为零允许点区间。</p>
<p>接口及方向</p>
<ul>
<li><code>input Real nominal = 1</code></li>
<li><code>input Real lowerTolerance = 0.1 \"Nonnegative subtraction in the nominal unit\"</code></li>
<li><code>input Real upperTolerance = 0.1 \"Nonnegative addition in the nominal unit\"</code></li>
<li><code>output UncertaintyLibrary.Sets.Interval bounds</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">MechanicalInertiaInterval</a> 提供同域宿主参考。</p>
</html>"));
end AbsoluteTolerance;
