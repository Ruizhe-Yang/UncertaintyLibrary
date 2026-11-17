within UncertaintyLibrary.Sets;
function AffineMap "Affine image with endpoint reordering"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval a "Finite ordered input interval";
  input Real scale=1 "Fixed affine multiplier";
  input Real offset=0 "Fixed additive term in the output unit";
  output UncertaintyLibrary.Sets.Interval bounds "Ordered interval image of the affine relation";
protected
  Real left "Image of the lower input endpoint";
  Real right "Image of the upper input endpoint";
algorithm
  assert(UncertaintyLibrary.Utilities.Functions.Valid(a),"Invalid closed interval a.");
  left:=scale*a.lo+offset;
  right:=scale*a.hi+offset;
  bounds:=UncertaintyLibrary.Sets.Interval(min(left,right),max(left,right));
  assert(UncertaintyLibrary.Utilities.Functions.Valid(bounds),"Invalid closed interval bounds.");
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-41.44,8.5},{-5.18,8.5}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-41.44,-0.38},{-41.44,17.38}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-5.18,-0.38},{-5.18,17.38}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-0.74,8.5},{18.5,8.5},{18.5,-24.8}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{-12.58,-28.5},{42.18,-28.5}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-12.58,-37.38},{-12.58,-19.62}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{42.18,-37.38},{42.18,-19.62}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-45.14,40.32},{45.88,22.56}}, textString="a*x+b", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Evaluate <code>scale*x+offset</code> at both endpoints of a and sort the two results. Negative scale reverses endpoint order; zero scale gives a singleton at offset.</p><p>Call <code>AffineMap(a,scale,offset)</code> with dimensionally compatible coefficients. The input interval and resulting endpoints are checked for validity.</p></html>"));
end AffineMap;
