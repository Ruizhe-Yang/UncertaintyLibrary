within UncertaintyLibrary;
package Sets "Closed intervals, tolerance ranges and deterministic selections"
  extends Modelica.Icons.Package;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Line(points={{-54.28,0},{54.28,0}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-54.28,-11.04},{-54.28,11.04}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{54.28,-11.04},{54.28,11.04}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Ellipse(extent={{-58.88,-4.6},{-49.68,4.6}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{49.68,-4.6},{58.88,4.6}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5)
      }),
    Documentation(info="<html><p>Construct, combine and inspect finite closed intervals, or select deterministic points for state and parameter bindings. Asymmetric contains separate lower and upper tolerance constructors.</p><p>Arithmetic uses ordinary floating-point operations without outward rounding. Interval products describe all admitted combinations and do not retain shared-variable dependence. Use returned status flags where an operation can report an empty result.</p></html>"));
end Sets;
