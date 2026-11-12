within UncertaintyLibrary.Candidates;
function SelectCandidate "Select one existing one-based candidate row"
  extends Modelica.Icons.Function;
input Real candidates[:,:];
  input Integer index;
  output Real row[size(candidates,2)];
  output Integer candidateId;
algorithm
  assert(index>=1 and index<=size(candidates,1),"Candidate index out of range.");
  row:=candidates[index,:];
  candidateId:=index;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Rectangle(extent={{-38.48,-43.3},{38.48,23.3}}, lineColor={128,128,128}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-38.48,-18.88},{38.48,1.84}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-38.48,-18.88},{38.48,-18.88}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-38.48,1.84},{38.48,1.84}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-12.58,-43.3},{-12.58,23.3}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{13.32,-43.3},{13.32,23.3}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-54.76,-8.52},{-40.7,-8.52}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Select one existing one-based candidate row.</p><p><b>Interfaces</b> input Real candidates[:,:]; input Integer index; output Real row[size(candidates,2)]; output Integer candidateId</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Select one existing one-based candidate row</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> row, candidateId</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.CandidateGrids\">UncertaintyLibrary.Examples.CandidateGrids</a></p></html>"));
end SelectCandidate;
