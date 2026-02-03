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
  parameter units.MassFlowRate Disp_m_flow_min= 0.5;
  parameter units.MassFlowRate Disp_m_flow_max= 2;
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {-152, 150}, extent = {{-10, -10}, {10, 10}})));
  MSLfluidWithVisualization.Sources.Boundary_pT boundary1(nPorts = 1, redeclare package Medium = liquid1, p(displayUnit = "kPa") = 1e5, valMin = Contour_pMin, valMax = Contour_pMax)  annotation(
    Placement(transformation(origin = {96, 80}, extent = {{20, -20}, {-20, 20}})));
  MSLfluidWithVisualization.Sources.MassFlowSource_T boundary(redeclare package Medium = liquid1, m_flow = 1, T = 363.15, switchUnitP = FluidSystemComponents.Visualizers.Types.SwitchUnitVisPressure.kPa, valMin = Contour_pMin, valMax = Contour_pMax, nPorts = 1)  annotation(
    Placement(transformation(origin = {-134, 80}, extent = {{-20, -20}, {20, 20}})));
  MSLfluidWithVisualization.Vessels.ClosedVolume volume(nPorts = 2, valMin = Contour_pMin, valMax = Contour_pMax, redeclare package Medium = liquid1, use_portsData = false, use_HeatTransfer = true, V = 0.1, T_start = 368.15)  annotation(
    Placement(transformation(origin = {-70, 90}, extent = {{-20, -20}, {20, 20}})));
  MSLfluidWithVisualization.Fittings.SimpleGenericOrifice restriction(valMin = Contour_pMin, valMax = Contour_pMax, redeclare package Medium = liquid1, diameter = 0.1, zeta = 0.01)  annotation(
    Placement(transformation(origin = {-30, 80}, extent = {{-12, -10}, {12, 10}})));
  FluidSystemComponents.MSLfluidWithVisualization.Vessels.ClosedVolume volume1(redeclare package Medium = liquid1, V = 0.1, nPorts = 2, use_HeatTransfer = false, use_portsData = false, valMax = Contour_pMax, valMin = Contour_pMin, T_start = 368.15) annotation(
    Placement(transformation(origin = {6, 90}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow(Q_flow = 1e6)  annotation(
    Placement(transformation(origin = {-118, 150}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.MSLfluidWithVisualization.Fittings.SimpleGenericOrifice restriction1(redeclare package Medium = liquid1, diameter = 0.02, valMax = Contour_pMax, valMin = Contour_pMin, zeta = 1) annotation(
    Placement(transformation(origin = {48, 80}, extent = {{-12, -10}, {12, 10}})));
equation
  connect(boundary.ports[1], volume.ports[1]) annotation(
    Line(points = {{-124, 80}, {-70, 80}}, color = {0, 127, 255}));
  connect(volume.ports[2], restriction.port_a) annotation(
    Line(points = {{-70, 80}, {-40, 80}}, color = {0, 127, 255}));
  connect(restriction.port_b, volume1.ports[1]) annotation(
    Line(points = {{-20, 80}, {6, 80}}, color = {0, 127, 255}));
  connect(fixedHeatFlow.port, volume.heatPort) annotation(
    Line(points = {{-108, 150}, {-80, 150}, {-80, 90}}, color = {191, 0, 0}));
  connect(volume1.ports[2], restriction1.port_a) annotation(
    Line(points = {{6, 80}, {38, 80}}, color = {0, 127, 255}));
  connect(restriction1.port_b, boundary1.ports[1]) annotation(
    Line(points = {{58, 80}, {86, 80}}, color = {0, 127, 255}));

annotation(
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, preserveAspectRatio = false)),
  experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.05));
end BoilingWater;
