within FluidSystemComponents.InteractiveSimulation.Examples;

model DispValAndColor00_ex01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Sine sine(amplitude = 25, f = 1/10)  annotation(
    Placement(visible = true, transformation(origin = {-18, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 50, f = 1/10) annotation(
    Placement(visible = true, transformation(origin = {-18, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.InteractiveSimulation.Output.DispValAndColor00 disp annotation(
    Placement(visible = true, transformation(origin = {30, 9}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.InteractiveSimulation.Output.DispValAndColor00 dispValAndColor00 annotation(
    Placement(visible = true, transformation(origin = {30, -31}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sine.y, disp.u) annotation(
    Line(points = {{-6, 18}, {19.5, 18}}, color = {0, 0, 127}));
  connect(sine1.y, dispValAndColor00.u) annotation(
    Line(points = {{-6, -22}, {19.5, -22}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.04));
end DispValAndColor00_ex01;
