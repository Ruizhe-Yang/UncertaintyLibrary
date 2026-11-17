within UncertaintyLibrary.Utilities.Types;
type Sense = enumeration(Upper "Response must not exceed the upper limit", Lower "Response must not fall below the lower limit") "Orientation of an admissible response bound" annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-85,-85},{85,85}}, lineColor={128,128,128}, fillColor={160,160,164}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=18),
        Text(extent={{-66,68},{-13,20}}, textString="E", textColor={255,255,255}, fontSize=0),
        Line(points={{-50,-22},{50,-22}}, color={255,255,255}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{-23,-53},{-23,1}}, color={255,255,255}, thickness=0.9, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{23,1},{23,-53}}, color={255,255,255}, thickness=0.9, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled})
      }), Documentation(info="<html><p>Upper selects a requirement that the response does not exceed the limit. Lower selects a requirement that the response is not below the limit. SafetyMargin uses this orientation to return positive distance on the permitted side.</p></html>"));
