within FluidSystemComponents.InteractiveSimulation.Examples.Temp;

model temp
  parameter Real par1=1;
equation

annotation(
    defaultComponentName = "tempComp",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}));
end temp;
