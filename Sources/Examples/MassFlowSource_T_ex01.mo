within FluidSystemComponents.Sources.Examples;

model MassFlowSource_T_ex01
  extends Modelica.Icons.Example;
  //-----
  package Fluid1 = Modelica.Media.Air.DryAirNasa;
  //package Fluid1 = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = Fluid1
  //-----
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Fluid1, diameter = 0.05, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Fluid1, nPorts = 2, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {110, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = Fluid1) annotation(
    Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow(duration = 10, height = 1.0, offset = 1.0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate2(redeclare package Medium = Fluid1) annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Fluid1, diameter = 0.05, length = 0.4) annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Fluid1) annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature1(redeclare package Medium = Fluid1) annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Sources.MassFlowSource_T boundary(redeclare package Medium = Fluid1, T = 288.15, nPorts = 2, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal1(redeclare package Medium = Fluid1) annotation(
    Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
equation
  connect(teeJunctionIdeal1.port_3, volumeFlowRate2.port_a) annotation(
    Line(points = {{-20, 10}, {-20, 10}, {-20, -20}, {0, -20}, {0, -20}}, color = {0, 127, 255}));
  connect(teeJunctionIdeal1.port_2, volumeFlowRate1.port_a) annotation(
    Line(points = {{-10, 20}, {0, 20}, {0, 20}, {0, 20}}, color = {0, 127, 255}));
  connect(boundary.ports[1], teeJunctionIdeal1.port_1) annotation(
    Line(points = {{-40, 20}, {-30, 20}, {-30, 20}, {-30, 20}}, color = {0, 127, 255}));
  connect(ramp_m_flow.y, boundary.m_flow_in) annotation(
    Line(points = {{-79, 28}, {-63, 28}, {-63, 28}, {-61, 28}}, color = {0, 0, 127}));
  connect(temperature1.port_b, pipe1.port_a) annotation(
    Line(points = {{50, -20}, {60, -20}, {60, -20}, {60, -20}}, color = {0, 127, 255}));
  connect(volumeFlowRate2.port_b, temperature1.port_a) annotation(
    Line(points = {{20, -20}, {30, -20}, {30, -20}, {30, -20}}, color = {0, 127, 255}));
  connect(temperature.port_b, pipe.port_a) annotation(
    Line(points = {{50, 20}, {60, 20}, {60, 20}, {60, 20}}, color = {0, 127, 255}));
  connect(volumeFlowRate1.port_b, temperature.port_a) annotation(
    Line(points = {{20, 20}, {30, 20}, {30, 20}, {30, 20}}, color = {0, 127, 255}));
  connect(pipe1.port_b, boundary1.ports[2]) annotation(
    Line(points = {{80, -20}, {86, -20}, {86, 20}, {100, 20}}, color = {0, 127, 255}));
  connect(pipe.port_b, boundary1.ports[1]) annotation(
    Line(points = {{80, 20}, {100, 20}, {100, 20}, {100, 20}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {120, 100}})),
    __OpenModelica_commandLineOptions = "");
end MassFlowSource_T_ex01;
