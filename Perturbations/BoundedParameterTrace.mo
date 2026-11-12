within UncertaintyLibrary.Perturbations;
block BoundedParameterTrace "受外部确定性坐标驱动的有界模型输入"
  parameter UncertaintyLibrary.Sets.Interval bounds = UncertaintyLibrary.Sets.Interval(0.9,1.1) "Static permitted value range";
  Modelica.Blocks.Interfaces.RealInput fraction "Deterministic normalized coordinate" annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  Modelica.Blocks.Interfaces.RealOutput value annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.BooleanOutput valid "Current coordinate is within [0,1]" annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
initial equation
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(bounds),"Invalid value range.");
equation
  valid = noEvent(fraction>=0 and fraction<=1);
  value = if valid then (1-fraction)*bounds.lo+fraction*bounds.hi else 0.5*(bounds.lo+bounds.hi);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-63,43},{63,43}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-63,-38},{63,-38}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-58,-25},{-31,26},{-10,9},{17,32},{42,-21},{60,0}}, color={0,0,127}, thickness=1.1, pattern=LinePattern.Solid),
        Text(extent={{-59,73},{59,48}}, textString="lo .. hi", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 受外部确定性坐标驱动的有界模型输入</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealInput fraction \"Deterministic normalized coordinate\"; Modelica.Blocks.Interfaces.RealOutput value; Modelica.Blocks.Interfaces.BooleanOutput valid \"Current coordinate is within [0,1]\"</p><p><b>Parameters</b> parameter UncertaintyLibrary.Sets.Interval bounds = UncertaintyLibrary.Sets.Interval(0.9,1.1) \"Static permitted value range\"</p><p><b>Behavior</b> 受外部确定性坐标驱动的有界模型输入</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.BoundedMeasurement\">UncertaintyLibrary.Examples.BoundedMeasurement</a></p>
<p>受外部确定性坐标驱动的有界模型输入</p>
<p><b>行为</b> 有效时按端点插值。越域时报告 valid=false 并输出区间中点。</p>
<p><b>最小用法</b> 接用户指定的确定性外部轨迹，再把 value 接支持时变输入的元件。</p>
<p><b>适用边界</b> Modelica 参数在仿真中保持固定。该块输出的是时变信号。</p>
<p>参数的类型、默认值和取值见下列声明。</p>
<ul>
<li><code>UncertaintyLibrary.Sets.Interval bounds = UncertaintyLibrary.Sets.Interval(0.9,1.1) \"Static permitted value range\"</code></li>
</ul>
<p>接口及方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealInput fraction \"Deterministic normalized coordinate\"</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput value</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput valid \"Current coordinate is within [0,1]\"</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">CorrelatedWorstCase</a> 提供同域宿主参考。</p>
</html>"));
end BoundedParameterTrace;
