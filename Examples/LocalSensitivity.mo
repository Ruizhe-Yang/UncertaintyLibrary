within UncertaintyLibrary.Examples;
model LocalSensitivity "Evaluate central and normalised sensitivity of a squared response"
  extends Modelica.Icons.Example;
  UncertaintyLibrary.Utilities.Views.SensitivityView computed  "Central and normalised sensitivity calculation" annotation(Placement(transformation(origin={-90,0},extent={{-23,-23},{23,23}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput slope  "Central finite-difference slope" annotation(Placement(transformation(origin={155,38},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput normalized  "Normalised sensitivity at the nominal point" annotation(Placement(transformation(origin={155,0},extent={{-7,-7},{7,7}},rotation=0)));
  Modelica.Blocks.Interfaces.BooleanOutput available  "The normalisation denominator is usable" annotation(Placement(transformation(origin={155,-38},extent={{-7,-7},{7,7}},rotation=0)));
equation
  connect(computed.slope,slope) annotation(Line(points={{-67,16.1},{155,16.1},{155,38}},color={0,0,127}));
  connect(computed.normalized,normalized) annotation(Line(points={{-67,0},{155,0}},color={0,0,127}));
  connect(computed.available,available) annotation(Line(points={{-67,-16.1},{155,-16.1},{155,-38}},color={255,0,255}));
  annotation(experiment(StartTime=0,StopTime=1,Interval=0.002,Tolerance=1e-6),
    Diagram(coordinateSystem(extent={{-240,-160},{240,160}},preserveAspectRatio=true),graphics={Text(extent={{-192,137},{8,123}},textString="Computed values",textColor={34,61,73})}),
    Documentation(info="<html><p>Evaluate the central difference of p*p about p=2 with half-step 0.001. The slope is 4, and scaling by nominal parameter 2 and response 4 gives normalised sensitivity 2.</p><p>Plot slope, normalized and available. If the centre is changed in the view, keep responseNominal consistent with the intended nominal response. These quantities describe local sensitivity at the supplied evaluation point.</p></html>"));
end LocalSensitivity;
