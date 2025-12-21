within FluidSystemComponents.Compressible.Examples.Test;

model ObliqueShock00_ex01
  extends Modelica.Icons.Example;
  //-----
  package Fluid1 = Modelica.Media.Air.DryAirNasa;
  //-----
  Components.ObliqueShock00 Shock(redeclare package Medium = Fluid1, DELTA_par = 0.17453292519943295) annotation(
    Placement(transformation(origin = {0, 26}, extent = {{-20, -11}, {20, 11}})));
  Interfaces.portMn2FluidWithMach port2FluidStatMn(redeclare package Medium = Fluid1) annotation(
    Placement(transformation(origin = {-42, 30}, extent = {{-2, -10}, {2, 10}})));
  Interfaces.FluidWithMach2portMn FluidStatMn2port(redeclare package Medium = Fluid1) annotation(
    Placement(transformation(origin = {38, 19}, extent = {{-2, -10}, {2, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Fluid1, T (displayUnit = "K")= 216.65, nPorts = 1, p (displayUnit = "kPa")= 12100) annotation(
    Placement(transformation(origin = {-70, 38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_Mn(k = 2) annotation(
    Placement(transformation(origin = {-70, 2}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = Fluid1, m_flow = -1, nPorts = 1) annotation(
    Placement(transformation(origin = {66, 27}, extent = {{10, -10}, {-10, 10}})));
equation
  connect(port2FluidStatMn.portStatWithMn, Shock.portStatWithMn_1) annotation(
    Line(points = {{-40, 30}, {-20, 30}}, color = {0, 127, 255}));
  connect(Shock.portStatWithMn_2, FluidStatMn2port.portStatWithMn) annotation(
    Line(points = {{20, 19}, {36, 19}}, color = {0, 127, 255}));
  connect(boundary.ports[1], port2FluidStatMn.port) annotation(
    Line(points = {{-60, 38}, {-44, 38}}, color = {0, 127, 255}));
  connect(const_Mn.y, port2FluidStatMn.u_Mn) annotation(
    Line(points = {{-58, 2}, {-52, 2}, {-52, 22}, {-44, 22}}, color = {0, 0, 127}));
  connect(FluidStatMn2port.port, boundary1.ports[1]) annotation(
    Line(points = {{40, 27}, {56, 27}}, color = {0, 127, 255}));
annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT", s = "dassl", variableFilter = ".*"));
end ObliqueShock00_ex01;
