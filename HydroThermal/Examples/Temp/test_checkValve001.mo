within FluidSystemComponents.HydroThermal.Examples.Temp;

model test_checkValve001
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 20, height = 49 * 101.3 * 1000, offset = 1 * 101.3 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.CheckValveSpringLoad_Linear checkValveSpringLoad_Linear1(redeclare package Medium = liquid1, deltapCrack = 20 * 101.3 * 1000, gradientQP = 0.001 * 1 / (10 * 1000)) annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 1 * 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(checkValveSpringLoad_Linear1.port_2, boundary1.ports[1]) annotation(
    Line(points = {{20, 30}, {30, 30}, {30, 30}, {30, 30}}, color = {0, 127, 255}));
  connect(boundary.ports[1], checkValveSpringLoad_Linear1.port_1) annotation(
    Line(points = {{-10, 30}, {0, 30}, {0, 30}, {0, 30}}, color = {0, 127, 255}));
  connect(ramp1.y, boundary.p_in) annotation(
    Line(points = {{-58, 30}, {-54, 30}, {-54, 38}, {-32, 38}, {-32, 38}}, color = {0, 0, 127}));
//--
  annotation(
    experiment(StartTime = 0, StopTime = 120, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end test_checkValve001;
