within FluidSystemComponents.CommonAnyFluid.Examples.EngineeringStudies;

model RectifierByTeslaValves_02
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
  parameter Real glb_diodicity = 1.5;
  parameter Real glb_zeta_teslaValve = 1;
  parameter Modelica.Units.SI.Area glb_area_teslaValve = 0.1^2*Modelica.Constants.pi/4;
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {-190, 50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 288.15, nPorts = 1, p = 100*1000, use_T_in = false, use_p_in = false) annotation(
    Placement(transformation(origin = {150, 0}, extent = {{10, -10}, {-10, 10}})));
  CommonAnyFluid.Components.TeslaValveConstantZeta00 TeslaValve1(redeclare package Medium = fluid1, Amech_par = glb_area_teslaValve, diodicity_par = glb_diodicity, zeta_forward_par = glb_zeta_teslaValve) annotation(
    Placement(transformation(origin = {-40, 51}, extent = {{-20, -9}, {20, 9}})));
  Sensor.MonitorMassFlow00 m_flow_sensor(redeclare package Medium = fluid1, m_flow_Min = m_flow_arrow_min, m_flow_Max = m_flow_arrow_max) annotation(
    Placement(transformation(origin = {-120, 0}, extent = {{-10, -6}, {10, 6}})));
  CommonAnyFluid.Components.TeslaValveConstantZeta00 TeslaValve2(Amech_par = glb_area_teslaValve, redeclare package Medium = fluid1, diodicity_par = glb_diodicity, zeta_forward_par = glb_zeta_teslaValve) annotation(
    Placement(transformation(origin = {40, 51}, extent = {{20, -9}, {-20, 9}})));
  CommonAnyFluid.Components.TeslaValveConstantZeta00 TeslaValve4(Amech_par = glb_area_teslaValve, redeclare package Medium = fluid1, diodicity_par = glb_diodicity, zeta_forward_par = glb_zeta_teslaValve) annotation(
    Placement(transformation(origin = {40, -31}, extent = {{-20, -9}, {20, 9}})));
  CommonAnyFluid.Components.TeslaValveConstantZeta00 TeslaValve3(Amech_par = glb_area_teslaValve, redeclare package Medium = fluid1, diodicity_par = glb_diodicity, zeta_forward_par = glb_zeta_teslaValve) annotation(
    Placement(transformation(origin = {-40, -31}, extent = {{20, -9}, {-20, 9}})));
  Sensor.MonitorMassFlow00 m_flow_sensor1(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {-80, 46}, extent = {{-10, -6}, {10, 6}})));
  Sensor.MonitorMassFlow00 m_flow_sensor2(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {80, 46}, extent = {{-10, -6}, {10, 6}})));
  Sensor.MonitorMassFlow00 m_flow_sensor3(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {-80, -36}, extent = {{-10, -6}, {10, 6}})));
  Sensor.MonitorMassFlow00 m_flow_sensor4(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {80, -36}, extent = {{-10, -6}, {10, 6}})));
  Sensor.MonitorMassFlow00 m_flow_sensor5(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {120, 0}, extent = {{-10, -6}, {10, 6}})));
  Sensor.MonitorMassFlow00 m_flow_sensor6(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {0, 90}, extent = {{-10, -6}, {10, 6}}, rotation = 90)));
  Sensor.MonitorMassFlow00 m_flow_sensor7(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {0, -80}, extent = {{-10, -6}, {10, 6}}, rotation = 90)));
  Sensor.MonitorMassFlow00 m_flow_sensor8(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {194, -30}, extent = {{-10, -6}, {10, 6}}, rotation = -90)));
  Modelica.Blocks.Sources.Cosine cosine(amplitude = 20*1000, f = 0.1, offset = 100*1000) annotation(
    Placement(transformation(origin = {-195, 8}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 288.15, nPorts = 1, p = 100*1000, use_T_in = false, use_p_in = true) annotation(
    Placement(transformation(origin = {-160, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -0)));
  FluidSystemComponents.CommonAnyFluid.Components.ClosedVolumeColorP volume6(redeclare package Medium = fluid1, V = 0.001, valMin = p_contour_min, valMax = p_contour_max, nPorts = 3)  annotation(
    Placement(transformation(origin = {0, 56}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.CommonAnyFluid.Components.ClosedVolumeColorP volume7(redeclare package Medium = fluid1, V = 0.001, valMax = p_contour_max, valMin = p_contour_min, nPorts = 3) annotation(
    Placement(transformation(origin = {0, -26}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.CommonAnyFluid.Components.ClosedVolumeColorP volume(redeclare package Medium = fluid1, V = 0.001, nPorts = 3, valMax = p_contour_max, valMin = p_contour_min) annotation(
    Placement(transformation(origin = {-96, 10}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.CommonAnyFluid.Components.ClosedVolumeColorP volume5(redeclare package Medium = fluid1, V = 0.001, nPorts = 3, valMax = p_contour_max, valMin = p_contour_min) annotation(
    Placement(transformation(origin = {96, 10}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(m_flow_sensor1.port_b, TeslaValve1.port_1) annotation(
    Line(points = {{-70, 46}, {-60, 46}}, color = {0, 127, 255}));
  connect(m_flow_sensor3.port_b, TeslaValve3.port_2) annotation(
    Line(points = {{-70, -36}, {-60, -36}}, color = {0, 127, 255}));
  connect(TeslaValve2.port_1, m_flow_sensor2.port_a) annotation(
    Line(points = {{60, 46}, {70, 46}}, color = {0, 127, 255}));
  connect(TeslaValve4.port_2, m_flow_sensor4.port_a) annotation(
    Line(points = {{60, -36}, {70, -36}}, color = {0, 127, 255}));
  connect(m_flow_sensor5.port_b, boundary1.ports[1]) annotation(
    Line(points = {{130, 0}, {140, 0}}, color = {0, 127, 255}));
  connect(m_flow_sensor6.port_b, m_flow_sensor8.port_a) annotation(
    Line(points = {{0, 100}, {194, 100}, {194, -20}}, color = {0, 127, 255}));
  connect(m_flow_sensor7.port_a, m_flow_sensor8.port_b) annotation(
    Line(points = {{0, -90}, {194, -90}, {194, -40}}, color = {0, 127, 255}));
  connect(m_flow_sensor.port_a, boundary.ports[1]) annotation(
    Line(points = {{-130, 0}, {-150, 0}}, color = {0, 127, 255}));
  connect(cosine.y, boundary.p_in) annotation(
    Line(points = {{-190, 8}, {-172, 8}}, color = {0, 0, 127}));
  connect(TeslaValve1.port_2, volume6.ports[1]) annotation(
    Line(points = {{-20, 46}, {0, 46}}, color = {0, 127, 255}));
  connect(TeslaValve2.port_2, volume6.ports[2]) annotation(
    Line(points = {{20, 46}, {0, 46}}, color = {0, 127, 255}));
  connect(m_flow_sensor6.port_a, volume6.ports[3]) annotation(
    Line(points = {{0, 80}, {0, 46}}, color = {0, 127, 255}));
  connect(TeslaValve3.port_1, volume7.ports[1]) annotation(
    Line(points = {{-20, -36}, {0, -36}}, color = {0, 127, 255}));
  connect(TeslaValve4.port_1, volume7.ports[2]) annotation(
    Line(points = {{20, -36}, {0, -36}}, color = {0, 127, 255}));
  connect(m_flow_sensor7.port_b, volume7.ports[3]) annotation(
    Line(points = {{0, -70}, {0, -36}}, color = {0, 127, 255}));
  connect(m_flow_sensor.port_b, volume.ports[1]) annotation(
    Line(points = {{-110, 0}, {-96, 0}}, color = {0, 127, 255}));
  connect(m_flow_sensor1.port_a, volume.ports[2]) annotation(
    Line(points = {{-90, 46}, {-96, 46}, {-96, 0}}, color = {0, 127, 255}));
  connect(m_flow_sensor3.port_a, volume.ports[3]) annotation(
    Line(points = {{-90, -36}, {-96, -36}, {-96, 0}}, color = {0, 127, 255}));
  connect(m_flow_sensor2.port_b, volume5.ports[1]) annotation(
    Line(points = {{90, 46}, {96, 46}, {96, 0}}, color = {0, 127, 255}));
  connect(m_flow_sensor5.port_a, volume5.ports[2]) annotation(
    Line(points = {{110, 0}, {96, 0}}, color = {0, 127, 255}));
  connect(m_flow_sensor4.port_b, volume5.ports[3]) annotation(
    Line(points = {{90, -36}, {96, -36}, {96, 0}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-05, Interval = 0.1),
    Diagram(coordinateSystem(extent = {{-200, -120}, {200, 120}})));
end RectifierByTeslaValves_02;
