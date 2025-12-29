within FluidSystemComponents.CommonAnyFluid.Examples.EngineeringStudies;

model RectifierByTeslaValves_01
  extends Modelica.Icons.Example;
  //-----
  //package fluid1 = Modelica.Media.Water.StandardWater;
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //-----
  parameter Modelica.Units.SI.Pressure p_contour_min = 1*1000;
  parameter Modelica.Units.SI.Pressure p_contour_max = 150*1000;
  parameter Modelica.Units.SI.MassFlowRate m_flow_arrow_min = -1;
  parameter Modelica.Units.SI.MassFlowRate m_flow_arrow_max = 1;
  //-----
  parameter Real glb_diodicity= 1.5;
  parameter Real glb_zeta_teslaValve= 1;
  parameter Modelica.Units.SI.Area glb_area_teslaValve= 0.1^2*Modelica.Constants.pi/4;
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {-190, 50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 288.15, nPorts = 1, p = 100*1000, use_T_in = false, use_p_in = false) annotation(
    Placement(transformation(origin = {150, 0}, extent = {{10, -10}, {-10, 10}})));
  FluidSystemComponents.CommonAnyFluid.Components.TeslaValveConstantZeta00 TeslaValve1(redeclare package Medium = fluid1, Amech_par = glb_area_teslaValve, diodicity_par = glb_diodicity, zeta_forward_par = glb_zeta_teslaValve) annotation(
    Placement(transformation(origin = {-40, 39}, extent = {{-20, -9}, {20, 9}})));
  Sensor.MonitorMassFlow00 m_flow_sensor(redeclare package Medium = fluid1, m_flow_Min = m_flow_arrow_min, m_flow_Max = m_flow_arrow_max) annotation(
    Placement(transformation(origin = {-120, 0}, extent = {{-10, -6}, {10, 6}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(nPorts = 1, redeclare package Medium = fluid1, m_flow = 10, T = 288.15, use_m_flow_in = true) annotation(
    Placement(transformation(origin = {-170, 0}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.CommonAnyFluid.Components.TeslaValveConstantZeta00 TeslaValve2(Amech_par = glb_area_teslaValve, redeclare package Medium = fluid1, diodicity_par = glb_diodicity, zeta_forward_par = glb_zeta_teslaValve) annotation(
    Placement(transformation(origin = {40, 39}, extent = {{20, -9}, {-20, 9}})));
  FluidSystemComponents.CommonAnyFluid.Components.TeslaValveConstantZeta00 TeslaValve4(Amech_par = glb_area_teslaValve, redeclare package Medium = fluid1, diodicity_par = glb_diodicity, zeta_forward_par = glb_zeta_teslaValve) annotation(
    Placement(transformation(origin = {40, -31}, extent = {{-20, -9}, {20, 9}})));
  FluidSystemComponents.CommonAnyFluid.Components.TeslaValveConstantZeta00 TeslaValve3(Amech_par = glb_area_teslaValve, redeclare package Medium = fluid1, diodicity_par = glb_diodicity, zeta_forward_par = glb_zeta_teslaValve) annotation(
    Placement(transformation(origin = {-40, -31}, extent = {{20, -9}, {-20, 9}})));
  FluidSystemComponents.Sensor.MonitorMassFlow00 m_flow_sensor1(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {-80, 34}, extent = {{-10, -6}, {10, 6}})));
  FluidSystemComponents.Sensor.MonitorMassFlow00 m_flow_sensor2(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {80, 34}, extent = {{-10, -6}, {10, 6}})));
  FluidSystemComponents.Sensor.MonitorMassFlow00 m_flow_sensor3(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {-80, -36}, extent = {{-10, -6}, {10, 6}})));
  FluidSystemComponents.Sensor.MonitorMassFlow00 m_flow_sensor4(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {80, -36}, extent = {{-10, -6}, {10, 6}})));
  FluidSystemComponents.Sensor.MonitorMassFlow00 m_flow_sensor5(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {120, 0}, extent = {{-10, -6}, {10, 6}})));
  FluidSystemComponents.Sensor.MonitorMassFlow00 m_flow_sensor6(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {0, 80}, extent = {{-10, -6}, {10, 6}}, rotation = 90)));
  FluidSystemComponents.Sensor.MonitorMassFlow00 m_flow_sensor7(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {0, -80}, extent = {{-10, -6}, {10, 6}}, rotation = 90)));
  FluidSystemComponents.Sensor.MonitorMassFlow00 m_flow_sensor8(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {194, -30}, extent = {{-10, -6}, {10, 6}}, rotation = -90)));
  Modelica.Blocks.Sources.Cosine cosine(amplitude = 1, f = 0.1)  annotation(
    Placement(transformation(origin = {-195, 8}, extent = {{-5, -5}, {5, 5}})));
