within UncertaintyLibrary.Constraints;
function LinearFeasibility "Row-wise feasibility of linear upper inequalities"
  extends Modelica.Icons.Function;
input Real A[:,:] "Coefficient matrix with one inequality per row";
  input Real b[size(A,1)] "Upper bound for each inequality row";
  input Real x[size(A,2)] "Point to be tested";
  input Real rowTolerance[size(A,1)]=fill(0,size(A,1)) "Nonnegative allowance in the unit of each inequality row";
  output Boolean feasible "True when every relaxed upper inequality is satisfied";
  output Boolean mask[size(A,1)] "Feasibility result for each inequality row";
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
    Documentation(info="<html><p>Call <code>LinearFeasibility(A,b,x,rowTolerance)</code> to obtain <code>feasible</code> and the per-row <code>mask</code>. Row i accepts <code>sum(A[i,j]*x[j]) &lt;= b[i]+rowTolerance[i]</code>; every row must pass.</p><p>Each row tolerance must be nonnegative and expressed in that row's unit. Supply finite, consistently scaled data. With no constraint rows, feasibility is true and the mask is empty.</p></html>"));
end LinearFeasibility;
