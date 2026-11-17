within UncertaintyLibrary.Analysis;
function SafetyMargin "Signed requirement margin from observed extrema"
  extends Modelica.Icons.Function;
input Real worstMin "Smallest supplied response value";
  input Real worstMax "Largest supplied response value";
  input Real limit "Requirement bound in the response unit";
  input UncertaintyLibrary.Utilities.Types.Sense sense=UncertaintyLibrary.Utilities.Types.Sense.Upper "Upper or lower requirement orientation";
  output Real margin "Signed distance from the relevant extremum to the requirement bound";
algorithm
  assert(worstMin<=worstMax,"Unordered observed extrema.");
  margin:=if sense==UncertaintyLibrary.Utilities.Types.Sense.Upper then limit-worstMax else worstMin-limit;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,-26.28},{46.62,-26.28}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid),
        Line(points={{28.12,-42.56},{28.12,25.52}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Dash),
        Ellipse(extent={{-4.44,-30.72},{4.44,-21.84}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{0.74,0.36},{27.38,0.36}}, color={75,138,73}, thickness=1, pattern=LinePattern.Solid, arrow={Arrow.Filled,Arrow.Filled}),
        Text(extent={{0,35.14},{28.86,14.42}}, textString="m", textColor={75,138,73}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>For Sense.Upper, return limit-worstMax; for Sense.Lower, return worstMin-limit. A positive margin is favourable and zero lies on the requirement boundary. The supplied extrema must be ordered.</p><p>Supply finite extrema and a limit in the same unit. The result inherits the coverage of those extrema; an observed margin does not establish coverage of an unsampled domain.</p></html>"));
end SafetyMargin;
