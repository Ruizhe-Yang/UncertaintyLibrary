within UncertaintyLibrary.Analysis;
function FiniteDifferenceJacobian "由多组对称扰动得到多输出局部雅可比矩阵"
  input Real minusValues[:,:] "Rows are metrics, columns are parameters";
  input Real plusValues[size(minusValues,1),size(minusValues,2)];
  input Real steps[size(minusValues,2)] "Positive perturbation sizes";
  output Real jacobian[size(minusValues,1),size(minusValues,2)];
algorithm
  for j in 1:size(steps,1) loop
    assert(steps[j]>0 and steps[j]<Modelica.Constants.inf,"A central perturbation step must be finite and positive.");
    for i in 1:size(minusValues,1) loop
      assert(abs(plusValues[i,j])<Modelica.Constants.inf and abs(minusValues[i,j])<Modelica.Constants.inf,
        "All matched metrics must be finite.");
      jacobian[i,j] := (plusValues[i,j]-minusValues[i,j])/(2*steps[j]);
    end for;
  end for;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-42.18,25.52},{-48.1,25.52},{-48.1,-45.52},{-42.18,-45.52}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{42.18,25.52},{48.1,25.52},{48.1,-45.52},{42.18,-45.52}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{-36.26,18.12},{-14.06,-1.12}}, textString="a", textColor={108,88,49}, fontSize=0),
        Text(extent={{-11.1,18.12},{11.1,-1.12}}, textString="b", textColor={108,88,49}, fontSize=0),
        Text(extent={{14.06,18.12},{36.26,-1.12}}, textString="c", textColor={108,88,49}, fontSize=0),
        Text(extent={{-36.26,-15.18},{-14.06,-34.42}}, textString="d", textColor={108,88,49}, fontSize=0),
        Text(extent={{-11.1,-15.18},{11.1,-34.42}}, textString="e", textColor={108,88,49}, fontSize=0),
        Text(extent={{14.06,-15.18},{36.26,-34.42}}, textString="f", textColor={108,88,49}, fontSize=0),
        Text(extent={{-15.54,46.98},{15.54,29.22}}, textString="J", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 由多组对称扰动得到多输出局部雅可比矩阵</p><p><b>Interfaces</b> input Real minusValues[:,:] \"Rows are metrics, columns are parameters\"; input Real plusValues[size(minusValues,1),size(minusValues,2)]; input Real steps[size(minusValues,2)] \"Positive perturbation sizes\"; output Real jacobian[size(minusValues,1),size(minusValues,2)]</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 由多组对称扰动得到多输出局部雅可比矩阵</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.LocalSensitivity\">UncertaintyLibrary.Examples.LocalSensitivity</a></p>
<p>由多组对称扰动得到多输出局部雅可比矩阵</p>
<p><b>行为</b> 第 j 列只改变对应参数。对每个输出保存单位对应的导数近似。</p>
<p><b>最小用法</b> 将确定性扰动仿真的配对结果汇入矩阵。</p>
<p><b>适用边界</b> 独立坐标的局部变化应保持可行。如果受约束，应先选可行参数化坐标。</p>
<p>接口及方向</p>
<ul>
<li><code>input Real minusValues[:,:] \"Rows are metrics, columns are parameters\"</code></li>
<li><code>input Real plusValues[size(minusValues,1),size(minusValues,2)]</code></li>
<li><code>input Real steps[size(minusValues,2)] \"Positive perturbation sizes\"</code></li>
<li><code>output Real jacobian[size(minusValues,1),size(minusValues,2)]</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">CorrelatedWorstCase</a> 提供同域宿主参考。</p>
</html>"));
end FiniteDifferenceJacobian;
