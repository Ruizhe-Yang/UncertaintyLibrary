within UncertaintyLibrary.Sets;
function Hull "Smallest closed interval containing both inputs"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval a;
  input UncertaintyLibrary.Sets.Interval b;
  output UncertaintyLibrary.Sets.Interval bounds;
algorithm
  assert(UncertaintyLibrary.Utilities.Functions.Valid(a),"Invalid closed interval a.");
  assert(UncertaintyLibrary.Utilities.Functions.Valid(b),"Invalid closed interval b.");
  bounds:=UncertaintyLibrary.Sets.Interval(min(a.lo,b.lo),max(a.hi,b.hi));
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-42.18,15.9},{0,15.9}}, color={128,128,128}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-42.18,7.02},{-42.18,24.78}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{0,7.02},{0,24.78}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-4.44,-10.74},{42.18,-10.74}}, color={128,128,128}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-4.44,-19.62},{-4.44,-1.86}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{42.18,-19.62},{42.18,-1.86}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-42.18,-41.82},{42.18,-41.82}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-42.18,-50.7},{-42.18,-32.94}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{42.18,-50.7},{42.18,-32.94}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-42.18,6.28},{-42.18,-32.2}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Dash),
        Line(points={{42.18,-20.36},{42.18,-32.2}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Dash),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Smallest closed interval containing both inputs.</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval a; input UncertaintyLibrary.Sets.Interval b; output UncertaintyLibrary.Sets.Interval bounds</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Smallest closed interval containing both inputs</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> Public outputs and the stated input conditions.</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">UncertaintyLibrary.Examples.ToleranceAndSelection</a></p></html>"));
end Hull;
