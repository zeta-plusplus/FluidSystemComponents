within FluidSystemComponents.Media.MixtureGas;

package Mixture_N2O2
  extends Modelica.Media.IdealGases.Common.MixtureGasNasa(mediumName="Mixture_N2O2",
    data={Modelica.Media.IdealGases.Common.SingleGasesData.N2, Modelica.Media.IdealGases.Common.SingleGasesData.O2},
	fluidConstants={Modelica.Media.IdealGases.Common.FluidData.N2, Modelica.Media.IdealGases.Common.FluidData.O2},
	substanceNames={"Oxygen","Nitrogen"},
	reference_X= {0.768,0.232},
	X_default= {0.768, 0.232}
    );
  
end Mixture_N2O2;
