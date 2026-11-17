within UncertaintyLibrary.Examples;
model ToleranceAndSelection "Construct tolerance intervals and select their endpoints"
  extends Modelica.Icons.Example;
  UncertaintyLibrary.Utilities.Views.IntervalView computed  "Tolerance construction and interval selection" annotation(Placement(transformation(origin={-90,0},extent={{-23,-23},{23,23}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput relativeLo  "Lower relative-tolerance endpoint" annotation(Placement(transformation(origin={155,76},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput relativeHi  "Upper relative-tolerance endpoint" annotation(Placement(transformation(origin={155,38},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput absoluteLo  "Lower absolute-tolerance endpoint" annotation(Placement(transformation(origin={155,0},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput mid  "Midpoint of the absolute-tolerance interval" annotation(Placement(transformation(origin={155,-38},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput absoluteHi  "Upper absolute-tolerance endpoint" annotation(Placement(transformation(origin={155,-76},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(computed.relativeLo,relativeLo) annotation(Line(points={{-67,16.1},{47,16.1},{47,76},{155,76}},color={0,0,127}));
  connect(computed.relativeHi,relativeHi) annotation(Line(points={{-67,8.05},{47,8.05},{47,38},{155,38}},color={0,0,127}));
  connect(computed.absoluteLo,absoluteLo) annotation(Line(points={{-67,0},{155,0}},color={0,0,127}));
  connect(computed.mid,mid) annotation(Line(points={{-67,-8.05},{47,-8.05},{47,-38},{155,-38}},color={0,0,127}));
  connect(computed.absoluteHi,absoluteHi) annotation(Line(points={{-67,-16.1},{47,-16.1},{47,-76},{155,-76}},color={0,0,127}));
  annotation(experiment(StartTime=0,StopTime=1,Interval=0.002,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-360,-240},{360,240}},preserveAspectRatio=true),graphics={Text(extent={{-192,202},{8,188}},textString="Computed values",textColor={34,61,73})}),
    Documentation(info="<html><p>A relative tolerance of 0.1 about -10 gives [-11,-9], using the magnitude of the nominal value. An absolute tolerance of 0.1 about 2 gives [1.9,2.1].</p><p>The signed coordinates -1, 0 and 1 select the lower endpoint, midpoint and upper endpoint of the absolute interval. Inspect relativeLo, relativeHi, absoluteLo, mid and absoluteHi.</p></html>"));
end ToleranceAndSelection;
