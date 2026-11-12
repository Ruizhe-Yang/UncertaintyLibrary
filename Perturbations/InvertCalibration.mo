within UncertaintyLibrary.Perturbations;
function InvertCalibration "传播未知增益和零点对标定反解的影响"
  input UncertaintyLibrary.Sets.Interval reading;
  input UncertaintyLibrary.Sets.Interval gain "Positive instrument gain";
  input UncertaintyLibrary.Sets.Interval offset "Additive offset, reading unit";
  output UncertaintyLibrary.Sets.Interval physical;
algorithm
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(reading) and UncertaintyLibrary.Utilities.Internal.validInterval(offset) and UncertaintyLibrary.Utilities.Internal.validInterval(gain) and gain.lo>0,"Calibration gain must be strictly positive.");
  physical := UncertaintyLibrary.Sets.Divide(UncertaintyLibrary.Sets.Interval(reading.lo-offset.hi,reading.hi-offset.lo),gain);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,29.22},{-45.14,-41.08},{46.62,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-38.48,-28.5},{31.08,19.6}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-33.3,8.5},{15.54,8.5},{15.54,-41.08}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Line(points={{-33.3,-31.46},{3.7,-31.46}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-33.3,-40.34},{-33.3,-22.58}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{3.7,-40.34},{3.7,-22.58}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-1.48,8.5},{-34.78,8.5}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 传播未知增益和零点对标定反解的影响</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval reading; input UncertaintyLibrary.Sets.Interval gain \"Positive instrument gain\"; input UncertaintyLibrary.Sets.Interval offset \"Additive offset, reading unit\"; output UncertaintyLibrary.Sets.Interval physical</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 传播未知增益和零点对标定反解的影响</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.BoundedMeasurement\">UncertaintyLibrary.Examples.BoundedMeasurement</a></p>
<p>传播未知增益和零点对标定反解的影响</p>
<p><b>行为</b> 将 reading=gain·physical+offset 反解到真值区间。</p>
<p><b>最小用法</b> 把标定数据的增益与零点范围和测量范围一同输入。</p>
<p><b>适用边界</b> 增益下界须正。同一传感器的公共标定误差需保持参数相关性。</p>
<p>接口及方向</p>
<ul>
<li><code>input UncertaintyLibrary.Sets.Interval reading</code></li>
<li><code>input UncertaintyLibrary.Sets.Interval gain \"Positive instrument gain\"</code></li>
<li><code>input UncertaintyLibrary.Sets.Interval offset \"Additive offset, reading unit\"</code></li>
<li><code>output UncertaintyLibrary.Sets.Interval physical</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">ElectricalResistanceInterval</a> 提供同域宿主参考。</p>
</html>"));
end InvertCalibration;
