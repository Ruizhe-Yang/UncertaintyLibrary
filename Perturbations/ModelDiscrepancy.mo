within UncertaintyLibrary.Perturbations;
block ModelDiscrepancy "Apply a bounded discrepancy coefficient to an explicit basis"
parameter Boolean useCoordinateInput=false;
  parameter Real xi(min=-1,max=1)=0;
  Modelica.Blocks.Interfaces.RealInput coordinate if useCoordinateInput annotation(Placement(transformation(origin={-100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,70},extent={{-10,-10},{10,10}})));
  parameter UncertaintyLibrary.Sets.Interval range=UncertaintyLibrary.Sets.Interval(-0.1,0.1);
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin={-100,23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput basis annotation(Placement(transformation(origin={-100,-23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,-23.33333},extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput delta annotation(Placement(transformation(origin={100,23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput lower annotation(Placement(transformation(origin={100,-23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput upper annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));

protected
  Modelica.Blocks.Interfaces.RealInput x annotation(Placement(transformation(origin={-100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,-70},extent={{-10,-10},{10,10}})));

equation
  connect(coordinate,x);
  if not useCoordinateInput then x=xi; end if;
  delta=UncertaintyLibrary.Sets.SelectPoint(range,x);
  y=u+basis*delta;
  lower=min(u+basis*range.lo,u+basis*range.hi);
  upper=max(u+basis*range.lo,u+basis*range.hi);
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-62,-20},{-27,-20}}, color={0,0,127}, thickness=0.9, pattern=LinePattern.Solid),
        Ellipse(extent={{-25,-43},{21,3}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-20,-2},{16,-39}}, textString="+", textColor={0,0,127}, fontSize=0),
        Line(points={{21,-20},{63,-20}}, color={0,0,127}, thickness=0.9, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Rectangle(extent={{-27,23},{29,57}}, lineColor={108,88,49}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Text(extent={{-24,52},{26,27}}, textString="b(x)", textColor={108,88,49}, fontSize=0),
        Line(points={{1,23},{1,4}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-29,73},{31,73}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-29,61},{-29,85}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{31,61},{31,85}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Apply a bounded discrepancy coefficient to an explicit basis.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealInput coordinate if useCoordinateInput; Modelica.Blocks.Interfaces.RealInput u; Modelica.Blocks.Interfaces.RealInput basis; Modelica.Blocks.Interfaces.RealOutput y; Modelica.Blocks.Interfaces.RealOutput delta; Modelica.Blocks.Interfaces.RealOutput lower; Modelica.Blocks.Interfaces.RealOutput upper</p><p><b>Parameters</b> parameter Boolean useCoordinateInput=false; parameter Real xi(min=-1,max=1)=0; parameter UncertaintyLibrary.Sets.Interval range=UncertaintyLibrary.Sets.Interval(-0.1,0.1)</p><p><b>Behavior</b> Apply a bounded discrepancy coefficient to an explicit basis</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> The optional coordinate is a deterministic input. Bounds are ordered for both signs of the multiplier.</p><p><b>Observables</b> y, delta, lower, upper</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.BoundedMeasurement\">UncertaintyLibrary.Examples.BoundedMeasurement</a></p></html>"));
end ModelDiscrepancy;
