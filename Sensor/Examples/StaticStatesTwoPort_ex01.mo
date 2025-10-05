within FluidSystemComponents.Sensor.Examples;

model StaticStatesTwoPort_ex01
  extends Modelica.Icons.Example;
  //-----
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //package fluid1 = FluidSystemComponents.Media.Mixture_N2O2;
  //-----
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 500, nPorts = 1, p = 5*101.325*1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 10, height = 0, offset = 2*101.325*1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T1(duration = 10, height = 0, offset = 500, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CommonAnyFluid.Components.VariableZetaOrifice00 Orifice(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_zeta(duration = 10, height = 1, offset = 1, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = fluid1, m_flow = -0.01, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(transformation(origin = {60, 20}, extent = {{10, -10}, {-10, 10}})));
  StaticStatesTwoPort StaticStates(redeclare package Medium = fluid1)  annotation(
    Placement(transformation(origin = {18, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_m_flow(duration = 10, height = -0.01, offset = -0.01, startTime = 50) annotation(
    Placement(transformation(origin = {90, 28}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Interaction.Show.RealValue real_Mn(significantDigits = 4)  annotation(
    Placement(transformation(origin = {34, 40}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ramp_zeta.y, Orifice.u_zeta) annotation(
    Line(points = {{-18, -10}, {-14, -10}, {-14, 11}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Orifice.port_1) annotation(
    Line(points = {{-40, 20}, {-20, 20}}, color = {0, 127, 255}));
  connect(ramp_T1.y, boundary.T_in) annotation(
    Line(points = {{-78, 20}, {-70, 20}, {-70, 24}, {-62, 24}, {-62, 24}}, color = {0, 0, 127}));
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{-78, 50}, {-72, 50}, {-72, 28}, {-62, 28}, {-62, 28}}, color = {0, 0, 127}));
  connect(Orifice.port_2, StaticStates.port_1) annotation(
    Line(points = {{0, 20}, {8, 20}}, color = {0, 127, 255}));
  connect(StaticStates.port_2, boundary1.ports[1]) annotation(
    Line(points = {{28, 20}, {50, 20}}, color = {0, 127, 255}));
  connect(boundary1.m_flow_in, ramp_m_flow.y) annotation(
    Line(points = {{70, 28}, {79, 28}}, color = {0, 0, 127}));
  StaticStates.bus_Static.Aeff=StaticStates.AeffPath;
  connect(real_Mn.numberPort, StaticStates.bus_Static.Aeff) annotation(
    Line(points = {{22, 40}, {18, 40}, {18, 30}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 80, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end StaticStatesTwoPort_ex01;
