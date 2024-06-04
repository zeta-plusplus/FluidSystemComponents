within FluidSystemComponents.HeatTransfer.Examples.HeatTransferDevices;

model HX_ShellTube_NTU00_ex01
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWater;
  replaceable package liquid2 = Modelica.Media.Water.StandardWater;
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = liquid1, T = 80 + 273.15, m_flow = 50, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = liquid2, T = 20 + 273.15, m_flow = 40, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.325*1000) annotation(
    Placement(visible = true, transformation(origin = {70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = liquid2, T = 288.15, nPorts = 1, p = 101.325*1000) annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = liquid1, diameter = 0.05, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = liquid2, diameter = 0.05, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.HX_ShellTube_NTU00 HX(redeclare package Medium1 = liquid1, redeclare package Medium2 = liquid2, A_par = 10) annotation(
    Placement(transformation(origin = {-19, 6.42857}, extent = {{-23, -16.4286}, {23, 16.4286}})));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_2(duration = 10, height = 5, offset = 5, startTime = 10) annotation(
    Placement(transformation(origin = {-105, -32}, extent = {{-7, -7}, {7, 7}})));
equation
  connect(pipe1.port_b, boundary3.ports[1]) annotation(
    Line(points = {{40, -30}, {60, -30}}, color = {0, 127, 255}));
  connect(pipe.port_b, boundary2.ports[1]) annotation(
    Line(points = {{40, 40}, {60, 40}, {60, 40}, {60, 40}}, color = {0, 127, 255}));
  connect(boundary.ports[1], HX.port_1_med1) annotation(
    Line(points = {{-60, 50}, {-42, 50}, {-42, 20}}, color = {0, 127, 255}));
  connect(HX.port_2_med1, pipe.port_a) annotation(
    Line(points = {{4, 20}, {4, 40}, {20, 40}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], HX.port_1_med2) annotation(
    Line(points = {{-60, -40}, {-42, -40}, {-42, -6}}, color = {0, 127, 255}));
  connect(HX.port_2_med2, pipe1.port_a) annotation(
    Line(points = {{4, -6}, {6, -6}, {6, -30}, {20, -30}}, color = {0, 127, 255}));
  connect(ramp_m_flow_2.y, boundary1.m_flow_in) annotation(
    Line(points = {{-97, -32}, {-80, -32}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.05),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-140, -100}, {100, 100}})));
end HX_ShellTube_NTU00_ex01;
