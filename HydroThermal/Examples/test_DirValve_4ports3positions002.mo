within FluidSystemComponents.HydroThermal.Examples;

model test_DirValve_4ports3positions002
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  // redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.DirValve_4ports3positions dirValve_4ports3positions1(redeclare package Medium = liquid1, dp_nominal(displayUnit = "Pa") = 5 * 1000, m_flow_nominal = 0.1) annotation(
    Placement(visible = true, transformation(origin = {8.88178e-16, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.CheckValveSpringLoad_Linear checkValveSpringLoad_Linear1(redeclare package Medium = liquid1, deltapCrack = 5 * 101.3 * 1000, gradientQP = 0.001 * 50 / (100 * 1000)) annotation(
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 2 *101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-20, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 2 * 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {20, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = liquid1, V = 0.01, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, T = 288.15, nPorts = 3, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-20, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.HydroThermal.Components.PumpConstQflow_ideal pumpConstQflow_ideal1(redeclare package Medium = liquid1, qFlowDes = 0.01) annotation(
    Placement(visible = true, transformation(origin = {-20, -70}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 10000) annotation(
    Placement(visible = true, transformation(origin = {-80, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.IntegerStep integerStep1(height = 1, offset = 0, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {50, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(dirValve_4ports3positions1.u_ctrl, integerStep1.y) annotation(
    Line(points = {{20, 20}, {38, 20}}, color = {255, 127, 0}));
  connect(boundary2.ports[1], dirValve_4ports3positions1.port_4) annotation(
    Line(points = {{20, 60}, {20, 50}, {16, 50}, {16, 40}}, color = {0, 127, 255}));
  connect(const.y, speed1.w_ref) annotation(
    Line(points = {{-69, -70}, {-62, -70}}, color = {0, 0, 127}));
  connect(volume.ports[2], dirValve_4ports3positions1.port_1) annotation(
    Line(points = {{-20, -40}, {-20, -21}, {-16, -21}, {-16, 0}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], dirValve_4ports3positions1.port_3) annotation(
    Line(points = {{-20, 60}, {-20, 49}, {-16, 49}, {-16, 40}}, color = {0, 127, 255}));
  connect(dirValve_4ports3positions1.port_2, boundary.ports[3]) annotation(
    Line(points = {{16, 0}, {16, -90}, {-20, -90}}, color = {0, 127, 255}));
  connect(speed1.flange, pumpConstQflow_ideal1.flange_1) annotation(
    Line(points = {{-40, -70}, {-30, -70}, {-30, -70}, {-30, -70}}));
  connect(checkValveSpringLoad_Linear1.port_2, boundary.ports[2]) annotation(
    Line(points = {{10, -40}, {14, -40}, {14, -88}, {-20, -88}, {-20, -90}}, color = {0, 127, 255}));
  connect(volume.ports[3], checkValveSpringLoad_Linear1.port_1) annotation(
    Line(points = {{-20, -40}, {-10, -40}}, color = {0, 127, 255}));
  connect(pumpConstQflow_ideal1.port_2, volume.ports[1]) annotation(
    Line(points = {{-20, -60}, {-20, -60}, {-20, -40}, {-20, -40}}, color = {0, 127, 255}));
  connect(boundary.ports[1], pumpConstQflow_ideal1.port_1) annotation(
    Line(points = {{-20, -90}, {-20, -90}, {-20, -80}, {-20, -80}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.05),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-100, -120}, {100, 100}})),
    Icon(coordinateSystem(extent = {{-100, -140}, {100, 100}})),
    __OpenModelica_commandLineOptions = "");
end test_DirValve_4ports3positions002;
