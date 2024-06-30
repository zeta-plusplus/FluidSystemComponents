within FluidSystemComponents.InteractiveSimulation.Examples.System;

model getCPUclock_ex01
  extends Modelica.Icons.Example;
  InteractiveSimulation.System.getCPUclock CPUtime annotation(
    Placement(transformation(origin = {-22, 56}, extent = {{-10, -10}, {10, 10}})));
equation

annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.001));
end getCPUclock_ex01;
