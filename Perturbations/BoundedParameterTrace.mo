within UncertaintyLibrary.Perturbations;
block BoundedParameterTrace "Bounded signal driven by a deterministic unit coordinate"
  parameter UncertaintyLibrary.Sets.Interval bounds = UncertaintyLibrary.Sets.Interval(0.9,1.1) "Fixed finite ordered range of the output signal";
  Modelica.Blocks.Interfaces.RealInput fraction "Deterministic interpolation coordinate in [0,1]" annotation(Placement(transformation(extent={{-106,-6},{-94,6}}), iconTransformation(extent={{-106,-6},{-94,6}})));
  Modelica.Blocks.Interfaces.RealOutput value  "Interpolated value, or the midpoint when invalid" annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.BooleanOutput valid "True when the coordinate lies in [0,1]" annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
initial equation
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(bounds),"Invalid value range.");
equation
  valid = noEvent(fraction>=0 and fraction<=1);
  value = if valid then (1-fraction)*bounds.lo+fraction*bounds.hi else 0.5*(bounds.lo+bounds.hi);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-63,43},{63,43}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-63,-38},{63,-38}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-58,-25},{-31,26},{-10,9},{17,32},{42,-21},{60,0}}, color={0,0,127}, thickness=1.1, pattern=LinePattern.Solid),
        Text(extent={{-59,73},{59,48}}, textString="lo .. hi", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>For <code>fraction</code> in [0,1], interpolate linearly between the bounds: zero selects the lower endpoint and one the upper endpoint. The Boolean output valid reports membership in that coordinate range.</p><p>Outside [0,1], return the midpoint and set valid=false rather than clipping the coordinate. The validity comparison suppresses events with noEvent. The output is a time-varying signal; it does not change a Modelica parameter during simulation.</p></html>"));
end BoundedParameterTrace;
