within UncertaintyLibrary.Candidates;
function BoxCorners "Enumerate box corners with the final dimension changing fastest"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval box[:];
  output Real corners[if size(box,1)<=10 then integer(2^size(box,1)) else 0,size(box,1)];
algorithm
  assert(size(box,1)>=1 and size(box,1)<=10,"Corner enumeration supports 1 to 10 dimensions.");
  for j in 1:size(box,1) loop
    assert(UncertaintyLibrary.Utilities.Functions.Valid(box[j]),"Invalid box dimension.");
    for i in 1:size(corners,1) loop
      corners[i,j]:=if mod(div(i-1,integer(2^(size(box,1)-j))),2)==0 then box[j].lo else box[j].hi;
    end for;
  end for;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Rectangle(extent={{-35.52,-38.12},{35.52,18.12}}, lineColor={108,88,49}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Ellipse(extent={{-39.96,-42.56},{-31.08,-33.68}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-39.96,13.68},{-31.08,22.56}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{31.08,-42.56},{39.96,-33.68}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{31.08,13.68},{39.96,22.56}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Enumerate box corners with the final dimension changing fastest.</p><p><b>Interfaces</b> input UncertaintyLibrary.Sets.Interval box[:]; output Real corners[if size(box,1)&lt;=10 then integer(2^size(box,1)) else 0,size(box,1)]</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Enumerate box corners with the final dimension changing fastest</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> At most 1024 corners. A zero-width dimension may produce repeated equal rows.</p><p><b>Observables</b> corners</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.CandidateGrids\">UncertaintyLibrary.Examples.CandidateGrids</a></p></html>"));
end BoxCorners;
