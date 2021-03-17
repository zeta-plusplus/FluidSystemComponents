within FluidSystemComponents.CommonAnyFluid.Examples.Thermodynamics;

model ConstPressureHeatRejection00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = FluidSystemComponents.Media.Mixture_N2O2;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Constant const_p(k =  101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_T(k = 400 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Xi[engineAir.nXi](k = {0.768, 0.232}) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T2(duration = 10, height = -20, offset = 100 + 273.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Thermodynamics.ConstPressureHeatRejection00 ConstPressHeatReject(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
equation
  connect(ramp_T2.y, ConstPressHeatReject.u_T_state2) annotation(
    Line(points = {{-38, 60}, {-2, 60}, {-2, 43}}, color = {0, 0, 127}));
  connect(const_Xi.y, ConstPressHeatReject.u_Xi_fluidState_1) annotation(
    Line(points = {{-58, -30}, {-36, -30}, {-36, -20}, {-23, -20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(const_T.y, ConstPressHeatReject.u_T_fluidState_1) annotation(
    Line(points = {{-58, 0}, {-44, 0}, {-44, 7}, {-23, 7}}, color = {0, 0, 127}));
  connect(const_p.y, ConstPressHeatReject.u_p_fluidState_1) annotation(
    Line(points = {{-58, 30}, {-46, 30}, {-46, 16}, {-23, 16}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end ConstPressureHeatRejection00_ex01;
