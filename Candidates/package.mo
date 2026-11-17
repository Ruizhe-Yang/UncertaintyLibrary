within UncertaintyLibrary;
package Candidates "Deterministic grids, shared coordinates and row selection"
  extends Modelica.Icons.Package;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-44.16,-34.96},{44.16,34.96}}, lineColor={108,88,49}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-14.72,-34.96},{-14.72,34.96}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{14.72,-34.96},{14.72,34.96}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-44.16,-11.96},{44.16,-11.96}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-44.16,11.96},{44.16,11.96}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Ellipse(extent={{-46.644,-37.444},{-41.676,-32.476}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-46.644,-14.444},{-41.676,-9.476}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-46.644,9.476},{-41.676,14.444}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-46.644,32.476},{-41.676,37.444}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-17.204,-37.444},{-12.236,-32.476}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-17.204,-14.444},{-12.236,-9.476}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-17.204,9.476},{-12.236,14.444}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-17.204,32.476},{-12.236,37.444}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{12.236,-37.444},{17.204,-32.476}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{12.236,-14.444},{17.204,-9.476}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{12.236,9.476},{17.204,14.444}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{12.236,32.476},{17.204,37.444}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{41.676,-37.444},{46.644,-32.476}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{41.676,-14.444},{46.644,-9.476}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{41.676,9.476},{46.644,14.444}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{41.676,32.476},{46.644,37.444}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5)
      }), Documentation(info="<html><p>Construct finite interval grids, box corners and coupled coordinate selections, then select existing candidate rows. These operations define explicit parameter choices without sampling probabilities.</p><p>Keep row identities when associating responses with candidates. Review the documented interface limitation before using FilterCombinations.</p></html>"));
end Candidates;
