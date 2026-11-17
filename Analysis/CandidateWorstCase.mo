within UncertaintyLibrary.Analysis;
block CandidateWorstCase "Worst current finite-candidate response with collection status"
  parameter Integer n(min=1) = 3 "Number of declared candidate rows";
  parameter Boolean largerIsWorse = true "Select the largest metric rather than the smallest";
  Modelica.Blocks.Interfaces.RealInput metrics[n] "Comparable current metric for each candidate row" annotation(Placement(transformation(extent={{-106,66},{-94,78}}), iconTransformation(extent={{-106,66},{-94,78}})));
  Modelica.Blocks.Interfaces.BooleanInput feasible[n] "Candidate-row feasibility from the supplied constraints" annotation(Placement(transformation(extent={{-106,18},{-94,30}}), iconTransformation(extent={{-106,18},{-94,30}})));
  Modelica.Blocks.Interfaces.BooleanInput valid[n] "True when the candidate observation is declared usable" annotation(Placement(transformation(extent={{-106,-30},{-94,-18}}), iconTransformation(extent={{-106,-30},{-94,-18}})));
  Modelica.Blocks.Interfaces.BooleanInput collectionComplete "External indication that the requested collection stage has ended" annotation(Placement(transformation(extent={{-106,-78},{-94,-66}}), iconTransformation(extent={{-106,-78},{-94,-66}})));
  Modelica.Blocks.Interfaces.IntegerOutput selectedIndex "First selected one-based row, or zero when none is usable" annotation(Placement(transformation(extent={{94,66},{106,78}}), iconTransformation(extent={{94,66},{106,78}})));
  Modelica.Blocks.Interfaces.IntegerOutput feasibleCount  "Number of rows marked feasible" annotation(Placement(transformation(extent={{94,18},{106,30}}), iconTransformation(extent={{94,18},{106,30}})));
  Modelica.Blocks.Interfaces.IntegerOutput observedCount  "Number of feasible rows with valid finite observations" annotation(Placement(transformation(extent={{94,-30},{106,-18}}), iconTransformation(extent={{94,-30},{106,-18}})));
  Modelica.Blocks.Interfaces.RealOutput worstObserved  "Selected current metric, or zero when none is usable" annotation(Placement(transformation(extent={{94,-78},{106,-66}}), iconTransformation(extent={{94,-78},{106,-66}})));
  output UncertaintyLibrary.Utilities.Types.EvidenceState state "Completeness and validity of the declared feasible collection";
protected
  Boolean bad "A feasible observation marked valid is non-finite";
algorithm
  selectedIndex := 0;
  feasibleCount := 0;
  observedCount := 0;
  worstObserved := 0;
  bad := false;
  for i in 1:n loop
    if feasible[i] then
      feasibleCount := feasibleCount+1;
      if valid[i] then
        if noEvent(abs(metrics[i]) < Modelica.Constants.inf) then
          observedCount := observedCount+1;
          if selectedIndex==0 or (if largerIsWorse then metrics[i]>worstObserved else metrics[i]<worstObserved) then
            worstObserved := metrics[i];
            selectedIndex := i;
          end if;
        else
          bad := true;
        end if;
      end if;
    end if;
  end for;
  state := if feasibleCount==0 then UncertaintyLibrary.Utilities.Types.EvidenceState.NOT_APPLICABLE elseif bad then UncertaintyLibrary.Utilities.Types.EvidenceState.INVALID
    elseif not collectionComplete or observedCount<feasibleCount then UncertaintyLibrary.Utilities.Types.EvidenceState.UNDECIDED else UncertaintyLibrary.Utilities.Types.EvidenceState.COMPLETE;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(extent={{-90,-85},{90,85}}, lineColor={64,64,64}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-60,-45},{62,-45}}, color={128,128,128}, thickness=0.5, pattern=LinePattern.Solid),
        Rectangle(extent={{-53,-45},{-36,-10}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{-23,-45},{-6,42}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{7,-45},{24,13}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Rectangle(extent={{37,-45},{54,25}}, lineColor={108,88,49}, fillColor={255,215,136}, fillPattern=FillPattern.Solid, pattern=LinePattern.Solid, lineThickness=0.5, radius=0),
        Line(points={{-26,51},{-3,51}}, color={108,88,49}, thickness=1.4, pattern=LinePattern.Solid),
        Text(extent={{-60,76},{65,52}}, textString="worst", textColor={108,88,49}, fontSize=0),
        Text(extent={{-150,155},{150,125}}, textString="%name", textColor={0,0,255}, fontSize=0)
      }),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html><p>Select the largest or smallest finite metric among feasible candidates marked valid. Equal values retain the first row. feasibleCount includes all feasible rows; observedCount includes only their valid finite observations. With none usable, selectedIndex and worstObserved are zero.</p><p>The state is NOT_APPLICABLE for no feasible rows, INVALID when a feasible row marked valid has a non-finite metric, UNDECIDED while collection is incomplete or a feasible observation is missing, and COMPLETE otherwise. Inputs are evaluated currently; the block stores no past extrema. COMPLETE describes the declared finite collection, not coverage of a continuous domain.</p></html>"));
end CandidateWorstCase;
