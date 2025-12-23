within FluidSystemComponents.Compressible.Examples.Tutorial;

model MultiObliqueShocks00_ex01
  extends Modelica.Icons.Example;
  //-----
  package Fluid1 = Modelica.Media.Air.DryAirNasa;
  //-----
  Compressible.Components.ObliqueShock00 Shock1(redeclare package Medium = Fluid1, DELTA_par = 0.06981317007977318, switchDetermine_DELTA = Types.Switches.switchHowToDetVar.viaRealInput) annotation(
    Placement(transformation(origin = {-80, 18}, extent = {{-20, -11}, {20, 11}})));
  Interfaces.portMn2FluidWithMach port2FluidStatMn(redeclare package Medium = Fluid1) annotation(
    Placement(transformation(origin = {-132, 22}, extent = {{-2, -10}, {2, 10}})));
  Modelica.Fluid.Sources.Boundary_pT FlStart(redeclare package Medium = Fluid1, T(displayUnit = "K") = 216.65, nPorts = 1, p(displayUnit = "kPa") = 12100) annotation(
    Placement(transformation(origin = {-160, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_Mn(k = 5) annotation(
    Placement(transformation(origin = {-160, -6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_T FlEnd(redeclare package Medium = Fluid1, m_flow = -1, nPorts = 1) annotation(
    Placement(transformation(origin = {120, -12}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_ang(height = 0, duration = 5, offset = 1, startTime = 5) annotation(
    Placement(transformation(origin = {-148, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg annotation(
    Placement(transformation(origin = {-112, 70}, extent = {{-10, -10}, {10, 10}})));
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {70, 90}, extent = {{-10, -10}, {10, 10}})));
  Compressible.Components.ObliqueShock00 Shock2(DELTA_par = 0.06981317007977318, redeclare package Medium = Fluid1, switchDetermine_DELTA = Types.Switches.switchHowToDetVar.param, switchDetermine_angCtrLine4plot = Types.Switches.switchHowToDetVar.viaRealInput, x0_4plot_par = 1, y0_4plot_par = -0.02) annotation(
    Placement(transformation(origin = {-20, 7}, extent = {{-20, -11}, {20, 11}})));
  Compressible.Components.ObliqueShock00 Shock3(DELTA_par = 0.06981317007977318, redeclare package Medium = Fluid1, switchDetermine_DELTA = Types.Switches.switchHowToDetVar.param, switchDetermine_angCtrLine4plot = Types.Switches.switchHowToDetVar.viaRealInput, x0_4plot_par = 2.5, y0_4plot_par = -0.15) annotation(
    Placement(transformation(origin = {40, -4}, extent = {{-20, -11}, {20, 11}})));
  FluidSystemComponents.Interfaces.StaticMach2Total StatMn2Tot(redeclare package Medium = Fluid1) annotation(
    Placement(transformation(origin = {88, -12}, extent = {{-8, -10}, {8, 10}})));
equation
  connect(port2FluidStatMn.portStatWithMn, Shock1.portStatWithMn_1) annotation(
    Line(points = {{-130, 22}, {-100, 22}}, color = {0, 127, 255}, thickness = 3));
  connect(FlStart.ports[1], port2FluidStatMn.port) annotation(
    Line(points = {{-150, 30}, {-134, 30}}, color = {0, 127, 255}, thickness = 3));
  connect(const_Mn.y, port2FluidStatMn.u_Mn) annotation(
    Line(points = {{-149, -6}, {-143, -6}, {-143, 14}, {-135, 14}}, color = {0, 0, 127}, thickness = 1));
  connect(ramp_ang.y, from_deg.u) annotation(
    Line(points = {{-137, 70}, {-125, 70}}, color = {0, 0, 127}));
  connect(from_deg.y, Shock1.u_DELTA) annotation(
    Line(points = {{-101, 70}, {-84, 70}, {-84, 31}}, color = {0, 0, 127}));
  connect(Shock1.portStatWithMn_2, Shock2.portStatWithMn_1) annotation(
    Line(points = {{-60, 11}, {-40, 11}}, color = {0, 127, 255}, thickness = 3));
  connect(Shock2.portStatWithMn_2, Shock3.portStatWithMn_1) annotation(
    Line(points = {{0, 0}, {20, 0}}, color = {0, 127, 255}, thickness = 3));
  connect(Shock1.y_DELTA_pls_angCtrLine, Shock2.u_angCtrLine4plot) annotation(
    Line(points = {{-59, 26}, {-32, 26}, {-32, 20}}, color = {0, 0, 127}));
  connect(Shock2.y_DELTA_pls_angCtrLine, Shock3.u_angCtrLine4plot) annotation(
    Line(points = {{1, 15}, {28, 15}, {28, 8}}, color = {0, 0, 127}));
  connect(Shock3.portStatWithMn_2, StatMn2Tot.portStatWithMn) annotation(
    Line(points = {{60, -12}, {80, -12}}, color = {0, 127, 255}, thickness = 3));
  connect(StatMn2Tot.port, FlEnd.ports[1]) annotation(
    Line(points = {{96, -12}, {110, -12}}, color = {0, 127, 255}, thickness = 3));
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT", s = "dassl", variableFilter = ".*"),
  Diagram(coordinateSystem(extent = {{-180, -60}, {180, 100}})),
  version = "",
  uses);
end MultiObliqueShocks00_ex01;
