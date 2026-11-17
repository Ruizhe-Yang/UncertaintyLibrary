within UncertaintyLibrary.Examples;
model IntervalArithmetic "Compare interval arithmetic and signed affine mapping"
  extends Modelica.Icons.Example;
  UncertaintyLibrary.Utilities.Views.ArithmeticView computed  "Interval calculations with fixed input ranges" annotation(Placement(transformation(origin={-90,0},extent={{-23,-23},{23,23}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput sumLower  "Lower endpoint of the interval sum" annotation(Placement(transformation(origin={155,171},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput sumUpper  "Upper endpoint of the interval sum" annotation(Placement(transformation(origin={155,133},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput differenceLower  "Lower endpoint of the interval difference" annotation(Placement(transformation(origin={155,95},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput differenceUpper  "Upper endpoint of the interval difference" annotation(Placement(transformation(origin={155,57},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput productLower  "Lower endpoint of the interval product" annotation(Placement(transformation(origin={155,19},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput productUpper  "Upper endpoint of the interval product" annotation(Placement(transformation(origin={155,-19},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput ratioLower  "Lower endpoint of the interval quotient" annotation(Placement(transformation(origin={155,-57},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput ratioUpper  "Upper endpoint of the interval quotient" annotation(Placement(transformation(origin={155,-95},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput mappedLower  "Lower endpoint after negative affine scaling" annotation(Placement(transformation(origin={155,-133},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput mappedUpper  "Upper endpoint after negative affine scaling" annotation(Placement(transformation(origin={155,-171},extent={{-7,-7},{7,7}},rotation=0)));
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
    Documentation(info="<html><p>Use a=[-2,3] and b=[4,5]. Addition gives [2,8], subtraction [-7,-1], multiplication [-10,15] and division [-0.5,0.75]. Mapping a with gain -2 and offset 1 gives [-5,5].</p><p>Inspect the paired lower and upper outputs. The operations order their result endpoints, including for a negative gain; the denominator interval excludes zero.</p></html>"));
end IntervalArithmetic;
