within FluidSystemComponents.Compressible.Examples.Tutorial;

model IdealGasVolumeColorP01_ex01
  extends Modelica.Icons.Example;
  //-------------------------
  import units = Modelica.Units.SI;
  //-------------------------
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium= fluid1,
  //-------------------------
  parameter Integer digitP = 4;
  parameter Modelica.Units.SI.Pressure pContourMin = 0*1000 "";
  parameter Modelica.Units.SI.Pressure pContourMax = 200*1000 "";
  parameter units.MassFlowRate m_flow_Min = 0.0;
  parameter units.MassFlowRate m_flow_Max = 1.0;
  parameter Real arrowMassFlowMin = 0.01;
  parameter Real arrowMassFlowMax = 40;
  //-------------------------
  Sources.Boundary_pT_colorP boundary1(nPorts = 1, p = 150*1000, T(displayUnit = "K") = 400, redeclare package Medium = fluid1, valMin = pContourMin, valMax = pContourMax, sigDigits = digitP) annotation(
    Placement(transformation(origin = {-22, 82}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary2(redeclare package Medium = fluid1, T = 561.3, nPorts = 1, p = 100*1000, valMin = pContourMin, valMax = pContourMax, sigDigits = digitP) annotation(
    Placement(transformation(origin = {-22, -156}, extent = {{-10, -10}, {10, 10}})));
  Components.IdealGasVolumeColorP01 Vol1(redeclare package Medium = fluid1, nPorts = 2, valMin = pContourMin, valMax = pContourMax, sigDigits = digitP) annotation(
    Placement(transformation(origin = {-12, 6}, extent = {{-10, -10}, {10, 10}})));
  Components.IdealGasNozzleFlow01 Restriction1(redeclare package Medium = fluid1, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax) annotation(
    Placement(transformation(origin = {-12, 44}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Components.IdealGasNozzleFlow01 Restriction2(redeclare package Medium = fluid1, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax) annotation(
    Placement(transformation(origin = {-12, -34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Components.IdealGasVolumeColorP01 Vol2(redeclare package Medium = fluid1, nPorts = 2, sigDigits = digitP, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-12, -74}, extent = {{-10, -10}, {10, 10}})));
  Components.IdealGasNozzleFlow01 Restriction3(redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {-12, -112}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(boundary1.ports[1], Restriction1.port_a) annotation(
    Line(points = {{-12, 82}, {-12, 54}}, color = {0, 127, 255}));
  connect(Restriction1.port_b, Vol1.ports[2]) annotation(
    Line(points = {{-12, 34}, {-12, -4}}, color = {0, 127, 255}));
  connect(Vol1.ports[2], Restriction2.port_a) annotation(
    Line(points = {{-12, -4}, {-12, -24}}, color = {0, 127, 255}));
  connect(Restriction2.port_b, Vol2.ports[1]) annotation(
    Line(points = {{-12, -44}, {-12, -84}}, color = {0, 127, 255}));
  connect(Vol2.ports[2], Restriction3.port_a) annotation(
    Line(points = {{-12, -84}, {-12, -102}}, color = {0, 127, 255}));
  connect(Restriction3.port_b, boundary2.ports[1]) annotation(
    Line(points = {{-12, -122}, {-12, -156}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "euler", variableFilter = ".*"),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})));
end IdealGasVolumeColorP01_ex01;
