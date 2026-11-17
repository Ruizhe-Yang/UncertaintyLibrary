within UncertaintyLibrary.Analysis;
function NormalizedSensitivity "Normalised local slope with a response-magnitude guard"
  extends Modelica.Icons.Function;
input Real parameterNominal "Nominal value of the perturbed parameter";
  input Real responseNominal "Response at the nominal parameter";
  input Real slope "Local response derivative per unit parameter";
  input Real floorMagnitude(min=0)=1e-12 "Positive minimum nominal response magnitude for normalisation";
  output Real value "Dimensionless normalised slope, or zero when unavailable";
  output Boolean available "Nominal response magnitude meets the denominator floor";
algorithm
  assert(floorMagnitude>0,"Sensitivity denominator floor must be positive.");
  available:=abs(responseNominal)>=floorMagnitude;
  value:=if available then (parameterNominal/responseNominal)*slope else 0;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,29.22},{-45.14,-41.08},{46.62,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-36.26,-26.28},{33.3,14.42}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Ellipse(extent={{-29.23,-23.69},{-22.57,-17.03}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{18.87,5.17},{25.53,11.83}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-37.74,46.24},{13.32,24.04}}, textString="S*", textColor={108,88,49}, fontSize=0),
        Text(extent={{-23.68,-48.48},{42.92,-65.5}}, textString="x0/y0", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Return <code>(parameterNominal/responseNominal)*slope</code> when the absolute nominal response is at least floorMagnitude. Otherwise return value=0 and available=false. The positive floor uses the response unit.</p><p>Supply finite nominal values and a local slope in response-unit per parameter-unit. The availability check concerns denominator magnitude only; it does not validate input finiteness or the quality of the slope estimate.</p></html>"));
end NormalizedSensitivity;
