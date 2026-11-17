within UncertaintyLibrary.Sets;
record Interval "Closed interval endpoints with application-defined units"
  extends Modelica.Icons.Record;
Real lo=0 "Inclusive lower endpoint in the application unit";
Real hi=0 "Inclusive upper endpoint in the application unit";
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-100,48},{100,48}}, color={108,88,49}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-45.76,-5},{45.76,-5}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{-45.76,-15.56},{-45.76,5.56}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{45.76,-15.56},{45.76,5.56}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-54.56,-22.6},{-10.56,-47.24}}, textString="lo", textColor={108,88,49}, fontSize=0),
        Text(extent={{10.56,-22.6},{54.56,-47.24}}, textString="hi", textColor={108,88,49}, fontSize=0),
        Text(extent={{-70,80},{70,52}}, textString="[lo, hi]", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p>Store inclusive endpoints <code>lo</code> and <code>hi</code>. Equal endpoints describe a singleton. The record stores data only; its constructor does not enforce ordering or finiteness.</p><p>Use <code>Utilities.Functions.Valid</code> to check an interval before a calculation that requires finite ordered endpoints. Assign the same physical unit to both endpoints through the application; the record carries no probability or empty-set marker.</p></html>"));
end Interval;
