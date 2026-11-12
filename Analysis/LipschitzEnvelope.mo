within UncertaintyLibrary.Analysis;
function LipschitzEnvelope "用各坐标的变化率上界包围整个参数盒的响应"
  input Real nominalResponse;
  input Real nominalPoint[:];
  input UncertaintyLibrary.Sets.Interval ranges[size(nominalPoint,1)];
  input Real derivativeBounds[size(nominalPoint,1)] "Output unit / corresponding input unit";
  output UncertaintyLibrary.Sets.Interval response;
protected
  Real radius;
algorithm
  radius := 0;
  for i in 1:size(nominalPoint,1) loop
    assert(UncertaintyLibrary.Utilities.Internal.validInterval(ranges[i]) and nominalPoint[i]>=ranges[i].lo and nominalPoint[i]<=ranges[i].hi and derivativeBounds[i]>=0,
      "Nominal point must lie in the box and derivative bounds must be nonnegative.");
    radius := radius+derivativeBounds[i]*max(nominalPoint[i]-ranges[i].lo,ranges[i].hi-nominalPoint[i]);
  end for;
  response := UncertaintyLibrary.Sets.Interval(nominalResponse-radius,nominalResponse+radius);
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(response),"Nonfinite discrepancy envelope.");
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Polygon(points={{-41.44,-35.9},{0,-10},{-41.44,15.9},{-41.44,-35.9}}, lineColor={128,128,128}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Polygon(points={{41.44,-35.9},{0,-10},{41.44,15.9},{41.44,-35.9}}, lineColor={128,128,128}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-41.44,-35.9},{0,-10},{41.44,15.9}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{-41.44,15.9},{0,-10},{41.44,-35.9}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Ellipse(extent={{-3.7,-13.7},{3.7,-6.3}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-14.8,42.54},{14.8,20.34}}, textString="L", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 用各坐标的变化率上界包围整个参数盒的响应</p><p><b>Interfaces</b> input Real nominalResponse; input Real nominalPoint[:]; input UncertaintyLibrary.Sets.Interval ranges[size(nominalPoint,1)]; input Real derivativeBounds[size(nominalPoint,1)] \"Output unit / corresponding input unit\"; output UncertaintyLibrary.Sets.Interval response</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 用各坐标的变化率上界包围整个参数盒的响应</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.LocalSensitivity\">UncertaintyLibrary.Examples.LocalSensitivity</a></p>
<p>用各坐标的变化率上界包围整个参数盒的响应</p>
<p><b>行为</b> 把各坐标到最远端的距离乘全段导数界后相加，得到围绕名义值的外包。</p>
<p><b>最小用法</b> 对提供可靠斜率上界的简化响应函数使用。</p>
<p><b>适用边界</b> 单点差分灵敏度一般不能作为整个区间的导数上界。</p>
<p>接口及方向</p>
<ul>
<li><code>input Real nominalResponse</code></li>
<li><code>input Real nominalPoint[:]</code></li>
<li><code>input UncertaintyLibrary.Sets.Interval ranges[size(nominalPoint,1)]</code></li>
<li><code>input Real derivativeBounds[size(nominalPoint,1)] \"Output unit / corresponding input unit\"</code></li>
<li><code>output UncertaintyLibrary.Sets.Interval response</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">CorrelatedWorstCase</a> 提供同域宿主参考。</p>
</html>"));
end LipschitzEnvelope;
