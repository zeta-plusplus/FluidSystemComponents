within FluidSystemComponents.Compressible.Examples.Tutorial;

model NozzleFlowEquation03_ex01
  extends Modelica.Icons.Example;
  //---------------
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = fluid1
  //---------------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_H_1(redeclare package Medium = fluid1, T = 700, p = 2 * 100 * 1000, use_p_in = true, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-50, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_L_1(redeclare package Medium = fluid1, T = 600, p = 100 * 1000, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {50, 32}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pH_1(duration = 1, height = -2.9 * 100 * 1000, offset = 3 * 100 * 1000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_L_2(redeclare package Medium = fluid1, T = 600, nPorts = 2, p = 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {50, -68}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_H_2(redeclare package Medium = fluid1, T = 700, nPorts = 2, p = 100 * 1000, use_p_in = false) annotation(
    Placement(visible = true, transformation(origin = {-50, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pL_2(duration = 1, height = -1.1 * 100 * 1000, offset = 1.2 * 100 * 1000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {90, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 flowPath(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {0, 32}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 flowPath1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {0, -68}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.05 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1, dp_nominal = 100 * 1000, m_flow_nominal = 0.1, p_nominal = 2 * 100 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {-2, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valve(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-2, 81}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_valve_1(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {0, -19}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible1(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.05 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1, dp_nominal = 100 * 1000, m_flow_nominal = 0.1, p_nominal = 2 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_pH_1.y, BC_H_1.p_in) annotation(
    Line(points = {{-79, 40}, {-63, 40}}, color = {0, 0, 127}));
  connect(BC_L_2.p_in, ramp_pL_2.y) annotation(
    Line(points = {{62, -60}, {80, -60}}, color = {0, 0, 127}));
  connect(flowPath.port_a, BC_H_1.ports[1]) annotation(
    Line(points = {{-20, 32}, {-40, 32}}, color = {0, 127, 255}));
  connect(flowPath.port_b, BC_L_1.ports[1]) annotation(
    Line(points = {{20, 32}, {40, 32}}, color = {0, 127, 255}));
  connect(flowPath1.port_a, BC_H_2.ports[1]) annotation(
    Line(points = {{-20, -68}, {-40, -68}}, color = {0, 127, 255}));
  connect(flowPath1.port_b, BC_L_2.ports[1]) annotation(
    Line(points = {{20, -68}, {40, -68}}, color = {0, 127, 255}));
  connect(ramp_valve.y, valveCompressible.opening) annotation(
    Line(points = {{-2, 75.5}, {-2, 68}}, color = {0, 0, 127}));
  connect(valveCompressible.port_a, BC_H_1.ports[2]) annotation(
    Line(points = {{-12, 60}, {-26, 60}, {-26, 32}, {-40, 32}}, color = {0, 127, 255}));
  connect(valveCompressible.port_b, BC_L_1.ports[2]) annotation(
    Line(points = {{8, 60}, {32, 60}, {32, 32}, {40, 32}}, color = {0, 127, 255}));
  connect(ramp_valve_1.y, valveCompressible1.opening) annotation(
    Line(points = {{0, -24.5}, {0, -32}}, color = {0, 0, 127}));
  connect(valveCompressible1.port_a, BC_H_2.ports[2]) annotation(
    Line(points = {{-10, -40}, {-26, -40}, {-26, -68}, {-40, -68}}, color = {0, 127, 255}));
  connect(valveCompressible1.port_b, BC_L_2.ports[2]) annotation(
    Line(points = {{10, -40}, {30, -40}, {30, -68}, {40, -68}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.001),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end NozzleFlowEquation03_ex01;
