within FluidSystemComponents.Compressible.Components;

model IdealGasVolumeColorP01
  extends Compressible.BaseClasses.IdealGasVolume_base01;
equation

  annotation(
    defaultComponentName = "Vol",
    Icon(graphics = {Ellipse(fillColor = {85, 85, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 100}, {100, -100}})}));
  
  
end IdealGasVolumeColorP01;
