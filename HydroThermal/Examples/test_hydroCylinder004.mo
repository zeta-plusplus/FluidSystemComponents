within FluidSystemComponents.HydroThermal.Examples;

model test_hydroCylinder004
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  // redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-150, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.CheckValveSpringLoad_Linear checkValveSpringLoad_Linear1(redeclare package Medium = liquid1, deltapCrack = 10 * 100 * 1000, gradientQP = 0.001 * 50 / (100 * 1000)) annotation(
    Placement(visible = true, transformation(origin = {-50, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = liquid1, V = 0.01, nPorts = 3, p_start = 1 *101.3 * 1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-80, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, T = 288.15, nPorts = 3, p = 1.0 *101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.HydroThermal.Components.PumpConstQflow_ideal pumpConstQflow_ideal1(redeclare package Medium = liquid1, qFlowDes = 1 * 10 ^ (-6)) annotation(
    Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 10000) annotation(
    Placement(visible = true, transformation(origin = {-130, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.DirValve_4ports3positions dirValve_4ports3positions1(redeclare package Medium = liquid1, dp_nominal =  10 * 1000, m_flow_nominal = 0.01) annotation(
    Placement(visible = true, transformation(origin = {-40, 130}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.IntegerStep integerStep1(height = 1, offset = -1, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {7, 130}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.pistonCylinder pistonCylinder1(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {-40, 180}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(dirValve_4ports3positions1.port_3, pistonCylinder1.port_1) annotation(
    Line(points = {{-56, 150}, {-56, 160}}, color = {0, 127, 255}));
  connect(dirValve_4ports3positions1.port_4, pistonCylinder1.port_2) annotation(
    Line(points = {{-24, 150}, {-24, 160}}, color = {0, 127, 255}));
  connect(dirValve_4ports3positions1.port_2, boundary.ports[3]) annotation(
    Line(points = {{-24, 110}, {-24, 40}, {-70, 40}}, color = {0, 127, 255}));
  connect(dirValve_4ports3positions1.port_1, volume.ports[2]) annotation(
    Line(points = {{-56, 110}, {-56, 100}, {-70, 100}, {-70, 90}}, color = {0, 127, 255}));
  connect(dirValve_4ports3positions1.u_ctrl, integerStep1.y) annotation(
    Line(points = {{-20, 130}, {-1, 130}}, color = {255, 127, 0}));
  connect(const.y, speed1.w_ref) annotation(
    Line(points = {{-119, 60}, {-113, 60}}, color = {0, 0, 127}));
  connect(speed1.flange, pumpConstQflow_ideal1.flange_1) annotation(
    Line(points = {{-90, 60}, {-80, 60}}));
  connect(volume.ports[3], checkValveSpringLoad_Linear1.port_1) annotation(
    Line(points = {{-70, 90}, {-50, 90}}, color = {0, 127, 255}));
  connect(pumpConstQflow_ideal1.port_2, volume.ports[1]) annotation(
    Line(points = {{-70, 70}, {-70, 90}}, color = {0, 127, 255}));
  connect(boundary.ports[2], checkValveSpringLoad_Linear1.port_2) annotation(
    Line(points = {{-70, 40}, {-50, 40}, {-50, 70}}, color = {0, 127, 255}));
  connect(boundary.ports[1], pumpConstQflow_ideal1.port_1) annotation(
    Line(points = {{-70, 40}, {-70, 50}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 15, Tolerance = 1e-06, Interval = 0.03),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-160, -60}, {80, 200}}), graphics = {Text(origin = {-288, -361}, extent = {{-28, 9}, {92, -3}}, textString = "piston cylinder actuator", fontSize = 8, horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-100, -140}, {100, 100}})),
    __OpenModelica_commandLineOptions = "");
end test_hydroCylinder004;
