within UncertaintyLibrary.Analysis;
function InterpolationErrorBounds "用二阶导数界估计线性插值误差"
  input Real estimate;
  input Real spacing = 1 "Distance between interpolation nodes in input units";
  input Real fraction = 0.5 "Coordinate between the two nodes";
  input Real secondDerivativeBound = 1 "Absolute curvature bound in output/input-unit squared";
  output UncertaintyLibrary.Sets.Interval response;
protected
  Real radius;
algorithm
  assert(spacing>0 and fraction>=0 and fraction<=1 and secondDerivativeBound>=0,"Invalid interpolation bound input.");
  radius := 0.5*secondDerivativeBound*spacing^2*fraction*(1-fraction);
  response := UncertaintyLibrary.Sets.Interval(estimate-radius,estimate+radius);
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(response),"Nonfinite interpolation envelope.");
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,29.22},{-45.14,-41.08},{46.62,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-39.22,-24.8},{40.7,11.46}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-40.7,-24.8},{-38.7619,-21.5973},{-36.8239,-18.5093},{-34.8858,-15.5352},{-32.9478,-12.6751},{-31.0097,-9.929},{-29.0716,-7.2968},{-27.1336,-4.7786},{-25.1955,-2.375},{-23.2575,-0.0855},{-21.3194,2.0901},{-19.3806,4.1518},{-17.4425,6.0987},{-15.5045,7.9317},{-13.5664,9.6514},{-11.6284,11.2558},{-9.6903,12.7469},{-7.7522,14.124},{-5.8142,15.3864},{-3.8761,16.5349},{-1.9381,17.5694},{0,18.49},{1.9381,19.2966},{3.8761,19.9885},{5.8142,20.5664},{7.7522,21.0304},{9.6903,21.3804},{11.6284,21.6158},{13.5664,21.7379},{15.5045,21.7453},{17.4425,21.6387},{19.3806,21.4182},{21.3194,21.0837},{23.2575,20.6345},{25.1955,20.0714},{27.1336,19.3943},{29.0716,18.6032},{31.0097,17.6982},{32.9478,16.6785},{34.8858,15.5448},{36.8239,14.2972},{38.7619,12.9356},{40.7,11.46}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{0.74,-6.67},{0.74,18.49}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-4.44,-6.67},{5.92,-6.67}}, color={108,88,49}, thickness=0.7, pattern=LinePattern.Solid),
        Line(points={{-4.44,18.49},{5.92,18.49}}, color={108,88,49}, thickness=0.7, pattern=LinePattern.Solid),
        Ellipse(extent={{-42.18,-27.76},{-36.26,-21.84}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{37.74,8.5},{43.66,14.42}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 用二阶导数界估计线性插值误差</p><p><b>Interfaces</b> input Real estimate; input Real spacing = 1 \"Distance between interpolation nodes in input units\"; input Real fraction = 0.5 \"Coordinate between the two nodes\"; input Real secondDerivativeBound = 1 \"Absolute curvature bound in output/input-unit squared\"; output UncertaintyLibrary.Sets.Interval response</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 用二阶导数界估计线性插值误差</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.LocalSensitivity\">UncertaintyLibrary.Examples.LocalSensitivity</a></p>
<p>用二阶导数界估计线性插值误差</p>
<p><b>行为</b> 由线性插值余项给出对称误差界，端点余项为零。</p>
<p><b>最小用法</b> 在查表输入位置已知时给区间宽度和该段绝对二阶导界。</p>
<p><b>适用边界</b> 保证依赖该段确实存在用户指定的曲率上界。</p>
<p>接口及方向</p>
<ul>
<li><code>input Real estimate</code></li>
<li><code>input Real spacing = 1 \"Distance between interpolation nodes in input units\"</code></li>
<li><code>input Real fraction = 0.5 \"Coordinate between the two nodes\"</code></li>
<li><code>input Real secondDerivativeBound = 1 \"Absolute curvature bound in output/input-unit squared\"</code></li>
<li><code>output UncertaintyLibrary.Sets.Interval response</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">CorrelatedWorstCase</a> 提供同域宿主参考。</p>
</html>"));
end InterpolationErrorBounds;
