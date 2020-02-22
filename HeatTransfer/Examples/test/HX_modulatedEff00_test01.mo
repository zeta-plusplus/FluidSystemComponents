within FluidSystemComponents.HeatTransfer.Examples.test;

model HX_modulatedEff00_test01
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWater;
  replaceable package liquid2 = Modelica.Media.Water.StandardWater;
  //----------
    inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = liquid1, T = 80 + 273.15, m_flow = 10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = liquid2, T = 10 + 273.15, m_flow = 5, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HeatTransfer.Components.HX_modulatedEff00 HX(redeclare package Medium1 = liquid1,redeclare package Medium2 = liquid2) annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = liquid2, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 5, height = -0.05, offset = 0.9, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = liquid1, diameter = 0.05, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = liquid2, diameter = 0.05, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(boundary1.ports[1], HX.port_1_med2) annotation(
    Line(points = {{-60, -20}, {-34, -20}, {-34, 22}, {-20, 22}}, color = {0, 127, 255}));
  connect(boundary.ports[1], HX.port_1_med1) annotation(
    Line(points = {{-60, 50}, {-32, 50}, {-32, 38}, {-20, 38}}, color = {0, 127, 255}));
  connect(ramp1.y, HX.u_eff) annotation(
    Line(points = {{-58, 20}, {-48, 20}, {-48, 30}, {-21, 30}}, color = {0, 0, 127}));
  connect(HX.port_2_med1, pipe.port_a) annotation(
    Line(points = {{0, 38}, {10, 38}, {10, 50}, {20, 50}}, color = {0, 127, 255}));
  connect(HX.port_2_med2, pipe1.port_a) annotation(
    Line(points = {{0, 22}, {8, 22}, {8, -10}, {20, -10}}, color = {0, 127, 255}));
  connect(pipe1.port_b, boundary3.ports[1]) annotation(
    Line(points = {{40, -10}, {60, -10}, {60, -10}, {60, -10}}, color = {0, 127, 255}));
  connect(pipe.port_b, boundary2.ports[1]) annotation(
    Line(points = {{40, 50}, {60, 50}, {60, 50}, {60, 50}}, color = {0, 127, 255}));
annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-6, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));end HX_modulatedEff00_test01;
