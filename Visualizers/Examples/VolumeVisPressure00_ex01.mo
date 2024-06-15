within FluidSystemComponents.Visualizers.Examples;

model VolumeVisPressure00_ex01
  extends Modelica.Icons.Example;
  //--------------------
  import units=Modelica.Units.SI;
  //--------------------
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //--------------------
  parameter Modelica.Units.SI.AbsolutePressure pContourMin = 100*1000 "";
  parameter Modelica.Units.SI.AbsolutePressure pContourMax = 5000*1000 "";
  parameter Modelica.Units.SI.AbsolutePressure p_par=100*1000;
  parameter Modelica.Units.SI.Temperature T_par= 288.15;
  parameter Modelica.Units.SI.MassFlowRate m_flow_par= 1;
  //--------------------
  VolumeVisPressure00 Vol_pVis(redeclare package Medium = fluid1, pContourMin = pContourMin, pContourMax = pContourMax, nPorts = 1) annotation(
    Placement(transformation(origin = {-76, 32}, extent = {{-10, -10}, {10, 10}})));
  Sensor.MassFlowDispByRef00 m_flow_ref(redeclare package Medium = fluid1, m_flow_dat = m_flow_par)  annotation(
    Placement(transformation(origin = {-40, 22}, extent = {{-10, -6}, {10, 6}})));
  VolumeVisPressure00 Vol_pVis1(redeclare package Medium = fluid1, pContourMax = pContourMax, pContourMin = pContourMin, nPorts = 1) annotation(
    Placement(transformation(origin = {-12, 32}, extent = {{-10, -10}, {10, 10}})));
equation
  
  Vol_pVis.medium.p=  p_par*time;
  Vol_pVis1.medium.p= 2* p_par*time;
  connect(Vol_pVis.ports[1], m_flow_ref.port_a) annotation(
    Line(points = {{-76, 22}, {-50, 22}}, color = {0, 127, 255}));
  connect(m_flow_ref.port_b, Vol_pVis1.ports[1]) annotation(
    Line(points = {{-30, 22}, {-12, 22}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.01));
end VolumeVisPressure00_ex01;
