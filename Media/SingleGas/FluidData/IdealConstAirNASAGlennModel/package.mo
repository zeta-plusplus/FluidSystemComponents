within FluidSystemComponents.Media.SingleGas.FluidData;

package IdealConstAirNASAGlennModel
  extends Modelica.Icons.Package;
  
  constant Modelica.Media.Interfaces.Types.IdealGas.FluidConstants IdealConstAir(
                       chemicalFormula =        "IdealConstAir",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "7727-37-9",
                       meltingPoint =            63.15,
                       normalBoilingPoint =      77.35,
                       criticalTemperature =    126.20,
                       criticalPressure =        33.98e5,
                       criticalMolarVolume =     90.10e-6,
                       acentricFactor =           0.037,
                       dipoleMoment =             0.0,
                       molarMass =              Modelica.Media.IdealGases.Common.SingleGasesData.N2.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);
  
  
  
end IdealConstAirNASAGlennModel;
