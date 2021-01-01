within FluidSystemComponents.CommonAnyFluid.Examples.Thermodynamics;

model ConstVolumeHeatAddition00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = FluidSystemComponents.Media.Mixture_N2O2;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Constant const_p(k = 10 *101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_T(k = 600 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Xi[engineAir.nXi](k = {0.768, 0.232}) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Qqm(duration = 10, height = 100 * 1000, offset = 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Thermodynamics.ConstVolumeHeatAddition00 ConstVolHeatAdd(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
equation
  connect(ConstVolHeatAdd.u_Xi_fluidState_1, const_Xi.y) annotation(
    Line(points = {{-23, -17}, {-30, -17}, {-30, -30}, {-58, -30}}, color = {0, 0, 127}, thickness = 0.5));
  connect(const_T.y, ConstVolHeatAdd.u_T_fluidState_1) annotation(
    Line(points = {{-58, 0}, {-42, 0}, {-42, 10}, {-23, 10}}, color = {0, 0, 127}));
  connect(const_p.y, ConstVolHeatAdd.u_p_fluidState_1) annotation(
    Line(points = {{-58, 30}, {-46, 30}, {-46, 19}, {-23, 19}}, color = {0, 0, 127}));
  connect(ramp_Qqm.y, ConstVolHeatAdd.u_Qqm) annotation(
    Line(points = {{-38, 60}, {-14, 60}, {-14, 43}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end ConstVolumeHeatAddition00_ex01;
