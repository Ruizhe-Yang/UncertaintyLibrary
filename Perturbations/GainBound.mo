within UncertaintyLibrary.Perturbations;
block GainBound "Selected relative gain error with signed output bounds"
parameter Boolean useCoordinateInput=false "Use the external signed coordinate instead of xi";
  parameter Real xi(min=-1,max=1)=0 "Fixed signed coordinate in [-1,1]";
  Modelica.Blocks.Interfaces.RealInput coordinate if useCoordinateInput  "External signed coordinate in [-1,1]" annotation(Placement(transformation(origin={-100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,70},extent={{-10,-10},{10,10}})));
  parameter UncertaintyLibrary.Sets.Interval range=UncertaintyLibrary.Sets.Interval(-0.1,0.1) "Dimensionless relative gain-error interval";
  Modelica.Blocks.Interfaces.RealInput u  "Unperturbed signed input" annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));

    Modelica.Blocks.Interfaces.RealOutput y  "Input multiplied by one plus the selected gain error" annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput gainError  "Selected dimensionless relative gain error" annotation(Placement(transformation(origin={100,23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput lower  "Lower endpoint of the current signed gain product" annotation(Placement(transformation(origin={100,-23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput upper  "Upper endpoint of the current signed gain product" annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));

protected
  Modelica.Blocks.Interfaces.RealInput x  "Selected internal signed coordinate" annotation(Placement(transformation(origin={-100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,-70},extent={{-10,-10},{10,10}})));

equation
  connect(coordinate,x);
  if not useCoordinateInput then x=xi; end if;
  gainError=UncertaintyLibrary.Sets.SelectPoint(range,x);
  y=(1+gainError)*u;
  lower=min((1+range.lo)*u,(1+range.hi)*u);
  upper=max((1+range.lo)*u,(1+range.hi)*u);
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Polygon(points={{-37,34},{-37,-34},{38,0},{-37,34}}, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-24,20},{12,-20}}, textString="k", textColor={0,0,127}, fontSize=0),
        Line(points={{-64,0},{-37,0}}, color={0,0,127}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{38,0},{64,0}}, color={0,0,127}, thickness=0.9, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{-35,55},{35,55}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-35,43},{-35,67}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{35,43},{35,67}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Select gainError from range and apply <code>y=(1+gainError)*u</code>. The range describes a relative error, not the multiplier itself. Both endpoint products are evaluated and reordered for the current signed input.</p><p>Use xi or an enabled coordinate input in [-1,1]. The multiplier may change sign if the chosen error range permits it; the block imposes no positivity requirement on 1+gainError.</p></html>"));
end GainBound;
