within UncertaintyLibrary.Sets;
function Subtract "Subtract the compatible endpoint ranges"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval a;
  input UncertaintyLibrary.Sets.Interval b;
  output UncertaintyLibrary.Sets.Interval bounds;
algorithm
  assert(UncertaintyLibrary.Utilities.Functions.Valid(a),"Invalid closed interval a.");
  assert(UncertaintyLibrary.Utilities.Functions.Valid(b),"Invalid closed interval b.");
  bounds:=UncertaintyLibrary.Sets.Interval(a.lo-b.hi,a.hi-b.lo);
  assert(UncertaintyLibrary.Utilities.Functions.Valid(bounds),"Invalid closed interval bounds.");
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-40.7,11.46},{40.7,11.46}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-40.7,2.58},{-40.7,20.34}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{40.7,2.58},{40.7,20.34}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-40.7,-31.46},{40.7,-31.46}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-40.7,-40.34},{-40.7,-22.58}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{40.7,-40.34},{40.7,-22.58}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-16.28,5.54},{16.28,-25.54}}, textString="-", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Subtract the compatible endpoint ranges.</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval a; input UncertaintyLibrary.Sets.Interval b; output UncertaintyLibrary.Sets.Interval bounds</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Subtract the compatible endpoint ranges</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> Public outputs and the stated input conditions.</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">UncertaintyLibrary.Examples.ToleranceAndSelection</a></p></html>"));
end Subtract;
