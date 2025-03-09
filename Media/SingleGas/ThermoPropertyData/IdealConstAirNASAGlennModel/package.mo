within FluidSystemComponents.Media.SingleGas.ThermoPropertyData;

package IdealConstAirNASAGlennModel
  extends Modelica.Icons.Package;
  
  constant Modelica.Media.IdealGases.Common.DataRecord IdealConstAir(
    name="N2",
    MM=0.02897,
    Hf=0,
    H0=0,
    Tlimit=1000,
    alow={0, 0, 1004/287, 0, 0, 0,
        0},
    blow={0, 0},
    ahigh={0, 0, 1004/287, 0, 0, 0,
        0},
    bhigh={0, 0},
    R_s=287);
  
  
end IdealConstAirNASAGlennModel;
