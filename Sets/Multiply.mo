within UncertaintyLibrary.Sets;
function Multiply "Range of the four endpoint products"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval a;
  input UncertaintyLibrary.Sets.Interval b;
  output UncertaintyLibrary.Sets.Interval bounds;
protected
  Real products[4];
algorithm
  assert(UncertaintyLibrary.Utilities.Functions.Valid(a),"Invalid closed interval a.");
  assert(UncertaintyLibrary.Utilities.Functions.Valid(b),"Invalid closed interval b.");
  products:={a.lo*b.lo,a.lo*b.hi,a.hi*b.lo,a.hi*b.hi};
  bounds:=UncertaintyLibrary.Sets.Interval(min(products),max(products));
  assert(UncertaintyLibrary.Utilities.Functions.Valid(bounds),"Invalid closed interval bounds.");
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-40.7,9.98},{40.7,9.98}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-40.7,1.1},{-40.7,18.86}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{40.7,1.1},{40.7,18.86}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-40.7,-29.98},{40.7,-29.98}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-40.7,-38.86},{-40.7,-21.1}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{40.7,-38.86},{40.7,-21.1}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-7.4,-17.4},{7.4,-2.6}}, color={108,88,49}, thickness=1.3, pattern=LinePattern.Solid),
        Line(points={{-7.4,-2.6},{7.4,-17.4}}, color={108,88,49}, thickness=1.3, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Range of the four endpoint products.</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval a; input UncertaintyLibrary.Sets.Interval b; output UncertaintyLibrary.Sets.Interval bounds</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Range of the four endpoint products</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> Public outputs and the stated input conditions.</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">UncertaintyLibrary.Examples.ToleranceAndSelection</a></p></html>"));
end Multiply;
