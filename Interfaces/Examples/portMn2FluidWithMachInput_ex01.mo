within FluidSystemComponents.Interfaces.Examples;

model portMn2FluidWithMachInput_ex01
  extends Modelica.Icons.Example;
  //-----
  package Fluid1 = Modelica.Media.Air.DryAirNasa;
  //-----
  Modelica.Fluid.Sources.Boundary_pT boundary(nPorts = 1, redeclare package Medium = Fluid1, p = 1e5, T = 288.15) annotation(
    Placement(transformation(origin = {-56, 18}, extent = {{-10, -10}, {10, 10}})));
  portMn2FluidWithMachInput port2FluidStatMn(redeclare package Medium = Fluid1)  annotation(
    Placement(transformation(origin = {-20, 10}, extent = {{-2, -10}, {2, 10}})));
  FluidWithMachOutput2portMn FluidStatMn2port(redeclare package Medium = Fluid1)  annotation(
    Placement(transformation(origin = {14, 10}, extent = {{-2, -10}, {2, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(nPorts = 1, redeclare package Medium = Fluid1, m_flow = -1)  annotation(
    Placement(transformation(origin = {48, 18}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Blocks.Sources.Constant const_Mn(k = 2)  annotation(
    Placement(transformation(origin = {-56, -18}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(boundary.ports[1], port2FluidStatMn.port) annotation(
    Line(points = {{-46, 18}, {-22, 18}}, color = {0, 127, 255}));
  connect(port2FluidStatMn.portStatWithMn, FluidStatMn2port.portStatWithMn) annotation(
    Line(points = {{-18, 10}, {12, 10}}, color = {0, 127, 255}));
  connect(FluidStatMn2port.port, boundary1.ports[1]) annotation(
    Line(points = {{16, 18}, {38, 18}}, color = {0, 127, 255}));
  connect(const_Mn.y, port2FluidStatMn.u_Mn) annotation(
    Line(points = {{-44, -18}, {-32, -18}, {-32, 2}, {-22, 2}}, color = {0, 0, 127}));
end portMn2FluidWithMachInput_ex01;
