within UncertaintyLibrary.Examples;
model CandidateGrids "Inspect finite grids and their candidate ordering"
  extends Modelica.Icons.Example;
  UncertaintyLibrary.Utilities.Views.CandidateView computed  "Finite candidate-grid calculations" annotation(Placement(transformation(origin={-90,0},extent={{-23,-23},{23,23}},rotation=0)));
  Modelica.Blocks.Interfaces.IntegerOutput corners  "Number of box-corner rows" annotation(Placement(transformation(origin={155,76},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.IntegerOutput gridPoints  "Number of Cartesian-grid rows" annotation(Placement(transformation(origin={155,38},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput singleton  "Midpoint selected by a one-point grid" annotation(Placement(transformation(origin={155,0},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput secondCornerY  "Second coordinate of the second corner" annotation(Placement(transformation(origin={155,-38},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput middleX  "First coordinate of the middle grid row" annotation(Placement(transformation(origin={155,-76},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(computed.corners,corners) annotation(Line(points={{-67,16.1},{47,16.1},{47,76},{155,76}},color={255,127,0}));
  connect(computed.gridPoints,gridPoints) annotation(Line(points={{-67,8.05},{47,8.05},{47,38},{155,38}},color={255,127,0}));
  connect(computed.singleton,singleton) annotation(Line(points={{-67,0},{155,0}},color={0,0,127}));
  connect(computed.secondCornerY,secondCornerY) annotation(Line(points={{-67,-8.05},{47,-8.05},{47,-38},{155,-38}},color={0,0,127}));
  connect(computed.middleX,middleX) annotation(Line(points={{-67,-16.1},{47,-16.1},{47,-76},{155,-76}},color={0,0,127}));
  annotation(experiment(StartTime=0,StopTime=1,Interval=0.002,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-360,-240},{360,240}},preserveAspectRatio=true),graphics={Text(extent={{-192,202},{8,188}},textString="Computed values",textColor={34,61,73})}),
    Documentation(info="<html><p>Construct corners and a three-by-three Cartesian grid for [0,2] by [-1,1]. A one-point grid on the first interval selects its midpoint.</p><p>The view reports four corners, nine grid points, singleton=1, secondCornerY=1 and middleX=1. Inspect the underlying candidate arrays when mapping a row index back to a parameter combination.</p></html>"));
end CandidateGrids;
