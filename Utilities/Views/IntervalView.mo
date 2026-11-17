within UncertaintyLibrary.Utilities.Views;
block IntervalView "Display tolerance intervals and deterministic point selections"
parameter UncertaintyLibrary.Sets.Interval relativeRange=UncertaintyLibrary.Sets.RelativeTolerance(-10,0.1) "Default interval from relative tolerance about -10";
  parameter UncertaintyLibrary.Sets.Interval absoluteRange=UncertaintyLibrary.Sets.AbsoluteTolerance(2,0.1) "Default interval from absolute tolerance about 2";
  Modelica.Blocks.Interfaces.RealOutput relativeLo  "Lower endpoint of the relative interval" annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput relativeHi  "Upper endpoint of the relative interval" annotation(Placement(transformation(origin={100,35},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,35},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput absoluteLo  "Point selected at signed coordinate -1" annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput mid  "Point selected at signed coordinate zero" annotation(Placement(transformation(origin={100,-35},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-35},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput absoluteHi  "Point selected at signed coordinate 1" annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
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
    Documentation(info="<html><p>Expose the endpoints of a relative-tolerance interval and the lower, midpoint and upper selections of an absolute-tolerance interval.</p><p>The defaults give [-11,-9] around -10 and [1.9,2.1] around 2, with midpoint 2. The signed selection coordinates -1, 0 and 1 are deterministic positions, not probabilities.</p></html>"));
end IntervalView;
