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
    Icon(coordinateSystem(extent = {{-100, -80}, {100, 40}}), graphics = {Rectangle(origin = {0, -60}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 20}, {100, -20}}), Text(origin = {0, -61}, extent = {{-100, 15}, {100, -15}}, textString = DynamicSelect("0.0", String(u, 6, 0, true)))}),
    defaultComponentName = "disp");


end DispValAndColor01;
