within UncertaintyLibrary.Analysis;
function RadiativeExchangeBounds "Net radiative heat-flow interval between two temperature bands"
  input UncertaintyLibrary.Sets.Interval emitter "Positive emitter absolute-temperature interval in kelvin";
  input UncertaintyLibrary.Sets.Interval receiver "Positive receiver absolute-temperature interval in kelvin";
  input UncertaintyLibrary.Sets.Interval effectiveArea "Nonnegative area interval in square metres including grey-body factors";
  output UncertaintyLibrary.Sets.Interval heatFlow "Net heat-flow interval in watts, positive from emitter to receiver";
protected
  UncertaintyLibrary.Sets.Interval difference "Interval of emitter temperature to the fourth power minus receiver temperature to the fourth power";
  UncertaintyLibrary.Sets.Interval scaled "Temperature-power difference multiplied by effective area";
algorithm
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(emitter) and UncertaintyLibrary.Utilities.Internal.validInterval(receiver) and min(emitter.lo,receiver.lo)>0 and effectiveArea.lo>=0,
    "Radiation uses positive absolute temperatures and nonnegative area.");
  difference := UncertaintyLibrary.Sets.Interval(emitter.lo^4-receiver.hi^4,emitter.hi^4-receiver.lo^4);
  scaled := UncertaintyLibrary.Sets.Multiply(effectiveArea,difference);
  heatFlow := UncertaintyLibrary.Sets.Interval(Modelica.Constants.sigma*scaled.lo,Modelica.Constants.sigma*scaled.hi);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Rectangle(extent={{-42.92,-21.1},{-32.56,21.08}}, lineColor={191,0,0}, fillColor={191,0,0}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{32.56,-21.1},{42.92,21.08}}, lineColor={128,128,128}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-27.38,3.32},{-26.0761,5.2832},{-24.7722,7.0718},{-23.4684,8.5266},{-22.1645,9.5197},{-20.8606,9.9615},{-19.5575,9.8128},{-18.2536,9.0876},{-16.9497,7.8503},{-15.6458,6.2097},{-14.3419,4.3123},{-13.0381,2.3277},{-11.7342,0.4303},{-10.4303,-1.2103},{-9.1264,-2.4476},{-7.8225,-3.1728},{-6.5194,-3.3215},{-5.2155,-2.8797},{-3.9116,-1.8866},{-2.6078,-0.4318},{-1.3039,1.3568},{0,3.32},{1.3039,5.2832},{2.6078,7.0718},{3.9116,8.5266},{5.2155,9.5197},{6.5194,9.9615},{7.8225,9.8128},{9.1264,9.0876},{10.4303,7.8503},{11.7342,6.2097},{13.0381,4.3123},{14.3419,2.3277},{15.6458,0.4303},{16.9497,-1.2103},{18.2536,-2.4476},{19.5575,-3.1728},{20.8606,-3.3215},{22.1645,-2.8797},{23.4684,-1.8866},{24.7722,-0.4318},{26.0761,1.3568},{27.38,3.32}}, color={191,0,0}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{27.38,-12.22},{26.0761,-10.2568},{24.7722,-8.4682},{23.4684,-7.0134},{22.1645,-6.0203},{20.8606,-5.5785},{19.5575,-5.7272},{18.2536,-6.4524},{16.9497,-7.6897},{15.6458,-9.3303},{14.3419,-11.2277},{13.0381,-13.2123},{11.7342,-15.1097},{10.4303,-16.7503},{9.1264,-17.9876},{7.8225,-18.7128},{6.5194,-18.8615},{5.2155,-18.4197},{3.9116,-17.4266},{2.6078,-15.9718},{1.3039,-14.1832},{0,-12.22},{-1.3039,-10.2568},{-2.6078,-8.4682},{-3.9116,-7.0134},{-5.2155,-6.0203},{-6.5194,-5.5785},{-7.8225,-5.7272},{-9.1264,-6.4524},{-10.4303,-7.6897},{-11.7342,-9.3303},{-13.0381,-11.2277},{-14.3419,-13.2123},{-15.6458,-15.1097},{-16.9497,-16.7503},{-18.2536,-17.9876},{-19.5575,-18.7128},{-20.8606,-18.8615},{-22.1645,-18.4197},{-23.4684,-17.4266},{-24.7722,-15.9718},{-26.0761,-14.1832},{-27.38,-12.22}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{-33.3,-43.3},{33.3,-43.3}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-33.3,-52.18},{-33.3,-34.42}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{33.3,-52.18},{33.3,-34.42}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Evaluate the interval relation <code>sigma*effectiveArea*(emitter^4-receiver^4)</code>. Both temperature intervals are strictly positive in kelvin; effectiveArea is nonnegative and includes the applicable grey-body and geometric factors.</p><p>Positive heat flow is from emitter to receiver, while a hotter receiver can produce a negative interval. Temperature and area combinations are treated independently. The function provides a static relation, with no heat ports or thermal storage.</p></html>"));
end RadiativeExchangeBounds;
