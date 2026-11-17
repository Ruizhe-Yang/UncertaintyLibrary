within UncertaintyLibrary.Constraints;
function BoxFeasibility "Closed-box membership with per-coordinate results"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval box[:] "Closed interval for each coordinate";
  input Real x[size(box,1)] "Point with coordinates corresponding to box";
  output Boolean feasible "True when every coordinate belongs to its interval";
  output Boolean mask[size(box,1)] "Membership result for each coordinate";
algorithm
  feasible:=true;
  for i in 1:size(box,1) loop
    mask[i]:=UncertaintyLibrary.Sets.Contains(box[i],x[i]);
    feasible:=feasible and mask[i];
  end for;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Rectangle(extent={{-35.52,-38.12},{35.52,18.12}}, lineColor={108,88,49}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Ellipse(extent={{1.48,-10.74},{8.88,-3.34}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-45.88,28.48},{-37,19.6}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-45.88,19.6},{-37,28.48}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{21.275,-46.26},{27.602,-52.92},{39.923,-36.936}}, color={75,138,73}, thickness=1.5, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Call <code>BoxFeasibility(box,x)</code> to obtain <code>feasible</code> and the per-coordinate <code>mask</code>. Both interval endpoints are included, and feasibility is the conjunction of all membership results.</p><p>Each interval is validated by Contains; an invalid interval raises an assertion. An empty box returns true with an empty mask.</p></html>"));
end BoxFeasibility;
