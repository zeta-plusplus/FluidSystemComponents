within FluidSystemComponents.Compressible.Examples.Tutorial;

model NozzleFlowEquation03_ex02
  extends Modelica.Icons.Example;
  //---------------
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = fluid1
  //---------------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_H_1(redeclare package Medium = fluid1, T = 700, p = 2 * 100 * 1000, use_p_in = true, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_L_1(redeclare package Medium = fluid1, T = 600, p = 100 * 1000, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {50, 32}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pH_1(duration = 1, height = -2.9 * 100 * 1000, offset = 3 * 100 * 1000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_H_2(redeclare package Medium = fluid1, T = 700, nPorts = 1, p = 100 * 1000, use_p_in = false) annotation(
    Placement(visible = true, transformation(origin = {-50, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 flowPath(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {0, 32}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 flowPath1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {0, -66}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T BC_L_2(redeclare package Medium = fluid1, nPorts = 1, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {50, -66}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_2(duration = 1, height = 0.01, offset = 0.1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {86, -58}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(ramp_pH_1.y, BC_H_1.p_in) annotation(
    Line(points = {{-79, 40}, {-63, 40}}, color = {0, 0, 127}));
  connect(flowPath.port_a, BC_H_1.ports[1]) annotation(
    Line(points = {{-20, 32}, {-40, 32}}, color = {0, 127, 255}));
  connect(flowPath.port_b, BC_L_1.ports[1]) annotation(
    Line(points = {{20, 32}, {40, 32}}, color = {0, 127, 255}));
  connect(flowPath1.port_a, BC_H_2.ports[1]) annotation(
    Line(points = {{-20, -66}, {-40, -66}}, color = {0, 127, 255}));
  connect(flowPath1.port_b, BC_L_2.ports[1]) annotation(
    Line(points = {{20, -66}, {40, -66}}, color = {0, 127, 255}));
  connect(BC_L_2.m_flow_in, ramp_m_flow_2.y) annotation(
    Line(points = {{60, -58}, {75, -58}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.001),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Diagram(graphics = {Text(origin = {12, 70}, extent = {{-72, 6}, {72, -6}}, textString = "Cause: Upstream, downstream pressures"), Text(origin = {11, 58}, extent = {{-69, 4}, {69, -4}}, textString = "-> Result: mass flow rate"), Text(origin = {12, -26}, extent = {{-72, 6}, {72, -6}}, textString = "Cause: Upstream pressure, mass flow rate"), Text(origin = {21, -38}, extent = {{-69, 4}, {69, -4}}, textString = "-> Result: downstream pressure")}));
end NozzleFlowEquation03_ex02;
