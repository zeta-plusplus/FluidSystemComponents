within FluidSystemComponents.Compressible.Examples.Tutorial;

model NozzleFlowEquation01_ex01
  extends Modelica.Icons.Example;
  //---------------
  package SecondaryAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = SecondaryAir
  //---------------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_H_1(redeclare package Medium = SecondaryAir, T = 700, p = 2 * 100 * 1000, use_p_in = true, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_L_1(redeclare package Medium = SecondaryAir, T = 600, p = 100 * 1000, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pH_1(duration = 1, height = -1 * 100 * 1000, offset = 2 * 100 * 1000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-90, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_L_2(redeclare package Medium = SecondaryAir, T = 600, nPorts = 1, p = 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {50, -32}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_H_2(redeclare package Medium = SecondaryAir, T = 700, nPorts = 1, p = 100 * 1000, use_p_in = false) annotation(
    Placement(visible = true, transformation(origin = {-50, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pL_2(duration = 1, height = -0.7 * 100 * 1000, offset = 0.9 * 100 * 1000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {90, -24}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation01 flowPath(redeclare package Medium = SecondaryAir) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation01 flowPath1(redeclare package Medium = SecondaryAir) annotation(
    Placement(visible = true, transformation(origin = {0, -32}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(ramp_pH_1.y, BC_H_1.p_in) annotation(
    Line(points = {{-79, 18}, {-63, 18}}, color = {0, 0, 127}));
  connect(BC_L_2.p_in, ramp_pL_2.y) annotation(
    Line(points = {{62, -24}, {80, -24}}, color = {0, 0, 127}));
  connect(flowPath.port_1, BC_H_1.ports[1]) annotation(
    Line(points = {{-20, 10}, {-40, 10}}, color = {0, 127, 255}));
  connect(flowPath.port_2, BC_L_1.ports[1]) annotation(
    Line(points = {{20, 10}, {40, 10}}, color = {0, 127, 255}));
  connect(flowPath1.port_1, BC_H_2.ports[1]) annotation(
    Line(points = {{-20, -32}, {-40, -32}}, color = {0, 127, 255}));
  connect(flowPath1.port_2, BC_L_2.ports[1]) annotation(
    Line(points = {{20, -32}, {40, -32}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.01));
end NozzleFlowEquation01_ex01;
