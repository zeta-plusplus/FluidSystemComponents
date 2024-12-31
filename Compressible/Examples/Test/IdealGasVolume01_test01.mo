within FluidSystemComponents.Compressible.Examples.Test;

model IdealGasVolume01_test01
  extends Modelica.Icons.Example;
  //-------------------------
  import units = Modelica.Units.SI;
  //-------------------------
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium= fluid1,
  //-------------------------
  Sources.Boundary_pT_colorP boundary1(nPorts = 1, p = 150*1000, T (displayUnit = "K")= 400, redeclare package Medium = fluid1)  annotation(
    Placement(transformation(origin = {-22, 82}, extent = {{-10, -10}, {10, 10}})));
  Components.NozzleFlowEquation03 Restriction1(redeclare package Medium = fluid1)  annotation(
    Placement(transformation(origin = {-12, 44}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Components.NozzleFlowEquation03 Restriction2(redeclare package Medium = fluid1)  annotation(
    Placement(transformation(origin = {-12, -36}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Sources.Boundary_pT_colorP boundary2(redeclare package Medium = fluid1, T = 561.3, nPorts = 1, p = 100*1000) annotation(
    Placement(transformation(origin = {-22, -74}, extent = {{-10, -10}, {10, 10}})));
  Components.IdealGasVolumeColorP01 Vol1(redeclare package Medium = fluid1, nPorts = 2)  annotation(
    Placement(transformation(origin = {-12, 6}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(boundary1.ports[1], Restriction1.port_a) annotation(
    Line(points = {{-12, 82}, {-12, 54}}, color = {0, 127, 255}));
  connect(Restriction2.port_b, boundary2.ports[1]) annotation(
    Line(points = {{-12, -46}, {-12, -74}}, color = {0, 127, 255}));
  connect(Restriction1.port_b, Vol1.ports[1]) annotation(
    Line(points = {{-12, 34}, {-12, -4}}, color = {0, 127, 255}));
  connect(Vol1.ports[2], Restriction2.port_a) annotation(
    Line(points = {{-12, -4}, {-12, -26}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01));
end IdealGasVolume01_test01;
