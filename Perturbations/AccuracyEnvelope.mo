within UncertaintyLibrary.Perturbations;
function AccuracyEnvelope "由绝对误差与读数比例误差构造测量范围"
  input Real reading;
  input Real absoluteError = 0.01;
  input Real relativeError = 0.005 "Fraction of displayed magnitude";
  output UncertaintyLibrary.Sets.Interval compatible;
protected
  Real radius;
algorithm
  assert(absoluteError>=0 and relativeError>=0,"Error allowances must be nonnegative.");
  radius := absoluteError+relativeError*abs(reading);
  compatible := UncertaintyLibrary.Sets.Interval(reading-radius,reading+radius);
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(compatible),"Invalid accuracy range.");
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-41.44,-10},{41.44,-10}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-41.44,-18.88},{-41.44,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{41.44,-18.88},{41.44,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Ellipse(extent={{-3.7,-13.7},{3.7,-6.3}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{0,0.36},{0,21.82}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid),
        Text(extent={{-49.58,-28.5},{49.58,-49.96}}, textString="abs + rel", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 由绝对误差与读数比例误差构造测量范围</p><p><b>Interfaces</b> input Real reading; input Real absoluteError = 0.01; input Real relativeError = 0.005 \"Fraction of displayed magnitude\"; output UncertaintyLibrary.Sets.Interval compatible</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 由绝对误差与读数比例误差构造测量范围</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.BoundedMeasurement\">UncertaintyLibrary.Examples.BoundedMeasurement</a></p>
<p>由绝对误差与读数比例误差构造测量范围</p>
<p><b>行为</b> 按指定读数的幅值计算相对误差，再加绝对误差。</p>
<p><b>最小用法</b> 把仪表规格 ±(0.5% 读数 + 0.01 单位) 输入此函数。</p>
<p><b>适用边界</b> 该公式对应以读数为基准的规格。满量程项请折算进 absoluteError。</p>
<p>接口及方向</p>
<ul>
<li><code>input Real reading</code></li>
<li><code>input Real absoluteError = 0.01</code></li>
<li><code>input Real relativeError = 0.005 \"Fraction of displayed magnitude\"</code></li>
<li><code>output UncertaintyLibrary.Sets.Interval compatible</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">ElectricalResistanceInterval</a> 提供同域宿主参考。</p>
</html>"));
end AccuracyEnvelope;
