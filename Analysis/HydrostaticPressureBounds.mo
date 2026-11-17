within UncertaintyLibrary.Analysis;
function HydrostaticPressureBounds "Hydrostatic pressure from surface, density and depth intervals"
  input UncertaintyLibrary.Sets.Interval surfacePressure "Positive absolute surface-pressure interval in pascals";
  input UncertaintyLibrary.Sets.Interval density "Nonnegative density interval in kilograms per cubic metre";
  input UncertaintyLibrary.Sets.Interval depth "Nonnegative downward depth interval in metres";
  input Modelica.Units.SI.Acceleration gravity = Modelica.Constants.g_n "Nonnegative gravitational acceleration";
  output UncertaintyLibrary.Sets.Interval pressure "Hydrostatic absolute-pressure interval in pascals";
protected
  UncertaintyLibrary.Sets.Interval term "Interval product of density and depth";
algorithm
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(surfacePressure) and surfacePressure.lo>0 and density.lo>=0 and depth.lo>=0 and gravity>=0,"Invalid hydrostatic domain.");
  term := UncertaintyLibrary.Sets.Multiply(density,depth);
  pressure := UncertaintyLibrary.Sets.Interval(surfacePressure.lo+gravity*term.lo,surfacePressure.hi+gravity*term.hi);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Rectangle(extent={{-35.668,-22.4764},{10.508,23.6996}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Ellipse(extent={{-35.668,16.7732},{10.508,30.0488}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-35.668,0.0344},{10.508,0.0344}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-30.34,-0.38},{8.88,-0.38}}, color={0,0,127}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{28.12,17.38},{28.12,-31.46}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.Filled,Arrow.Filled}),
        Text(extent={{31.08,3.32},{48.84,-14.44}}, textString="h", textColor={108,88,49}, fontSize=0),
        Line(points={{-35.52,-45.52},{35.52,-45.52}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-35.52,-54.4},{-35.52,-36.64}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{35.52,-54.4},{35.52,-36.64}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Evaluate the interval relation <code>surfacePressure+gravity*density*depth</code>. Depth is positive downwards, density and depth are nonnegative, and the surface-pressure interval is positive.</p><p>Use pascals, kilograms per cubic metre and metres with a finite nonnegative gravity in metres per second squared. The ranges describe independent combinations in a hydrostatic relation; no fluid dynamics or variation of density with depth is modelled.</p></html>"));
end HydrostaticPressureBounds;
