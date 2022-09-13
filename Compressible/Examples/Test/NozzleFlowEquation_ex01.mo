within FluidSystemComponents.Compressible.Examples.Test;

model NozzleFlowEquation_ex01
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
  Modelica.Blocks.Sources.Ramp ramp_pH_1(duration = 1, height = -0.1 * 100 * 1000, offset = 1.1 * 100 * 1000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-90, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_L_2(redeclare package Medium = SecondaryAir, T = 600, nPorts = 1, p = 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_H_2(redeclare package Medium = SecondaryAir, T = 700, nPorts = 1, p = 100 * 1000, use_p_in = false) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pL_2(duration = 1, height = -0.7 * 100 * 1000, offset = 0.9 * 100 * 1000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {90, -22}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation01 flowPath(redeclare package Medium = SecondaryAir, AmechTot_par = 0.001) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation01 flowPath1(redeclare package Medium = SecondaryAir, AmechTot_par = 0.001) annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(ramp_pH_1.y, BC_H_1.p_in) annotation(
    Line(points = {{-79, 18}, {-63, 18}}, color = {0, 0, 127}));
  connect(BC_L_2.p_in, ramp_pL_2.y) annotation(
    Line(points = {{62, -22}, {79, -22}}, color = {0, 0, 127}));
  connect(BC_H_1.ports[1], flowPath.port_1) annotation(
    Line(points = {{-40, 10}, {-20, 10}}, color = {0, 127, 255}));
  connect(flowPath.port_2, BC_L_1.ports[1]) annotation(
    Line(points = {{20, 10}, {40, 10}}, color = {0, 127, 255}));
  connect(BC_H_2.ports[1], flowPath1.port_1) annotation(
    Line(points = {{-40, -30}, {-20, -30}}, color = {0, 127, 255}));
  connect(BC_L_2.ports[1], flowPath1.port_2) annotation(
    Line(points = {{40, -30}, {20, -30}}, color = {0, 127, 255}));  protected
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.01));
end NozzleFlowEquation_ex01;