equation
  connect(m_flow_sensor1.port_b, TeslaValve1.port_1) annotation(
    Line(points = {{-70, 34}, {-60, 34}}, color = {0, 127, 255}));
  connect(m_flow_sensor3.port_b, TeslaValve3.port_2) annotation(
    Line(points = {{-70, -36}, {-60, -36}}, color = {0, 127, 255}));
  connect(TeslaValve2.port_1, m_flow_sensor2.port_a) annotation(
    Line(points = {{60, 34}, {70, 34}}, color = {0, 127, 255}));
  connect(TeslaValve4.port_2, m_flow_sensor4.port_a) annotation(
    Line(points = {{60, -36}, {70, -36}}, color = {0, 127, 255}));
  connect(TeslaValve3.port_1, m_flow_sensor7.port_b) annotation(
    Line(points = {{-20, -36}, {0, -36}, {0, -70}}, color = {0, 127, 255}));
  connect(TeslaValve4.port_1, m_flow_sensor7.port_b) annotation(
    Line(points = {{20, -36}, {0, -36}, {0, -70}}, color = {0, 127, 255}));
  connect(m_flow_sensor2.port_b, m_flow_sensor5.port_a) annotation(
    Line(points = {{90, 34}, {94, 34}, {94, 0}, {110, 0}}, color = {0, 127, 255}));
  connect(m_flow_sensor5.port_a, m_flow_sensor4.port_b) annotation(
    Line(points = {{110, 0}, {94, 0}, {94, -36}, {90, -36}}, color = {0, 127, 255}));
  connect(m_flow_sensor.port_b, m_flow_sensor1.port_a) annotation(
    Line(points = {{-110, 0}, {-96, 0}, {-96, 34}, {-90, 34}}, color = {0, 127, 255}));
  connect(m_flow_sensor.port_b, m_flow_sensor3.port_a) annotation(
    Line(points = {{-110, 0}, {-96, 0}, {-96, -36}, {-90, -36}}, color = {0, 127, 255}));
  connect(boundary.ports[1], m_flow_sensor.port_a) annotation(
    Line(points = {{-160, 0}, {-130, 0}}, color = {0, 127, 255}));
  connect(m_flow_sensor5.port_b, boundary1.ports[1]) annotation(
    Line(points = {{130, 0}, {140, 0}}, color = {0, 127, 255}));
  connect(cosine.y, boundary.m_flow_in) annotation(
    Line(points = {{-190, 8}, {-180, 8}}, color = {0, 0, 127}));
  connect(m_flow_sensor6.port_b, m_flow_sensor8.port_a) annotation(
    Line(points = {{0, 90}, {194, 90}, {194, -20}}, color = {0, 127, 255}));
  connect(TeslaValve1.port_2, m_flow_sensor6.port_a) annotation(
    Line(points = {{-20, 34}, {0, 34}, {0, 70}}, color = {0, 127, 255}));
  connect(TeslaValve2.port_2, m_flow_sensor6.port_a) annotation(
    Line(points = {{20, 34}, {0, 34}, {0, 70}}, color = {0, 127, 255}));
  connect(m_flow_sensor7.port_a, m_flow_sensor8.port_b) annotation(
    Line(points = {{0, -90}, {194, -90}, {194, -40}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-05, Interval = 0.1),
    Diagram(coordinateSystem(extent = {{-200, -120}, {200, 120}})));
end RectifierByTeslaValves_01;
