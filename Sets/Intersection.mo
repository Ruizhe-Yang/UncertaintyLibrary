within UncertaintyLibrary.Sets;
function Intersection "Closed-interval intersection with an explicit empty flag"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval a "First finite ordered interval";
  input UncertaintyLibrary.Sets.Interval b "Second finite ordered interval";
  output UncertaintyLibrary.Sets.Interval bounds "Intersection endpoints, or [0,0] when empty";
  output Boolean empty "True when the two closed intervals do not overlap";
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
    Documentation(info="<html><p>Return the overlapping interval and an <code>empty</code> flag. A shared endpoint is a nonempty singleton intersection.</p><p>Read both outputs from <code>Intersection(a,b)</code>. When empty=true, bounds is the placeholder [0,0]; that placeholder must not be interpreted as an actual intersection.</p></html>"));
end Intersection;
