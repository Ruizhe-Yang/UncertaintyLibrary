within UncertaintyLibrary.Sets;
function RelativeTolerance "Symmetric interval scaled by the nominal magnitude"
  extends Modelica.Icons.Function;
input Real center "Signed nominal value";
  input Real relative(min=0) "Nonnegative fraction of the nominal magnitude";
  output UncertaintyLibrary.Sets.Interval bounds "Closed interval defined by the relative tolerance";
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
    Documentation(info="<html><p>Return <code>center ± abs(center)*relative</code>. The nonnegative fraction is dimensionless, so negative centres retain correctly ordered endpoints.</p><p>Call <code>RelativeTolerance(center,relative)</code>. A zero centre gives the singleton [0,0], irrespective of the finite fraction; use an absolute allowance when a nonzero width is needed there.</p></html>"));
end RelativeTolerance;
