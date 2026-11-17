within UncertaintyLibrary.Perturbations;
block CalibrationBound "Selected relative gain and bias errors with box bounds"
parameter Boolean useCoordinateInput=false "Use the external signed coordinate instead of xi";
  parameter Real xi(min=-1,max=1)=0 "Fixed signed coordinate in [-1,1]";
  Modelica.Blocks.Interfaces.RealInput coordinate if useCoordinateInput  "External signed coordinate in [-1,1]" annotation(Placement(transformation(origin={-100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,70},extent={{-10,-10},{10,10}})));
  parameter UncertaintyLibrary.Sets.Interval gainRange=UncertaintyLibrary.Sets.Interval(-0.02,0.02) "Dimensionless relative gain-error interval";
  parameter UncertaintyLibrary.Sets.Interval biasRange=UncertaintyLibrary.Sets.Interval(-0.2,0.2) "Additive-bias interval in the unit of u";
  parameter Real xiBias(min=-1,max=1)=0 "Fixed signed bias coordinate when coordinates are not shared";
  parameter Boolean shareCoordinate=false "Use the gain coordinate for the selected bias as well";
    Modelica.Blocks.Interfaces.RealInput u  "Unperturbed signed input" annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput y  "Calibrated input with selected gain and bias errors" annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput gainError  "Selected dimensionless relative gain error" annotation(Placement(transformation(origin={100,35},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,35},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput bias  "Selected additive bias" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput lower  "Lower endpoint over all admitted gain and bias combinations" annotation(Placement(transformation(origin={100,-35},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-35},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput upper  "Upper endpoint over all admitted gain and bias combinations" annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));

protected
  Modelica.Blocks.Interfaces.RealInput x  "Selected internal signed coordinate" annotation(Placement(transformation(origin={-100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,-70},extent={{-10,-10},{10,10}})));

equation
  connect(coordinate,x);
  if not useCoordinateInput then x=xi; end if;

  gainError=UncertaintyLibrary.Sets.SelectPoint(gainRange,x);
  bias=UncertaintyLibrary.Sets.SelectPoint(biasRange,if shareCoordinate then x else xiBias);
  y=(1+gainError)*u+bias;
  lower=min((1+gainRange.lo)*u,(1+gainRange.hi)*u)+biasRange.lo;
  upper=max((1+gainRange.lo)*u,(1+gainRange.hi)*u)+biasRange.hi;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Polygon(points={{-60,27},{-60,-27},{-9,0},{-60,27}}, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-51,17},{-24,-17}}, textString="k", textColor={0,0,127}, fontSize=0),
        Line(points={{-8,0},{7,0}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Ellipse(extent={{9,-23},{55,23}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{14,18},{50,-18}}, textString="+", textColor={0,0,127}, fontSize=0),
        Line(points={{55,0},{68,0}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{-52,55},{52,55}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-52,43},{-52,67}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{52,43},{52,67}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Apply <code>y=(1+gainError)*u+bias</code>. The gain coordinate is xi or the enabled external coordinate. Bias uses xiBias unless shareCoordinate=true, in which case both errors use the same signed coordinate.</p><p>The reported lower and upper values always combine the complete gain and bias intervals independently. They remain box bounds when a shared coordinate couples the selected errors and can therefore be wider than that coupled trajectory.</p></html>"));
end CalibrationBound;
