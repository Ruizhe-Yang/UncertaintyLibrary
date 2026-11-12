within UncertaintyLibrary.Analysis;
function SafetyMargin "Signed distance from a worst observed value to a bound"
  extends Modelica.Icons.Function;
input Real worstMin;
  input Real worstMax;
  input Real limit;
  input UncertaintyLibrary.Utilities.Types.Sense sense=UncertaintyLibrary.Utilities.Types.Sense.Upper;
  output Real margin;
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
    Documentation(info="<html><p><b>Purpose</b> Signed distance from a worst observed value to a bound.</p><p><b>Interfaces</b> input Real worstMin; input Real worstMax; input Real limit; input UncertaintyLibrary.Utilities.Types.Sense sense=UncertaintyLibrary.Utilities.Types.Sense.Upper; output Real margin</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Signed distance from a worst observed value to a bound</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> margin</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.LocalSensitivity\">UncertaintyLibrary.Examples.LocalSensitivity</a></p></html>"));
end SafetyMargin;
