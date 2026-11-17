within UncertaintyLibrary.Utilities.Views;
block ArithmeticView "Display endpoint results of fixed interval operations"
parameter UncertaintyLibrary.Sets.Interval a=UncertaintyLibrary.Sets.Interval(-2,3) "First closed interval";
  parameter UncertaintyLibrary.Sets.Interval b=UncertaintyLibrary.Sets.Interval(4,5) "Second closed interval";
  parameter UncertaintyLibrary.Sets.Interval sumRange=UncertaintyLibrary.Sets.Add(a,b) "Default sum interval from a and b";
  parameter UncertaintyLibrary.Sets.Interval diffRange=UncertaintyLibrary.Sets.Subtract(a,b) "Default difference interval a minus b";
  parameter UncertaintyLibrary.Sets.Interval prodRange=UncertaintyLibrary.Sets.Multiply(a,b) "Default product interval from a and b";
  parameter UncertaintyLibrary.Sets.Interval ratioRange=UncertaintyLibrary.Sets.Divide(a,b) "Default ratio interval a divided by b";
  parameter UncertaintyLibrary.Sets.Interval mapped=UncertaintyLibrary.Sets.AffineMap(a,-2,1) "Default affine image of a under -2*a+1";
  Modelica.Blocks.Interfaces.RealOutput sumLower  "Lower sum endpoint" annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput sumUpper  "Upper sum endpoint" annotation(Placement(transformation(origin={100,54.44444},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,54.44444},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput differenceLower  "Lower difference endpoint" annotation(Placement(transformation(origin={100,38.88889},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,38.88889},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput differenceUpper  "Upper difference endpoint" annotation(Placement(transformation(origin={100,23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput productLower  "Lower product endpoint" annotation(Placement(transformation(origin={100,7.77778},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,7.77778},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput productUpper  "Upper product endpoint" annotation(Placement(transformation(origin={100,-7.77778},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-7.77778},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput ratioLower  "Lower ratio endpoint" annotation(Placement(transformation(origin={100,-23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput ratioUpper  "Upper ratio endpoint" annotation(Placement(transformation(origin={100,-38.88889},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-38.88889},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput mappedLower  "Lower affine-image endpoint" annotation(Placement(transformation(origin={100,-54.44444},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-54.44444},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput mappedUpper  "Upper affine-image endpoint" annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
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
    Documentation(info="<html><p>Expose the endpoints of parameter-bound addition, subtraction, multiplication, division and the affine map <code>-2*a+1</code>. Change <code>a</code> and <code>b</code> to compare the calculated ranges.</p><p>For the defaults, the sum is [2,8], difference [-7,-1], product [-10,15], ratio [-0.5,0.75] and affine image [-5,5]. Division requires the denominator interval to exclude zero.</p></html>"));
end ArithmeticView;
