within UncertaintyLibrary.Examples;
model BoundedMeasurement "Select additive and gain errors with a common coordinate"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant nominal(k=10)  "Constant nominal signal" annotation(Placement(transformation(origin={-155,63},extent={{-12,-12},{12,12}},rotation=0)));
  Modelica.Blocks.Sources.RealExpression coordinate(y=if time<1 then -1 elseif time<2 then 0 else 1)  "Shared signed selection coordinate" annotation(Placement(transformation(origin={-155,-64},extent={{-12,-12},{12,12}},rotation=0)));
  UncertaintyLibrary.Perturbations.AdditiveBound additive(useCoordinateInput=true,range=UncertaintyLibrary.Sets.Interval(-0.2,0.2))  "Selected additive-error model" annotation(Placement(transformation(origin={-5,65},extent={{-16,-16},{16,16}},rotation=0)));
  UncertaintyLibrary.Perturbations.GainBound gain(useCoordinateInput=true,range=UncertaintyLibrary.Sets.Interval(-0.02,0.02))  "Selected fractional gain-error model" annotation(Placement(transformation(origin={-5,-58},extent={{-16,-16},{16,16}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput additiveValue  "Nominal signal plus the selected additive error" annotation(Placement(transformation(origin={153,65},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput gainValue  "Nominal signal multiplied by the selected gain" annotation(Placement(transformation(origin={153,-58},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(nominal.y,additive.u) annotation(Line(points={{-141.8,63},{-81.4,63},{-81.4,65},{-21,65}},color={0,0,127}));
  connect(coordinate.y,additive.coordinate) annotation(Line(points={{-141.8,-64},{-81.4,-64},{-81.4,76.2},{-21,76.2}},color={0,0,127}));
  connect(additive.y,additiveValue) annotation(Line(points={{11,76.2},{153,76.2},{153,65}},color={0,0,127}));
  connect(nominal.y,gain.u) annotation(Line(points={{-141.8,63},{-81.4,63},{-81.4,-58},{-21,-58}},color={0,0,127}));
  connect(coordinate.y,gain.coordinate) annotation(Line(points={{-141.8,-64},{-81.4,-64},{-81.4,-46.8},{-21,-46.8}},color={0,0,127}));
  connect(gain.y,gainValue) annotation(Line(points={{11,-46.8},{153,-46.8},{153,-58}},color={0,0,127}));
  annotation(experiment(StartTime=0,StopTime=4,Interval=0.008,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true)),
    Documentation(info="<html><p>Apply additive error in [-0.2,0.2] and gain error in [-0.02,0.02] to a nominal input of 10. A shared coordinate selects the lower endpoint before 1 s, the midpoint over [1,2) s and the upper endpoint from 2 s.</p><p>Both selected outputs are 9.8, 10 and 10.2 in those intervals. Plot additiveValue and gainValue with each block's lower and upper bounds. The equality of the selected outputs follows from this positive nominal value and these particular error ranges.</p></html>"));
end BoundedMeasurement;
