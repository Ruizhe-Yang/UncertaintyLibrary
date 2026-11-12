within UncertaintyLibrary.Analysis;
block CandidateWorstCase "汇总可行的有限候选中最差观测值"
  parameter Integer n(min=1) = 3 "Number of declared candidates";
  parameter Boolean largerIsWorse = true;
  Modelica.Blocks.Interfaces.RealInput metrics[n] "Comparable metric values" annotation(Placement(transformation(extent={{-106,66},{-94,78}}), iconTransformation(extent={{-106,66},{-94,78}})));
  Modelica.Blocks.Interfaces.BooleanInput feasible[n] "Feasibility from independent constraints" annotation(Placement(transformation(extent={{-106,18},{-94,30}}), iconTransformation(extent={{-106,18},{-94,30}})));
  Modelica.Blocks.Interfaces.BooleanInput valid[n] "Per-candidate observation exists and is usable" annotation(Placement(transformation(extent={{-106,-30},{-94,-18}}), iconTransformation(extent={{-106,-30},{-94,-18}})));
  Modelica.Blocks.Interfaces.BooleanInput collectionComplete "The requested evaluation stage has ended" annotation(Placement(transformation(extent={{-106,-78},{-94,-66}}), iconTransformation(extent={{-106,-78},{-94,-66}})));
  Modelica.Blocks.Interfaces.IntegerOutput selectedIndex "1-based candidate, zero if none usable" annotation(Placement(transformation(extent={{94,66},{106,78}}), iconTransformation(extent={{94,66},{106,78}})));
  Modelica.Blocks.Interfaces.IntegerOutput feasibleCount annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.IntegerOutput observedCount annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
  Modelica.Blocks.Interfaces.RealOutput worstObserved annotation(Placement(transformation(extent={{94,-78},{106,-66}}), iconTransformation(extent={{94,-78},{106,-66}})));
  output UncertaintyLibrary.Utilities.Types.EvidenceState state;
protected
  Boolean bad;
algorithm
  selectedIndex := 0;
  feasibleCount := 0;
  observedCount := 0;
  worstObserved := 0;
  bad := false;
  for i in 1:n loop
    if feasible[i] then
      feasibleCount := feasibleCount+1;
      if valid[i] then
        if noEvent(abs(metrics[i]) < Modelica.Constants.inf) then
          observedCount := observedCount+1;
          if selectedIndex==0 or (if largerIsWorse then metrics[i]>worstObserved else metrics[i]<worstObserved) then
            worstObserved := metrics[i];
            selectedIndex := i;
          end if;
        else
          bad := true;
        end if;
      end if;
    end if;
  end for;
  state := if feasibleCount==0 then UncertaintyLibrary.Utilities.Types.EvidenceState.NOT_APPLICABLE elseif bad then UncertaintyLibrary.Utilities.Types.EvidenceState.INVALID
    elseif not collectionComplete or observedCount<feasibleCount then UncertaintyLibrary.Utilities.Types.EvidenceState.UNDECIDED else UncertaintyLibrary.Utilities.Types.EvidenceState.COMPLETE;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-60,-45},{62,-45}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Rectangle(extent={{-53,-45},{-36,-10}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-23,-45},{-6,42}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{7,-45},{24,13}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{37,-45},{54,25}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-26,51},{-3,51}}, color={108,88,49}, thickness=1.4, pattern=LinePattern.Solid),
        Text(extent={{-60,76},{65,52}}, textString="worst", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p><b>Purpose</b> 汇总可行的有限候选中最差观测值</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealInput metrics[n] \"Comparable metric values\"; Modelica.Blocks.Interfaces.BooleanInput feasible[n] \"Feasibility from independent constraints\"; Modelica.Blocks.Interfaces.BooleanInput valid[n] \"Per-candidate observation exists and is usable\"; Modelica.Blocks.Interfaces.BooleanInput collectionComplete \"The requested evaluation stage has ended\"; Modelica.Blocks.Interfaces.IntegerOutput selectedIndex \"1-based candidate, zero if none usable\"; Modelica.Blocks.Interfaces.IntegerOutput feasibleCount; Modelica.Blocks.Interfaces.IntegerOutput observedCount; Modelica.Blocks.Interfaces.RealOutput worstObserved; output UncertaintyLibrary.Utilities.Types.EvidenceState state</p><p><b>Parameters</b> parameter Integer n(min=1) = 3 \"Number of declared candidates\"; parameter Boolean largerIsWorse = true</p><p><b>Behavior</b> 汇总可行的有限候选中最差观测值</p><p><b>Initialization</b> Use the declared initial values and host state modifiers.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Use the declared parameter range. The catalog identifies simulation coverage.</p><p><b>Observables</b> Inspect the declared output variables.</p><p><b>Set semantics</b> Deterministic input domain. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.LocalSensitivity\">UncertaintyLibrary.Examples.LocalSensitivity</a></p>
<p>汇总可行的有限候选中最差观测值</p>
<p><b>行为</b> 排除不可行行，等值优先原顺序。保留已观测最差值和索引，有缺项或评估未结束时保持未决。</p>
<p><b>最小用法</b> 各候选运行同一指标，接原始行号顺序的值与状态。</p>
<p><b>适用边界</b> 该结果是给定有限集合上的最差观测。全域最坏情况需要额外的数学界或全域验证。</p>
<p>参数的类型、默认值和取值见下列声明。</p>
<ul>
<li><code>Integer n(min=1) = 3 \"Number of declared candidates\"</code></li>
<li><code>Boolean largerIsWorse = true</code></li>
</ul>
<p>接口及方向</p>
<ul>
<li><code>Modelica.Blocks.Interfaces.RealInput metrics[n] \"Comparable metric values\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanInput feasible[n] \"Feasibility from independent constraints\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanInput valid[n] \"Per-candidate observation exists and is usable\"</code></li>
<li><code>Modelica.Blocks.Interfaces.BooleanInput collectionComplete \"The requested evaluation stage has ended\"</code></li>
<li><code>Modelica.Blocks.Interfaces.IntegerOutput selectedIndex \"1-based candidate, zero if none usable\"</code></li>
<li><code>Modelica.Blocks.Interfaces.IntegerOutput feasibleCount</code></li>
<li><code>Modelica.Blocks.Interfaces.IntegerOutput observedCount</code></li>
<li><code>Modelica.Blocks.Interfaces.RealOutput worstObserved</code></li>
<li><code>output UncertaintyLibrary.Utilities.Types.EvidenceState state</code></li>
</ul>
<p><a href=\"modelica://UncertaintyLibrary.Examples.FiniteCandidateWorstCase\">CorrelatedWorstCase</a> 提供同域宿主参考。</p>
</html>"));
end CandidateWorstCase;
