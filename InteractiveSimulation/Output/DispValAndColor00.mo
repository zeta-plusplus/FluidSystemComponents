within FluidSystemComponents.InteractiveSimulation.Output;

model DispValAndColor00
  extends FluidSystemComponents.InteractiveSimulation.Output.DispColorGrad00;
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Integer sigDigits(min=1) = 6
    "";
  
  
equation

annotation(
    Icon(coordinateSystem(extent = {{-100, -40}, {100, 40}}), graphics = {Text(origin = {0, -5}, extent = {{-100, 25}, {100, -25}}, textString = DynamicSelect("0.0", String(u, sigDigits, 0, true)))}),
    defaultComponentName = "disp");


end DispValAndColor00;
