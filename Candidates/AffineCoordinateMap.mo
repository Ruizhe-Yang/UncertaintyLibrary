within UncertaintyLibrary.Candidates;
function AffineCoordinateMap "以共享确定性坐标产生关联参数"
  input Real origin[:];
  input Real directions[size(origin,1),:] "One column per shared coordinate";
  input Real coordinate[size(directions,2)] "Normalized deterministic coordinates in [-1,1]";
  output Real values[size(origin,1)];
algorithm
  assert(size(origin,1)>0 and size(coordinate,1)>0,"An affine map needs input and output dimensions.");
  for i in 1:size(coordinate,1) loop
    assert(coordinate[i]>=-1 and coordinate[i]<=1,"Shared coordinate outside [-1,1].");
  end for;
  values := origin+directions*coordinate;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-44.4,25.52},{-44.4,-41.08},{45.14,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Polygon(points={{-31.82,-31.46},{12.58,-31.46},{34.04,16.64},{-10.36,16.64},{-31.82,-31.46}}, lineColor={108,88,49}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-10.36,-31.46},{11.84,16.64}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid),
        Line(points={{-20.72,-7.78},{23.68,-7.78}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid),
        Ellipse(extent={{-24.05,-11.11},{-17.39,-4.45}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-1.85,-11.11},{4.81,-4.45}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{20.35,-11.11},{27.01,-4.45}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 以共享确定性坐标产生关联参数</p><p><b>Interfaces</b> input Real origin[:]; input Real directions[size(origin,1),:] \"One column per shared coordinate\"; input Real coordinate[size(directions,2)] \"Normalized deterministic coordinates in [-1,1]\"; output Real values[size(origin,1)]</p><p><b>Parameters</b> The declaration has no standalone tuning parameters.</p><p><b>Behavior</b> 以共享确定性坐标产生关联参数</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.CandidateGrids\">UncertaintyLibrary.Examples.CandidateGrids</a></p>
<p>以共享确定性坐标产生关联参数</p>
<p><b>行为</b> 共用同一坐标的参数随之联动。输出为 origin+A·z。</p>
<p><b>最小用法</b> 给定共享温漂或共用制造偏差方向，再选择坐标组合。</p>
<p><b>适用边界</b> 系数携带各目标参数的单位。该映射不是概率相关性模型。</p>
<p>接口及方向</p>
<ul>
<li><code>input Real origin[:]</code></li>
<li><code>input Real directions[size(origin,1),:] \"One column per shared coordinate\"</code></li>
<li><code>input Real coordinate[size(directions,2)] \"Normalized deterministic coordinates in [-1,1]\"</code></li>
<li><code>output Real values[size(origin,1)]</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">CorrelatedWorstCase</a> 提供同域宿主参考。</p>
</html>"));
end AffineCoordinateMap;
