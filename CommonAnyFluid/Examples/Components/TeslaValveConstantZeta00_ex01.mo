within FluidSystemComponents.CommonAnyFluid.Examples.Components;

model TeslaValveConstantZeta00_ex01
  extends Modelica.Icons.Example;
  //-----
  //package fluid1 = Modelica.Media.Water.StandardWater;
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //-----
  parameter Modelica.Units.SI.Pressure p_contour_min = 1*1000;
  parameter Modelica.Units.SI.Pressure p_contour_max = 150*1000;
  parameter Modelica.Units.SI.MassFlowRate m_flow_arrow_min = -2;
  parameter Modelica.Units.SI.MassFlowRate m_flow_arrow_max = 2;
  //-----
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 288.15, nPorts = 1, p = 5*101.325*1000, use_T_in = false, use_p_in = true) annotation(
    Placement(transformation(origin = {-60, 50}, extent = {{-10, -10}, {10, 10}})));
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 10, height = (0.8 - 1.2)*100*1000, offset = 1.2*100*1000, startTime = 10) annotation(
    Placement(transformation(origin = {-90, 58}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 288.15, nPorts = 1, p = 100*1000, use_T_in = false, use_p_in = false) annotation(
    Placement(transformation(origin = {110, 50}, extent = {{10, -10}, {-10, 10}})));
  CommonAnyFluid.Components.TeslaValveConstantZeta00 TeslaValve(redeclare package Medium = fluid1, Amech_par = 0.1^2*Modelica.Constants.pi/4) annotation(
    Placement(transformation(origin = {40, 55}, extent = {{-20, -9}, {20, 9}})));
  Sensor.PressureDispColor00 Pressure(redeclare package Medium = fluid1, valMin = p_contour_min, valMax = p_contour_max) annotation(
    Placement(transformation(origin = {-30, 52}, extent = {{-10, -10}, {10, 10}})));
  Sensor.MonitorMassFlow00 m_flow_sensor(redeclare package Medium = fluid1, m_flow_Min = m_flow_arrow_min, m_flow_Max = m_flow_arrow_max) annotation(
    Placement(transformation(origin = {0, 50}, extent = {{-10, -6}, {10, 6}})));
  Sensor.PressureDispColor00 Pressure1(redeclare package Medium = fluid1, valMin = p_contour_min, valMax = p_contour_max) annotation(
    Placement(transformation(origin = {80, 52}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = fluid1, T = 288.15, nPorts = 2, p = 120*1000, use_T_in = false, use_p_in = false) annotation(
    Placement(transformation(origin = {-60, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = fluid1, T = 288.15, nPorts = 2, p = 100*1000, use_T_in = false, use_p_in = false) annotation(
    Placement(transformation(origin = {110, 10}, extent = {{10, -10}, {-10, 10}})));
  CommonAnyFluid.Components.TeslaValveConstantZeta00 TeslaValve1(Amech_par = 0.1^2*Modelica.Constants.pi/4, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {40, 15}, extent = {{-20, -9}, {20, 9}})));
  Sensor.PressureDispColor00 Pressure2(redeclare package Medium = fluid1, valMax = p_contour_max, valMin = p_contour_min) annotation(
    Placement(transformation(origin = {-30, 12}, extent = {{-10, -10}, {10, 10}})));
  Sensor.MonitorMassFlow00 m_flow_sensor1(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {0, 10}, extent = {{-10, -6}, {10, 6}})));
  Sensor.PressureDispColor00 Pressure3(redeclare package Medium = fluid1, valMax = p_contour_max, valMin = p_contour_min) annotation(
    Placement(transformation(origin = {80, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary4(redeclare package Medium = fluid1, T = 288.15, nPorts = 2, p = 80*1000, use_T_in = false, use_p_in = false) annotation(
    Placement(transformation(origin = {-60, -70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary5(redeclare package Medium = fluid1, T = 288.15, nPorts = 2, p = 100*1000, use_T_in = false, use_p_in = false) annotation(
    Placement(transformation(origin = {110, -70}, extent = {{10, -10}, {-10, 10}})));
  Sensor.PressureDispColor00 Pressure4(redeclare package Medium = fluid1, valMax = p_contour_max, valMin = p_contour_min) annotation(
    Placement(transformation(origin = {-30, -68}, extent = {{-10, -10}, {10, 10}})));
  Sensor.MonitorMassFlow00 m_flow_sensor2(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {0, -70}, extent = {{-10, -6}, {10, 6}})));
  Sensor.PressureDispColor00 Pressure5(redeclare package Medium = fluid1, valMax = p_contour_max, valMin = p_contour_min) annotation(
    Placement(transformation(origin = {80, -68}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.TeslaValveConstantZeta00 TeslaValve2(Amech_par = 0.1^2*Modelica.Constants.pi/4, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {40, -65}, extent = {{-20, -9}, {20, 9}})));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(diameter = 0.1, zeta = 1, redeclare package Medium = fluid1)  annotation(
    Placement(transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.Sensor.MonitorMassFlow00 m_flow_sensor3(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {0, -20}, extent = {{-10, -6}, {10, 6}})));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice1(redeclare package Medium = fluid1, diameter = 0.1, zeta = 1.5) annotation(
    Placement(transformation(origin = {30, -100}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.Sensor.MonitorMassFlow00 m_flow_sensor4(redeclare package Medium = fluid1, m_flow_Max = m_flow_arrow_max, m_flow_Min = m_flow_arrow_min) annotation(
    Placement(transformation(origin = {0, -100}, extent = {{-10, -6}, {10, 6}})));
equation
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{-79, 58}, {-72, 58}}, color = {0, 0, 127}));
  connect(Pressure.port, m_flow_sensor.port_a) annotation(
    Line(points = {{-40, 52}, {-25, 52}, {-25, 50}, {-10, 50}}, color = {0, 127, 255}));
  connect(m_flow_sensor.port_b, TeslaValve.port_1) annotation(
    Line(points = {{10, 50}, {20, 50}}, color = {0, 127, 255}));
  connect(TeslaValve.port_2, Pressure1.port) annotation(
    Line(points = {{60, 50}, {65, 50}, {65, 52}, {70, 52}}, color = {0, 127, 255}));
  connect(TeslaValve.port_2, boundary1.ports[1]) annotation(
    Line(points = {{60, 50}, {100, 50}}, color = {0, 127, 255}));
  connect(boundary.ports[1], m_flow_sensor.port_a) annotation(
    Line(points = {{-50, 50}, {-10, 50}}, color = {0, 127, 255}));
  connect(boundary2.ports[1], m_flow_sensor1.port_a) annotation(
    Line(points = {{-50, 10}, {-10, 10}}, color = {0, 127, 255}));
  connect(TeslaValve1.port_1, m_flow_sensor1.port_b) annotation(
    Line(points = {{20, 10}, {10, 10}}, color = {0, 127, 255}));
  connect(TeslaValve1.port_2, boundary3.ports[1]) annotation(
    Line(points = {{60, 10}, {100, 10}}, color = {0, 127, 255}));
  connect(TeslaValve1.port_2, Pressure3.port) annotation(
    Line(points = {{60, 10}, {65, 10}, {65, 12}, {70, 12}}, color = {0, 127, 255}));
  connect(boundary4.ports[1], m_flow_sensor2.port_a) annotation(
    Line(points = {{-50, -70}, {-10, -70}}, color = {0, 127, 255}));
  connect(m_flow_sensor2.port_b, TeslaValve2.port_1) annotation(
    Line(points = {{10, -70}, {20, -70}}, color = {0, 127, 255}));
  connect(TeslaValve2.port_2, boundary5.ports[1]) annotation(
    Line(points = {{60, -70}, {100, -70}}, color = {0, 127, 255}));
  connect(TeslaValve2.port_2, Pressure5.port) annotation(
    Line(points = {{60, -70}, {65, -70}, {65, -68}, {70, -68}}, color = {0, 127, 255}));
  connect(m_flow_sensor1.port_a, Pressure2.port) annotation(
    Line(points = {{-10, 10}, {-25, 10}, {-25, 12}, {-40, 12}}, color = {0, 127, 255}));
  connect(m_flow_sensor2.port_a, Pressure4.port) annotation(
    Line(points = {{-10, -70}, {-25, -70}, {-25, -68}, {-40, -68}}, color = {0, 127, 255}));
  connect(boundary2.ports[2], m_flow_sensor3.port_a) annotation(
    Line(points = {{-50, 10}, {-16, 10}, {-16, -20}, {-10, -20}}, color = {0, 127, 255}));
  connect(m_flow_sensor3.port_b, orifice.port_a) annotation(
    Line(points = {{10, -20}, {20, -20}}, color = {0, 127, 255}));
  connect(boundary3.ports[2], orifice.port_b) annotation(
    Line(points = {{100, 10}, {64, 10}, {64, -20}, {40, -20}}, color = {0, 127, 255}));
  connect(boundary4.ports[2], m_flow_sensor4.port_a) annotation(
    Line(points = {{-50, -70}, {-16, -70}, {-16, -100}, {-10, -100}}, color = {0, 127, 255}));
  connect(m_flow_sensor4.port_b, orifice1.port_a) annotation(
    Line(points = {{10, -100}, {20, -100}}, color = {0, 127, 255}));
  connect(boundary5.ports[2], orifice1.port_b) annotation(
    Line(points = {{100, -70}, {64, -70}, {64, -100}, {40, -100}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.01),
    Diagram(coordinateSystem(extent = {{-100, -120}, {120, 100}})));
end TeslaValveConstantZeta00_ex01;
