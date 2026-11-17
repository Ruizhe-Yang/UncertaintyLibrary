within UncertaintyLibrary.Sets;
function GasInventoryBounds "Ideal-gas mass bounds from pressure, volume and temperature"
  input UncertaintyLibrary.Sets.Interval pressure "Positive absolute-pressure interval in pascals";
  input UncertaintyLibrary.Sets.Interval volume "Positive volume interval in cubic metres";
  input UncertaintyLibrary.Sets.Interval temperature "Positive absolute-temperature interval in kelvin";
  input Real specificGasConstant(unit="J/(kg.K)") = 287.05 "Positive specific gas constant";
  output UncertaintyLibrary.Sets.Interval mass "Ideal-gas mass interval in kilograms";
protected
  UncertaintyLibrary.Sets.Interval pv "Interval product of absolute pressure and volume";
algorithm
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(pressure) and UncertaintyLibrary.Utilities.Internal.validInterval(volume) and UncertaintyLibrary.Utilities.Internal.validInterval(temperature) and min(pressure.lo,min(volume.lo,temperature.lo))>0
    and specificGasConstant>0,"Gas inventory requires positive absolute data.");
  pv := UncertaintyLibrary.Sets.Multiply(pressure,volume);
  mass := UncertaintyLibrary.Sets.Divide(pv,UncertaintyLibrary.Sets.Interval(specificGasConstant*temperature.lo,specificGasConstant*temperature.hi));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Rectangle(extent={{-20.72,-18.066},{20.72,23.374}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Ellipse(extent={{-20.72,17.158},{20.72,29.072}}, lineColor={64,64,64}, fillColor={245,245,245}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-22.94,13.68},{22.94,-7.78}}, textString="m0", textColor={0,0,127}, fontSize=0),
        Line(points={{-35.52,-41.82},{35.52,-41.82}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-35.52,-50.7},{-35.52,-32.94}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{35.52,-50.7},{35.52,-32.94}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Evaluate the ideal-gas relation <code>mass=pressure*volume/(specificGasConstant*temperature)</code> with interval multiplication and division. Absolute pressure, volume, absolute temperature and the gas constant must be strictly positive.</p><p>Use pascals, cubic metres, kelvin and J/(kg.K); the result is in kilograms. The input ranges admit all combinations. The function stores no fluid and imposes no initialisation equations on a vessel.</p></html>"));
end GasInventoryBounds;
