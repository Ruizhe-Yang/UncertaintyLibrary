within UncertaintyLibrary.Analysis;
function HydrostaticPressureBounds "计算静压、密度与深度共同引起的绝压范围"
  input UncertaintyLibrary.Sets.Interval surfacePressure "Pa";
  input UncertaintyLibrary.Sets.Interval density "kg/m3";
  input UncertaintyLibrary.Sets.Interval depth "Positive downward depth, m";
  input Modelica.Units.SI.Acceleration gravity = Modelica.Constants.g_n;
  output UncertaintyLibrary.Sets.Interval pressure "Pa";
protected
  UncertaintyLibrary.Sets.Interval term;
algorithm
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(surfacePressure) and surfacePressure.lo>0 and density.lo>=0 and depth.lo>=0 and gravity>=0,"Invalid hydrostatic domain.");
  term := UncertaintyLibrary.Sets.Multiply(density,depth);
  pressure := UncertaintyLibrary.Sets.Interval(surfacePressure.lo+gravity*term.lo,surfacePressure.hi+gravity*term.hi);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Rectangle(extent={{-35.668,-22.4764},{10.508,23.6996}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Ellipse(extent={{-35.668,16.7732},{10.508,30.0488}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-35.668,0.0344},{10.508,0.0344}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-30.34,-0.38},{8.88,-0.38}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{28.12,17.38},{28.12,-31.46}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.Filled,Arrow.Filled}),
        Text(extent={{31.08,3.32},{48.84,-14.44}}, textString="h", textColor={108,88,49}, fontSize=0),
        Line(points={{-35.52,-45.52},{35.52,-45.52}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-35.52,-54.4},{-35.52,-36.64}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{35.52,-54.4},{35.52,-36.64}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 计算静压、密度与深度共同引起的绝压范围</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval surfacePressure \"Pa\"; input UncertaintyLibrary.Sets.Interval density \"kg/m3\"; input UncertaintyLibrary.Sets.Interval depth \"Positive downward depth, m\"; input Modelica.Units.SI.Acceleration gravity = Modelica.Constants.g_n; output UncertaintyLibrary.Sets.Interval pressure \"Pa\"</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 计算静压、密度与深度共同引起的绝压范围</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.LocalSensitivity\">UncertaintyLibrary.Examples.LocalSensitivity</a></p>
<p>计算静压、密度与深度共同引起的绝压范围</p>
<p><b>行为</b> 对均匀密度按 p_surface+ρgh 给确定性区间。</p>
<p><b>最小用法</b> 把供水槽深度和环境压力范围绑定到边界分析。</p>
<p><b>适用边界</b> 只用于静水压力，流动和分层需宿主物理模型。</p>
<p>接口及方向</p>
<ul>
<li><code>input UncertaintyLibrary.Sets.Interval surfacePressure \"Pa\"</code></li>
<li><code>input UncertaintyLibrary.Sets.Interval density \"kg/m3\"</code></li>
<li><code>input UncertaintyLibrary.Sets.Interval depth \"Positive downward depth, m\"</code></li>
<li><code>input Modelica.Units.SI.Acceleration gravity = Modelica.Constants.g_n</code></li>
<li><code>output UncertaintyLibrary.Sets.Interval pressure \"Pa\"</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">FluidRestrictionInterval</a> 提供同域宿主参考。</p>
</html>"));
end HydrostaticPressureBounds;
