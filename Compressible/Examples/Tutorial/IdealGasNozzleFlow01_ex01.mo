within FluidSystemComponents.Compressible.Examples.Tutorial;

model IdealGasNozzleFlow01_ex01
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
  parameter units.MassFlowRate m_flow_Min = 0.01;
  parameter units.MassFlowRate m_flow_Max = 1.0;
  parameter Real arrowMassFlowMin = 0.01;
  parameter Real arrowMassFlowMax = 40;
  //-------------------------
  Sources.Boundary_pT_colorP boundary1(nPorts = 1, p = 150*1000, T(displayUnit = "K") = 400, redeclare package Medium = fluid1, valMin = pContourMin, valMax = pContourMax, sigDigits = digitP, use_p_in = true) annotation(
    Placement(transformation(origin = {-22, 42}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary2(redeclare package Medium = fluid1, T = 561.3, nPorts = 1, p = 100*1000, valMin = pContourMin, valMax = pContourMax, sigDigits = digitP, use_p_in = true) annotation(
    Placement(transformation(origin = {-22, -42}, extent = {{-10, -10}, {10, 10}})));
  Components.IdealGasNozzleFlow01 Restriction1(redeclare package Medium = fluid1, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax) annotation(
    Placement(transformation(origin = {-12, 4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp1(height = 100*1000, duration = 1, offset = 100*1000, startTime = 10) annotation(
    Placement(transformation(origin = {-64, 50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 1, height = 200*1000, offset = 100*1000, startTime = 20) annotation(
    Placement(transformation(origin = {-62, -34}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(boundary1.ports[1], Restriction1.port_a) annotation(
    Line(points = {{-12, 42}, {-12, 14}}, color = {0, 127, 255}));
  connect(Restriction1.port_b, boundary2.ports[1]) annotation(
    Line(points = {{-12, -6}, {-12, -42}}, color = {0, 127, 255}));
  connect(ramp1.y, boundary1.p_in) annotation(
    Line(points = {{-52, 50}, {-34, 50}}, color = {0, 0, 127}));
  connect(ramp2.y, boundary2.p_in) annotation(
    Line(points = {{-50, -34}, {-34, -34}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "euler", variableFilter = ".*"));
end IdealGasNozzleFlow01_ex01;
