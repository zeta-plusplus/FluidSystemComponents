within FluidSystemComponents.InteractiveSimulation.Output;

model DispValAndColor00
  extends FluidSystemComponents.InteractiveSimulation.Output.DispColorGrad00;
  
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Integer significantDigits(min=1) = 6
    "";
  
  
equation

annotation(
    Icon(coordinateSystem(extent = {{-100, -40}, {100, 40}}), graphics = {Text(origin = {20, 0}, extent = {{-120, 22}, {120, -22}}, textString = DynamicSelect("0.0", String(u, 6, 0, true)))}),
    defaultComponentName = "disp");


end DispValAndColor00;
