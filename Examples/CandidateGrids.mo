within UncertaintyLibrary.Examples;
model CandidateGrids "Inspect one-dimensional, corner and Cartesian candidate grids"
  extends Modelica.Icons.Example;
  UncertaintyLibrary.Utilities.Views.CandidateView computed annotation(Placement(transformation(origin={-90,0},extent={{-23,-23},{23,23}},rotation=0)));
  Modelica.Blocks.Interfaces.IntegerOutput corners annotation(Placement(transformation(origin={155,76},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.IntegerOutput gridPoints annotation(Placement(transformation(origin={155,38},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput singleton annotation(Placement(transformation(origin={155,0},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput secondCornerY annotation(Placement(transformation(origin={155,-38},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput middleX annotation(Placement(transformation(origin={155,-76},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(computed.corners,corners) annotation(Line(points={{-67,16.1},{47,16.1},{47,76},{155,76}},color={255,127,0}));
  connect(computed.gridPoints,gridPoints) annotation(Line(points={{-67,8.05},{47,8.05},{47,38},{155,38}},color={255,127,0}));
  connect(computed.singleton,singleton) annotation(Line(points={{-67,0},{155,0}},color={0,0,127}));
  connect(computed.secondCornerY,secondCornerY) annotation(Line(points={{-67,-8.05},{47,-8.05},{47,-38},{155,-38}},color={0,0,127}));
  connect(computed.middleX,middleX) annotation(Line(points={{-67,-16.1},{47,-16.1},{47,-76},{155,-76}},color={0,0,127}));
  annotation(experiment(StartTime=0,StopTime=1,Interval=0.002,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-360,-240},{360,240}},preserveAspectRatio=true),graphics={Text(extent={{-192,202},{8,188}},textString="Computed values",textColor={34,61,73})}),
    Documentation(info="<html><p><b>Purpose</b> Inspect one-dimensional, corner and Cartesian candidate grids</p><p><b>Interfaces</b> Instances and connections are shown in the Diagram layer.</p><p><b>Parameters</b> Default values are shown in the component modifiers.</p><p><b>Behavior</b> The two-dimensional box has four corners and nine grid points. A singleton on [0,2] selects 1.</p><p><b>Initialization</b> All initial conditions are explicit in the source and component modifiers.</p><p><b>Activation and recovery</b> The given time windows follow the simulation time axis.</p><p><b>Limitations</b> This demonstration uses the declared inputs, initial conditions and idealized components.</p><p><b>Observables</b> corners, gridPoints, singleton, secondCornerY, middleX</p></html>"));
end CandidateGrids;
