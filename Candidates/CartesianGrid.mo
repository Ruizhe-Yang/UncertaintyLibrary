within UncertaintyLibrary.Candidates;
function CartesianGrid "Deterministic Cartesian grid with a bounded total size"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval box[:] "Finite ordered coordinate intervals";
  input Integer counts[size(box,1)] "Positive uniform-grid size for each coordinate";
  output Real candidates[UncertaintyLibrary.Utilities.Functions.GridSize(counts),size(box,1)] "Cartesian candidate rows with the final coordinate changing fastest";
protected
  Integer index "Remaining mixed-radix row index";
  Integer q "Zero-based coordinate-grid index";
algorithm
  assert(size(box,1)>=1 and size(candidates,1)>0,"Grid requires 1 to 4096 points and positive per-axis sizes.");
  for j in 1:size(box,1) loop assert(UncertaintyLibrary.Utilities.Functions.Valid(box[j]),"Invalid grid interval."); end for;
  for i in 1:size(candidates,1) loop
    index:=i-1;
    for j in size(box,1):-1:1 loop
      q:=mod(index,counts[j]);
      candidates[i,j]:=UncertaintyLibrary.Sets.SelectPoint(box[j],if counts[j]==1 then 0 else -1+2.0*q/(counts[j]-1));
      index:=div(index,counts[j]);
    end for;
  end for;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Rectangle(extent={{-35.52,-38.12},{35.52,18.12}}, lineColor={108,88,49}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-11.84,-38.12},{-11.84,18.12}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{11.84,-38.12},{11.84,18.12}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-35.52,-19.62},{35.52,-19.62}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-35.52,-0.38},{35.52,-0.38}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Ellipse(extent={{-37.518,-40.118},{-33.522,-36.122}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-37.518,-21.618},{-33.522,-17.622}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-37.518,-2.378},{-33.522,1.618}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-37.518,16.122},{-33.522,20.118}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-13.838,-40.118},{-9.842,-36.122}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-13.838,-21.618},{-9.842,-17.622}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-13.838,-2.378},{-9.842,1.618}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-13.838,16.122},{-9.842,20.118}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{9.842,-40.118},{13.838,-36.122}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{9.842,-21.618},{13.838,-17.622}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{9.842,-2.378},{13.838,1.618}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{9.842,16.122},{13.838,20.118}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{33.522,-40.118},{37.518,-36.122}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{33.522,-21.618},{37.518,-17.622}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{33.522,-2.378},{37.518,1.618}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{33.522,16.122},{37.518,20.118}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Generate a Cartesian product of uniform per-axis grids, with the final axis changing fastest. A count of one selects the interval midpoint; larger counts include both endpoints.</p><p>Each count must be positive and the total product must not exceed 4096. Supply at least one finite ordered coordinate interval. Rows are deterministic combinations, with no probability weights or guarantee of capturing interior response extrema.</p></html>"));
end CartesianGrid;
