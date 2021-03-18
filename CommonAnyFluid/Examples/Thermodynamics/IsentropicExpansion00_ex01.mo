within FluidSystemComponents.CommonAnyFluid.Examples.Thermodynamics;

model IsentropicExpansion00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = FluidSystemComponents.Media.Mixture_N2O2;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Constant const_p(k = 40 *101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_T(k = 1400) annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Xi[engineAir.nXi](k = {0.768, 0.232}) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_PR(duration = 10, height = 5, offset = 5, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Thermodynamics.IsentropicExpansion00 IsenExp(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
equation
  connect(ramp_PR.y, IsenExp.u_PR) annotation(
    Line(points = {{-38, 60}, {-2, 60}, {-2, 43}}, color = {0, 0, 127}));
  connect(const_p.y, IsenExp.u_p_fluidState_1) annotation(
    Line(points = {{-58, 30}, {-42, 30}, {-42, 16}, {-23, 16}}, color = {0, 0, 127}));
  connect(const_T.y, IsenExp.u_T_fluidState_1) annotation(
    Line(points = {{-58, 0}, {-50, 0}, {-50, 7}, {-23, 7}}, color = {0, 0, 127}));
  connect(const_Xi.y, IsenExp.u_Xi_fluidState_1) annotation(
    Line(points = {{-58, -30}, {-34, -30}, {-34, -20}, {-23, -20}}, color = {0, 0, 127}, thickness = 0.5));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end IsentropicExpansion00_ex01;
