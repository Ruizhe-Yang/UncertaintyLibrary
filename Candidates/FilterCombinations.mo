within UncertaintyLibrary.Candidates;
function FilterCombinations "Box and coupled-constraint filtering wrapper"
  input Real candidates[:,:] "Candidate rows intended for feasibility filtering";
  input UncertaintyLibrary.Sets.Interval ranges[size(candidates,2)] "Intended inclusive range of each candidate coordinate";
  input Real coefficients[:,size(candidates,2)] "Intended linear-constraint coefficients by row";
  input Real lower[size(coefficients,1)] "Intended lower bound for each linear-constraint row";
  input Real upper[size(coefficients,1)] "Intended upper bound for each linear-constraint row";
  input Real tolerance(min=0) = 0 "Intended nonnegative allowance for the constraint comparisons";
  output Boolean feasible[size(candidates,1)] "Intended row-feasibility mask after correcting the internal call";
  output Integer feasibleCount "Intended number of feasible candidate rows";
  output Real violation[size(candidates,1)] "Intended largest nonnegative bound violation for each row";
protected
  Boolean linearOK "Intended combined linear-feasibility result";
  Real rowViolation "Intended linear violation result absent from the called interface";
  Real rowMargin "Intended linear margin result absent from the called interface";
  Real boxViolation "Largest coordinate-box violation for the current row";
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
    Documentation(info="<html><p>This wrapper is intended to combine box limits with two-sided linear constraints while retaining candidate-row identities and reporting violations.</p><p><b>Interface limitation:</b> its current call to Constraints.LinearFeasibility supplies five arguments and assigns three results. That function declares four inputs, <code>(A,b,x,rowTolerance)</code>, and two outputs, <code>(feasible,mask)</code>; the argument ranks also differ. The call must be reconciled before this wrapper is used. Combine the supported box and linear feasibility results explicitly when constructing the intended filter.</p></html>"));
end FilterCombinations;
