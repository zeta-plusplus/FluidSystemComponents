within FluidSystemComponents.CommonAnyFluid.Examples.Thermodynamics;

model LenoirCycleIdeal00_ex02
  extends Modelica.Icons.Example;
  //-----
  //replaceable package cycleFluid = Modelica.Media.Water.StandardWaterOnePhase;
  //package cycleFluid = Modelica.Media.Water.StandardWater;
  package cycleFluid = Modelica.Media.CompressibleLiquids.LinearColdWater;
  //replaceable package cycleFluid= Modelica.Media.Incompressible.Examples.Glycol47;
  //package cycleFluid = FluidSystemComponents.Media.Mixture_N2O2;
  //redeclare package Medium = cycleFluid
  //-----
  Modelica.Blocks.Sources.Ramp ramp_T2(duration = 10, height = 0, offset = 80 + 273.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 0, offset = 101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_in(duration = 10, height = 0, offset = 288.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Xi[cycleFluid.nXi] annotation(
    Placement(visible = true, transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Thermodynamics.ConstVolumeHeatAddition00 ConstVolHeatAdd(redeclare package Medium = cycleFluid, switch_u_Process = FluidSystemComponents.Types.Switches.switch_input_HeatChangeProcess.use_T_state2)  annotation(
    Placement(visible = true, transformation(origin = {-3.55271e-15, 3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Thermodynamics.IsentropicExpansion00 IsenExp(redeclare package Medium = cycleFluid, switch_u_ExpProcess = FluidSystemComponents.Types.Switches.switch_input_AdiabaticProcess.use_p_state2_for_AdiabaticProcess, switch_u_thermoState = FluidSystemComponents.Types.Switches.switch_input_ThermodynamicState.use_h_for_ThermodynamicState)  annotation(
    Placement(visible = true, transformation(origin = {60, 3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Thermodynamics.ConstPressureHeatRejection00 ConstPressHeatReject(redeclare package Medium = cycleFluid, switch_u_thermoState = FluidSystemComponents.Types.Switches.switch_input_ThermodynamicState.use_h_for_ThermodynamicState)  annotation(
    Placement(visible = true, transformation(origin = {120, 3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(ramp_T_in.y, ConstPressHeatReject.u_T_state2) annotation(
    Line(points = {{-58, 60}, {112, 60}, {112, 22}, {112, 22}}, color = {0, 0, 127}));
  connect(ramp_T_in.y, ConstVolHeatAdd.u_T_fluidState_1) annotation(
    Line(points = {{-59, 60}, {-39.5, 60}, {-39.5, -2}, {-22, -2}}, color = {0, 0, 127}));
  connect(ramp_p_in.y, IsenExp.u_p_state2) annotation(
    Line(points = {{-59, 90}, {60, 90}, {60, 22}}, color = {0, 0, 127}));
  connect(ramp_p_in.y, ConstVolHeatAdd.u_p_fluidState_1) annotation(
    Line(points = {{-59, 90}, {-30.5, 90}, {-30.5, 4}, {-22, 4}}, color = {0, 0, 127}));
  connect(IsenExp.y_Xi_fluidState_2, ConstPressHeatReject.u_Xi_fluidState_1) annotation(
    Line(points = {{82, -20}, {96, -20}, {96, -20}, {98, -20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(IsenExp.y_h_fluidState_2, ConstPressHeatReject.u_h_fluidState_1) annotation(
    Line(points = {{82, -8}, {98, -8}, {98, -8}, {98, -8}}, color = {0, 0, 127}));
  connect(IsenExp.y_p_fluidState_2, ConstPressHeatReject.u_p_fluidState_1) annotation(
    Line(points = {{82, 4}, {96, 4}, {96, 4}, {98, 4}}, color = {0, 0, 127}));
  connect(ConstVolHeatAdd.y_h_fluidState_2, IsenExp.u_h_fluidState_1) annotation(
    Line(points = {{22, -8}, {38, -8}, {38, -8}, {38, -8}}, color = {0, 0, 127}));
  connect(ConstVolHeatAdd.y_Xi_fluidState_2, IsenExp.u_Xi_fluidState_1) annotation(
    Line(points = {{22, -20}, {38, -20}, {38, -20}, {38, -20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(ConstVolHeatAdd.y_p_fluidState_2, IsenExp.u_p_fluidState_1) annotation(
    Line(points = {{22, 4}, {36, 4}, {36, 4}, {38, 4}}, color = {0, 0, 127}));
  connect(const_Xi.y, ConstVolHeatAdd.u_Xi_fluidState_1) annotation(
    Line(points = {{-58, -70}, {-34, -70}, {-34, -20}, {-22, -20}, {-22, -20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(ramp_T2.y, ConstVolHeatAdd.u_T_state2) annotation(
    Line(points = {{-78, 30}, {-8, 30}, {-8, 22}, {-8, 22}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
  __OpenModelica_commandLineOptions = "");
end LenoirCycleIdeal00_ex02;
