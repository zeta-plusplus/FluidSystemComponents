within FluidSystemComponents.CommonAnyFluid.Examples.Thermodynamics;

model LenoirCycleIdeal00_ex01
  extends Modelica.Icons.Example;
  //-----
  package cycleFluid = FluidSystemComponents.Media.Mixture_N2O2;
  //package cycleFluid = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = cycleFluid
  //-----
  FluidSystemComponents.CommonAnyFluid.Thermodynamics.LenoirCycleIdeal00 LenoirCycle(redeclare package Medium = cycleFluid) annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Q_in(duration = 10, height = 10 * 1000, offset = 10 * 1000, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_massFluid(duration = 10, height = 0, offset = 1, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 0, offset = 101.325 * 1000, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_in(duration = 10, height = 0, offset = 288.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Xi[cycleFluid.nXi](k = cycleFluid.X_default)  annotation(
    Placement(visible = true, transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_Q_in.y, LenoirCycle.u_Qin) annotation(
    Line(points = {{-79, 30}, {-30.5, 30}, {-30.5, 14}, {-3, 14}}, color = {0, 0, 127}));
  connect(ramp_p_in.y, LenoirCycle.u_p_fluidState_1) annotation(
    Line(points = {{-58, -10}, {-48, -10}, {-48, -4}, {-3, -4}}, color = {0, 0, 127}));
  connect(ramp_T_in.y, LenoirCycle.u_T_fluidState_1) annotation(
    Line(points = {{-58, -40}, {-32, -40}, {-32, -12}, {-2, -12}, {-2, -12}}, color = {0, 0, 127}));
  connect(ramp_massFluid.y, LenoirCycle.par_massFluid) annotation(
    Line(points = {{-18, 70}, {24, 70}, {24, 23}}, color = {0, 0, 127}));
  connect(const_Xi.y, LenoirCycle.u_Xi_fluidState_1) annotation(
    Line(points = {{-58, -70}, {-14, -70}, {-14, -40}, {-3, -40}}, color = {0, 0, 127}, thickness = 0.5));
annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-6, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
    
    
end LenoirCycleIdeal00_ex01;
