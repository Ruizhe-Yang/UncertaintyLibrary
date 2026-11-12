within UncertaintyLibrary.Examples;
model IntervalArithmetic "Check interval addition, subtraction, product, division and negative scaling"
  extends Modelica.Icons.Example;
  UncertaintyLibrary.Utilities.Views.ArithmeticView computed annotation(Placement(transformation(origin={-90,0},extent={{-23,-23},{23,23}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput sumLower annotation(Placement(transformation(origin={155,171},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput sumUpper annotation(Placement(transformation(origin={155,133},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput differenceLower annotation(Placement(transformation(origin={155,95},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput differenceUpper annotation(Placement(transformation(origin={155,57},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput productLower annotation(Placement(transformation(origin={155,19},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput productUpper annotation(Placement(transformation(origin={155,-19},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput ratioLower annotation(Placement(transformation(origin={155,-57},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput ratioUpper annotation(Placement(transformation(origin={155,-95},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput mappedLower annotation(Placement(transformation(origin={155,-133},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput mappedUpper annotation(Placement(transformation(origin={155,-171},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(computed.sumLower,sumLower) annotation(Line(points={{-67,16.1},{47,16.1},{47,171},{155,171}},color={0,0,127}));
  connect(computed.sumUpper,sumUpper) annotation(Line(points={{-67,12.52221},{-62,12.52221},{-62,133},{155,133}},color={0,0,127}));
  connect(computed.differenceLower,differenceLower) annotation(Line(points={{-67,8.94445},{-62,8.94445},{-62,95},{155,95}},color={0,0,127}));
  connect(computed.differenceUpper,differenceUpper) annotation(Line(points={{-67,5.36666},{-62,5.36666},{-62,57},{155,57}},color={0,0,127}));
  connect(computed.productLower,productLower) annotation(Line(points={{-67,1.78889},{155,1.78889},{155,19}},color={0,0,127}));
  connect(computed.productUpper,productUpper) annotation(Line(points={{-67,-1.78889},{155,-1.78889},{155,-19}},color={0,0,127}));
  connect(computed.ratioLower,ratioLower) annotation(Line(points={{-67,-5.36666},{-62,-5.36666},{-62,-57},{155,-57}},color={0,0,127}));
  connect(computed.ratioUpper,ratioUpper) annotation(Line(points={{-67,-8.94445},{-62,-8.94445},{-62,-95},{155,-95}},color={0,0,127}));
  connect(computed.mappedLower,mappedLower) annotation(Line(points={{-67,-12.52221},{-62,-12.52221},{-62,-133},{155,-133}},color={0,0,127}));
  connect(computed.mappedUpper,mappedUpper) annotation(Line(points={{-67,-16.1},{47,-16.1},{47,-171},{155,-171}},color={0,0,127}));
  annotation(experiment(StartTime=0,StopTime=1,Interval=0.002,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-360,-240},{360,240}},preserveAspectRatio=true),graphics={Text(extent={{-192,202},{8,188}},textString="Computed values",textColor={34,61,73})}),
    Documentation(info="<html><p><b>Purpose</b> Check interval addition, subtraction, product, division and negative scaling</p><p><b>Interfaces</b> Instances and connections are shown in the Diagram layer.</p><p><b>Parameters</b> Default values are shown in the component modifiers.</p><p><b>Behavior</b> The operation ranges are [2,8], [-7,-1], [-10,15], [-0.5,0.75] and [-5,5].</p><p><b>Initialization</b> All initial conditions are explicit in the source and component modifiers.</p><p><b>Activation and recovery</b> The given time windows follow the simulation time axis.</p><p><b>Limitations</b> This demonstration uses the declared inputs, initial conditions and idealized components.</p><p><b>Observables</b> sumLower, sumUpper, differenceLower, differenceUpper, productLower, productUpper, ratioLower, ratioUpper, mappedLower, mappedUpper</p></html>"));
end IntervalArithmetic;
