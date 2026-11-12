within UncertaintyLibrary.Perturbations;
block CalibrationBound "Apply independent or shared deterministic gain and bias coordinates"
parameter Boolean useCoordinateInput=false;
  parameter Real xi(min=-1,max=1)=0;
  Modelica.Blocks.Interfaces.RealInput coordinate if useCoordinateInput annotation(Placement(transformation(origin={-100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,70},extent={{-10,-10},{10,10}})));
  parameter UncertaintyLibrary.Sets.Interval gainRange=UncertaintyLibrary.Sets.Interval(-0.02,0.02);
  parameter UncertaintyLibrary.Sets.Interval biasRange=UncertaintyLibrary.Sets.Interval(-0.2,0.2);
  parameter Real xiBias(min=-1,max=1)=0;
  parameter Boolean shareCoordinate=false;
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput gainError annotation(Placement(transformation(origin={100,35},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,35},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput bias annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput lower annotation(Placement(transformation(origin={100,-35},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-35},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput upper annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));

protected
  Modelica.Blocks.Interfaces.RealInput x annotation(Placement(transformation(origin={-100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,-70},extent={{-10,-10},{10,10}})));

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
    Documentation(info="<html><p><b>Purpose</b> Apply independent or shared deterministic gain and bias coordinates.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealInput coordinate if useCoordinateInput; Modelica.Blocks.Interfaces.RealInput u; Modelica.Blocks.Interfaces.RealOutput y; Modelica.Blocks.Interfaces.RealOutput gainError; Modelica.Blocks.Interfaces.RealOutput bias; Modelica.Blocks.Interfaces.RealOutput lower; Modelica.Blocks.Interfaces.RealOutput upper</p><p><b>Parameters</b> parameter Boolean useCoordinateInput=false; parameter Real xi(min=-1,max=1)=0; parameter UncertaintyLibrary.Sets.Interval gainRange=UncertaintyLibrary.Sets.Interval(-0.02,0.02); parameter UncertaintyLibrary.Sets.Interval biasRange=UncertaintyLibrary.Sets.Interval(-0.2,0.2); parameter Real xiBias(min=-1,max=1)=0; parameter Boolean shareCoordinate=false</p><p><b>Behavior</b> Apply independent or shared deterministic gain and bias coordinates</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> y, gainError, bias, lower, upper</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.BoundedMeasurement\">UncertaintyLibrary.Examples.BoundedMeasurement</a></p></html>"));
end CalibrationBound;
