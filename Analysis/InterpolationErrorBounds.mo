within UncertaintyLibrary.Analysis;
function InterpolationErrorBounds "Linear-interpolation error from a supplied curvature bound"
  input Real estimate "Linear interpolant at the selected fractional coordinate";
  input Real spacing = 1 "Positive distance between the two interpolation nodes";
  input Real fraction = 0.5 "Fractional coordinate from the first node to the second";
  input Real secondDerivativeBound = 1 "Absolute second-derivative bound over the whole interpolation interval";
  output UncertaintyLibrary.Sets.Interval response "Interpolation estimate expanded by the error radius";
protected
  Real radius "Nonnegative interpolation-error radius";
algorithm
  assert(spacing>0 and fraction>=0 and fraction<=1 and secondDerivativeBound>=0,"Invalid interpolation bound input.");
  radius := 0.5*secondDerivativeBound*spacing^2*fraction*(1-fraction);
  response := UncertaintyLibrary.Sets.Interval(estimate-radius,estimate+radius);
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(response),"Nonfinite interpolation envelope.");
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,29.22},{-45.14,-41.08},{46.62,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-39.22,-24.8},{40.7,11.46}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-40.7,-24.8},{-38.7619,-21.5973},{-36.8239,-18.5093},{-34.8858,-15.5352},{-32.9478,-12.6751},{-31.0097,-9.929},{-29.0716,-7.2968},{-27.1336,-4.7786},{-25.1955,-2.375},{-23.2575,-0.0855},{-21.3194,2.0901},{-19.3806,4.1518},{-17.4425,6.0987},{-15.5045,7.9317},{-13.5664,9.6514},{-11.6284,11.2558},{-9.6903,12.7469},{-7.7522,14.124},{-5.8142,15.3864},{-3.8761,16.5349},{-1.9381,17.5694},{0,18.49},{1.9381,19.2966},{3.8761,19.9885},{5.8142,20.5664},{7.7522,21.0304},{9.6903,21.3804},{11.6284,21.6158},{13.5664,21.7379},{15.5045,21.7453},{17.4425,21.6387},{19.3806,21.4182},{21.3194,21.0837},{23.2575,20.6345},{25.1955,20.0714},{27.1336,19.3943},{29.0716,18.6032},{31.0097,17.6982},{32.9478,16.6785},{34.8858,15.5448},{36.8239,14.2972},{38.7619,12.9356},{40.7,11.46}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{0.74,-6.67},{0.74,18.49}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-4.44,-6.67},{5.92,-6.67}}, color={108,88,49}, thickness=0.7, pattern=LinePattern.Solid),
        Line(points={{-4.44,18.49},{5.92,18.49}}, color={108,88,49}, thickness=0.7, pattern=LinePattern.Solid),
        Ellipse(extent={{-42.18,-27.76},{-36.26,-21.84}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{37.74,8.5},{43.66,14.42}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Expand estimate by the radius <code>0.5*secondDerivativeBound*spacing^2*fraction*(1-fraction)</code>. The coordinate fraction lies in [0,1], spacing is positive and the absolute second-derivative bound is nonnegative.</p><p>Supply the linear interpolant at that fraction and a curvature bound valid throughout the interpolation interval. The radius is zero at either node and largest at the midpoint. The function does not derive or verify the supplied curvature bound.</p></html>"));
end InterpolationErrorBounds;
