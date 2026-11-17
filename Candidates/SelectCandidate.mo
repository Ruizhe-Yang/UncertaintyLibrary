within UncertaintyLibrary.Candidates;
function SelectCandidate "Selection of an existing one-based candidate row"
  extends Modelica.Icons.Function;
input Real candidates[:,:] "Existing candidate matrix with coordinates by column";
  input Integer index "One-based row index to select";
  output Real row[size(candidates,2)] "Selected parameter row";
  output Integer candidateId "Original one-based row index";
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
    Documentation(info="<html><p>Return the requested row of candidates and repeat its one-based index as candidateId. The index must lie within the existing row range.</p><p>The function does not reorder, validate or filter candidate values. Apply any feasibility mask before choosing the index and keep the original row numbering for traceability.</p></html>"));
end SelectCandidate;
