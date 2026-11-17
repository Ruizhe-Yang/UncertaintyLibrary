within UncertaintyLibrary.UsersGuide;
class Conventions "Units, selection coordinates and availability flags"
  extends Modelica.Icons.Information;
  annotation(Documentation(info="<html><p>Interval endpoints carry the units chosen by the caller. Use ordered finite endpoints and read any availability, nonempty or validity flag returned by the selected operation before interpreting its numerical output.</p><p>SelectPoint uses a signed coordinate in [-1,1], with zero at the midpoint. BoundedParameterTrace instead uses fraction in [0,1]. MechanicalStateBox forwards its fractions values to SelectPoint, so those values follow the signed convention.</p><p>Preserve candidate row indices when applying masks. A finite-candidate extremum, a local sensitivity and a formula-specific interval range have different scopes; retain that scope when interpreting the result.</p></html>"));
end Conventions;
