within FluidSystemComponents.Compressible.Examples.EngineeringStudies;

model dynamicPipe_waterHammer_byAir_01
  extends Modelica.Icons.Example;
  //-----
  //package fluid1 = Modelica.Media.Water.StandardWater;
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //-----
  parameter Modelica.Units.SI.Pressure p_contour_min = 100*1000;
  parameter Modelica.Units.SI.Pressure p_contour_max = 20*100*1000;
  parameter Modelica.Units.SI.MassFlowRate m_flow_arrow_min = -3;
  parameter Modelica.Units.SI.MassFlowRate m_flow_arrow_max = 3;
  //-----
  Modelica.Units.SI.Pressure arr_p_pipe[pipe.nNodes];
  //-----
  
  Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = fluid1, diameter = 0.1, length = 10, nNodes = 50, modelStructure = Modelica.Fluid.Types.ModelStructure.av_vb, roughness (displayUnit = "m")= 1e-4) annotation(
    Placement(transformation(origin = {110, 28}, extent = {{-10, -10}, {10, 10}})));
  inner Modelica.Fluid.System system(momentumDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, p_ambient = 1e5, T_ambient = 288.15) annotation(
    Placement(transformation(origin = {62, 88}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Valves.ValveLinear valveLinear(redeclare package Medium = fluid1, dp_nominal(displayUnit = "kPa") = 5e4, m_flow_nominal = 0.1) annotation(
    Placement(transformation(origin = {174, 28}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_valveLinear_opening(height = -1, duration = 0.01, offset = 1, startTime = 5) annotation(
    Placement(transformation(origin = {165, 61}, extent = {{-5, -5}, {5, 5}})));
  MSLfluidWithVisualization.Sources.Boundary_pT boundary1(p = 100*1000, T = 288.15, nPorts = 1, valMin = p_contour_min, valMax = p_contour_max, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {206, 28}, extent = {{14, -14}, {-14, 14}})));
  MSLfluidWithVisualization.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 288.15, nPorts = 1, p = 10*100*1000, valMax = p_contour_max, valMin = p_contour_min, use_p_in = true) annotation(
    Placement(transformation(origin = {40, 28}, extent = {{-14, -14}, {14, 14}})));
  Sensor.MonitorMassFlow00 m_flow(m_flow_Min = m_flow_arrow_min, m_flow_Max = m_flow_arrow_max, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {70, 28}, extent = {{-10, -6}, {10, 6}})));
  Modelica.Blocks.Sources.Ramp ramp_boundary_p(duration = 2, height = 900*1000, offset = 100*1000, startTime = 1) annotation(
    Placement(transformation(origin = {15, 34}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {89, 38}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {129, 38}, extent = {{-5, -5}, {5, 5}})));
equation
  
  //----------
  for i in 1:pipe.nNodes loop
    arr_p_pipe[i]=pipe.mediums[i].p;
  end for;
  
  //----------
    
  connect(ramp_valveLinear_opening.y, valveLinear.opening) annotation(
    Line(points = {{170.5, 61}, {174, 61}, {174, 36}}, color = {0, 0, 127}));
  connect(valveLinear.port_b, boundary1.ports[1]) annotation(
    Line(points = {{184, 28}, {199, 28}}, color = {0, 127, 255}));
  connect(pipe.port_b, valveLinear.port_a) annotation(
    Line(points = {{120, 28}, {164, 28}}, color = {0, 127, 255}));
  connect(boundary.ports[1], m_flow.port_a) annotation(
    Line(points = {{48, 28}, {60, 28}}, color = {0, 127, 255}));
  connect(ramp_boundary_p.y, boundary.p_in) annotation(
    Line(points = {{20.5, 34}, {32, 34}}, color = {0, 0, 127}));
  connect(m_flow.port_b, pipe.port_a) annotation(
    Line(points = {{80, 28}, {100, 28}}, color = {0, 127, 255}));
  connect(pipe.port_a, pressure.port) annotation(
    Line(points = {{100, 28}, {89, 28}, {89, 33}}, color = {0, 127, 255}));
  connect(pipe.port_b, pressure1.port) annotation(
    Line(points = {{120, 28}, {129, 28}, {129, 33}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "4.1.0")),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.005),
    Diagram(coordinateSystem(extent = {{0, 0}, {300, 100}})),
    version = "");
end dynamicPipe_waterHammer_byAir_01;