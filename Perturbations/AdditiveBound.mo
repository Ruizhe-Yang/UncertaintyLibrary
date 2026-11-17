within UncertaintyLibrary.Perturbations;
block AdditiveBound "Selected additive error with pointwise output bounds"
parameter Boolean useCoordinateInput=false "Use the external signed coordinate instead of xi";
  parameter Real xi(min=-1,max=1)=0 "Fixed signed coordinate in [-1,1]";
  Modelica.Blocks.Interfaces.RealInput coordinate if useCoordinateInput  "External signed coordinate in [-1,1]" annotation(Placement(transformation(origin={-100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,70},extent={{-10,-10},{10,10}})));
  parameter UncertaintyLibrary.Sets.Interval range=UncertaintyLibrary.Sets.Interval(-0.1,0.1) "Additive-error interval in the same unit as u";
  Modelica.Blocks.Interfaces.RealInput u  "Unperturbed input" annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));

    Modelica.Blocks.Interfaces.RealOutput y  "Input plus the selected additive error" annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput delta  "Selected additive error" annotation(Placement(transformation(origin={100,23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput lower  "Current input plus the lower error endpoint" annotation(Placement(transformation(origin={100,-23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput upper  "Current input plus the upper error endpoint" annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));

protected
  Modelica.Blocks.Interfaces.RealInput x  "Selected internal signed coordinate" annotation(Placement(transformation(origin={-100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,-70},extent={{-10,-10},{10,10}})));

equation
  connect(coordinate,x);
  if not useCoordinateInput then x=xi; end if;
  delta=UncertaintyLibrary.Sets.SelectPoint(range,x);
  y=u+delta;
  lower=u+range.lo;
  upper=u+range.hi;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Ellipse(extent={{-24,-24},{24,24}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-20,20},{20,-20}}, textString="+", textColor={0,0,127}, fontSize=0),
        Line(points={{-64,0},{-26,0}}, color={0,0,127}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{24,0},{64,0}}, color={0,0,127}, thickness=0.9, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{-39,47},{39,47}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-39,35},{-39,59}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{39,35},{39,59}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{0,34},{0,26}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Select <code>delta</code> from range with a signed coordinate in [-1,1], then apply <code>y=u+delta</code>. The outputs lower and upper are u plus the two range endpoints at the current input value.</p><p>Use xi for a fixed selection or enable and connect coordinate. The error and input must use the same unit. The block introduces no random process or temporal error model.</p></html>"));
end AdditiveBound;
