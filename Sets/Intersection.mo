within UncertaintyLibrary.Sets;
function Intersection "Intersect two closed intervals and expose emptiness"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval a;
  input UncertaintyLibrary.Sets.Interval b;
  output UncertaintyLibrary.Sets.Interval bounds;
  output Boolean empty;
algorithm
  assert(UncertaintyLibrary.Utilities.Functions.Valid(a),"Invalid closed interval a.");
  assert(UncertaintyLibrary.Utilities.Functions.Valid(b),"Invalid closed interval b.");
  empty:=max(a.lo,b.lo)>min(a.hi,b.hi);
  bounds:=if empty then UncertaintyLibrary.Sets.Interval(0,0) else UncertaintyLibrary.Sets.Interval(max(a.lo,b.lo),min(a.hi,b.hi));
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-42.18,15.9},{13.32,15.9}}, color={128,128,128}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-42.18,7.02},{-42.18,24.78}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{13.32,7.02},{13.32,24.78}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-13.32,-10.74},{42.18,-10.74}}, color={128,128,128}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-13.32,-19.62},{-13.32,-1.86}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{42.18,-19.62},{42.18,-1.86}}, color={128,128,128}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-13.32,-41.82},{13.32,-41.82}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-13.32,-50.7},{-13.32,-32.94}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{13.32,-50.7},{13.32,-32.94}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-13.32,-20.36},{-13.32,-31.46}}, color={108,88,49}, thickness=0.6, pattern=LinePattern.Solid),
        Line(points={{13.32,6.28},{13.32,-31.46}}, color={108,88,49}, thickness=0.6, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Intersect two closed intervals and expose emptiness.</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval a; input UncertaintyLibrary.Sets.Interval b; output UncertaintyLibrary.Sets.Interval bounds; output Boolean empty</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Intersect two closed intervals and expose emptiness</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> When empty is true, bounds is a placeholder and has no set meaning.</p><p><b>Observables</b> empty</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">UncertaintyLibrary.Examples.ToleranceAndSelection</a></p></html>"));
end Intersection;
