within FluidSystemComponents.InteractiveSimulation.System;

block terminateWhenTriggered
  Modelica.Blocks.Interfaces.BooleanInput u_trigger annotation(
    Placement(transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}})));

algorithm
  
  when(u_trigger==true)then
    terminate("terminate trigger is set true");
  end when;
  
  annotation(
    defaultComponentName = "TerminateWhenTriggered",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-1, 0}, extent = {{-93, 40}, {93, -40}}, textString = "Terminate
by trigger")}));
end terminateWhenTriggered;
