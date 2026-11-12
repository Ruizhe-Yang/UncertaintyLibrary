within UncertaintyLibrary.Utilities.Views;
block IntervalView "Show relative and absolute interval selections"
parameter UncertaintyLibrary.Sets.Interval relativeRange=UncertaintyLibrary.Sets.RelativeTolerance(-10,0.1);
  parameter UncertaintyLibrary.Sets.Interval absoluteRange=UncertaintyLibrary.Sets.AbsoluteTolerance(2,0.1);
  Modelica.Blocks.Interfaces.RealOutput relativeLo annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput relativeHi annotation(Placement(transformation(origin={100,35},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,35},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput absoluteLo annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput mid annotation(Placement(transformation(origin={100,-35},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-35},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput absoluteHi annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
equation
  relativeLo=relativeRange.lo;
  relativeHi=relativeRange.hi;
  absoluteLo=UncertaintyLibrary.Sets.SelectPoint(absoluteRange,-1);
  mid=UncertaintyLibrary.Sets.SelectPoint(absoluteRange,0);
  absoluteHi=UncertaintyLibrary.Sets.SelectPoint(absoluteRange,1);
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-72,-52},{72,66}}, lineColor={128,128,128}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-48,-65},{48,-65}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,-52},{0,-65}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-44.66,25.71},{44.66,25.71}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-44.66,16.47},{-44.66,34.95}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{44.66,16.47},{44.66,34.95}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-30.03,-7.4},{30.03,-7.4}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-30.03,-16.64},{-30.03,1.84}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{30.03,-16.64},{30.03,1.84}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Ellipse(extent={{-3.08,22.63},{3.08,28.79}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-3.08,-10.48},{3.08,-4.32}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Show relative and absolute interval selections.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealOutput relativeLo; Modelica.Blocks.Interfaces.RealOutput relativeHi; Modelica.Blocks.Interfaces.RealOutput absoluteLo; Modelica.Blocks.Interfaces.RealOutput mid; Modelica.Blocks.Interfaces.RealOutput absoluteHi</p><p><b>Parameters</b> parameter UncertaintyLibrary.Sets.Interval relativeRange=UncertaintyLibrary.Sets.RelativeTolerance(-10,0.1); parameter UncertaintyLibrary.Sets.Interval absoluteRange=UncertaintyLibrary.Sets.AbsoluteTolerance(2,0.1)</p><p><b>Behavior</b> Show relative and absolute interval selections</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> relativeLo, relativeHi, absoluteLo, mid, absoluteHi</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">UncertaintyLibrary.Examples.ToleranceAndSelection</a></p></html>"));
end IntervalView;
