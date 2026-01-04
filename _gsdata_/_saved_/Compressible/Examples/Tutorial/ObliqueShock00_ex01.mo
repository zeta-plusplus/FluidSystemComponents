within FluidSystemComponents.Compressible.Examples.Tutorial;

model ObliqueShock00_ex01
  extends Modelica.Icons.Example;
  //-----
  package Fluid1 = Modelica.Media.Air.DryAirNasa;
  //-----
  Components.ObliqueShock00 Shock(redeclare package Medium = Fluid1, DELTA_par = 0.15707963267948966, switchDetermine_DELTA = Types.Switches.switchHowToDetVar.viaRealInput) annotation(
    Placement(transformation(origin = {0, 26}, extent = {{-20, -11}, {20, 11}})));
  Interfaces.portMn2FluidWithMach port2FluidStatMn(redeclare package Medium = Fluid1) annotation(
    Placement(transformation(origin = {-42, 30}, extent = {{-2, -10}, {2, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Fluid1, T(displayUnit = "K") = 216.65, nPorts = 1, p(displayUnit = "kPa") = 12100) annotation(
    Placement(transformation(origin = {-70, 38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_Mn(k = 5) annotation(
    Placement(transformation(origin = {-70, 2}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = Fluid1, m_flow = -1, nPorts = 1) annotation(
    Placement(transformation(origin = {70, 18}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_ang(height = 5, duration = 5, offset = 1, startTime = 5) annotation(
    Placement(transformation(origin = {-62, 78}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg annotation(
    Placement(transformation(origin = {-26, 78}, extent = {{-10, -10}, {10, 10}})));
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {70, 90}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.StaticMach2Total StatMn2Tot(redeclare package Medium = Fluid1)  annotation(
    Placement(transformation(origin = {40, 18}, extent = {{-8, -10}, {8, 10}})));
equation
  connect(port2FluidStatMn.portStatWithMn, Shock.portStatWithMn_1) annotation(
    Line(points = {{-40, 30}, {-20, 30}}, color = {0, 127, 255}, thickness = 3));
  connect(boundary.ports[1], port2FluidStatMn.port) annotation(
    Line(points = {{-60, 38}, {-44, 38}}, color = {0, 127, 255}, thickness = 3));
  connect(const_Mn.y, port2FluidStatMn.u_Mn) annotation(
    Line(points = {{-58, 2}, {-52, 2}, {-52, 22}, {-44, 22}}, color = {0, 0, 127}, thickness = 1));
  connect(ramp_ang.y, from_deg.u) annotation(
    Line(points = {{-50, 78}, {-38, 78}}, color = {0, 0, 127}));
  connect(from_deg.y, Shock.u_DELTA) annotation(
    Line(points = {{-14, 78}, {-4, 78}, {-4, 38}}, color = {0, 0, 127}));
  connect(StatMn2Tot.port, boundary1.ports[1]) annotation(
    Line(points = {{48, 18}, {60, 18}}, color = {0, 127, 255}, thickness = 3));
  connect(Shock.portStatWithMn_2, StatMn2Tot.portStatWithMn) annotation(
    Line(points = {{20, 18}, {32, 18}}, color = {0, 127, 255}, thickness = 3));
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT", s = "dassl", variableFilter = ".*"));
end ObliqueShock00_ex01;
