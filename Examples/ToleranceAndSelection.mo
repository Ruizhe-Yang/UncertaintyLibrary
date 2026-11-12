within UncertaintyLibrary.Examples;
model ToleranceAndSelection "Evaluate endpoints and midpoint for two tolerance constructions"
  extends Modelica.Icons.Example;
  UncertaintyLibrary.Utilities.Views.IntervalView computed annotation(Placement(transformation(origin={-90,0},extent={{-23,-23},{23,23}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput relativeLo annotation(Placement(transformation(origin={155,76},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput relativeHi annotation(Placement(transformation(origin={155,38},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput absoluteLo annotation(Placement(transformation(origin={155,0},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput mid annotation(Placement(transformation(origin={155,-38},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput absoluteHi annotation(Placement(transformation(origin={155,-76},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(computed.relativeLo,relativeLo) annotation(Line(points={{-67,16.1},{47,16.1},{47,76},{155,76}},color={0,0,127}));
  connect(computed.relativeHi,relativeHi) annotation(Line(points={{-67,8.05},{47,8.05},{47,38},{155,38}},color={0,0,127}));
  connect(computed.absoluteLo,absoluteLo) annotation(Line(points={{-67,0},{155,0}},color={0,0,127}));
  connect(computed.mid,mid) annotation(Line(points={{-67,-8.05},{47,-8.05},{47,-38},{155,-38}},color={0,0,127}));
  connect(computed.absoluteHi,absoluteHi) annotation(Line(points={{-67,-16.1},{47,-16.1},{47,-76},{155,-76}},color={0,0,127}));
  annotation(experiment(StartTime=0,StopTime=1,Interval=0.002,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-360,-240},{360,240}},preserveAspectRatio=true),graphics={Text(extent={{-192,202},{8,188}},textString="Computed values",textColor={34,61,73})}),
    Documentation(info="<html><p><b>Purpose</b> Evaluate endpoints and midpoint for two tolerance constructions</p><p><b>Interfaces</b> Instances and connections are shown in the Diagram layer.</p><p><b>Parameters</b> Default values are shown in the component modifiers.</p><p><b>Behavior</b> The negative-center interval is [-11,-9]. The absolute interval supplies 1.9, 2 and 2.1 at coordinates -1, 0 and 1.</p><p><b>Initialization</b> All initial conditions are explicit in the source and component modifiers.</p><p><b>Activation and recovery</b> The given time windows follow the simulation time axis.</p><p><b>Limitations</b> This demonstration uses the declared inputs, initial conditions and idealized components.</p><p><b>Observables</b> relativeLo, relativeHi, absoluteLo, mid, absoluteHi</p></html>"));
end ToleranceAndSelection;
