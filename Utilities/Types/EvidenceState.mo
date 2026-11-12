within UncertaintyLibrary.Utilities.Types;
type EvidenceState = enumeration(COMPLETE "候选证据完整", UNDECIDED "候选数据缺失", INVALID "候选值无效", NOT_APPLICABLE "没有可行候选") "有限候选的数值证据状态"
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-85,-85},{85,85}}, lineColor={128,128,128}, fillColor={160,160,164}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=18),
        Text(extent={{-66,68},{-13,20}}, textString="E", textColor={255,255,255}, fontSize=0),
        Rectangle(extent={{-50,-59},{50,-8}}, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-37,-22},{37,-22}}, color={255,255,255}, thickness=0.7, pattern=LinePattern.Solid),
        Line(points={{-37,-43},{15,-43}}, color={255,255,255}, thickness=0.7, pattern=LinePattern.Solid)
      }),
    Documentation(info="<html>
<p>有限候选的数值证据状态</p>
</html>"));
