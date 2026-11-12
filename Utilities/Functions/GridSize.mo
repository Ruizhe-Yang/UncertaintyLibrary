within UncertaintyLibrary.Utilities.Functions;
function GridSize "Bounded Cartesian product size without overflow"
  extends Modelica.Icons.Function;
input Integer counts[:];
  output Integer n;
algorithm
  n:=1;
  for i in 1:size(counts,1) loop
    if counts[i]<1 then n:=0;
    elseif n>div(4096,counts[i]) then n:=0;
    else n:=n*counts[i]; end if;
  end for;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Text(extent={{-49.58,29.96},{49.58,1.1}}, textString="n1 * n2", textColor={108,88,49}, fontSize=0),
        Line(points={{-39.96,-11.48},{39.96,-11.48}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid),
        Text(extent={{-24.42,-19.62},{24.42,-52.92}}, textString="N", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Bounded Cartesian product size without overflow.</p><p><b>Interfaces</b> input Integer counts[:]; output Integer n</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Bounded Cartesian product size without overflow</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> n</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p></html>"));
end GridSize;
