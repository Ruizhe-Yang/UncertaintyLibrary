within UncertaintyLibrary.Sets;
function AffineMap "Map both endpoints with an affine function"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval a;
  input Real scale=1;
  input Real offset=0;
  output UncertaintyLibrary.Sets.Interval bounds;
protected
  Real left;
  Real right;
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
    Documentation(info="<html><p><b>Purpose</b> Map both endpoints with an affine function.</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval a; input Real scale=1; input Real offset=0; output UncertaintyLibrary.Sets.Interval bounds</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Map both endpoints with an affine function</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> Public outputs and the stated input conditions.</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">UncertaintyLibrary.Examples.ToleranceAndSelection</a></p></html>"));
end AffineMap;
