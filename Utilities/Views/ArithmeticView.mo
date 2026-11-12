within UncertaintyLibrary.Utilities.Views;
block ArithmeticView "Compare interval operations with endpoint values"
parameter UncertaintyLibrary.Sets.Interval a=UncertaintyLibrary.Sets.Interval(-2,3);
  parameter UncertaintyLibrary.Sets.Interval b=UncertaintyLibrary.Sets.Interval(4,5);
  parameter UncertaintyLibrary.Sets.Interval sumRange=UncertaintyLibrary.Sets.Add(a,b);
  parameter UncertaintyLibrary.Sets.Interval diffRange=UncertaintyLibrary.Sets.Subtract(a,b);
  parameter UncertaintyLibrary.Sets.Interval prodRange=UncertaintyLibrary.Sets.Multiply(a,b);
  parameter UncertaintyLibrary.Sets.Interval ratioRange=UncertaintyLibrary.Sets.Divide(a,b);
  parameter UncertaintyLibrary.Sets.Interval mapped=UncertaintyLibrary.Sets.AffineMap(a,-2,1);
  Modelica.Blocks.Interfaces.RealOutput sumLower annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput sumUpper annotation(Placement(transformation(origin={100,54.44444},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,54.44444},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput differenceLower annotation(Placement(transformation(origin={100,38.88889},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,38.88889},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput differenceUpper annotation(Placement(transformation(origin={100,23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput productLower annotation(Placement(transformation(origin={100,7.77778},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,7.77778},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput productUpper annotation(Placement(transformation(origin={100,-7.77778},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-7.77778},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput ratioLower annotation(Placement(transformation(origin={100,-23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput ratioUpper annotation(Placement(transformation(origin={100,-38.88889},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-38.88889},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput mappedLower annotation(Placement(transformation(origin={100,-54.44444},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-54.44444},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput mappedUpper annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
equation
  sumLower=sumRange.lo;
  sumUpper=sumRange.hi;
  differenceLower=diffRange.lo;
  differenceUpper=diffRange.hi;
  productLower=prodRange.lo;
  productUpper=prodRange.hi;
  ratioLower=ratioRange.lo;
  ratioUpper=ratioRange.hi;
  mappedLower=mapped.lo;
  mappedUpper=mapped.hi;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-72,-52},{72,66}}, lineColor={128,128,128}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-48,-65},{48,-65}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,-52},{0,-65}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{-43.89,42.65},{43.89,12.62}}, textString="+  -", textColor={0,0,127}, fontSize=0),
        Text(extent={{-43.89,5.69},{43.89,-24.34}}, textString="*  /", textColor={0,0,127}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Compare interval operations with endpoint values.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput sumLower; Modelica.Blocks.Interfaces.RealOutput sumUpper; Modelica.Blocks.Interfaces.RealOutput differenceLower; Modelica.Blocks.Interfaces.RealOutput differenceUpper; Modelica.Blocks.Interfaces.RealOutput productLower; Modelica.Blocks.Interfaces.RealOutput productUpper; Modelica.Blocks.Interfaces.RealOutput ratioLower; Modelica.Blocks.Interfaces.RealOutput ratioUpper; Modelica.Blocks.Interfaces.RealOutput mappedLower; Modelica.Blocks.Interfaces.RealOutput mappedUpper</p><p><b>Parameters</b> parameter UncertaintyLibrary.Sets.Interval a=UncertaintyLibrary.Sets.Interval(-2,3); parameter UncertaintyLibrary.Sets.Interval b=UncertaintyLibrary.Sets.Interval(4,5); parameter UncertaintyLibrary.Sets.Interval sumRange=UncertaintyLibrary.Sets.Add(a,b); parameter UncertaintyLibrary.Sets.Interval diffRange=UncertaintyLibrary.Sets.Subtract(a,b); parameter UncertaintyLibrary.Sets.Interval prodRange=UncertaintyLibrary.Sets.Multiply(a,b); parameter UncertaintyLibrary.Sets.Interval ratioRange=UncertaintyLibrary.Sets.Divide(a,b); parameter UncertaintyLibrary.Sets.Interval mapped=UncertaintyLibrary.Sets.AffineMap(a,-2,1)</p><p><b>Behavior</b> Compare interval operations with endpoint values</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> sumLower, sumUpper, differenceLower, differenceUpper, productLower, productUpper, ratioLower, ratioUpper, mappedLower, mappedUpper</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.IntervalArithmetic\">UncertaintyLibrary.Examples.IntervalArithmetic</a></p></html>"));
end ArithmeticView;
