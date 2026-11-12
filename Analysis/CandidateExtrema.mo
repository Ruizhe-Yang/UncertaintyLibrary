within UncertaintyLibrary.Analysis;
function CandidateExtrema "Find observed extrema and their first candidate indices"
  extends Modelica.Icons.Function;
input Real responses[:];
  input Boolean valid[size(responses,1)]=fill(true,size(responses,1));
  output Real minimum;
  output Real maximum;
  output Integer iMin;
  output Integer iMax;
  output Boolean available;
algorithm
  minimum:=0; maximum:=0; iMin:=0; iMax:=0; available:=false;
  for i in 1:size(responses,1) loop
    if valid[i] and abs(responses[i])<Modelica.Constants.inf then
      if not available or responses[i]<minimum then minimum:=responses[i]; iMin:=i; end if;
      if not available or responses[i]>maximum then maximum:=responses[i]; iMax:=i; end if;
      available:=true;
    end if;
  end for;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,29.22},{-45.14,-41.08},{46.62,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Ellipse(extent={{-40.33,-28.13},{-33.67,-21.47}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-21.83,7.39},{-15.17,14.05}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-3.33,-39.23},{3.33,-32.57}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{15.17,17.75},{21.83,24.41}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{33.67,-9.63},{40.33,-2.97}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-5.92,-41.82},{5.92,-29.98}}, lineColor={108,88,49}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=1),
        Ellipse(extent={{12.58,15.16},{24.42,27}}, lineColor={108,88,49}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=1),
        Line(points={{-41.44,21.08},{41.44,21.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Dash),
        Line(points={{-41.44,-35.9},{41.44,-35.9}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Dash),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Find observed extrema and their first candidate indices.</p><p><b>Interfaces</b> input Real responses[:]; input Boolean valid[size(responses,1)]=fill(true,size(responses,1)); output Real minimum; output Real maximum; output Integer iMin; output Integer iMax; output Boolean available</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Find observed extrema and their first candidate indices</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Only supplied candidate values are compared. Ties retain the earliest input row.</p><p><b>Observables</b> minimum, maximum, iMin, iMax, available</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.LocalSensitivity\">UncertaintyLibrary.Examples.LocalSensitivity</a></p></html>"));
end CandidateExtrema;
