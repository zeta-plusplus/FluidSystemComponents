within FluidSystemComponents.HydroThermal.Examples.Temp;

model test_DirValve_4ports3positions001
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  // redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.DirValve_4ports3positions dirValve_4ports3positions1(redeclare package Medium = liquid1, dp_nominal(displayUnit = "Pa") = 10 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {1.22125e-15, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.CheckValveSpringLoad_Linear checkValveSpringLoad_Linear1(redeclare package Medium = liquid1, deltapCrack = 10 * 1000) annotation(
    Placement(visible = true, transformation(origin = {10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 2 * 101.3 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {-20, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 2 * 101.3 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {20, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = liquid1, T = 288.15, nPorts = 2, p = 101.3 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = liquid1, V = 0.01,nPorts = 3, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {-30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.IntegerStep integerStep1(height = -1, offset = 0, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {50, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1,T = 288.15, nPorts = 1, p = 5 *101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-20, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(boundary.ports[1], volume.ports[1]) annotation(
    Line(points = {{-20, -60}, {-20, -60}, {-20, -40}, {-20, -40}}, color = {0, 127, 255}, thickness = 0.5));
  connect(dirValve_4ports3positions1.u_ctrl, integerStep1.y) annotation(
    Line(points = {{20, 20}, {40, 20}, {40, 20}, {38, 20}}, color = {255, 127, 0}));
  connect(boundary2.ports[1], dirValve_4ports3positions1.port_4) annotation(
    Line(points = {{20, 60}, {20, 60}, {20, 40}, {20, 40}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], dirValve_4ports3positions1.port_3) annotation(
    Line(points = {{-20, 60}, {-20, 60}, {-20, 40}, {-20, 40}}, color = {0, 127, 255}));
  connect(checkValveSpringLoad_Linear1.port_2, boundary3.ports[2]) annotation(
    Line(points = {{20, -40}, {50, -40}, {50, -60}, {50, -60}}, color = {0, 127, 255}));
  connect(dirValve_4ports3positions1.port_2, boundary3.ports[1]) annotation(
    Line(points = {{20, 0}, {20, 0}, {20, -18}, {50, -18}, {50, -60}, {50, -60}}, color = {0, 127, 255}));
  connect(volume.ports[3], checkValveSpringLoad_Linear1.port_1) annotation(
    Line(points = {{-20, -40}, {0, -40}}, color = {0, 127, 255}));
  connect(volume.ports[2], dirValve_4ports3positions1.port_1) annotation(
    Line(points = {{-20, -40}, {-20, 0}}, color = {0, 127, 255}));
annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-6, Interval = 0.05),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));end test_DirValve_4ports3positions001;
