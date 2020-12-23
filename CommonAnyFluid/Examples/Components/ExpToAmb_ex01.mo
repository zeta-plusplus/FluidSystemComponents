within FluidSystemComponents.CommonAnyFluid.Examples.Components;

model ExpToAmb_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  FluidSystemComponents.CommonAnyFluid.Components.ExpansionToAmbient ExpToAmb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 500, nPorts = 1, p = 5 * 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {36, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint(tgtValue_paramInput = 1.0, use_u_targetVal = false) annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 10, height = 2 * 101.325 * 1000, offset = 2 * 101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 200, offset = 500, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp1.y, boundary.T_in) annotation(
    Line(points = {{-78, 20}, {-70, 20}, {-70, 24}, {-62, 24}, {-62, 24}}, color = {0, 0, 127}));
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{-78, 50}, {-72, 50}, {-72, 28}, {-62, 28}, {-62, 28}}, color = {0, 0, 127}));
  connect(Constraint.u_variable, massFlowRate1.m_flow) annotation(
    Line(points = {{-10, 39}, {-10, 32}}, color = {0, 0, 127}));
  connect(boundary.ports[1], massFlowRate1.port_a) annotation(
    Line(points = {{-40, 20}, {-20, 20}, {-20, 20}, {-20, 20}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], ExpToAmb.port_2) annotation(
    Line(points = {{36, 50}, {36, 30}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, ExpToAmb.port_1) annotation(
    Line(points = {{0, 20}, {20, 20}, {20, 20}, {20, 20}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-6, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end ExpToAmb_ex01;
