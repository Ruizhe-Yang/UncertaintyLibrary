within UncertaintyLibrary.Perturbations;
function AccuracyEnvelope "Measurement interval from absolute and reading-relative allowances"
  input Real reading "Displayed measurement value";
  input Real absoluteError = 0.01 "Nonnegative allowance in the reading unit";
  input Real relativeError = 0.005 "Nonnegative fraction of the displayed magnitude";
  output UncertaintyLibrary.Sets.Interval compatible "Closed interval centred on the supplied reading";
protected
  Real radius "Sum of the absolute and reading-relative allowances";
algorithm
  assert(absoluteError>=0 and relativeError>=0,"Error allowances must be nonnegative.");
  radius := absoluteError+relativeError*abs(reading);
  compatible := UncertaintyLibrary.Sets.Interval(reading-radius,reading+radius);
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(compatible),"Invalid accuracy range.");
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-41.44,-10},{41.44,-10}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-41.44,-18.88},{-41.44,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{41.44,-18.88},{41.44,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Ellipse(extent={{-3.7,-13.7},{3.7,-6.3}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{0,0.36},{0,21.82}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid),
        Text(extent={{-49.58,-28.5},{49.58,-49.96}}, textString="abs + rel", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Form radius <code>absoluteError+relativeError*abs(reading)</code> and return reading plus or minus that radius. Both allowances must be nonnegative, with relativeError interpreted as a fraction of the displayed magnitude.</p><p>This is a deterministic specification band about the supplied reading. It neither defines a probability distribution nor inverts a relative-error relation defined against an unknown true value.</p></html>"));
end AccuracyEnvelope;
