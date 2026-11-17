within UncertaintyLibrary.Analysis;
function MarginRange "Signed margin interval and its supplied-bound classification"
  input UncertaintyLibrary.Sets.Interval response "Finite ordered response interval";
  input Real limit = 1 "Requirement bound in the same unit as response";
  input Boolean upperLimit = true "Use an inclusive upper requirement rather than a lower requirement";
  output UncertaintyLibrary.Sets.Interval margin "Signed margin interval, with nonnegative values satisfying the requirement";
  output UncertaintyLibrary.Utilities.Types.MarginStatus status "Requirement classification over the supplied response interval";
algorithm
  assert(UncertaintyLibrary.Utilities.Internal.validInterval(response) and abs(limit)<Modelica.Constants.inf,"Invalid response or requirement.");
  margin := if upperLimit then UncertaintyLibrary.Sets.Interval(limit-response.hi,limit-response.lo)
    else UncertaintyLibrary.Sets.Interval(response.lo-limit,response.hi-limit);
  status := if margin.lo>=0 then UncertaintyLibrary.Utilities.Types.MarginStatus.GUARANTEED elseif margin.hi<0 then UncertaintyLibrary.Utilities.Types.MarginStatus.VIOLATED else UncertaintyLibrary.Utilities.Types.MarginStatus.UNRESOLVED;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-88,-88},{88,88}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{14.06,-42.56},{14.06,27}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Dash),
        Line(points={{-39.22,-17.4},{1.48,-17.4}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-39.22,-26.28},{-39.22,-8.52}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{1.48,-26.28},{1.48,-8.52}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{2.22,7.02},{13.32,7.02}}, color={75,138,73}, thickness=1.2, pattern=LinePattern.Solid, arrow={Arrow.Filled,Arrow.Filled}),
        Text(extent={{-2.96,38.1},{27.38,18.12}}, textString="m", textColor={75,138,73}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>For an upper requirement, return [limit-response.hi,limit-response.lo]; for a lower requirement, return [response.lo-limit,response.hi-limit]. Positive margins are favourable and zero satisfies the inclusive requirement.</p><p>The status is GUARANTEED when the whole supplied margin is nonnegative, VIOLATED when it is wholly negative, and UNRESOLVED otherwise. This classification applies to the input interval; it does not establish that the interval encloses an unsampled model response.</p></html>"));
end MarginRange;
