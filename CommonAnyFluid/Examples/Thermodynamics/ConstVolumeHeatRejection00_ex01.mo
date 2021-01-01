within FluidSystemComponents.CommonAnyFluid.Examples.Thermodynamics;

model ConstVolumeHeatRejection00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = FluidSystemComponents.Media.Mixture_N2O2;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Constant const_p(k = 10 *101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_T(k = 400 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Xi[engineAir.nXi](k = {0.768, 0.232}) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_2(duration = 10, height = -50, offset = 100 + 273.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Thermodynamics.ConstVolumeHeatRejection00 ConstVolHeatReject(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
equation
  connect(const_Xi.y, ConstVolHeatReject.u_Xi_fluidState_1) annotation(
    Line(points = {{-58, -30}, {-32, -30}, {-32, -18}, {-24, -18}, {-24, -18}}, color = {0, 0, 127}, thickness = 0.5));
  connect(const_T.y, ConstVolHeatReject.u_T_fluidState_1) annotation(
    Line(points = {{-58, 0}, {-34, 0}, {-34, 10}, {-24, 10}, {-24, 10}}, color = {0, 0, 127}));
  connect(const_p.y, ConstVolHeatReject.u_p_fluidState_1) annotation(
    Line(points = {{-58, 30}, {-48, 30}, {-48, 18}, {-24, 18}, {-24, 20}}, color = {0, 0, 127}));
  connect(ramp_T_2.y, ConstVolHeatReject.u_T_state2) annotation(
    Line(points = {{-38, 60}, {-4, 60}, {-4, 43}, {-5, 43}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end ConstVolumeHeatRejection00_ex01;
