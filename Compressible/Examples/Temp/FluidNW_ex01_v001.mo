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
  Modelica.Blocks.Sources.Ramp ramp_p(duration = 1, height = 100*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-470, 490}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 700, nPorts = 1, p = 40*101.325*1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-450, 430}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p1(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-470, 460}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 rst(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.01^2) annotation(
    Placement(visible = true, transformation(origin = {-440, 400}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume vol1(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-360, 360}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume vol(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-440, 360}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 rst1(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.01^2) annotation(
    Placement(visible = true, transformation(origin = {-360, 400}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p2(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-390, 460}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p2(duration = 1, height = 120*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-390, 490}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 750, nPorts = 1, p = 40*101.325*1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-370, 430}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 rst_0_1(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.01^2) annotation(
    Placement(visible = true, transformation(origin = {-400, 360}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Sensor.Monitor_p_kPa_T_K monitorPT(redeclare package Medium = fluid1, significantDigits_T = 5, significantDigits_p = 6) annotation(
    Placement(visible = true, transformation(origin = {-426, 330}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Sensor.Monitor_p_kPa_T_K monitorPT1(redeclare package Medium = fluid1, significantDigits_T = 5, significantDigits_p = 6) annotation(
    Placement(visible = true, transformation(origin = {-346, 330}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_p.y, firstOrder_p1.u) annotation(
    Line(points = {{-470, 480}, {-470, 472}}, color = {0, 0, 127}));
  connect(firstOrder_p1.y, boundary.p_in) annotation(
    Line(points = {{-470, 450}, {-470, 438}, {-462, 438}}, color = {0, 0, 127}));
  connect(boundary.ports[1], rst.port_a) annotation(
    Line(points = {{-440, 430}, {-440, 410}}, color = {0, 127, 255}));
  connect(firstOrder_p2.y, boundary1.p_in) annotation(
    Line(points = {{-390, 449}, {-390, 437}, {-382, 437}}, color = {0, 0, 127}));
  connect(ramp_p2.y, firstOrder_p2.u) annotation(
    Line(points = {{-390, 479}, {-390, 471}}, color = {0, 0, 127}));
  connect(rst1.port_a, boundary1.ports[1]) annotation(
    Line(points = {{-360, 410}, {-360, 430}}, color = {0, 127, 255}));
  connect(rst1.port_b, vol1.ports[1]) annotation(
    Line(points = {{-360, 390}, {-360, 350}}, color = {0, 127, 255}));
  connect(rst.port_b, vol.ports[1]) annotation(
    Line(points = {{-440, 390}, {-440, 350}}, color = {0, 127, 255}));
  connect(rst_0_1.port_a, vol.ports[2]) annotation(
    Line(points = {{-410, 360}, {-440, 360}, {-440, 350}}, color = {0, 127, 255}));
  connect(rst_0_1.port_b, vol1.ports[2]) annotation(
    Line(points = {{-390, 360}, {-360, 360}, {-360, 350}}, color = {0, 127, 255}));
  connect(monitorPT.port, vol.ports[3]) annotation(
    Line(points = {{-436, 330}, {-440, 330}, {-440, 350}}, color = {0, 127, 255}));
  connect(monitorPT1.port, vol1.ports[3]) annotation(
    Line(points = {{-356, 330}, {-360, 330}, {-360, 350}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-500, -500}, {500, 500}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.1));
end FluidNW_ex01_v001;
