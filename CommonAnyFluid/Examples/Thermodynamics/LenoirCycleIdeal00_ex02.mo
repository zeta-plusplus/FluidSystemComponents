within FluidSystemComponents.CommonAnyFluid.Examples.Thermodynamics;

model LenoirCycleIdeal00_ex02
  extends Modelica.Icons.Example;
  //-----
  replaceable package cycleFluid = Modelica.Media.Water.StandardWaterOnePhase;
  //replaceable package cycleFluid= Modelica.Media.Incompressible.Examples.Glycol47;
  //redeclare package Medium = cycleFluid
  //-----
  FluidSystemComponents.CommonAnyFluid.Thermodynamics.LenoirCycleIdeal00 LenoirCycle(redeclare package Medium = cycleFluid, switch_u_fluidQuantity = FluidSystemComponents.Types.Switches.switch_input_fluidQuantity.use_Volume) annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Q_in(duration = 10, height = 0, offset = 1000 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_VolFluid(duration = 10, height = 0, offset = 0.001, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 0, offset = 101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_in(duration = 10, height = 0, offset = 288.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Xi[cycleFluid.nXi] annotation(
    Placement(visible = true, transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_VolFluid.y, LenoirCycle.par_Vol1) annotation(
    Line(points = {{-18, 70}, {12, 70}, {12, 24}, {12, 24}}, color = {0, 0, 127}));
  connect(const_Xi.y, LenoirCycle.u_Xi_fluidState_1) annotation(
    Line(points = {{-58, -70}, {-18, -70}, {-18, -40}, {-2, -40}, {-2, -40}}, color = {0, 0, 127}, thickness = 0.5));
  connect(ramp_Q_in.y, LenoirCycle.u_Qin) annotation(
    Line(points = {{-79, 30}, {-30.5, 30}, {-30.5, 14}, {-3, 14}}, color = {0, 0, 127}));
  connect(ramp_p_in.y, LenoirCycle.u_p_fluidState_1) annotation(
    Line(points = {{-58, -10}, {-48, -10}, {-48, -4}, {-3, -4}}, color = {0, 0, 127}));
  connect(ramp_T_in.y, LenoirCycle.u_T_fluidState_1) annotation(
    Line(points = {{-58, -40}, {-32, -40}, {-32, -12}, {-2, -12}, {-2, -12}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end LenoirCycleIdeal00_ex02;
