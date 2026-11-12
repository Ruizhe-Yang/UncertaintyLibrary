within UncertaintyLibrary.Sets;
function StoredElectricalEnergy "给出电容与电感联合初始储能范围"
  input UncertaintyLibrary.Sets.Interval capacitance "F";
  input UncertaintyLibrary.Sets.Interval voltage "V, signed";
  input UncertaintyLibrary.Sets.Interval inductance "H";
  input UncertaintyLibrary.Sets.Interval current "A, signed";
  output UncertaintyLibrary.Sets.Interval energy "J";
protected
  UncertaintyLibrary.Sets.Interval ec;
  UncertaintyLibrary.Sets.Interval el;
algorithm
  assert(capacitance.lo>=0 and inductance.lo>=0,"Energy storage coefficients must be nonnegative.");
  ec := UncertaintyLibrary.Sets.Multiply(capacitance,UncertaintyLibrary.Analysis.QuadraticRange(voltage,1,0,0));
  el := UncertaintyLibrary.Sets.Multiply(inductance,UncertaintyLibrary.Analysis.QuadraticRange(current,1,0,0));
  energy := UncertaintyLibrary.Sets.Interval(0.5*(ec.lo+el.lo),0.5*(ec.hi+el.hi));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-42.55,4.8},{-26.27,4.8}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-18.13,4.8},{-1.85,4.8}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-26.27,-4.561},{-26.27,14.161}}, color={0,0,127}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-18.13,-4.561},{-18.13,14.161}}, color={0,0,127}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{5.92,4.8},{6.1427,7.2901},{6.7954,9.61},{7.8344,11.6021},{9.1886,13.1309},{10.7648,14.0922},{12.4572,14.42},{14.1488,14.0922},{15.725,13.1309},{17.0792,11.6021},{18.1182,9.61},{18.7708,7.2901},{18.9936,4.8},{18.9936,4.8},{19.2163,7.2901},{19.869,9.61},{20.908,11.6021},{22.2622,13.1309},{23.8384,14.0922},{25.5307,14.42},{27.2224,14.0922},{28.7986,13.1309},{30.1528,11.6021},{31.1917,9.61},{31.8444,7.2901},{32.0672,4.8},{32.0672,4.8},{32.2899,7.2901},{32.9426,9.61},{33.9815,11.6021},{35.3357,13.1309},{36.9119,14.0922},{38.6043,14.42},{40.296,14.0922},{41.8722,13.1309},{43.2264,11.6021},{44.2653,9.61},{44.918,7.2901},{45.1407,4.8}}, color={0,0,127}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{-35.52,-36.64},{35.52,-36.64}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-35.52,-45.52},{-35.52,-27.76}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{35.52,-45.52},{35.52,-27.76}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-25.9,35.88},{25.9,19.6}}, textString="E0", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 给出电容与电感联合初始储能范围</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval capacitance \"F\"; input UncertaintyLibrary.Sets.Interval voltage \"V, signed\"; input UncertaintyLibrary.Sets.Interval inductance \"H\"; input UncertaintyLibrary.Sets.Interval current \"A, signed\"; output UncertaintyLibrary.Sets.Interval energy \"J\"</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 给出电容与电感联合初始储能范围</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">UncertaintyLibrary.Examples.ToleranceAndSelection</a></p>
<p>给出电容与电感联合初始储能范围</p>
<p><b>行为</b> 按 CV²/2 与 LI²/2 计算。电压或电流区间跨零时平方的最小值为零。</p>
<p><b>最小用法</b> 用于指定电容电感初态下的储能边界。</p>
<p><b>适用边界</b> 各区间按笛卡尔盒组合。已知相关约束可在候选层筛选。</p>
<p>接口及方向</p>
<ul>
<li><code>input UncertaintyLibrary.Sets.Interval capacitance \"F\"</code></li>
<li><code>input UncertaintyLibrary.Sets.Interval voltage \"V, signed\"</code></li>
<li><code>input UncertaintyLibrary.Sets.Interval inductance \"H\"</code></li>
<li><code>input UncertaintyLibrary.Sets.Interval current \"A, signed\"</code></li>
<li><code>output UncertaintyLibrary.Sets.Interval energy \"J\"</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">ElectricalResistanceInterval</a> 提供同域宿主参考。</p>
</html>"));
end StoredElectricalEnergy;
