within UncertaintyLibrary.Constraints;
function FilterCandidates "Select feasible rows without resizing the result arrays"
  extends Modelica.Icons.Function;
input Real candidates[:,:];
  input UncertaintyLibrary.Sets.Interval box[size(candidates,2)];
  input Real A[:,size(candidates,2)]=fill(0,0,size(candidates,2));
  input Real b[size(A,1)]=fill(0,size(A,1));
  input Real rowTolerance[size(A,1)]=fill(0,size(A,1));

  output Boolean acceptedMask[size(candidates,1)];
  output Integer acceptedIndices[size(candidates,1)];
  output Integer nAccepted;
  output Boolean available;
algorithm

  acceptedIndices:=fill(0,size(candidates,1));
  nAccepted:=0;
  for i in 1:size(candidates,1) loop
    acceptedMask[i]:=UncertaintyLibrary.Constraints.BoxFeasibility(box,candidates[i,:]) and UncertaintyLibrary.Constraints.LinearFeasibility(A,b,candidates[i,:],rowTolerance);
    if acceptedMask[i] then nAccepted:=nAccepted+1; acceptedIndices[nAccepted]:=i; end if;
  end for;
  available:=nAccepted>0;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Rectangle(extent={{-40.7,-44.04},{40.7,24.04}}, lineColor={128,128,128}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-40.7,-21.84},{40.7,-21.84}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid),
        Line(points={{-40.7,1.1},{40.7,1.1}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid),
        Rectangle(extent={{-40.7,-44.04},{40.7,-21.84}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-40.7,1.1},{40.7,24.04}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-51.8,12.94},{-42.18,12.94}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{-51.8,-32.94},{-42.18,-32.94}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{-22.2,-15.92},{22.2,-4.82}}, color={128,128,128}, thickness=0.7, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Select feasible rows without resizing the result arrays.</p><p><b>Interfaces</b> input Real candidates[:,:]; input UncertaintyLibrary.Sets.Interval box[size(candidates,2)]; input Real A[:,size(candidates,2)]=fill(0,0,size(candidates,2)); input Real b[size(A,1)]=fill(0,size(A,1)); input Real rowTolerance[size(A,1)]=fill(0,size(A,1)); output Boolean acceptedMask[size(candidates,1)]; output Integer acceptedIndices[size(candidates,1)]; output Integer nAccepted; output Boolean available</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Select feasible rows without resizing the result arrays</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Unused indices are zero. The empty accepted set is a valid output state.</p><p><b>Observables</b> acceptedMask, acceptedIndices, nAccepted, available</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.CoupledAndConstrainedCandidates\">UncertaintyLibrary.Examples.CoupledAndConstrainedCandidates</a></p></html>"));
end FilterCandidates;
