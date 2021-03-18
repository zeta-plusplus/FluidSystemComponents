within FluidSystemComponents.CommonAnyFluid.Examples.Thermodynamics;

model LenoirCycleIdeal00_ex03
  extends Modelica.Icons.Example;
  //-----
  package cycleFluid = Modelica.Media.CompressibleLiquids.LinearColdWater;
  //redeclare package Medium = cycleFluid
  //-----
  Modelica.Blocks.Sources.Ramp ramp_Q(duration = 10, height = 100 * 1000, offset = 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_VolFluid(duration = 10, height = 0, offset = 0.001, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 0, offset = 101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_in(duration = 10, height = 0, offset = 288.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Xi[cycleFluid.nXi] annotation(
    Placement(visible = true, transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Thermodynamics.LenoirCycleIdeal00 LenoirCycle(redeclare package Medium = cycleFluid, switch_u_fluidQuantity = FluidSystemComponents.Types.Switches.switch_input_fluidQuantity.use_Volume)  annotation(
    Placement(visible = true, transformation(origin = { 10,-10}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
equation
  connect(const_Xi.y, LenoirCycle.u_Xi_fluidState_1) annotation(
    Line(points = {{-58, -70}, {-34, -70}, {-34, -40}, {-24, -40}, {-24, -40}}, color = {0, 0, 127}, thickness = 0.5));
  connect(ramp_T_in.y, LenoirCycle.u_T_fluidState_1) annotation(
    Line(points = {{-58, -40}, {-46, -40}, {-46, -12}, {-24, -12}, {-24, -14}}, color = {0, 0, 127}));
  connect(ramp_p_in.y, LenoirCycle.u_p_fluidState_1) annotation(
    Line(points = {{-58, -10}, {-48, -10}, {-48, -4}, {-24, -4}, {-24, -4}}, color = {0, 0, 127}));
  connect(ramp_Q.y, LenoirCycle.u_Qin) annotation(
    Line(points = {{-78, 30}, {-50, 30}, {-50, 14}, {-24, 14}, {-24, 14}}, color = {0, 0, 127}));
  connect(ramp_VolFluid.y, LenoirCycle.par_Vol1) annotation(
    Line(points = {{-18, 70}, {-8, 70}, {-8, 24}, {-8, 24}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end LenoirCycleIdeal00_ex03;
