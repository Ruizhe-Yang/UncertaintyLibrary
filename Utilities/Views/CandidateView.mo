within UncertaintyLibrary.Utilities.Views;
block CandidateView "Show cardinalities and ordering of finite candidate grids"
parameter UncertaintyLibrary.Sets.Interval box[2]={UncertaintyLibrary.Sets.Interval(0,2),UncertaintyLibrary.Sets.Interval(-1,1)};
  parameter Real cornerSet[4,2]=UncertaintyLibrary.Candidates.BoxCorners(box);
  parameter Real gridSet[9,2]=UncertaintyLibrary.Candidates.CartesianGrid(box,{3,3});
  parameter Real singletonGrid[1]=UncertaintyLibrary.Candidates.Grid1D(box[1],1);
  Modelica.Blocks.Interfaces.IntegerOutput corners annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.IntegerOutput gridPoints annotation(Placement(transformation(origin={100,35},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,35},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput singleton annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput secondCornerY annotation(Placement(transformation(origin={100,-35},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-35},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput middleX annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
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
    Documentation(info="<html><p><b>Purpose</b> Show cardinalities and ordering of finite candidate grids.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.IntegerOutput corners; Modelica.Blocks.Interfaces.IntegerOutput gridPoints; Modelica.Blocks.Interfaces.RealOutput singleton; Modelica.Blocks.Interfaces.RealOutput secondCornerY; Modelica.Blocks.Interfaces.RealOutput middleX</p><p><b>Parameters</b> parameter UncertaintyLibrary.Sets.Interval box[2]={UncertaintyLibrary.Sets.Interval(0,2),UncertaintyLibrary.Sets.Interval(-1,1)}; parameter Real cornerSet[4,2]=UncertaintyLibrary.Candidates.BoxCorners(box); parameter Real gridSet[9,2]=UncertaintyLibrary.Candidates.CartesianGrid(box,{3,3}); parameter Real singletonGrid[1]=UncertaintyLibrary.Candidates.Grid1D(box[1],1)</p><p><b>Behavior</b> Show cardinalities and ordering of finite candidate grids</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> corners, gridPoints, singleton, secondCornerY, middleX</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.CandidateGrids\">UncertaintyLibrary.Examples.CandidateGrids</a></p></html>"));
end CandidateView;
