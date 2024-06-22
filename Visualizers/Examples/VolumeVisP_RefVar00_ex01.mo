within FluidSystemComponents.Visualizers.Examples;

model VolumeVisP_RefVar00_ex01
  extends Modelica.Icons.Example;
  //--------------------
  import units=Modelica.Units.SI;
  //--------------------
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //--------------------
  parameter Modelica.Units.SI.Pressure pContourMin = 100*1000 "";
  parameter Modelica.Units.SI.Pressure pContourMax = 5000*1000 "";
  parameter Modelica.Units.SI.Pressure p_par=100*1000;
  parameter Modelica.Units.SI.Temperature T_par= 288.15;
  
  
  //--------------------
  Modelica.Units.SI.MassFlowRate m_flow;
  
  
  VolumeVisP_RefVar00 Vol_pVis(redeclare package Medium = fluid1, pContourMin = pContourMin, pContourMax = pContourMax, nPorts = 1, pRef = ramp_p.y) annotation(
    Placement(transformation(origin = {-12, 31}, extent = {{-10, -10}, {10, 10}})));
  MassFlowDisp_RefVar00 m_flow_disp(redeclare package Medium = fluid1, m_flow_ref = ramp_m_flow.y)  annotation(
    Placement(transformation(origin = {21, 21.8}, extent = {{-13, -7.8}, {13, 7.8}})));
  VolumeVisP_RefVar00 Vol_pVis1(redeclare package Medium = fluid1, pContourMax = pContourMax, pContourMin = pContourMin, nPorts = 1, pRef = ramp_p1.y) annotation(
    Placement(transformation(origin = {52, 31}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_p(height = 5000*1000, duration = 20, offset = 100*1000, startTime = 10)  annotation(
    Placement(transformation(origin = {-60, 76}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 20, height = 10000*1000, offset = 100*1000, startTime = 10) annotation(
    Placement(transformation(origin = {-60, 38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_m_flow(duration = 20, height = 0.1, offset = 0.001, startTime = 10) annotation(
    Placement(transformation(origin = {-58, -10}, extent = {{-10, -10}, {10, 10}})));
equation
  
  m_flow= 0.1*time;
  
  connect(Vol_pVis.ports[1], m_flow_disp.port_a) annotation(
    Line(points = {{-12, 22}, {8, 22}}, color = {0, 127, 255}));
  connect(m_flow_disp.port_b, Vol_pVis1.ports[1]) annotation(
    Line(points = {{34, 21.8}, {52, 21.8}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.01));
end VolumeVisP_RefVar00_ex01;
