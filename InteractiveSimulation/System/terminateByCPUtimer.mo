within FluidSystemComponents.InteractiveSimulation.System;

block terminateByCPUtimer
  import units = Modelica.Units.SI;
  parameter units.Time tTerminate = 10000;
  parameter Integer sigDigits = 4;
  FluidSystemComponents.InteractiveSimulation.System.getCPUclock CPUtime annotation(
    Placement(transformation(origin = {-38, 50}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.InteractiveSimulation.System.terminateWhenTriggered TerminateWhenTriggered annotation(
    Placement(transformation(origin = {34, 50}, extent = {{-10, -10}, {10, 10}})));
algorithm
  if (tTerminate <= CPUtime.y_CPUtime) then
    TerminateWhenTriggered.u_trigger := true;
  else
    TerminateWhenTriggered.u_trigger := false;
  end if;
  annotation(
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {1, 49}, extent = {{-93, 33}, {93, -33}}, textString = "terminate 
by CPU timer"), Text(origin = {0, -51}, extent = {{-80, 13}, {80, -13}}, textString = DynamicSelect("0.0", String(CPUtime.y_CPUtime, sigDigits, 0, true))), Text(origin = {65, -70}, extent = {{-19, 10}, {19, -10}}, textString = "[s]"), Text(origin = {-60, -22}, extent = {{-26, 12}, {26, -12}}, textString = "current:")}));
end terminateByCPUtimer;
