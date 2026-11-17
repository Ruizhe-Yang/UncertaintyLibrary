within UncertaintyLibrary.Utilities.Views;
block ConstraintView "Display finite candidate feasibility and a shared coordinate"
parameter UncertaintyLibrary.Sets.Interval box[2]={UncertaintyLibrary.Sets.Interval(0,2),UncertaintyLibrary.Sets.Interval(0,2)} "Two-dimensional closed box";
  parameter Real candidateSet[9,2]=UncertaintyLibrary.Candidates.CartesianGrid(box,{3,3}) "Nine points of the default three-by-three grid";
  parameter Real negative[2]=UncertaintyLibrary.Candidates.SharedCoordinate({2,5},{0.1,0.3},-1) "Mapped vector at shared coordinate -1";
  parameter Real middle[2]=UncertaintyLibrary.Candidates.SharedCoordinate({2,5},{0.1,0.3},0) "Mapped vector at shared coordinate zero";
  parameter Real positive[2]=UncertaintyLibrary.Candidates.SharedCoordinate({2,5},{0.1,0.3},1) "Mapped vector at shared coordinate 1";
    Modelica.Blocks.Interfaces.IntegerOutput acceptedCount  "Number of grid rows satisfying the box and inequality" annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput sharedLower  "Second mapped component at coordinate -1" annotation(Placement(transformation(origin={100,23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput sharedMiddle  "Second mapped component at coordinate zero" annotation(Placement(transformation(origin={100,-23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput sharedUpper  "Second mapped component at coordinate 1" annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
  Boolean mask[9] "Feasibility flag for each original candidate row";
  Integer indices[9] "Accepted original row indices followed by zeros";
  Boolean available "True when at least one candidate row is accepted";
equation
  (mask,indices,acceptedCount,available)=UncertaintyLibrary.Constraints.FilterCandidates(candidateSet,box,[1.0,1.0],{2.0});
  sharedLower=negative[2];
  sharedMiddle=middle[2];
  sharedUpper=positive[2];
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-72,-52},{72,66}}, lineColor={128,128,128}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-48,-65},{48,-65}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,-52},{0,-65}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Rectangle(extent={{-43.89,-25.11},{43.89,41.11}}, lineColor={128,128,128}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Polygon(points={{-43.89,-25.11},{-43.89,41.11},{-27.72,41.11},{43.89,-18.18},{43.89,-25.11},{-43.89,-25.11}}, lineColor={128,128,128}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-27.72,41.11},{43.89,-18.18}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Ellipse(extent={{-24.64,-6.63},{-16.94,1.07}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{18.48,34.18},{27.72,24.94}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{18.48,24.94},{27.72,34.18}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Filter a 3-by-3 grid using its box and <code>x1+x2 &lt;= 2</code>. The default [0,2] by [0,2] grid admits six rows. The mask retains row order and the index array contains accepted original row numbers followed by zeros.</p><p>Separately map shared coordinates -1, 0 and 1 through centre {2,5} and scale {0.1,0.3}. The displayed second components are 4.7, 5 and 5.3. These maps do not change the grid filter.</p></html>"));
end ConstraintView;
