within UncertaintyLibrary.Sets;
function ThermalInitialEnergy "Thermal energy bounds relative to a reference temperature"
  input UncertaintyLibrary.Sets.Interval capacity "Nonnegative thermal-capacity interval in joules per kelvin";
  input UncertaintyLibrary.Sets.Interval temperature "Positive initial-temperature interval in kelvin";
  input Modelica.Units.SI.Temperature referenceTemperature = 293.15 "Positive absolute reference temperature";
  output UncertaintyLibrary.Sets.Interval energy "Relative thermal-energy interval in joules";
algorithm
  assert(capacity.lo>=0 and temperature.lo>0 and referenceTemperature>0 and UncertaintyLibrary.Utilities.Internal.validInterval(temperature),"Invalid initial thermal conditions.");
  energy := UncertaintyLibrary.Sets.Multiply(capacity,UncertaintyLibrary.Sets.Interval(temperature.lo-referenceTemperature,temperature.hi-referenceTemperature));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Rectangle(extent={{-20.128,-12.96},{-9.472,25.52}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=4.144),
        Ellipse(extent={{-27.232,-28.944},{-2.368,-5.264}}, lineColor={64,64,64}, fillColor={191,0,0}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-14.8,-14.144},{-14.8,17.232}}, color={191,0,0}, thickness=1.6, pattern=LinePattern.Solid),
        Text(extent={{5.18,17.38},{43.66,-4.82}}, textString="E0", textColor={108,88,49}, fontSize=0),
        Line(points={{-35.52,-45.52},{35.52,-45.52}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-35.52,-54.4},{-35.52,-36.64}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{35.52,-54.4},{35.52,-36.64}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Evaluate <code>capacity*(temperature-referenceTemperature)</code> with interval multiplication. Capacity must be nonnegative, and both absolute temperature and its reference must be positive.</p><p>Use capacity in J/K and temperatures in kelvin. The result is a relative energy in joules and can be negative below the reference temperature. Bind initial temperatures to the physical model separately.</p></html>"));
end ThermalInitialEnergy;
