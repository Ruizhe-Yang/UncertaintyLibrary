within UncertaintyLibrary.Perturbations;
function InvertCalibration "Calibration inverse with strictly positive gain bounds"
  input UncertaintyLibrary.Sets.Interval reading "Finite ordered instrument-reading interval";
  input UncertaintyLibrary.Sets.Interval gain "Strictly positive actual instrument-gain interval";
  input UncertaintyLibrary.Sets.Interval offset "Additive calibration-offset interval in the reading unit";
  output UncertaintyLibrary.Sets.Interval physical "Compatible physical-value interval from the inverse relation";
algorithm
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(reading) and UncertaintyLibrary.Utilities.Internal.validInterval(offset) and UncertaintyLibrary.Utilities.Internal.validInterval(gain) and gain.lo>0,"Calibration gain must be strictly positive.");
  physical := UncertaintyLibrary.Sets.Divide(UncertaintyLibrary.Sets.Interval(reading.lo-offset.hi,reading.hi-offset.lo),gain);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,29.22},{-45.14,-41.08},{46.62,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-38.48,-28.5},{31.08,19.6}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-33.3,8.5},{15.54,8.5},{15.54,-41.08}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Dash),
        Line(points={{-33.3,-31.46},{3.7,-31.46}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-33.3,-40.34},{-33.3,-22.58}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{3.7,-40.34},{3.7,-22.58}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-1.48,8.5},{-34.78,8.5}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>For <code>reading=gain*physical+offset</code>, return the interval quotient (reading-offset)/gain. Reading, offset and gain must be finite ordered intervals, and gain.lo must be strictly positive.</p><p>Choose units consistently with that calibration relation. Gain is the actual instrument gain, unlike the relative gain-error ranges used by GainBound and CalibrationBound. The calculation admits all combinations of the three input intervals.</p></html>"));
end InvertCalibration;
