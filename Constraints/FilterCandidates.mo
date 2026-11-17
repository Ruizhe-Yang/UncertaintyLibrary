within UncertaintyLibrary.Constraints;
function FilterCandidates "Candidate feasibility mask and retained original row indices"
  extends Modelica.Icons.Function;
input Real candidates[:,:] "Candidate points, one per row";
  input UncertaintyLibrary.Sets.Interval box[size(candidates,2)] "Closed interval for each candidate coordinate";
  input Real A[:,size(candidates,2)]=fill(0,0,size(candidates,2)) "Optional matrix of linear upper inequalities";
  input Real b[size(A,1)]=fill(0,size(A,1)) "Upper bound for each linear constraint row";
  input Real rowTolerance[size(A,1)]=fill(0,size(A,1)) "Nonnegative allowance in the unit of each linear constraint row";

  output Boolean acceptedMask[size(candidates,1)] "Feasibility flag in original candidate-row order";
  output Integer acceptedIndices[size(candidates,1)] "Accepted one-based row indices followed by zero padding";
  output Integer nAccepted "Number of accepted candidate rows";
  output Boolean available "True when at least one candidate is accepted";
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
    Documentation(info="<html><p>Call <code>FilterCandidates(candidates,box,A,b,rowTolerance)</code> to test each candidate row against the closed box and all linear upper inequalities. The optional empty constraint matrix applies only the box test.</p><p><code>acceptedMask</code> retains the candidate-row order. The leading <code>nAccepted</code> entries of <code>acceptedIndices</code> contain the accepted one-based row numbers; the remainder is zero. <code>available</code> is true when at least one row is accepted. No candidate matrix is resized or returned.</p></html>"));
end FilterCandidates;
