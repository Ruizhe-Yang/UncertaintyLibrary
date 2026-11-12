within UncertaintyLibrary.Sets;
function Divide "Divide two intervals with a denominator separated from zero"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval a;
  input UncertaintyLibrary.Sets.Interval b;
  output UncertaintyLibrary.Sets.Interval bounds;
algorithm
  assert(UncertaintyLibrary.Utilities.Functions.Valid(a),"Invalid closed interval a.");
  assert(UncertaintyLibrary.Utilities.Functions.Valid(b),"Invalid closed interval b.");
  if b.lo>0 or b.hi<0 then
    bounds:=UncertaintyLibrary.Sets.Multiply(a,UncertaintyLibrary.Sets.Interval(1/b.hi,1/b.lo));
  else
    assert(false,"Denominator interval contains zero.");
    bounds:=UncertaintyLibrary.Sets.Interval(0,0);
  end if;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-40.7,8.5},{40.7,8.5}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-40.7,-0.38},{-40.7,17.38}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{40.7,-0.38},{40.7,17.38}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-40.7,-28.5},{40.7,-28.5}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-40.7,-37.38},{-40.7,-19.62}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{40.7,-37.38},{40.7,-19.62}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-8.88,-10},{8.88,-10}}, color={108,88,49}, thickness=1.3, pattern=LinePattern.Solid),
        Ellipse(extent={{-2.22,-4.82},{2.22,-0.38}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-2.22,-19.62},{2.22,-15.18}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Inline=false,
    Documentation(info="<html><p><b>Purpose</b> Divide two intervals with a denominator separated from zero.</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval a; input UncertaintyLibrary.Sets.Interval b; output UncertaintyLibrary.Sets.Interval bounds</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Divide two intervals with a denominator separated from zero</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> Public outputs and the stated input conditions.</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">UncertaintyLibrary.Examples.ToleranceAndSelection</a></p></html>"));
end Divide;
