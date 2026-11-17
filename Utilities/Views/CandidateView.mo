within UncertaintyLibrary.Utilities.Views;
block CandidateView "Display finite-grid size and coordinate ordering"
parameter UncertaintyLibrary.Sets.Interval box[2]={UncertaintyLibrary.Sets.Interval(0,2),UncertaintyLibrary.Sets.Interval(-1,1)} "Two closed coordinate intervals";
  parameter Real cornerSet[4,2]=UncertaintyLibrary.Candidates.BoxCorners(box) "Four box corners in final-coordinate-fastest order";
  parameter Real gridSet[9,2]=UncertaintyLibrary.Candidates.CartesianGrid(box,{3,3}) "Nine points in the default three-by-three grid";
  parameter Real singletonGrid[1]=UncertaintyLibrary.Candidates.Grid1D(box[1],1) "Midpoint grid on the first interval";
  Modelica.Blocks.Interfaces.IntegerOutput corners  "Number of corner rows" annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.IntegerOutput gridPoints  "Number of Cartesian grid rows" annotation(Placement(transformation(origin={100,35},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,35},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput singleton  "Single midpoint on the first interval" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput secondCornerY  "Second coordinate of the second corner row" annotation(Placement(transformation(origin={100,-35},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-35},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput middleX  "First coordinate of the fifth grid row" annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
equation
  corners=size(cornerSet,1);
  gridPoints=size(gridSet,1);
  singleton=singletonGrid[1];
  secondCornerY=cornerSet[2,2];
  middleX=gridSet[5,1];
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-72,-52},{72,66}}, lineColor={128,128,128}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-48,-65},{48,-65}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,-52},{0,-65}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Rectangle(extent={{-36.96,-21.26},{36.96,37.26}}, lineColor={108,88,49}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-12.32,-21.26},{-12.32,37.26}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{12.32,-21.26},{12.32,37.26}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-36.96,-2.01},{36.96,-2.01}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-36.96,18.01},{36.96,18.01}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Ellipse(extent={{-39.039,-23.339},{-34.881,-19.181}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-39.039,-4.089},{-34.881,0.069}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-39.039,15.931},{-34.881,20.089}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-39.039,35.181},{-34.881,39.339}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-14.399,-23.339},{-10.241,-19.181}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-14.399,-4.089},{-10.241,0.069}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-14.399,15.931},{-10.241,20.089}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-14.399,35.181},{-10.241,39.339}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{10.241,-23.339},{14.399,-19.181}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{10.241,-4.089},{14.399,0.069}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{10.241,15.931},{14.399,20.089}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{10.241,35.181},{14.399,39.339}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{34.881,-23.339},{39.039,-19.181}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{34.881,-4.089},{39.039,0.069}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{34.881,15.931},{39.039,20.089}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{34.881,35.181},{39.039,39.339}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{43,80},{70,57}}, textString="N", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Generate four corners and a 3-by-3 Cartesian grid for a two-dimensional box. Also generate a singleton grid on the first interval. The final coordinate changes fastest in the candidate rows.</p><p>The default outputs are four corners, nine grid points, singleton value 1, second-corner second coordinate 1 and middle-row first coordinate 1. Array dimensions are fixed for this view.</p></html>"));
end CandidateView;
