within FluidSystemComponents.Compressible.Examples.Test;

model IdealGasVolume01_test01
  extends Modelica.Icons.Example;
  //-------------------------
  import units = Modelica.Units.SI;
  //-------------------------
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium= fluid1,
  //-------------------------
  parameter Integer digitP= 4;
  parameter Modelica.Units.SI.Pressure pContourMin = 0*1000 "";
  parameter Modelica.Units.SI.Pressure pContourMax = 200*1000 "";
  parameter units.MassFlowRate m_flow_Min = 0.0;
  parameter units.MassFlowRate m_flow_Max = 1.0;
  parameter Real arrowMassFlowMin = 0.01;
  parameter Real arrowMassFlowMax = 40;
  //-------------------------
  Sources.Boundary_pT_colorP boundary1(nPorts = 2, p = 150*1000, T (displayUnit = "K")= 400, redeclare package Medium = fluid1, valMin = pContourMin, valMax = pContourMax, sigDigits = digitP)  annotation(
    Placement(transformation(origin = {-22, 82}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary2(redeclare package Medium = fluid1, T (displayUnit = "K")= 288.15, nPorts = 2, p = 100*1000, valMin = pContourMin, valMax = pContourMax, sigDigits = digitP) annotation(
    Placement(transformation(origin = {-22, -84}, extent = {{-10, -10}, {10, 10}})));
  Components.IdealGasVolumeColorP01 Vol1(redeclare package Medium = fluid1, nPorts = 2, valMin = pContourMin, valMax = pContourMax, sigDigits = digitP, p_start(displayUnit = "kPa") = 1e5)  annotation(
    Placement(transformation(origin = {-12, 30}, extent = {{-10, -10}, {10, 10}})));
  Components.IdealGasVolumeColorP01 Vol2(redeclare package Medium = fluid1, nPorts = 2, sigDigits = digitP, valMax = pContourMax, valMin = pContourMin, p_start(displayUnit = "kPa") = 1e5) annotation(
    Placement(transformation(origin = {-12, -26}, extent = {{-10, -10}, {10, 10}})));
  Components.NozzleFlowEquation03 Restriction_1(AmechTot_par = 1000*1e-6, redeclare package Medium = fluid1)  annotation(
    Placement(transformation(origin = {32, 56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Components.NozzleFlowEquation03 Restriction_2(AmechTot_par = 1000*1e-6, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {32, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Components.NozzleFlowEquation03 Restriction_3(AmechTot_par = 1000*1e-6, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {32, -56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Components.IdealGasVolumeColorP01 Vol_1(redeclare package Medium = fluid1, nPorts = 2, sigDigits = digitP, valMax = pContourMax, valMin = pContourMin, p_start(displayUnit = "kPa") = 1e5) annotation(
    Placement(transformation(origin = {32, 30}, extent = {{-10, -10}, {10, 10}})));
  Components.IdealGasVolumeColorP01 Vol_2(redeclare package Medium = fluid1, nPorts = 2, sigDigits = digitP, valMax = pContourMax, valMin = pContourMin, p_start(displayUnit = "kPa") = 1e5) annotation(
    Placement(transformation(origin = {32, -26}, extent = {{-10, -10}, {10, 10}})));
  Components.IdealGasNozzleFlow01 Restriction1(AmechTot_par = 1000*1e-6, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-12, 56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Components.IdealGasNozzleFlow01 Restriction2(AmechTot_par = 1000*1e-6, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-12, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Components.IdealGasNozzleFlow01 Restriction3(AmechTot_par = 1000*1e-6, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-12, -56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(boundary1.ports[2], Restriction_1.port_a) annotation(
    Line(points = {{-12, 82}, {32, 82}, {32, 66}}, color = {0, 127, 255}));
  connect(boundary2.ports[2], Restriction_3.port_b) annotation(
    Line(points = {{-12, -84}, {32, -84}, {32, -66}}, color = {0, 127, 255}));
  connect(Restriction_1.port_b, Vol_1.ports[1]) annotation(
    Line(points = {{32, 46}, {32, 20}}, color = {0, 127, 255}));
  connect(Restriction_2.port_a, Vol_1.ports[2]) annotation(
    Line(points = {{32, 10}, {32, 20}}, color = {0, 127, 255}));
  connect(Restriction_2.port_b, Vol_2.ports[1]) annotation(
    Line(points = {{32, -10}, {32, -36}}, color = {0, 127, 255}));
  connect(Restriction_3.port_a, Vol_2.ports[2]) annotation(
    Line(points = {{32, -46}, {32, -36}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], Restriction1.port_a) annotation(
    Line(points = {{-12, 82}, {-12, 66}}, color = {0, 127, 255}));
  connect(Restriction1.port_b, Vol1.ports[1]) annotation(
    Line(points = {{-12, 46}, {-12, 20}}, color = {0, 127, 255}));
  connect(Restriction2.port_a, Vol1.ports[2]) annotation(
    Line(points = {{-12, 10}, {-12, 20}}, color = {0, 127, 255}));
  connect(Restriction2.port_b, Vol2.ports[1]) annotation(
    Line(points = {{-12, -10}, {-12, -36}}, color = {0, 127, 255}));
  connect(Restriction3.port_a, Vol2.ports[2]) annotation(
    Line(points = {{-12, -46}, {-12, -36}}, color = {0, 127, 255}));
  connect(Restriction3.port_b, boundary2.ports[1]) annotation(
    Line(points = {{-12, -66}, {-12, -84}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01),
  __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "euler", variableFilter = ".*"),
  Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})));
end IdealGasVolume01_test01;
