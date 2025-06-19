within FluidSystemComponents.MSLfluidWithVisualization.Vessels.Examples;

model ClosedVolume_ex01
  extends Modelica.Icons.Example;
  //-----
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = fluid1
  //-----
  //--------------------
  import units = Modelica.Units.SI;
  //--------------------
  parameter units.Pressure pContourMin = 100*1000 "";
  parameter units.Pressure pContourMax = 1000*1000 "";
  parameter units.Pressure TcontourMin = 100*1000 "";
  parameter units.Pressure TcontourMax = 1000*1000 "";
  parameter units.MassFlowRate m_flow_arrow_Min = 0.0001;
  parameter units.MassFlowRate m_flow_arrow_Max = 0.1;
  parameter Real arrowMin = 0.01;
  parameter Real arrowMax = 30;
  parameter Integer sigDigit_p=4;
  //--------------------
  ClosedVolume Volume(nPorts = 2, redeclare package Medium = fluid1, valMin = pContourMin, valMax = pContourMax, use_portsData = false, V = 0.001, sigDigits = sigDigit_p) annotation(
    Placement(transformation(origin = {-14, 21}, extent = {{-14, -14}, {14, 14}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(nPorts = 1, redeclare package Medium = fluid1, use_m_flow_in = true) annotation(
    Placement(transformation(origin = {-46, 14}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary1(nPorts = 1, redeclare package Medium = fluid1, p = 1e5) annotation(
    Placement(transformation(origin = {52, 14}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = fluid1, length = 1, diameter = 0.05) annotation(
    Placement(transformation(origin = {20, 14}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_m_flow(duration = 10, height = 9, offset = 1, startTime = 10) annotation(
    Placement(transformation(origin = {-83, 30}, extent = {{-10, -10}, {10, 10}})));
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {-80, 88}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(Volume.ports[1], pipe.port_a) annotation(
    Line(points = {{-14, 14}, {10, 14}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Volume.ports[2]) annotation(
    Line(points = {{-36, 14}, {-14, 14}}, color = {0, 127, 255}));
  connect(pipe.port_b, boundary1.ports[1]) annotation(
    Line(points = {{30, 14}, {42, 14}}, color = {0, 127, 255}));
  connect(ramp_m_flow.y, boundary.m_flow_in) annotation(
    Line(points = {{-72, 30}, {-64, 30}, {-64, 22}, {-56, 22}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.01));
end ClosedVolume_ex01;
