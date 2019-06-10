within FluidSystemComponents.HydroThermal.Examples;

model pistonActuator001
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume sweptVolume1(redeclare package Medium = liquid1, clearance = Modelica.Constants.pi / 4 * 0.15 ^ 2 * 0.1, nPorts = 2, pistonCrossArea = Modelica.Constants.pi / 4 * 0.15 ^ 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {60, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.HydroThermal.Components.PumpConstQflow_ideal pumpConstQflow_ideal1(redeclare package Medium = liquid1, qFlowDes = 10 * 0.001 / 60) annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1(exact = true) annotation(
    Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass mass1(L = 0.2, a(fixed = true), m = 10, s(fixed = true, start = 0.1), v(fixed = true)) annotation(
    Placement(visible = true, transformation(origin = {90, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 20, height = 10000 - 100, offset = 100, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(redeclare package Medium = liquid1, dp_nominal(displayUnit = "Pa") = 100 * 1000, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = liquid1, V = 0.001, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {5, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  FluidSystemComponents.HydroThermal.Components.CheckValveSpringLoad_Linear checkValveSpringLoad_Linear1(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 20, height = 0.9, offset = 0.01, startTime = 40) annotation(
    Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary annotation(
    Placement(visible = true, transformation(origin = {-10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp1.y, valveLinear1.opening) annotation(
    Line(points = {{-29, 60}, {2, 60}}, color = {0, 0, 127}));
  connect(valveLinear1.port_b, sweptVolume1.ports[1]) annotation(
    Line(points = {{10, 70}, {10, 80}, {50, 80}}, color = {0, 127, 255}));
  connect(sweptVolume1.flange, mass1.flange_a) annotation(
    Line(points = {{70, 80}, {80, 80}, {80, 80}, {80, 80}}, color = {0, 127, 0}));
  connect(speed1.w_ref, ramp2.y) annotation(
    Line(points = {{-26, 0}, {-38, 0}}, color = {0, 0, 127}));
  connect(valveLinear1.port_a, volume.ports[3]) annotation(
    Line(points = {{10, 50}, {10, 30}}, color = {0, 127, 255}));
  connect(speed1.flange, pumpConstQflow_ideal1.flange_1) annotation(
    Line(points = {{-15, 0}, {0, 0}}));
  connect(boundary.ports[1], pumpConstQflow_ideal1.port_1) annotation(
    Line(points = {{0, -40}, {10, -40}, {10, -10}}, color = {0, 127, 255}));
  connect(volume.ports[2], checkValveSpringLoad_Linear1.port_1) annotation(
    Line(points = {{10, 30}, {40, 30}, {40, 10}}, color = {0, 127, 255}));
  connect(volume.ports[1], pumpConstQflow_ideal1.port_2) annotation(
    Line(points = {{10, 30}, {10, 10}}, color = {0, 127, 255}));
  connect(pumpConstQflow_ideal1.port_1, checkValveSpringLoad_Linear1.port_2) annotation(
    Line(points = {{10, -10}, {10, -20}, {40, -20}, {40, -10}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(initialScale = 0.05)),
    Icon(coordinateSystem(initialScale = 0.05)),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end pistonActuator001;
