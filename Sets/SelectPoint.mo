within UncertaintyLibrary.Sets;
function SelectPoint "Select a deterministic point using a signed unit coordinate"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval a;
  input Real xi(min=-1,max=1);
  output Real value;
algorithm
  assert(UncertaintyLibrary.Utilities.Functions.Valid(a),"Invalid closed interval a.");
  assert(xi>=-1 and xi<=1,"Coordinate outside [-1,1].");
  value:=((1-xi)*0.5)*a.lo+((1+xi)*0.5)*a.hi;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-42.18,-10},{42.18,-10}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-42.18,-18.88},{-42.18,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{42.18,-18.88},{42.18,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Ellipse(extent={{7.03,-14.07},{15.17,-5.93}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{11.1,24.04},{11.1,0.36}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{-51.06,-26.28},{-25.16,-47}}, textString="-1", textColor={108,88,49}, fontSize=0),
        Text(extent={{-11.1,-26.28},{11.1,-47}}, textString="0", textColor={108,88,49}, fontSize=0),
        Text(extent={{25.16,-26.28},{51.06,-47}}, textString="+1", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Select a deterministic point using a signed unit coordinate.</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval a; input Real xi(min=-1,max=1); output Real value</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Select a deterministic point using a signed unit coordinate</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> value</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.ToleranceAndSelection\">UncertaintyLibrary.Examples.ToleranceAndSelection</a></p></html>"));
end SelectPoint;
