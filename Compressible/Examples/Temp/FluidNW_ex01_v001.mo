within FluidSystemComponents.Compressible.Examples.Temp;

model FluidNW_ex01_v001
  extends Modelica.Icons.Example;
  //-------------------------
  import units = Modelica.Units.SI;
  //-------------------------
  parameter units.Volume volStd = 0.1;
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium= fluid1,
  //-------------------------
  inner Modelica.Fluid.System system(T_ambient(displayUnit = "K") = 288.15, T_start(displayUnit = "K") = 288.15, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 0, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_ambient = 100*1000, p_start = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {-340, 526}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p0(duration = 1, height = 100*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-140, 184}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary0(redeclare package Medium = fluid1, T = 700, nPorts = 2, p = 100*1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-120, 124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p0(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-140, 154}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 rst_b0_0(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.01^2) annotation(
    Placement(visible = true, transformation(origin = {-110, 84}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume vol1(redeclare package Medium = fluid1, V = volStd, nPorts = 5, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume vol0(redeclare package Medium = fluid1, V = volStd, nPorts = 4, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 rst_b1_1(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.02^2) annotation(
    Placement(visible = true, transformation(origin = {10, 84}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p1(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-20, 154}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 1, height = 120*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-20, 184}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 750, nPorts = 1, p = 100*1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {0, 124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 rst_0_1(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.02^2) annotation(
    Placement(visible = true, transformation(origin = {-60, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Sensor.Monitor_p_kPa_T_K monitorPT_vol(redeclare package Medium = fluid1, significantDigits_T = 5, significantDigits_p = 6) annotation(
    Placement(visible = true, transformation(origin = {-92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Sensor.Monitor_p_kPa_T_K monitorPT_vol1(redeclare package Medium = fluid1, significantDigits_T = 5, significantDigits_p = 6) annotation(
    Placement(visible = true, transformation(origin = {28, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Sensor.Monitor_MassFlow monitorMassFlow_0_1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-32, 34}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Sensor.Monitor_MassFlow monitorMassFlow_b0_0(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-110, 60}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Sensor.Monitor_MassFlow monitorMassFlow_b1_1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {10, 60}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Sensor.Monitor_p_kPa_T_K monitorPT_b0(redeclare package Medium = fluid1,significantDigits_T = 5, significantDigits_p = 6) annotation(
    Placement(visible = true, transformation(origin = {-94, 116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume vol2(redeclare package Medium = fluid1, V = volStd, nPorts = 5, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {120, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 rst_b2_2(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.005^2) annotation(
    Placement(visible = true, transformation(origin = {120, 84}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = fluid1, T = 600, nPorts = 1, p = 100*1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {110, 124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p2(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {90, 154}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p2(duration = 1, height = -50*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {90, 184}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Sensor.Monitor_MassFlow monitorMassFlow_b2_2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {120, 60}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 rst_1_2(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.015^2) annotation(
    Placement(visible = true, transformation(origin = {52, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Sensor.Monitor_MassFlow monitorMassFlow_1_2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {82, 34}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Sensor.Monitor_p_kPa_T_K monitorPT_vol2(redeclare package Medium = fluid1, significantDigits_T = 5, significantDigits_p = 6) annotation(
    Placement(visible = true, transformation(origin = {142, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p1000(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-220, 64}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p1000(duration = 1, height = 500*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-220, 94}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary1000(redeclare package Medium = fluid1, T = 700, nPorts = 1, p = 100*1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-200, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 rst_b1000_0(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.002^2) annotation(
    Placement(visible = true, transformation(origin = {-170, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Sensor.Monitor_MassFlow monitorMassFlow_b1000_0(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-140, 34}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1001(redeclare package Medium = fluid1, T = 700, nPorts = 1, p = 100*1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {230, 34}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p1001(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {250, 74}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p1001(duration = 1, height = -10*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {250, 104}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 rst_2_b1001(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.002^2) annotation(
    Placement(visible = true, transformation(origin = {170, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Sensor.Monitor_MassFlow monitorMassFlow_2_b1001(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {200, 34}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Sensor.PressureDispColor00 pressure1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {22, -6}, extent = {{-10, -4}, {10, 4}}, rotation = 0)));
  FluidSystemComponents.Sensor.PressureDispColor00 pressure2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {138, -6}, extent = {{-10, -4}, {10, 4}}, rotation = 0)));
equation
  connect(ramp_p0.y, firstOrder_p0.u) annotation(
    Line(points = {{-140, 173}, {-140, 165}}, color = {0, 0, 127}));
  connect(firstOrder_p0.y, boundary0.p_in) annotation(
    Line(points = {{-140, 143}, {-140, 131}, {-132, 131}}, color = {0, 0, 127}));
  connect(boundary0.ports[1], rst_b0_0.port_a) annotation(
    Line(points = {{-110, 124}, {-110, 94}}, color = {0, 127, 255}));
  connect(firstOrder_p1.y, boundary1.p_in) annotation(
    Line(points = {{-20, 143}, {-20, 131}, {-12, 131}}, color = {0, 0, 127}));
  connect(ramp_p1.y, firstOrder_p1.u) annotation(
    Line(points = {{-20, 173}, {-20, 165}}, color = {0, 0, 127}));
  connect(rst_b1_1.port_a, boundary1.ports[1]) annotation(
    Line(points = {{10, 94}, {10, 124}}, color = {0, 127, 255}));
  connect(rst_0_1.port_a, vol0.ports[1]) annotation(
    Line(points = {{-70, 34}, {-110, 34}, {-110, 20}}, color = {0, 127, 255}));
  connect(monitorPT_vol.port, vol0.ports[2]) annotation(
    Line(points = {{-102, 10}, {-110, 10}, {-110, 20}}, color = {0, 127, 255}));
  connect(monitorPT_vol1.port, vol1.ports[1]) annotation(
    Line(points = {{18, 10}, {10, 10}, {10, 20}}, color = {0, 127, 255}));
  connect(rst_0_1.port_b, monitorMassFlow_0_1.port_a) annotation(
    Line(points = {{-50, 34}, {-40, 34}}, color = {0, 127, 255}));
  connect(monitorMassFlow_0_1.port_b, vol1.ports[2]) annotation(
    Line(points = {{-24, 34}, {10, 34}, {10, 20}}, color = {0, 127, 255}));
  connect(monitorMassFlow_b0_0.port_b, vol0.ports[3]) annotation(
    Line(points = {{-110, 52}, {-110, 20}}, color = {0, 127, 255}));
  connect(monitorMassFlow_b0_0.port_a, rst_b0_0.port_b) annotation(
    Line(points = {{-110, 68}, {-110, 74}}, color = {0, 127, 255}));
  connect(rst_b1_1.port_b, monitorMassFlow_b1_1.port_a) annotation(
    Line(points = {{10, 74}, {10, 68}}, color = {0, 127, 255}));
  connect(monitorMassFlow_b1_1.port_b, vol1.ports[3]) annotation(
    Line(points = {{10, 52}, {10, 20}}, color = {0, 127, 255}));
  connect(boundary0.ports[2], monitorPT_b0.port) annotation(
    Line(points = {{-110, 124}, {-110, 116}, {-104, 116}}, color = {0, 127, 255}));
  connect(rst_b2_2.port_a, boundary2.ports[1]) annotation(
    Line(points = {{120, 94}, {120, 124}}, color = {0, 127, 255}));
  connect(rst_b2_2.port_b, monitorMassFlow_b2_2.port_a) annotation(
    Line(points = {{120, 74}, {120, 68}}, color = {0, 127, 255}));
  connect(monitorMassFlow_b2_2.port_b, vol2.ports[1]) annotation(
    Line(points = {{120, 52}, {120, 20}}, color = {0, 127, 255}));
  connect(monitorMassFlow_1_2.port_b, vol2.ports[2]) annotation(
    Line(points = {{90, 34}, {120, 34}, {120, 20}}, color = {0, 127, 255}));
  connect(rst_1_2.port_b, monitorMassFlow_1_2.port_a) annotation(
    Line(points = {{62, 34}, {74, 34}}, color = {0, 127, 255}));
  connect(rst_1_2.port_a, vol1.ports[4]) annotation(
    Line(points = {{42, 34}, {10, 34}, {10, 20}}, color = {0, 127, 255}));
  connect(vol2.ports[3], monitorPT_vol2.port) annotation(
    Line(points = {{120, 20}, {120, 12}, {132, 12}}, color = {0, 127, 255}));
  connect(ramp_p2.y, firstOrder_p2.u) annotation(
    Line(points = {{90, 173}, {90, 165}}, color = {0, 0, 127}));
  connect(firstOrder_p2.y, boundary2.p_in) annotation(
    Line(points = {{90, 143}, {90, 131}, {98, 131}}, color = {0, 0, 127}));
  connect(monitorMassFlow_b1000_0.port_b, vol0.ports[4]) annotation(
    Line(points = {{-132, 34}, {-110, 34}, {-110, 20}}, color = {0, 127, 255}));
  connect(rst_b1000_0.port_b, monitorMassFlow_b1000_0.port_a) annotation(
    Line(points = {{-160, 34}, {-148, 34}}, color = {0, 127, 255}));
  connect(rst_b1000_0.port_a, boundary1000.ports[1]) annotation(
    Line(points = {{-180, 34}, {-190, 34}}, color = {0, 127, 255}));
  connect(firstOrder_p1000.y, boundary1000.p_in) annotation(
    Line(points = {{-220, 53}, {-220, 41}, {-212, 41}}, color = {0, 0, 127}));
  connect(ramp_p1000.y, firstOrder_p1000.u) annotation(
    Line(points = {{-220, 83}, {-220, 75}}, color = {0, 0, 127}));
  connect(ramp_p1001.y, firstOrder_p1001.u) annotation(
    Line(points = {{250, 93}, {250, 85}}, color = {0, 0, 127}));
  connect(boundary1001.p_in, firstOrder_p1001.y) annotation(
    Line(points = {{242, 42}, {250, 42}, {250, 64}}, color = {0, 0, 127}));
  connect(rst_2_b1001.port_a, vol2.ports[4]) annotation(
    Line(points = {{160, 34}, {120, 34}, {120, 20}}, color = {0, 127, 255}));
  connect(rst_2_b1001.port_b, monitorMassFlow_2_b1001.port_a) annotation(
    Line(points = {{180, 34}, {192, 34}}, color = {0, 127, 255}));
  connect(monitorMassFlow_2_b1001.port_b, boundary1001.ports[1]) annotation(
    Line(points = {{208, 34}, {220, 34}}, color = {0, 127, 255}));
  connect(pressure2.port, vol2.ports[5]) annotation(
    Line(points = {{128, -6}, {120, -6}, {120, 20}}, color = {0, 127, 255}));
  connect(pressure1.port, vol1.ports[5]) annotation(
    Line(points = {{12, -6}, {10, -6}, {10, 20}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-300, -260}, {300, 260}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.1),
  Icon(coordinateSystem(extent = {{-300, -260}, {300, 260}})));
end FluidNW_ex01_v001;
