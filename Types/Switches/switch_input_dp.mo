within FluidSystemComponents.Types.Switches;

type switch_input_dp = enumeration(
  use_Cd "flow coefficient", 
  use_zeta "pressure drop coefficient"
) 
annotation(
  Documentation(info = "<html>

</html>"));
