within UncertaintyLibrary.Candidates;
function FilterCombinations "按盒与耦合约束筛选候选行并保留原行号"
  input Real candidates[:,:];
  input UncertaintyLibrary.Sets.Interval ranges[size(candidates,2)];
  input Real coefficients[:,size(candidates,2)];
  input Real lower[size(coefficients,1)];
  input Real upper[size(coefficients,1)];
  input Real tolerance(min=0) = 0;
  output Boolean feasible[size(candidates,1)];
  output Integer feasibleCount;
  output Real violation[size(candidates,1)] "Largest nonnegative violation of any supplied bound";
protected
  Boolean linearOK;
  Real rowViolation;
  Real rowMargin;
  Real boxViolation;
algorithm
  assert(size(candidates,1)>0 and size(candidates,2)>0 and tolerance>=0,"Invalid candidate matrix.");
  for j in 1:size(candidates,2) loop
    assert(UncertaintyLibrary.Utilities.Internal.validInterval(ranges[j]),"Invalid candidate interval.");
  end for;
  feasibleCount := 0;
  for i in 1:size(candidates,1) loop
    (linearOK,rowViolation,rowMargin) := UncertaintyLibrary.Constraints.LinearFeasibility(candidates[i,:],coefficients,lower,upper,tolerance);
    boxViolation := max({max(0,max(ranges[j].lo-candidates[i,j],candidates[i,j]-ranges[j].hi))
      for j in 1:size(candidates,2)});
    feasible[i] := linearOK and boxViolation<=tolerance;
    violation[i] := max(boxViolation,rowViolation);
    feasibleCount := feasibleCount+(if feasible[i] then 1 else 0);
  end for;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Rectangle(extent={{-44.4,-41.82},{44.4,21.82}}, lineColor={128,128,128}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Ellipse(extent={{-31.524,-30.424},{-26.196,-25.096}}, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-31.524,-12.664},{-26.196,-7.336}}, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-31.524,5.096},{-26.196,10.424}}, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-2.664,-30.424},{2.664,-25.096}}, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-2.664,-12.664},{2.664,-7.336}}, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-2.664,5.096},{2.664,10.424}}, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{26.196,-30.424},{31.524,-25.096}}, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{26.196,-12.664},{31.524,-7.336}}, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{26.196,5.096},{31.524,10.424}}, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Polygon(points={{-39.96,-33.68},{-25.16,17.38},{39.96,13.68},{25.16,-37.38},{-39.96,-33.68}}, lineColor={108,88,49}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-32.93,-31.83},{-24.79,-23.69}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-4.07,-14.07},{4.07,-5.93}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{24.79,3.69},{32.93,11.83}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 按盒与耦合约束筛选候选行并保留原行号</p><p><b>Interfaces</b> input Real candidates[:,:]; input UncertaintyLibrary.Sets.Interval ranges[size(candidates,2)]; input Real coefficients[:,size(candidates,2)]; input Real lower[size(coefficients,1)]; input Real upper[size(coefficients,1)]; input Real tolerance(min=0) = 0; output Boolean feasible[size(candidates,1)]; output Integer feasibleCount; output Real violation[size(candidates,1)] \"Largest nonnegative violation of any supplied bound\"</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 按盒与耦合约束筛选候选行并保留原行号</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.CandidateGrids\">UncertaintyLibrary.Examples.CandidateGrids</a></p>
<p>按盒与耦合约束筛选候选行并保留原行号</p>
<p><b>行为</b> 布尔掩码与原候选矩阵同顺序，越界量单独报告。</p>
<p><b>最小用法</b> 对生成的点集或外部确定性设计表调用。仅实例化允许的点，或者屏蔽其运行结果。</p>
<p><b>适用边界</b> 统一容差需要参数及约束行的量级适配。没有可行行不代表完整参数空间不可行。</p>
<p>接口及方向</p>
<ul>
<li><code>input Real candidates[:,:]</code></li>
<li><code>input UncertaintyLibrary.Sets.Interval ranges[size(candidates,2)]</code></li>
<li><code>input Real coefficients[:,size(candidates,2)]</code></li>
<li><code>input Real lower[size(coefficients,1)]</code></li>
<li><code>input Real upper[size(coefficients,1)]</code></li>
<li><code>input Real tolerance(min=0) = 0</code></li>
<li><code>output Boolean feasible[size(candidates,1)]</code></li>
<li><code>output Integer feasibleCount</code></li>
<li><code>output Real violation[size(candidates,1)] \"Largest nonnegative violation of any supplied bound\"</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">CorrelatedWorstCase</a> 提供同域宿主参考。</p>
</html>"));
end FilterCombinations;
