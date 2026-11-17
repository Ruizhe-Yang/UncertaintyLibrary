within UncertaintyLibrary.Sets;
function MechanicalStateBox "Selected position and velocity from independent state intervals"
  input UncertaintyLibrary.Sets.Interval positionRange "Position interval in metres";
  input UncertaintyLibrary.Sets.Interval speedRange "Velocity interval in metres per second";
  input Real fractions[2] = {0.5,0.5} "Signed coordinates for position and velocity, each in [-1,1]";
  output Modelica.Units.SI.Position position "Selected position for an explicit initial-state binding";
  output Modelica.Units.SI.Velocity velocity "Selected velocity for an explicit initial-state binding";
algorithm
  position := UncertaintyLibrary.Sets.SelectPoint(positionRange,fractions[1]);
  velocity := UncertaintyLibrary.Sets.SelectPoint(speedRange,fractions[2]);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-46.62,29.22},{-46.62,-44.04},{45.88,-44.04}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Rectangle(extent={{-29.6,-27.02},{31.08,15.9}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Text(extent={{-45.88,46.24},{-11.84,29.22}}, textString="v0", textColor={108,88,49}, fontSize=0),
        Text(extent={{14.8,-47},{48.1,-61.8}}, textString="s0", textColor={108,88,49}, fontSize=0),
        Ellipse(extent={{2.22,-5.56},{11.1,3.32}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Select position and velocity by calling SelectPoint on their respective ranges. Although the input is named <code>fractions</code>, each entry is a signed coordinate in [-1,1].</p><p>Use {-1,-1} for both lower endpoints, {0,0} for both midpoints and {1,1} for both upper endpoints. The default {0.5,0.5} selects three quarters of the distance from each lower endpoint. Bind the returned values to the receiving model's initial states explicitly.</p></html>"));
end MechanicalStateBox;
