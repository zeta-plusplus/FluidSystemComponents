within FluidSystemComponents.CommonAnyFluid.Examples.Thermodynamics;

model OttoCycleIdeal00_ex02
  extends Modelica.Icons.Example;
  //-----
  package cycleFluid = Modelica.Media.Water.StandardWaterOnePhase;
  //package cycleFluid= Modelica.Media.Incompressible.Examples.Glycol47;
  //package cycleFluid = FluidSystemComponents.Media.Mixture_N2O2;
  //package cycleFluid = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = cycleFluid
  //-----
  FluidSystemComponents.CommonAnyFluid.Thermodynamics.OttoCycleIdeal00 OttoCycle(redeclare package Medium = cycleFluid) annotation(
    Placement(visible = true, transformation(origin = {40, 3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Q_in(duration = 10, height = 0, offset = 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 0, offset = 101.325 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_in(duration = 10, height = 0, offset = 15 + 273.15, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Xi[cycleFluid.nXi] annotation(
    Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_mass(duration = 10, height = 0, offset = 1.0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_CR(duration = 10, height = 0, offset = 1.001, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {20, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_CR.y, OttoCycle.par_CR) annotation(
    Line(points = {{32, 80}, {44, 80}, {44, 22}, {44, 22}}, color = {0, 0, 127}));
  connect(ramp_mass.y, OttoCycle.par_massFluid) annotation(
    Line(points = {{21, 50}, {32, 50}, {32, 22}}, color = {0, 0, 127}));
  connect(const_Xi.y, OttoCycle.u_Xi_fluidState_1) annotation(
    Line(points = {{-38, -70}, {6, -70}, {6, -20}, {16, -20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(ramp_T_in.y, OttoCycle.u_T_fluidState_1) annotation(
    Line(points = {{-38, -40}, {-16, -40}, {-16, -2}, {16, -2}, {16, -2}}, color = {0, 0, 127}));
  connect(ramp_p_in.y, OttoCycle.u_p_fluidState_1) annotation(
    Line(points = {{-38, -10}, {-30, -10}, {-30, 4}, {16, 4}, {16, 4}}, color = {0, 0, 127}));
  connect(ramp_Q_in.y, OttoCycle.u_Qin) annotation(
    Line(points = {{-59, 30}, {2, 30}, {2, 16}, {18, 16}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 70, Tolerance = 1e-06, Interval = 0.140281),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end OttoCycleIdeal00_ex02;
