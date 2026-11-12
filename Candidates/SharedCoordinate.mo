within UncertaintyLibrary.Candidates;
function SharedCoordinate "Map one common coordinate or an explicit vector of coordinates"
  extends Modelica.Icons.Function;
input Real center[:];
  input Real scale[size(center,1)];
  input Real xi(min=-1,max=1)=0;
  input Boolean shared=true;
  input Real coordinates[size(center,1)]=fill(xi,size(center,1));
  output Real candidate[size(center,1)];
algorithm
  assert(xi>=-1 and xi<=1 and min(scale)>=0,"Invalid shared coordinate or scale.");
  for i in 1:size(center,1) loop
    assert(shared or (coordinates[i]>=-1 and coordinates[i]<=1),"Coordinate outside [-1,1].");
    candidate[i]:=center[i]+scale[i]*(if shared then xi else coordinates[i]);
  end for;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-18,79},{18,47}}, textString="f", textColor={108,88,49}, fontSize=0),
        Ellipse(extent={{-7.4,-17.4},{7.4,-2.6}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-44.4,-10},{-8.88,-10}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid, arrow={Arrow.None,Arrow.Filled}),
        Line(points={{7.4,-10},{22.2,-35.16}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{7.4,-10},{22.2,-10}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{7.4,-10},{22.2,15.16}}, color={108,88,49}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{25.16,-35.16},{46.62,-35.16}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{25.16,-44.04},{25.16,-26.28}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{46.62,-44.04},{46.62,-26.28}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{25.16,-10},{46.62,-10}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{25.16,-18.88},{25.16,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{46.62,-18.88},{46.62,-1.12}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{25.16,15.16},{46.62,15.16}}, color={108,88,49}, thickness=1.2, pattern=LinePattern.Solid),
        Line(points={{25.16,6.28},{25.16,24.04}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Line(points={{46.62,6.28},{46.62,24.04}}, color={108,88,49}, thickness=1, pattern=LinePattern.Solid),
        Text(extent={{-48.1,20.34},{-17.76,1.84}}, textString="xi", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Map one common coordinate or an explicit vector of coordinates.</p><p><b>Interfaces</b> input Real center[:]; input Real scale[size(center,1)]; input Real xi(min=-1,max=1)=0; input Boolean shared=true; input Real coordinates[size(center,1)]=fill(xi,size(center,1)); output Real candidate[size(center,1)]</p><p><b>Parameters</b> No tuning parameters; use the declared input contract.</p><p><b>Behavior</b> Map one common coordinate or an explicit vector of coordinates</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> candidate</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.CandidateGrids\">UncertaintyLibrary.Examples.CandidateGrids</a></p></html>"));
end SharedCoordinate;
