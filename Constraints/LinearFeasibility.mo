within UncertaintyLibrary.Constraints;
function LinearFeasibility "Check each row of a deterministic linear constraint"
  extends Modelica.Icons.Function;
input Real A[:,:];
  input Real b[size(A,1)];
  input Real x[size(A,2)];
  input Real rowTolerance[size(A,1)]=fill(0,size(A,1));
  output Boolean feasible;
  output Boolean mask[size(A,1)];
algorithm
  feasible:=true;
  for i in 1:size(A,1) loop
    assert(rowTolerance[i]>=0,"Negative row tolerance.");
    mask[i]:=sum(A[i,j]*x[j] for j in 1:size(A,2))<=b[i]+rowTolerance[i];
    feasible:=feasible and mask[i];
  end for;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Rectangle(extent={{-42.18,-41.82},{42.18,21.82}}, lineColor={128,128,128}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Polygon(points={{-42.18,-41.82},{-42.18,21.82},{-26.64,21.82},{42.18,-35.16},{42.18,-41.82},{-42.18,-41.82}}, lineColor={128,128,128}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-26.64,21.82},{42.18,-35.16}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Ellipse(extent={{-23.68,-24.06},{-16.28,-16.66}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{17.76,15.16},{26.64,6.28}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{17.76,6.28},{26.64,15.16}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Check each row of a deterministic linear constraint.</p><p><b>Interfaces</b> input Real A[:,:]; input Real b[size(A,1)]; input Real x[size(A,2)]; input Real rowTolerance[size(A,1)]=fill(0,size(A,1)); output Boolean feasible; output Boolean mask[size(A,1)]</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Check each row of a deterministic linear constraint</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Each row tolerance has the units of the corresponding right-hand side.</p><p><b>Observables</b> feasible, mask</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.CoupledAndConstrainedCandidates\">UncertaintyLibrary.Examples.CoupledAndConstrainedCandidates</a></p></html>"));
end LinearFeasibility;
