within UncertaintyLibrary.Analysis;
function MonotonicityCheck "Classification of the supplied sample order"
  extends Modelica.Icons.Function;
input Real samples[:] "Finite response observations in the intended coordinate order";
  output UncertaintyLibrary.Utilities.Types.SampleOrder state "Order classification of the supplied sequence";
protected
  Boolean up "All checked consecutive entries are nondecreasing";
  Boolean down "All checked consecutive entries are nonincreasing";
algorithm

  up:=true; down:=true;
  for i in 2:size(samples,1) loop
    up:=up and samples[i]>=samples[i-1];
    down:=down and samples[i]<=samples[i-1];
  end for;
  state:=if size(samples,1)<2 then UncertaintyLibrary.Utilities.Types.SampleOrder.Undetermined
    elseif up and down then UncertaintyLibrary.Utilities.Types.SampleOrder.Constant elseif up then UncertaintyLibrary.Utilities.Types.SampleOrder.Nondecreasing
    elseif down then UncertaintyLibrary.Utilities.Types.SampleOrder.Nonincreasing else UncertaintyLibrary.Utilities.Types.SampleOrder.Nonmonotone;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Line(points={{-45.14,29.22},{-45.14,-41.08},{46.62,-41.08}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Ellipse(extent={{-40.7,-32.94},{-33.3,-25.54}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-18.5,-14.44},{-11.1,-7.04}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{3.7,-14.44},{11.1,-7.04}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{29.6,11.46},{37,18.86}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-37,-29.24},{-14.8,-10.74},{7.4,-10.74},{33.3,15.16}}, color={128,128,128}, thickness=0.7, pattern=LinePattern.Solid),
        Text(extent={{-39.96,47.72},{45.14,29.22}}, textString="order", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Compare consecutive entries without sorting. Return Constant for an equal sequence, Nondecreasing or Nonincreasing for the corresponding weak order, and Nonmonotone otherwise. Fewer than two entries gives Undetermined.</p><p>Supply finite observations in the intended coordinate order. Finiteness is not checked internally. The result describes only this sequence and does not prove monotonicity between samples.</p></html>"));
end MonotonicityCheck;
