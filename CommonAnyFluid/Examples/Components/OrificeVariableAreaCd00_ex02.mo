within FluidSystemComponents.CommonAnyFluid.Examples.Components;

model OrificeVariableAreaCd00_ex02
  extends Modelica.Icons.Example;
  //-----
  //package fluid1 = Modelica.Media.Air.DryAirNasa;
  package fluid1= FluidSystemComponents.Media.Mixture_N2O2;
  //redeclare package Medium = fluid1
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 500, nPorts = 1, p = 5 * 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 10, height = 0, offset = 2 * 101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T1(duration = 10, height = 0, offset = 288.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cd(duration = 10, height = -0.05, offset = 0.65, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-40, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Components.OrificeVariableAreaCd00 Orifice(redeclare package Medium = fluid1, diam_paramInput = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_kArea(duration = 10, height = -0.2, offset = 0.8, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, nPorts = 1, p = 101.325 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(Orifice.port_2, boundary1.ports[1]) annotation(
    Line(points = {{0, 20}, {20, 20}, {20, 20}, {20, 20}}, color = {0, 127, 255}));
  connect(ramp_kArea.y, Orifice.u_kArea) annotation(
    Line(points = {{-18, -40}, {-12, -40}, {-12, 10}, {-12, 10}}, color = {0, 0, 127}));
  connect(ramp_Cd.y, Orifice.u_Cd) annotation(
    Line(points = {{-28, -10}, {-18, -10}, {-18, 8}, {-18, 8}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Orifice.port_1) annotation(
    Line(points = {{-40, 20}, {-20, 20}, {-20, 20}, {-20, 20}}, color = {0, 127, 255}));
  connect(ramp_T1.y, boundary.T_in) annotation(
    Line(points = {{-78, 20}, {-70, 20}, {-70, 24}, {-62, 24}, {-62, 24}}, color = {0, 0, 127}));
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{-78, 50}, {-72, 50}, {-72, 28}, {-62, 28}, {-62, 28}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end OrificeVariableAreaCd00_ex02;
