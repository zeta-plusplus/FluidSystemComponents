within FluidSystemComponents.Media.CoolProp;

package Hydrogen ""
  extends ExternalMedia.Media.CoolPropMedium(
    mediumName = "Hydrogen",
    substanceNames = {"hydrogen"},
    ThermoStates = Modelica.Media.Interfaces.Choices.IndependentVariables.ph,
    SpecificEnthalpy(start=2e5)
    );
end Hydrogen;
