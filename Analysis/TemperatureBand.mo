within UncertaintyLibrary.Analysis;
block TemperatureBand "在名义温度轨迹周围给出确定性环境边界"
  parameter UncertaintyLibrary.Sets.Interval offset = UncertaintyLibrary.Sets.Interval(-2,3) "Temperature difference interval in K";
  Modelica.Blocks.Interfaces.RealInput nominal(unit="K") annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  Modelica.Blocks.Interfaces.RealOutput lower(unit="K") annotation(Placement(transformation(extent={{94,42},{106,54}}), iconTransformation(extent={{94,42},{106,54}})));
  Modelica.Blocks.Interfaces.RealOutput upper(unit="K") annotation(Placement(transformation(extent={{94,-6},{106,6}}), iconTransformation(extent={{94,-6},{106,6}})));
  Modelica.Blocks.Interfaces.BooleanOutput valid annotation(Placement(transformation(extent={{94,-54},{106,-42}}), iconTransformation(extent={{94,-54},{106,-42}})));
initial equation
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(offset),"Invalid temperature offset.");
equation
  valid = noEvent(nominal+offset.lo>0 and nominal+offset.hi<Modelica.Constants.inf);
  lower = if valid then nominal+offset.lo else 0;
  upper = if valid then nominal+offset.hi else 0;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-61,53},{-61,-42},{63,-42}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Polygon(points={{-55,-25},{-52.381,-23.929},{-49.762,-22.857},{-47.143,-21.786},{-44.524,-20.714},{-41.905,-19.643},{-39.286,-18.571},{-36.667,-17.5},{-34.048,-16.429},{-31.429,-15.357},{-28.81,-14.286},{-26.19,-13.214},{-23.571,-12.143},{-20.952,-11.071},{-18.333,-10},{-15.714,-8.929},{-13.095,-7.857},{-10.476,-6.786},{-7.857,-5.714},{-5.238,-4.643},{-2.619,-3.571},{0,-2.5},{2.619,-1.429},{5.238,-0.357},{7.857,0.714},{10.476,1.786},{13.095,2.857},{15.714,3.929},{18.333,5},{20.952,6.071},{23.571,7.143},{26.19,8.214},{28.81,9.286},{31.429,10.357},{34.048,11.429},{36.667,12.5},{39.286,13.571},{41.905,14.643},{44.524,15.714},{47.143,16.786},{49.762,17.857},{52.381,18.929},{55,20},{55,45},{52.381,43.929},{49.762,42.857},{47.143,41.786},{44.524,40.714},{41.905,39.643},{39.286,38.571},{36.667,37.5},{34.048,36.429},{31.429,35.357},{28.81,34.286},{26.19,33.214},{23.571,32.143},{20.952,31.071},{18.333,30},{15.714,28.929},{13.095,27.857},{10.476,26.786},{7.857,25.714},{5.238,24.643},{2.619,23.571},{0,22.5},{-2.619,21.429},{-5.238,20.357},{-7.857,19.286},{-10.476,18.214},{-13.095,17.143},{-15.714,16.071},{-18.333,15},{-20.952,13.929},{-23.571,12.857},{-26.19,11.786},{-28.81,10.714},{-31.429,9.643},{-34.048,8.571},{-36.667,7.5},{-39.286,6.429},{-41.905,5.357},{-44.524,4.286},{-47.143,3.214},{-49.762,2.143},{-52.381,1.071},{-55,0}}, lineColor={128,128,128}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-55,-25},{-52.381,-23.929},{-49.762,-22.857},{-47.143,-21.786},{-44.524,-20.714},{-41.905,-19.643},{-39.286,-18.571},{-36.667,-17.5},{-34.048,-16.429},{-31.429,-15.357},{-28.81,-14.286},{-26.19,-13.214},{-23.571,-12.143},{-20.952,-11.071},{-18.333,-10},{-15.714,-8.929},{-13.095,-7.857},{-10.476,-6.786},{-7.857,-5.714},{-5.238,-4.643},{-2.619,-3.571},{0,-2.5},{2.619,-1.429},{5.238,-0.357},{7.857,0.714},{10.476,1.786},{13.095,2.857},{15.714,3.929},{18.333,5},{20.952,6.071},{23.571,7.143},{26.19,8.214},{28.81,9.286},{31.429,10.357},{34.048,11.429},{36.667,12.5},{39.286,13.571},{41.905,14.643},{44.524,15.714},{47.143,16.786},{49.762,17.857},{52.381,18.929},{55,20}}, color={191,0,0}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-55,0},{-52.381,1.071},{-49.762,2.143},{-47.143,3.214},{-44.524,4.286},{-41.905,5.357},{-39.286,6.429},{-36.667,7.5},{-34.048,8.571},{-31.429,9.643},{-28.81,10.714},{-26.19,11.786},{-23.571,12.857},{-20.952,13.929},{-18.333,15},{-15.714,16.071},{-13.095,17.143},{-10.476,18.214},{-7.857,19.286},{-5.238,20.357},{-2.619,21.429},{0,22.5},{2.619,23.571},{5.238,24.643},{7.857,25.714},{10.476,26.786},{13.095,27.857},{15.714,28.929},{18.333,30},{20.952,31.071},{23.571,32.143},{26.19,33.214},{28.81,34.286},{31.429,35.357},{34.048,36.429},{36.667,37.5},{39.286,38.571},{41.905,39.643},{44.524,40.714},{47.143,41.786},{49.762,42.857},{52.381,43.929},{55,45}}, color={191,0,0}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-55,-12.5},{-52.381,-11.429},{-49.762,-10.357},{-47.143,-9.286},{-44.524,-8.214},{-41.905,-7.143},{-39.286,-6.071},{-36.667,-5},{-34.048,-3.929},{-31.429,-2.857},{-28.81,-1.786},{-26.19,-0.714},{-23.571,0.357},{-20.952,1.429},{-18.333,2.5},{-15.714,3.571},{-13.095,4.643},{-10.476,5.714},{-7.857,6.786},{-5.238,7.857},{-2.619,8.929},{0,10},{2.619,11.071},{5.238,12.143},{7.857,13.214},{10.476,14.286},{13.095,15.357},{15.714,16.429},{18.333,17.5},{20.952,18.571},{23.571,19.643},{26.19,20.714},{28.81,21.786},{31.429,22.857},{34.048,23.929},{36.667,25},{39.286,26.071},{41.905,27.143},{44.524,28.214},{47.143,29.286},{49.762,30.357},{52.381,31.429},{55,32.5}}, color={64,64,64}, thickness=0.6, pattern=LinePattern.Dash),
        Text(extent={{-55,74},{-24,50}}, textString="T", textColor={191,0,0}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 在名义温度轨迹周围给出确定性环境边界</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealInput nominal(unit=\"K\"); Modelica.Blocks.Interfaces.RealOutput lower(unit=\"K\"); Modelica.Blocks.Interfaces.RealOutput upper(unit=\"K\"); Modelica.Blocks.Interfaces.BooleanOutput valid</p><p><b>Parameters</b> parameter UncertaintyLibrary.Sets.Interval offset = UncertaintyLibrary.Sets.Interval(-2,3) \"Temperature difference interval in K\"</p><p><b>Behavior</b> 在名义温度轨迹周围给出确定性环境边界</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.LocalSensitivity\">UncertaintyLibrary.Examples.LocalSensitivity</a></p>
<p>在名义温度轨迹周围给出确定性环境边界</p>
<p><b>行为</b> 偏置区间整体随名义环境变化。低于绝对零度的下界被标为无效。</p>
<p><b>最小用法</b> 将正常环境温度接 nominal，端点可作为确定性边界构型输入。</p>
<p><b>适用边界</b> 独立温度区间随时间给出包络，未定义跨时刻取值的动态变化率。</p>
<p>参数的类型、默认值和取值见下列声明。</p>
<ul>
<li><code>UncertaintyLibrary.Sets.Interval offset = UncertaintyLibrary.Sets.Interval(-2,3) \"Temperature difference interval in K\"</code></li>
</ul>
<p>接口及方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealInput nominal(unit=\"K\")</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput lower(unit=\"K\")</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput upper(unit=\"K\")</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanOutput valid</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">ThermalCapacityInterval</a> 提供同域宿主参考。</p>
</html>"));
end TemperatureBand;
