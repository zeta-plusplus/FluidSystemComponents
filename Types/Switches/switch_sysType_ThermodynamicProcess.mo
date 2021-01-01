within FluidSystemComponents.Types.Switches;

type switch_sysType_ThermodynamicProcess = enumeration
(
  openSystem "use enthalpy in state change calc",
  closedSystem "use internal energy in state change calc."
)
annotation (Documentation(info=
"<html>

</html>"));
