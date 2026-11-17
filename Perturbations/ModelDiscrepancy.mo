within UncertaintyLibrary.Perturbations;
block ModelDiscrepancy "Selected discrepancy coefficient applied to an explicit basis"
parameter Boolean useCoordinateInput=false "Use the external signed coordinate instead of xi";
  parameter Real xi(min=-1,max=1)=0 "Fixed signed coordinate in [-1,1]";
  Modelica.Blocks.Interfaces.RealInput coordinate if useCoordinateInput  "External signed coordinate in [-1,1]" annotation(Placement(transformation(origin={-100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,70},extent={{-10,-10},{10,10}})));
  parameter UncertaintyLibrary.Sets.Interval range=UncertaintyLibrary.Sets.Interval(-0.1,0.1) "Admissible discrepancy-coefficient interval";
  Modelica.Blocks.Interfaces.RealInput u  "Nominal model signal" annotation(Placement(transformation(origin={-100,23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput basis  "Explicit basis multiplied by the discrepancy coefficient" annotation(Placement(transformation(origin={-100,-23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,-23.33333},extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Interfaces.RealOutput y  "Nominal signal plus the selected discrepancy" annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput delta  "Selected discrepancy coefficient" annotation(Placement(transformation(origin={100,23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput lower  "Lower output value over the coefficient interval" annotation(Placement(transformation(origin={100,-23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput upper  "Upper output value over the coefficient interval" annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));

protected
  Modelica.Blocks.Interfaces.RealInput x  "Selected internal signed coordinate" annotation(Placement(transformation(origin={-100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,-70},extent={{-10,-10},{10,10}})));

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
    Documentation(info="<html><p>Select coefficient delta from range and apply <code>y=u+basis*delta</code>. Evaluate both coefficient endpoints and reorder their output values for the current signed basis.</p><p>Choose compatible units so basis times delta has the same unit as u. The basis is supplied by the application; the block does not identify a discrepancy model from data.</p></html>"));
end ModelDiscrepancy;
