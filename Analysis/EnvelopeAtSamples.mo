within UncertaintyLibrary.Analysis;
function EnvelopeAtSamples "Compute a per-sample envelope on explicitly identical time grids"
  extends Modelica.Icons.Function;
input Real Y[:,:];
  input Real times[:];
  input Real grids[:,:];
  input Boolean validMask[:,:]=fill(true,size(Y,1),size(Y,2));
  output Real lower[size(Y,2)];
  output Real upper[size(Y,2)];
  output Integer nValid[size(Y,2)];
algorithm

  assert(size(times,1)==size(Y,2) and size(grids,1)==size(Y,1) and size(grids,2)==size(Y,2)
    and size(validMask,1)==size(Y,1) and size(validMask,2)==size(Y,2),"Envelope input shapes differ.");
  for j in 1:size(Y,2) loop
    assert(abs(times[j])<Modelica.Constants.inf,"The reference sample grid must be finite.");
  end for;
  for j in 2:size(Y,2) loop assert(times[j]>times[j-1],"Reference sample grid must increase."); end for;
  for j in 1:size(Y,2) loop
    nValid[j]:=0; lower[j]:=0; upper[j]:=0;
    for i in 1:size(Y,1) loop
      assert(grids[i,j]==times[j],"Sample grids differ.");
      if validMask[i,j] and abs(Y[i,j])<Modelica.Constants.inf then
        if nValid[j]==0 or Y[i,j]<lower[j] then lower[j]:=Y[i,j]; end if;
        if nValid[j]==0 or Y[i,j]>upper[j] then upper[j]:=Y[i,j]; end if;
        nValid[j]:=nValid[j]+1;
      end if;
    end for;
  end for;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,29.22},{-45.14,-41.08},{46.62,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-31.82,-27.76},{-31.82,12.94}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{-37,-27.76},{-26.64,-27.76}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{-37,12.94},{-26.64,12.94}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{0,-18.14},{0,23.3}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{-5.18,-18.14},{5.18,-18.14}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{-5.18,23.3},{5.18,23.3}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{31.82,-32.94},{31.82,5.54}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{26.64,-32.94},{37,-32.94}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{26.64,5.54},{37,5.54}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Ellipse(extent={{-34.41,-3.71},{-29.23,1.47}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-34.41,-14.07},{-29.23,-8.89}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-2.59,-5.19},{2.59,-0.01}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-2.59,10.35},{2.59,15.53}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{29.23,-18.51},{34.41,-13.33}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{29.23,-6.67},{34.41,-1.49}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Compute a per-sample envelope on explicitly identical time grids.</p><p><b>Interfaces</b> input Real Y[:,:]; input Real times[:]; input Real grids[:,:]; input Boolean validMask[:,:]=fill(true,size(Y,1),size(Y,2)); output Real lower[size(Y,2)]; output Real upper[size(Y,2)]; output Integer nValid[size(Y,2)]</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Compute a per-sample envelope on explicitly identical time grids</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> A sample with zero valid candidates is unavailable. This function performs no interpolation.</p><p><b>Observables</b> lower, upper, nValid</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.LocalSensitivity\">UncertaintyLibrary.Examples.LocalSensitivity</a></p></html>"));
end EnvelopeAtSamples;
