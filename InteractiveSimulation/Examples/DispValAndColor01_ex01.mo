within FluidSystemComponents.InteractiveSimulation.Examples;

model DispValAndColor01_ex01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Sine sine(amplitude = 25, f = 1/10)  annotation(
    Placement(visible = true, transformation(origin = {-18, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 50, f = 1/10) annotation(
    Placement(visible = true, transformation(origin = {-18, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.InteractiveSimulation.Output.DispValAndColor01 disp(sigDigits = 4)  annotation(
    Placement(visible = true, transformation(origin = {30, 15}, extent = {{-10, -8}, {10, 4}}, rotation = 0)));
  FluidSystemComponents.InteractiveSimulation.Output.DispValAndColor01 dispValAndColor01 annotation(
    Placement(visible = true, transformation(origin = {30, -25}, extent = {{-10, -8}, {10, 4}}, rotation = 0)));
equation
  connect(sine.y, disp.u) annotation(
    Line(points = {{-6, 18}, {19.5, 18}}, color = {0, 0, 127}));
  connect(sine1.y, dispValAndColor01.u) annotation(
    Line(points = {{-6, -22}, {20, -22}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.04));
end DispValAndColor01_ex01;
