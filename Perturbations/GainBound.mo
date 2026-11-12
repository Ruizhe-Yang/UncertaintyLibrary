within UncertaintyLibrary.Perturbations;
block GainBound "Apply a selected gain error with signed output bounds"
parameter Boolean useCoordinateInput=false;
  parameter Real xi(min=-1,max=1)=0;
  Modelica.Blocks.Interfaces.RealInput coordinate if useCoordinateInput annotation(Placement(transformation(origin={-100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,70},extent={{-10,-10},{10,10}})));
  parameter UncertaintyLibrary.Sets.Interval range=UncertaintyLibrary.Sets.Interval(-0.1,0.1);
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));

    Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput gainError annotation(Placement(transformation(origin={100,23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput lower annotation(Placement(transformation(origin={100,-23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput upper annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));

protected
  Modelica.Blocks.Interfaces.RealInput x annotation(Placement(transformation(origin={-100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,-70},extent={{-10,-10},{10,10}})));

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
    Documentation(info="<html><p><b>Purpose</b> Apply a selected gain error with signed output bounds.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealInput coordinate if useCoordinateInput; Modelica.Blocks.Interfaces.RealInput u; Modelica.Blocks.Interfaces.RealOutput y; Modelica.Blocks.Interfaces.RealOutput gainError; Modelica.Blocks.Interfaces.RealOutput lower; Modelica.Blocks.Interfaces.RealOutput upper</p><p><b>Parameters</b> parameter Boolean useCoordinateInput=false; parameter Real xi(min=-1,max=1)=0; parameter UncertaintyLibrary.Sets.Interval range=UncertaintyLibrary.Sets.Interval(-0.1,0.1)</p><p><b>Behavior</b> Apply a selected gain error with signed output bounds</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> The optional coordinate is a deterministic input. Bounds are ordered for both signs of the multiplier.</p><p><b>Observables</b> y, gainError, lower, upper</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.BoundedMeasurement\">UncertaintyLibrary.Examples.BoundedMeasurement</a></p></html>"));
end GainBound;
