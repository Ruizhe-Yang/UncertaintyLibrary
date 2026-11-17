within UncertaintyLibrary.Utilities.Types;
type SampleOrder = enumeration(Nondecreasing "Each sample is at least its predecessor and the sequence is not constant", Nonincreasing "Each sample is at most its predecessor and the sequence is not constant", Constant "Every adjacent sample pair is equal", Nonmonotone "The sequence is neither nondecreasing nor nonincreasing", Undetermined "Too few samples to classify order") "Observed order of an explicit sample sequence" annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-85,-85},{85,85}}, lineColor={128,128,128}, fillColor={160,160,164}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=18),
        Text(extent={{-66,68},{-13,20}}, textString="E", textColor={255,255,255}, fontSize=0),
        Line(points={{-55,-31},{-14,-8}}, color={255,255,255}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{-55,-60},{-14,-60}}, color={255,255,255}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{9,-11},{52,-35}}, color={255,255,255}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{9,-60},{22,-41},{36,-60},{52,-48}}, color={255,255,255}, thickness=1, pattern=LinePattern.Solid)
      }), Documentation(info="<html><p>MonotonicityCheck classifies adjacent sample comparisons as nondecreasing, nonincreasing, constant or nonmonotone. Fewer than two samples give Undetermined.</p><p>The classification describes the supplied sequence and does not establish monotonicity between sample locations.</p></html>"));
