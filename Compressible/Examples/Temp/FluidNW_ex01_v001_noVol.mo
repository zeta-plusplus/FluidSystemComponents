within FluidSystemComponents.Compressible.Examples.Temp;

model FluidNW_ex01_v001_noVol
  extends Modelica.Icons.Example;
  //-------------------------
  import units = Modelica.Units.SI;
  //-------------------------
  parameter units.Volume volStd = 0.1;
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium= fluid1,
  //-------------------------
  inner Modelica.Fluid.System system(T_ambient(displayUnit = "K") = 288.15, T_start(displayUnit = "K") = 288.15, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_start = 0, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, p_ambient = 100*1000, p_start = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {-340, 526}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p0(duration = 1, height = 100*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-122, 170}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary0(redeclare package Medium = fluid1, T = 700, nPorts = 2, p = 100*1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-102, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p0(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-122, 140}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 rst_b0_0(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.01^2) annotation(
    Placement(visible = true, transformation(origin = {-92, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 rst_b1_1(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.02^2) annotation(
    Placement(visible = true, transformation(origin = {8, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p1(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-22, 140}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 1, height = 120*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-22, 170}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 750, nPorts = 1, p = 100*1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-2, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 rst_0_1(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.02^2) annotation(
    Placement(visible = true, transformation(origin = {-62, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Sensor.Monitor_MassFlow monitorMassFlow_0_1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-34, 20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Sensor.Monitor_MassFlow monitorMassFlow_b0_0(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-92, 46}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Sensor.Monitor_MassFlow monitorMassFlow_b1_1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {8, 46}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Sensor.Monitor_p_kPa_T_K monitorPT_b0(redeclare package Medium = fluid1, significantDigits_T = 5, significantDigits_p = 6) annotation(
    Placement(visible = true, transformation(origin = {-74, 104}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 rst_b2_2(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.005^2) annotation(
    Placement(visible = true, transformation(origin = {118, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = fluid1, T = 600, nPorts = 1, p = 100*1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {108, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p2(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {88, 140}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p2(duration = 1, height = -50*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {88, 170}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Sensor.Monitor_MassFlow monitorMassFlow_b2_2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {118, 46}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 rst_1_2(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.015^2) annotation(
    Placement(visible = true, transformation(origin = {50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Sensor.Monitor_MassFlow monitorMassFlow_1_2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {80, 20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p1000(duration = 1, height = 500*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-202, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p1000(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-202, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 rst_b1000_0(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.002^2) annotation(
    Placement(visible = true, transformation(origin = {-152, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1000(redeclare package Medium = fluid1, T = 700, nPorts = 1, p = 100*1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-182, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Sensor.Monitor_MassFlow monitorMassFlow_b1000_0(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-124, 20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p1001(duration = 1, height = -10*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {268, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary1001(redeclare package Medium = fluid1, T = 700, nPorts = 1, p = 100*1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {248, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p1001(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {268, 62}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 rst_2_b1001(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.002^2) annotation(
    Placement(visible = true, transformation(origin = {188, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Sensor.Monitor_MassFlow monitorMassFlow_2_b1001(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {218, 20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
equation
  connect(ramp_p0.y, firstOrder_p0.u) annotation(
    Line(points = {{-122, 159}, {-122, 151}}, color = {0, 0, 127}));
  connect(firstOrder_p0.y, boundary0.p_in) annotation(
    Line(points = {{-122, 129}, {-122, 117}, {-114, 117}}, color = {0, 0, 127}));
  connect(boundary0.ports[1], rst_b0_0.port_a) annotation(
    Line(points = {{-92, 110}, {-92, 80}}, color = {0, 127, 255}));
  connect(firstOrder_p1.y, boundary1.p_in) annotation(
    Line(points = {{-22, 129}, {-22, 117}, {-14, 117}}, color = {0, 0, 127}));
  connect(ramp_p1.y, firstOrder_p1.u) annotation(
    Line(points = {{-22, 159}, {-22, 151}}, color = {0, 0, 127}));
  connect(rst_b1_1.port_a, boundary1.ports[1]) annotation(
    Line(points = {{8, 80}, {8, 110}}, color = {0, 127, 255}));
  connect(rst_0_1.port_b, monitorMassFlow_0_1.port_a) annotation(
    Line(points = {{-52, 20}, {-42, 20}}, color = {0, 127, 255}));
  connect(monitorMassFlow_b0_0.port_a, rst_b0_0.port_b) annotation(
    Line(points = {{-92, 54}, {-92, 60}}, color = {0, 127, 255}));
  connect(rst_b1_1.port_b, monitorMassFlow_b1_1.port_a) annotation(
    Line(points = {{8, 60}, {8, 54}}, color = {0, 127, 255}));
  connect(boundary0.ports[2], monitorPT_b0.port) annotation(
    Line(points = {{-92, 110}, {-92, 104}, {-84, 104}}, color = {0, 127, 255}));
  connect(rst_b2_2.port_a, boundary2.ports[1]) annotation(
    Line(points = {{118, 80}, {118, 110}}, color = {0, 127, 255}));
  connect(rst_b2_2.port_b, monitorMassFlow_b2_2.port_a) annotation(
    Line(points = {{118, 60}, {118, 54}}, color = {0, 127, 255}));
  connect(rst_1_2.port_b, monitorMassFlow_1_2.port_a) annotation(
    Line(points = {{60, 20}, {72, 20}}, color = {0, 127, 255}));
  connect(ramp_p2.y, firstOrder_p2.u) annotation(
    Line(points = {{88, 159}, {88, 151}}, color = {0, 0, 127}));
  connect(firstOrder_p2.y, boundary2.p_in) annotation(
    Line(points = {{88, 129}, {88, 117}, {96, 117}}, color = {0, 0, 127}));
  connect(monitorMassFlow_b0_0.port_b, rst_0_1.port_a) annotation(
    Line(points = {{-92, 38}, {-92, 20}, {-72, 20}}, color = {0, 127, 255}));
  connect(monitorMassFlow_0_1.port_b, monitorMassFlow_b1_1.port_b) annotation(
    Line(points = {{-26, 20}, {8, 20}, {8, 38}}, color = {0, 127, 255}));
  connect(monitorMassFlow_0_1.port_b, rst_1_2.port_a) annotation(
    Line(points = {{-26, 20}, {40, 20}}, color = {0, 127, 255}));
  connect(monitorMassFlow_1_2.port_b, monitorMassFlow_b2_2.port_b) annotation(
    Line(points = {{88, 20}, {118, 20}, {118, 38}}, color = {0, 127, 255}));
  connect(rst_b1000_0.port_a, boundary1000.ports[1]) annotation(
    Line(points = {{-162, 20}, {-172, 20}}, color = {0, 127, 255}));
  connect(ramp_p1000.y, firstOrder_p1000.u) annotation(
    Line(points = {{-202, 69}, {-202, 61}}, color = {0, 0, 127}));
  connect(firstOrder_p1000.y, boundary1000.p_in) annotation(
    Line(points = {{-202, 39}, {-202, 27}, {-194, 27}}, color = {0, 0, 127}));
  connect(rst_b1000_0.port_b, monitorMassFlow_b1000_0.port_a) annotation(
    Line(points = {{-142, 20}, {-132, 20}}, color = {0, 127, 255}));
  connect(monitorMassFlow_b1000_0.port_b, monitorMassFlow_b0_0.port_b) annotation(
    Line(points = {{-116, 20}, {-92, 20}, {-92, 38}}, color = {0, 127, 255}));
  connect(monitorMassFlow_2_b1001.port_b, boundary1001.ports[1]) annotation(
    Line(points = {{226, 20}, {238, 20}}, color = {0, 127, 255}));
  connect(boundary1001.p_in, firstOrder_p1001.y) annotation(
    Line(points = {{260, 28}, {268, 28}, {268, 51}}, color = {0, 0, 127}));
  connect(ramp_p1001.y, firstOrder_p1001.u) annotation(
    Line(points = {{268, 79}, {268, 74}}, color = {0, 0, 127}));
  connect(rst_2_b1001.port_b, monitorMassFlow_2_b1001.port_a) annotation(
    Line(points = {{198, 20}, {210, 20}}, color = {0, 127, 255}));
  connect(monitorMassFlow_1_2.port_b, rst_2_b1001.port_a) annotation(
    Line(points = {{88, 20}, {178, 20}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-300, -260}, {300, 260}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.1),
  Icon(coordinateSystem(extent = {{-300, -260}, {300, 260}})));
end FluidNW_ex01_v001_noVol;