within FluidSystemComponents.InteractiveSimulation.Examples;

model DispColorGrad00_ex01
  extends Modelica.Icons.Example;
  FluidSystemComponents.InteractiveSimulation.Output.DispColorGrad00 disp(valMin = -25)  annotation(
    Placement(visible = true, transformation(origin = {30, 18}, extent = {{-10, -11}, {10, 11}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(amplitude = 25, f = 1/10)  annotation(
    Placement(visible = true, transformation(origin = {-18, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.InteractiveSimulation.Output.DispColorGrad00 dispColorGrad00(valMin = -25)  annotation(
    Placement(visible = true, transformation(origin = {30, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 50, f = 1/10) annotation(
    Placement(visible = true, transformation(origin = {-18, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sine.y, disp.u) annotation(
    Line(points = {{-7, 18}, {19, 18}}, color = {0, 0, 127}));
  connect(sine1.y, dispColorGrad00.u) annotation(
    Line(points = {{-7, -22}, {19, -22}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.04));
end DispColorGrad00_ex01;
