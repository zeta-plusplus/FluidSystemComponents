within FluidSystemComponents.InteractiveSimulation.Examples.System;

model terminateByCPUtimer_ex01
  extends Modelica.Icons.Example;
  InteractiveSimulation.System.terminateByCPUtimer terminateByCPUtimer(tTerminate = 5)  annotation(
    Placement(transformation(origin = {-32, 48}, extent = {{-10, -10}, {10, 10}})));
  InteractiveSimulation.System.getCPUclock CPUtime annotation(
    Placement(transformation(origin = {-62, 76}, extent = {{-10, -10}, {10, 10}})));
equation

annotation(
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 0.001));
end terminateByCPUtimer_ex01;
