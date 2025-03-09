within FluidSystemComponents.Compressible.Components;

model IdealGasVolumeColorP01
  extends Compressible.BaseClasses.IdealGasVolume_base01
  (
    heatTransfer(surfaceAreas={4*Modelica.Constants.pi*(3/4*V/Modelica.Constants.pi)^(2/3)})
  );
  extends FluidSystemComponents.CommonAnyFluid.BaseClasses.ClosedVolumeColorP01;
  

algorithm
  p:= medium.p;

equation
  
  
  annotation(
    defaultComponentName = "Vol",
  Icon(graphics = {Text(extent = {{-150, 12}, {150, -18}}, textString = "V=%V")})
    );
  
  
end IdealGasVolumeColorP01;
