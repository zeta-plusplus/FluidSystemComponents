within FluidSystemComponents.Compressible.Examples.Tutorial;

model NozzleFlowEquation03_ex01
  extends Modelica.Icons.Example;
  //---------------
  package SecondaryAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = SecondaryAir
  //---------------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_H_1(redeclare package Medium = SecondaryAir, T = 700, p = 2 * 100 * 1000, use_p_in = true, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_L_1(redeclare package Medium = SecondaryAir, T = 600, p = 100 * 1000, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pH_1(duration = 1, height = -2.9 * 100 * 1000, offset = 3 * 100 * 1000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-90, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_L_2(redeclare package Medium = SecondaryAir, T = 600, nPorts = 1, p = 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {50, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_H_2(redeclare package Medium = SecondaryAir, T = 700, nPorts = 1, p = 100 * 1000, use_p_in = false) annotation(
    Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pL_2(duration = 1, height = -1.1 * 100 * 1000, offset = 1.2 * 100 * 1000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {90, -32}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 flowPath(redeclare package Medium = SecondaryAir) annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 flowPath1(redeclare package Medium = SecondaryAir) annotation(
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(ramp_pH_1.y, BC_H_1.p_in) annotation(
    Line(points = {{-79, 38}, {-63, 38}}, color = {0, 0, 127}));
  connect(BC_L_2.p_in, ramp_pL_2.y) annotation(
    Line(points = {{62, -32}, {80, -32}}, color = {0, 0, 127}));
  connect(flowPath.port_a, BC_H_1.ports[1]) annotation(
    Line(points = {{-20, 30}, {-40, 30}}, color = {0, 127, 255}));
  connect(flowPath.port_b, BC_L_1.ports[1]) annotation(
    Line(points = {{20, 30}, {40, 30}}, color = {0, 127, 255}));
  connect(flowPath1.port_a, BC_H_2.ports[1]) annotation(
    Line(points = {{-20, -40}, {-40, -40}}, color = {0, 127, 255}));
  connect(flowPath1.port_b, BC_L_2.ports[1]) annotation(
    Line(points = {{20, -40}, {40, -40}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.001));
end NozzleFlowEquation03_ex01;
