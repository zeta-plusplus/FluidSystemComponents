within FluidSystemComponents.CommonAnyFluid.Examples.Thermodynamics;

model ConstPressureHeatAddition00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = FluidSystemComponents.Media.Mixture_N2O2;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Constant const_p(k = 10 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_T(k = 600 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Xi[engineAir.nXi](k = {0.768, 0.232}) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Qqm(duration = 10, height = 100 * 1000, offset = 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Thermodynamics.ConstPressureHeatAddition00 ConstPressHeatAdd(redeclare package Medium = engineAir, switch_sysType = FluidSystemComponents.Types.Switches.switch_sysType_ThermodynamicProcess.openSystem)  annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
equation
  connect(ramp_Qqm.y, ConstPressHeatAdd.u_Qqm) annotation(
    Line(points = {{-38, 60}, {-14, 60}, {-14, 44}, {-14, 44}}, color = {0, 0, 127}));
  connect(const_p.y, ConstPressHeatAdd.u_p_fluidState_1) annotation(
    Line(points = {{-58, 30}, {-36, 30}, {-36, 16}, {-24, 16}, {-24, 16}}, color = {0, 0, 127}));
  connect(const_T.y, ConstPressHeatAdd.u_T_fluidState_1) annotation(
    Line(points = {{-58, 0}, {-46, 0}, {-46, 7}, {-23, 7}}, color = {0, 0, 127}));
  connect(const_Xi.y, ConstPressHeatAdd.u_Xi_fluidState_1) annotation(
    Line(points = {{-58, -30}, {-32, -30}, {-32, -20}, {-23, -20}}, color = {0, 0, 127}, thickness = 0.5));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end ConstPressureHeatAddition00_ex01;
