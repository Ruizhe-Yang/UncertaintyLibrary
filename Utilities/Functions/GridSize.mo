within UncertaintyLibrary.Utilities.Functions;
function GridSize "Cartesian product cardinality capped at 4096 points"
  extends Modelica.Icons.Function;
input Integer counts[:] "Required point count along each axis";
  output Integer n "Product in 1 to 4096, or zero for an invalid or excessive size";
algorithm
  n:=1;
  for i in 1:size(counts,1) loop
    if counts[i]<1 then n:=0;
    elseif n>div(4096,counts[i]) then n:=0;
    else n:=n*counts[i]; end if;
  end for;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Text(extent={{-49.58,29.96},{49.58,1.1}}, textString="n1 * n2", textColor={108,88,49}, fontSize=0),
        Line(points={{-39.96,-11.48},{39.96,-11.48}}, color={128,128,128}, thickness=0.6, pattern=LinePattern.Solid),
        Text(extent={{-24.42,-19.62},{24.42,-52.92}}, textString="N", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Multiply the positive entries of <code>counts</code> while checking the product against 4096 before multiplication. Return zero if any count is less than one or the product would exceed that limit.</p><p>An empty vector returns the empty-product value one. This helper sizes candidate arrays; it does not generate points or validate interval bounds.</p></html>"));
end GridSize;
