within UncertaintyLibrary.Sets;
function RelativeTolerance "Construct a symmetric interval from a finite center and a nonnegative tolerance"
  extends Modelica.Icons.Function;
input Real center;
  input Real relative(min=0);
  output UncertaintyLibrary.Sets.Interval bounds;
algorithm
  assert(relative>=0,"Negative tolerance.");
  bounds:=UncertaintyLibrary.Sets.Interval(center-(abs(center)*relative),center+(abs(center)*relative));
  assert(UncertaintyLibrary.Utilities.Functions.Valid(bounds),"Invalid closed interval bounds.");
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-40.7,-10},{40.7,-10}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-40.7,-18.88},{-40.7,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{40.7,-18.88},{40.7,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Ellipse(extent={{-3.7,-13.7},{3.7,-6.3}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-43.66,31.44},{43.66,9.24}}, textString="+/- %", textColor={108,88,49}, fontSize=0),
        Text(extent={{-25.16,-27.02},{25.16,-49.22}}, textString="|x|", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Construct a symmetric interval from a finite center and a nonnegative tolerance.</p><p><b>Interfaces</b> input Real center; input Real relative(min=0); output UncertaintyLibrary.Sets.Interval bounds</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Construct a symmetric interval from a finite center and a nonnegative tolerance</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> Public outputs and the stated input conditions.</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">UncertaintyLibrary.Examples.ToleranceAndSelection</a></p></html>"));
end RelativeTolerance;
