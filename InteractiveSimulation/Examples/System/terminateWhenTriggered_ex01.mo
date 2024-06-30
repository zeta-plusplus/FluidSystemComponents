within FluidSystemComponents.InteractiveSimulation.Examples.System;

model terminateWhenTriggered_ex01
  extends Modelica.Icons.Example;
  InteractiveSimulation.System.terminateWhenTriggered TerminateWhenTriggered annotation(
    Placement(transformation(origin = {22, 38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.BooleanStep sourceTrigger(startTime = 50)  annotation(
    Placement(transformation(origin = {-22, 38}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(sourceTrigger.y, TerminateWhenTriggered.u_trigger) annotation(
    Line(points = {{-10, 38}, {10, 38}}, color = {255, 0, 255}));
annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.001));
end terminateWhenTriggered_ex01;
