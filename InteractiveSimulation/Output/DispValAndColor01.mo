within FluidSystemComponents.InteractiveSimulation.Output;

model DispValAndColor01
  extends FluidSystemComponents.InteractiveSimulation.Output.DispColorGrad00;
  
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Integer significantDigits(min=1) = 6
    "";
  
  
equation

annotation(
    Icon(coordinateSystem(extent = {{-100, -80}, {100, 40}}), graphics = {Text(origin = {0, -59}, extent = {{-100, 21}, {100, -21}}, textString = DynamicSelect("0.0", String(u, 6, 0, true)))}),
    defaultComponentName = "disp");


end DispValAndColor01;
