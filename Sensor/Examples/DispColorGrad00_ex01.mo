within FluidSystemComponents.Sensor.Examples;

model DispColorGrad00_ex01
  extends Modelica.Icons.Example;
  DispColorGrad00 disp annotation(
    Placement(visible = true, transformation(origin = {30, 16}, extent = {{-10, -6}, {10, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 5, height = 1000, offset = 0, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {-22, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp.y, disp.u) annotation(
    Line(points = {{-10, 16}, {20, 16}}, color = {0, 0, 127}));
annotation(
    experiment(StartTime = 0, StopTime = 15, Tolerance = 1e-6, Interval = 0.03));
end DispColorGrad00_ex01;
