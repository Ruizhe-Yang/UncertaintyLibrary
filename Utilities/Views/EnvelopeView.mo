within UncertaintyLibrary.Utilities.Views;
block EnvelopeView "Evaluate the three supplied responses at a common sample instant"
parameter Modelica.Units.SI.Time samplePeriod(min=0)=0.1;
    Modelica.Blocks.Interfaces.RealInput u[3] annotation(Placement(transformation(origin={-100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={-100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput lower(start=0,fixed=true) annotation(Placement(transformation(origin={100,70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,70},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput upper(start=0,fixed=true) annotation(Placement(transformation(origin={100,0},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,0},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.IntegerOutput nValid(start=0,fixed=true) annotation(Placement(transformation(origin={100,-70},extent={{-10,-10},{10,10}}),iconTransformation(origin={100,-70},extent={{-10,-10},{10,10}})));
initial equation
  assert(samplePeriod>0,"Sample period must be positive.");
equation
  when sample(0,samplePeriod) then
    lower=min(u);
    upper=max(u);
    nValid=size(u,1);
  end when;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-72,-52},{72,66}}, lineColor={128,128,128}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-48,-65},{48,-65}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{0,-52},{0,-65}}, color={128,128,128}, thickness=0.8, pattern=LinePattern.Solid),
        Line(points={{-46.97,48.81},{-46.97,-24.34},{48.51,-24.34}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Line(points={{-33.11,-10.48},{-33.11,31.87}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{-38.5,-10.48},{-27.72,-10.48}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{-38.5,31.87},{-27.72,31.87}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{0,-0.47},{0,42.65}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{-5.39,-0.47},{5.39,-0.47}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{-5.39,42.65},{5.39,42.65}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{33.11,-15.87},{33.11,24.17}}, color={108,88,49}, thickness=1.1, pattern=LinePattern.Solid),
        Line(points={{27.72,-15.87},{38.5,-15.87}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Line(points={{27.72,24.17},{38.5,24.17}}, color={108,88,49}, thickness=0.9, pattern=LinePattern.Solid),
        Ellipse(extent={{-35.805,14.545},{-30.415,19.935}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-35.805,3.765},{-30.415,9.155}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-2.695,13.005},{2.695,18.395}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{-2.695,29.175},{2.695,34.565}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{30.415,-0.855},{35.805,4.535}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Ellipse(extent={{30.415,11.465},{35.805,16.855}}, lineColor={108,88,49}, fillColor={108,88,49}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Documentation(info="<html><p><b>Purpose</b> Evaluate the three supplied responses at a common sample instant.</p><p><b>Interfaces</b> Modelica.Blocks.Interfaces.RealInput u[3]; Modelica.Blocks.Interfaces.RealOutput lower(start=0,fixed=true); Modelica.Blocks.Interfaces.RealOutput upper(start=0,fixed=true); Modelica.Blocks.Interfaces.IntegerOutput nValid(start=0,fixed=true)</p><p><b>Parameters</b> parameter Modelica.Units.SI.Time samplePeriod(min=0)=0.1</p><p><b>Behavior</b> Evaluate the three supplied responses at a common sample instant</p><p><b>Initialization</b> The declared start values and initialization equations apply.</p><p><b>Activation and recovery</b> Not applicable.</p><p><b>Limitations</b> Outputs retain the units declared at the interface. Numerical values depend on the supplied input and parameter range.</p><p><b>Observables</b> lower, upper, nValid</p><p><b>Set semantics</b> All intervals and candidates are deterministic. Bounds use ordinary floating-point arithmetic. No probability interpretation.</p><p><b>Example</b> <a href=\"modelica://UncertaintyLibrary.Examples.InitialConditionEnvelope\">UncertaintyLibrary.Examples.InitialConditionEnvelope</a></p></html>"));
end EnvelopeView;
