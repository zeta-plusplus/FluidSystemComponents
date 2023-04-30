within FluidSystemComponents.InteractiveSimulation.Examples;

model DispColorGrad00_ex01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Ramp ramp(duration = 5, height = 25, offset = 0, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-22, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.InteractiveSimulation.Output.DispColorGrad00 disp annotation(
    Placement(visible = true, transformation(origin = {22, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp.y, disp.u) annotation(
    Line(points = {{-10, 16}, {12, 16}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 15, Tolerance = 1e-06, Interval = 0.03));
end DispColorGrad00_ex01;
