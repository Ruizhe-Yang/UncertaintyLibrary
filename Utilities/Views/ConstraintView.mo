within UncertaintyLibrary.Utilities.Views;
block ConstraintView "Show a finite feasible set and shared-coordinate endpoints"
parameter UncertaintyLibrary.Sets.Interval box[2]={UncertaintyLibrary.Sets.Interval(0,2),UncertaintyLibrary.Sets.Interval(0,2)};
  parameter Real candidateSet[9,2]=UncertaintyLibrary.Candidates.CartesianGrid(box,{3,3});
  parameter Real negative[2]=UncertaintyLibrary.Candidates.SharedCoordinate({2,5},{0.1,0.3},-1);
  parameter Real middle[2]=UncertaintyLibrary.Candidates.SharedCoordinate({2,5},{0.1,0.3},0);
  parameter Real positive[2]=UncertaintyLibrary.Candidates.SharedCoordinate({2,5},{0.1,0.3},1);
    Modelica.Blocks.Interfaces.IntegerOutput acceptedCount annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput sharedLower annotation(Placement(transformation(origin={100,23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput sharedMiddle annotation(Placement(transformation(origin={100,-23.33333},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-23.33333},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput sharedUpper annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
  Boolean mask[9];
  Integer indices[9];
  Boolean available;
equation
  (mask,indices,acceptedCount,available)=UncertaintyLibrary.Constraints.FilterCandidates(candidateSet,box,[1.0,1.0],{2.0});
  sharedLower=negative[2];
  sharedMiddle=middle[2];
  sharedUpper=positive[2];
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-72,-52},{72,66}}, lineColor={128,128,128}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-48,-65},{48,-65}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,-52},{0,-65}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Rectangle(extent={{-43.89,-25.11},{43.89,41.11}}, lineColor={128,128,128}, fillColor={255,255,255}, fillPattern=FillPattern.None, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Polygon(points={{-43.89,-25.11},{-43.89,41.11},{-27.72,41.11},{43.89,-18.18},{43.89,-25.11},{-43.89,-25.11}}, lineColor={128,128,128}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{-27.72,41.11},{43.89,-18.18}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Ellipse(extent={{-24.64,-6.63},{-16.94,1.07}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Line(points={{18.48,34.18},{27.72,24.94}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{18.48,24.94},{27.72,34.18}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Show a finite feasible set and shared-coordinate endpoints.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.IntegerOutput acceptedCount; Modelica.Blocks.Interfaces.RealOutput sharedLower; Modelica.Blocks.Interfaces.RealOutput sharedMiddle; Modelica.Blocks.Interfaces.RealOutput sharedUpper</p><p><b>Parameters</b> parameter UncertaintyLibrary.Sets.Interval box[2]={UncertaintyLibrary.Sets.Interval(0,2),UncertaintyLibrary.Sets.Interval(0,2)}; parameter Real candidateSet[9,2]=UncertaintyLibrary.Candidates.CartesianGrid(box,{3,3}); parameter Real negative[2]=UncertaintyLibrary.Candidates.SharedCoordinate({2,5},{0.1,0.3},-1); parameter Real middle[2]=UncertaintyLibrary.Candidates.SharedCoordinate({2,5},{0.1,0.3},0); parameter Real positive[2]=UncertaintyLibrary.Candidates.SharedCoordinate({2,5},{0.1,0.3},1)</p><p><b>Behavior</b> Show a finite feasible set and shared-coordinate endpoints</p><p><b>Initialization</b> Evaluated from the current inputs and parameter bindings.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> acceptedCount, sharedLower, sharedMiddle, sharedUpper</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.CoupledAndConstrainedCandidates\">UncertaintyLibrary.Examples.CoupledAndConstrainedCandidates</a></p></html>"));
end ConstraintView;
