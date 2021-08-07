within FluidSystemComponents.Sources.Examples;

model VolumeFlowSource_T_ex01
  extends Modelica.Icons.Example;
  //-----
  package Fluid1 = Modelica.Media.Air.DryAirNasa;
  //package Fluid1 = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = Fluid1
  //-----
  FluidSystemComponents.Sources.VolumeFlowSource_T boundary(redeclare package Medium = Fluid1, T = 288.15, V_flow = 10 * 0.001, nPorts = 1, use_V_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Fluid1, diameter = 0.05, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Fluid1, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {130, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = Fluid1) annotation(
    Placement(visible = true, transformation(origin = {5, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_V_flow(duration = 10, height = 1.0, offset = 1.0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-130, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate2(redeclare package Medium = Fluid1) annotation(
    Placement(visible = true, transformation(origin = {5, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Fluid1, diameter = 0.05, length = 0.4) annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature1(redeclare package Medium = Fluid1) annotation(
    Placement(visible = true, transformation(origin = {25, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature2(redeclare package Medium = Fluid1) annotation(
    Placement(visible = true, transformation(origin = {25, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal1(redeclare package Medium = Fluid1) annotation(
    Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature0(redeclare package Medium = Fluid1) annotation(
    Placement(visible = true, transformation(origin = {-61, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate0(redeclare package Medium = Fluid1) annotation(
    Placement(visible = true, transformation(origin = {-75, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpyTwoPort specificEnthalpy0(redeclare package Medium = Fluid1) annotation(
    Placement(visible = true, transformation(origin = {-45, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpyTwoPort specificEnthalpy1(redeclare package Medium = Fluid1) annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpyTwoPort specificEnthalpy2(redeclare package Medium = Fluid1) annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpyTwoPort specificEnthalpy3(redeclare package Medium = Fluid1) annotation(
    Placement(visible = true, transformation(origin = {110, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature3(redeclare package Medium = Fluid1) annotation(
    Placement(visible = true, transformation(origin = {95, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
equation
  connect(specificEnthalpy1.port_b, pipe1.port_a) annotation(
    Line(points = {{45, 20}, {60, 20}}, color = {0, 127, 255}));
  connect(temperature1.port_b, specificEnthalpy1.port_a) annotation(
    Line(points = {{30, 20}, {35, 20}}, color = {0, 127, 255}));
  connect(pipe2.port_b, temperature3.port_a) annotation(
    Line(points = {{80, -20}, {84, -20}, {84, 20}, {90, 20}, {90, 20}}, color = {0, 127, 255}));
  connect(pipe1.port_b, temperature3.port_a) annotation(
    Line(points = {{80, 20}, {90, 20}, {90, 20}, {90, 20}}, color = {0, 127, 255}));
  connect(temperature3.port_b, specificEnthalpy3.port_a) annotation(
    Line(points = {{100, 20}, {106, 20}, {106, 20}, {106, 20}}, color = {0, 127, 255}));
  connect(specificEnthalpy3.port_b, boundary1.ports[1]) annotation(
    Line(points = {{116, 20}, {120, 20}, {120, 20}, {120, 20}}, color = {0, 127, 255}));
  connect(specificEnthalpy2.port_b, pipe2.port_a) annotation(
    Line(points = {{46, -20}, {60, -20}, {60, -20}, {60, -20}}, color = {0, 127, 255}));
  connect(temperature2.port_b, specificEnthalpy2.port_a) annotation(
    Line(points = {{30, -20}, {34, -20}, {34, -20}, {36, -20}}, color = {0, 127, 255}));
  connect(volumeFlowRate2.port_b, temperature2.port_a) annotation(
    Line(points = {{10, -20}, {20, -20}}, color = {0, 127, 255}));
  connect(specificEnthalpy0.port_b, teeJunctionIdeal1.port_1) annotation(
    Line(points = {{-40, 20}, {-30, 20}, {-30, 20}, {-30, 20}}, color = {0, 127, 255}));
  connect(temperature0.port_b, specificEnthalpy0.port_a) annotation(
    Line(points = {{-56, 20}, {-50, 20}, {-50, 20}, {-50, 20}}, color = {0, 127, 255}));
  connect(volumeFlowRate0.port_b, temperature0.port_a) annotation(
    Line(points = {{-70, 20}, {-66, 20}, {-66, 20}, {-66, 20}}, color = {0, 127, 255}));
  connect(boundary.ports[1], volumeFlowRate0.port_a) annotation(
    Line(points = {{-90, 20}, {-80, 20}, {-80, 20}, {-80, 20}}, color = {0, 127, 255}));
  connect(teeJunctionIdeal1.port_3, volumeFlowRate2.port_a) annotation(
    Line(points = {{-20, 10}, {-20, -20}, {0, -20}}, color = {0, 127, 255}));
  connect(volumeFlowRate1.port_b, temperature1.port_a) annotation(
    Line(points = {{10, 20}, {20, 20}}, color = {0, 127, 255}));
  connect(teeJunctionIdeal1.port_2, volumeFlowRate1.port_a) annotation(
    Line(points = {{-10, 20}, {0, 20}}, color = {0, 127, 255}));
  connect(ramp_V_flow.y, boundary.V_flow_in) annotation(
    Line(points = {{-119, 28}, {-110, 28}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-140, -100}, {140, 100}})),
  __OpenModelica_commandLineOptions = "");
end VolumeFlowSource_T_ex01;
