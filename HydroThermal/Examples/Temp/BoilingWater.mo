within FluidSystemComponents.HydroThermal.Examples.Temp;

model BoilingWater
  extends Modelica.Icons.Example;
  //----------
  import units=Modelica.Units.SI;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWater;
  //redeclare package Medium = liquid1
  //----------
  parameter units.Pressure Contour_pMin(displayUnit = "kPa") = 8e4;
  parameter units.Pressure Contour_pMax(displayUnit = "kPa") = 5e5;
  parameter units.Temperature Contour_Tmin= 273.15;
  parameter units.Temperature Contour_Tmax= 423.15; 
  parameter units.MassFlowRate Disp_m_flow_min= 0.5;
  parameter units.MassFlowRate Disp_m_flow_max= 2;
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {-108, 184}, extent = {{-10, -10}, {10, 10}})));
  MSLfluidWithVisualization.Sources.Boundary_pT boundary1(nPorts = 1, redeclare package Medium = liquid1, p(displayUnit = "kPa") = 1e5, valMin = Contour_pMin, valMax = Contour_pMax)  annotation(
    Placement(transformation(origin = {204, 80}, extent = {{20, -20}, {-20, 20}})));
  MSLfluidWithVisualization.Sources.MassFlowSource_T boundary(redeclare package Medium = liquid1, m_flow = 1, T = 363.15, switchUnitP = FluidSystemComponents.Visualizers.Types.SwitchUnitVisPressure.kPa, valMin = Contour_pMin, valMax = Contour_pMax, nPorts = 1)  annotation(
    Placement(transformation(origin = {-178, 80}, extent = {{-20, -20}, {20, 20}})));
  MSLfluidWithVisualization.Vessels.ClosedVolume volume(nPorts = 3, valMin = Contour_pMin, valMax = Contour_pMax, redeclare package Medium = liquid1, use_portsData = false, use_HeatTransfer = false, V = 0.1, T_start = 368.15)  annotation(
    Placement(transformation(origin = {-134, 90}, extent = {{-20, -20}, {20, 20}})));
  MSLfluidWithVisualization.Fittings.SimpleGenericOrifice restriction(valMin = Contour_pMin, valMax = Contour_pMax, redeclare package Medium = liquid1, diameter = 0.1, zeta = 0.01)  annotation(
    Placement(transformation(origin = {-94, 80}, extent = {{-12, -10}, {12, 10}})));
  FluidSystemComponents.MSLfluidWithVisualization.Vessels.ClosedVolume volume1(redeclare package Medium = liquid1, V = 0.1, nPorts = 3, use_HeatTransfer = true, use_portsData = false, valMax = Contour_pMax, valMin = Contour_pMin, T_start = 368.15) annotation(
    Placement(transformation(origin = {-52, 90}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow(Q_flow = 1e6)  annotation(
    Placement(transformation(origin = {-142, 150}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.MSLfluidWithVisualization.Fittings.SimpleGenericOrifice restriction1(redeclare package Medium = liquid1, diameter = 0.1, valMax = Contour_pMax, valMin = Contour_pMin, zeta = 0.01) annotation(
    Placement(transformation(origin = {-10, 80}, extent = {{-12, -10}, {12, 10}})));
  FluidSystemComponents.MSLfluidWithVisualization.Vessels.ClosedVolume volume2(redeclare package Medium = liquid1, T_start = 368.15, V = 0.1, nPorts = 3, use_HeatTransfer = true, use_portsData = false, valMax = Contour_pMax, valMin = Contour_pMin) annotation(
    Placement(transformation(origin = {32, 90}, extent = {{-20, -20}, {20, 20}})));
  FluidSystemComponents.MSLfluidWithVisualization.Vessels.ClosedVolume volume3(redeclare package Medium = liquid1, T_start = 368.15, V = 0.1, nPorts = 3, use_HeatTransfer = true, use_portsData = false, valMax = Contour_pMax, valMin = Contour_pMin) annotation(
    Placement(transformation(origin = {108, 90}, extent = {{-20, -20}, {20, 20}})));
  FluidSystemComponents.MSLfluidWithVisualization.Fittings.SimpleGenericOrifice restriction2(redeclare package Medium = liquid1, diameter = 0.1, valMax = Contour_pMax, valMin = Contour_pMin, zeta = 0.01) annotation(
    Placement(transformation(origin = {68, 80}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector thermalCollector annotation(
    Placement(transformation(origin = {-84, 150}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.MSLfluidWithVisualization.Fittings.SimpleGenericOrifice restriction_end(redeclare package Medium = liquid1, diameter = 0.01, valMax = Contour_pMax, valMin = Contour_pMin, zeta = 1) annotation(
    Placement(transformation(origin = {164, 80}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(transformation(origin = {-62, 126}, extent = {{-6, 6}, {6, -6}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue Q_flow_vol1_disp(significantDigits = 4)  annotation(
    Placement(transformation(origin = {-40, 126}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor2 annotation(
    Placement(transformation(origin = {22, 126}, extent = {{-6, 6}, {6, -6}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue Q_flow_vol2_disp(significantDigits = 4) annotation(
    Placement(transformation(origin = {44, 126}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor3 annotation(
    Placement(transformation(origin = {98, 126}, extent = {{-6, 6}, {6, -6}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue Q_flow_vol3_disp(significantDigits = 4) annotation(
    Placement(transformation(origin = {120, 126}, extent = {{-10, -10}, {10, 10}})));
  Sensor.TemperatureDispColor00 Temperature(redeclare package Medium = liquid1, valMin = Contour_Tmin, valMax = Contour_Tmax)  annotation(
    Placement(transformation(origin = {-136, 58}, extent = {{-10, -4}, {10, 4}})));
  FluidSystemComponents.Sensor.TemperatureDispColor00 Temperature1(redeclare package Medium = liquid1, valMax = Contour_Tmax, valMin = Contour_Tmin) annotation(
    Placement(transformation(origin = {-56, 58}, extent = {{-10, -4}, {10, 4}})));
  FluidSystemComponents.Sensor.TemperatureDispColor00 Temperature2(redeclare package Medium = liquid1, valMax = Contour_Tmax, valMin = Contour_Tmin) annotation(
    Placement(transformation(origin = {30, 58}, extent = {{-10, -4}, {10, 4}})));
  FluidSystemComponents.Sensor.TemperatureDispColor00 Temperature3(redeclare package Medium = liquid1, valMax = Contour_Tmax, valMin = Contour_Tmin) annotation(
    Placement(transformation(origin = {106, 58}, extent = {{-10, -4}, {10, 4}})));
equation
  connect(boundary.ports[1], volume.ports[1]) annotation(
    Line(points = {{-168, 80}, {-134, 80}}, color = {0, 127, 255}));
  connect(restriction.port_a, volume.ports[2]) annotation(
    Line(points = {{-104, 80}, {-134, 80}}, color = {0, 127, 255}));
  connect(restriction.port_b, volume1.ports[1]) annotation(
    Line(points = {{-84, 80}, {-52, 80}}, color = {0, 127, 255}));
  connect(restriction1.port_a, volume1.ports[2]) annotation(
    Line(points = {{-20, 80}, {-52, 80}}, color = {0, 127, 255}));
  connect(restriction1.port_b, volume2.ports[1]) annotation(
    Line(points = {{0, 80}, {32, 80}}, color = {0, 127, 255}));
  connect(restriction2.port_a, volume2.ports[2]) annotation(
    Line(points = {{58, 80}, {32, 80}}, color = {0, 127, 255}));
  connect(restriction2.port_b, volume3.ports[1]) annotation(
    Line(points = {{78, 80}, {108, 80}}, color = {0, 127, 255}));
  connect(fixedHeatFlow.port, thermalCollector.port_b) annotation(
    Line(points = {{-132, 150}, {-94, 150}}, color = {191, 0, 0}));
  connect(volume3.ports[2], restriction_end.port_a) annotation(
    Line(points = {{108, 80}, {154, 80}}, color = {0, 127, 255}));
  connect(restriction_end.port_b, boundary1.ports[1]) annotation(
    Line(points = {{174, 80}, {194, 80}}, color = {0, 127, 255}));
  connect(heatFlowSensor1.Q_flow, Q_flow_vol1_disp.numberPort) annotation(
    Line(points = {{-55, 126}, {-51.5, 126}}, color = {0, 0, 127}));
  connect(heatFlowSensor2.Q_flow, Q_flow_vol2_disp.numberPort) annotation(
    Line(points = {{29, 126}, {32.5, 126}}, color = {0, 0, 127}));
  connect(heatFlowSensor3.Q_flow, Q_flow_vol3_disp.numberPort) annotation(
    Line(points = {{105, 126}, {108.5, 126}}, color = {0, 0, 127}));
  connect(Temperature.port, volume.ports[3]) annotation(
    Line(points = {{-146, 58}, {-146, 80}, {-134, 80}}, color = {0, 127, 255}));
  connect(Temperature1.port, volume1.ports[3]) annotation(
    Line(points = {{-66, 58}, {-66, 80}, {-52, 80}}, color = {0, 127, 255}));
  connect(Temperature2.port, volume2.ports[3]) annotation(
    Line(points = {{20, 58}, {20, 80}, {32, 80}}, color = {0, 127, 255}));
  connect(Temperature3.port, volume3.ports[3]) annotation(
    Line(points = {{96, 58}, {96, 80}, {108, 80}}, color = {0, 127, 255}));
  connect(thermalCollector.port_a[1], heatFlowSensor1.port_a) annotation(
    Line(points = {{-74, 150}, {-62, 150}, {-62, 132}}, color = {191, 0, 0}));
  connect(heatFlowSensor1.port_b, volume1.heatPort) annotation(
    Line(points = {{-62, 120}, {-62, 90}}, color = {191, 0, 0}));
  connect(thermalCollector.port_a[2], heatFlowSensor2.port_a) annotation(
    Line(points = {{-74, 150}, {22, 150}, {22, 132}}, color = {191, 0, 0}));
  connect(heatFlowSensor2.port_b, volume2.heatPort) annotation(
    Line(points = {{22, 120}, {22, 90}}, color = {191, 0, 0}));
  connect(thermalCollector.port_a[3], heatFlowSensor3.port_a) annotation(
    Line(points = {{-74, 150}, {98, 150}, {98, 132}}, color = {191, 0, 0}));
  connect(heatFlowSensor3.port_b, volume3.heatPort) annotation(
    Line(points = {{98, 120}, {98, 90}}, color = {191, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -200}, {240, 200}}, preserveAspectRatio = false)),
  experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.02));
end BoilingWater;
