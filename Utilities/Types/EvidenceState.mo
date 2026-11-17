within UncertaintyLibrary.Utilities.Types;
type EvidenceState = enumeration(COMPLETE "Collection ended and every feasible candidate has a usable observation", UNDECIDED "Collection incomplete or a feasible observation is missing", INVALID "A feasible candidate declared valid has a non-finite metric", NOT_APPLICABLE "No candidate is currently feasible") "Evidence state of the supplied finite candidate set"
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-85,-85},{85,85}}, lineColor={128,128,128}, fillColor={160,160,164}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=18),
        Text(extent={{-66,68},{-13,20}}, textString="E", textColor={255,255,255}, fontSize=0),
        Rectangle(extent={{-50,-59},{50,-8}}, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-37,-22},{37,-22}}, color={255,255,255}, thickness=0.7, pattern=LinePattern.Solid),
        Line(points={{-37,-43},{15,-43}}, color={255,255,255}, thickness=0.7, pattern=LinePattern.Solid)
      }),
    Documentation(info="<html><p>CandidateWorstCase reports COMPLETE when collection has ended and every feasible candidate has a usable observation. UNDECIDED covers incomplete collection or missing feasible observations. INVALID marks a non-finite metric on a feasible candidate declared valid. NOT_APPLICABLE means no candidate is currently feasible.</p><p>The state describes the supplied candidate data; it establishes no result for unsampled points.</p></html>"));
