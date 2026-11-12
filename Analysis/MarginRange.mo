within UncertaintyLibrary.Analysis;
function MarginRange "把响应界转换为有符号裕量及全区间判定"
  input UncertaintyLibrary.Sets.Interval response;
  input Real limit = 1 "Same unit as response";
  input Boolean upperLimit = true;
  output UncertaintyLibrary.Sets.Interval margin "Positive means favorable";
  output UncertaintyLibrary.Utilities.Types.MarginStatus status;
algorithm
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(response) and abs(limit)<Modelica.Constants.inf,"Invalid response or requirement.");
  margin := if upperLimit then UncertaintyLibrary.Sets.Interval(limit-response.hi,limit-response.lo)
    else UncertaintyLibrary.Sets.Interval(response.lo-limit,response.hi-limit);
  status := if margin.lo>=0 then UncertaintyLibrary.Utilities.Types.MarginStatus.GUARANTEED elseif margin.hi<0 then UncertaintyLibrary.Utilities.Types.MarginStatus.VIOLATED else UncertaintyLibrary.Utilities.Types.MarginStatus.UNRESOLVED;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{14.06,-42.56},{14.06,27}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Dash),
        Line(points={{-39.22,-17.4},{1.48,-17.4}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-39.22,-26.28},{-39.22,-8.52}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{1.48,-26.28},{1.48,-8.52}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{2.22,7.02},{13.32,7.02}}, color={75,138,73}, thickness=1.2, pattern=LinePattern.Solid, arrow={Arrow.Filled,Arrow.Filled}),
        Text(extent={{-2.96,38.1},{27.38,18.12}}, textString="m", textColor={75,138,73}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 把响应界转换为有符号裕量及全区间判定</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval response; input Real limit = 1 \"Same unit as response\"; input Boolean upperLimit = true; output UncertaintyLibrary.Sets.Interval margin \"Positive means favorable\"; output UncertaintyLibrary.Utilities.Types.MarginStatus status</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 把响应界转换为有符号裕量及全区间判定</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.LocalSensitivity\">UncertaintyLibrary.Examples.LocalSensitivity</a></p>
<p>把响应界转换为有符号裕量及全区间判定</p>
<p><b>行为</b> 上界要求用 limit−response，下界反向。零裕量满足。跨边界时保留未决。</p>
<p><b>最小用法</b> 只在输入响应确有外包保证时把结论解释成全区间结论。</p>
<p><b>适用边界</b> 有限候选的最小最大值只覆盖这些候选。保证仍依赖输入区间及工程数值精度。</p>
<p>接口及方向</p>
<ul>
<li><code>input UncertaintyLibrary.Sets.Interval response</code></li>
<li><code>input Real limit = 1 \"Same unit as response\"</code></li>
<li><code>input Boolean upperLimit = true</code></li>
<li><code>output UncertaintyLibrary.Sets.Interval margin \"Positive means favorable\"</code></li>
<li><code>output UncertaintyLibrary.Utilities.Types.MarginStatus status</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">CorrelatedWorstCase</a> 提供同域宿主参考。</p>
</html>"));
end MarginRange;
