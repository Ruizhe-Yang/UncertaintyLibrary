within UncertaintyLibrary.Sets;
function AbsoluteTolerance "Symmetric interval from an absolute tolerance"
  extends Modelica.Icons.Function;
input Real center "Nominal value in the application unit";
  input Real tol(min=0) "Nonnegative absolute tolerance";
  output UncertaintyLibrary.Sets.Interval bounds "Closed interval defined by the absolute tolerance";
algorithm
  assert(tol>=0,"Negative tolerance.");
  bounds:=UncertaintyLibrary.Sets.Interval(center-(tol),center+(tol));
  assert(UncertaintyLibrary.Utilities.Functions.Valid(bounds),"Invalid closed interval bounds.");
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-40.7,-10},{40.7,-10}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-40.7,-18.88},{-40.7,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{40.7,-18.88},{40.7,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Ellipse(extent={{-3.7,-13.7},{3.7,-6.3}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-48.1,23.3},{-5.92,3.32}}, textString="-d", textColor={108,88,49}, fontSize=0),
        Text(extent={{5.92,23.3},{48.1,3.32}}, textString="+d", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Return <code>[center-tol,center+tol]</code>. The tolerance must be nonnegative and use the same unit as the centre.</p><p>Call <code>AbsoluteTolerance(center,tol)</code>. The calculated endpoints are checked for finiteness and ordering.</p></html>"));
end AbsoluteTolerance;
