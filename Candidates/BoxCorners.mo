within UncertaintyLibrary.Candidates;
function BoxCorners "Box-corner enumeration with the final axis changing fastest"
  extends Modelica.Icons.Function;
input UncertaintyLibrary.Sets.Interval box[:] "Finite ordered interval for each coordinate";
  output Real corners[if size(box,1)<=10 then integer(2^size(box,1)) else 0,size(box,1)] "Corner rows, with the final coordinate changing fastest";
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
    Documentation(info="<html><p>Enumerate every lower/upper endpoint combination for one to ten finite ordered intervals. The result has 2^n rows and n columns, with the final coordinate changing fastest and the all-lower corner first.</p><p>A zero-width coordinate can produce duplicate rows; they are retained. Corners are deterministic candidates and do not by themselves bound a nonlinear response with possible interior extrema.</p></html>"));
end BoxCorners;
