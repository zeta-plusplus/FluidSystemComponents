within FluidSystemComponents.HydroThermal.Examples.Test;

model SteamGenerator_002
  "Complete drum boiler model, including evaporator and supplementary components"
  extends Modelica.Icons.Example;
  parameter Boolean use_inputs = false "use external inputs instead of test data contained internally";
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler evaporator(redeclare package Medium = Modelica.Media.Water.StandardWater, V_l(fixed = true), V_l_start = 0.5, V_t = 1, cp_D = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_D = 1e-6, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p(fixed = false, start = 101.325 * 1000), p_start = 3 * 101.325 * 1000) annotation(
    Placement(transformation(extent = {{-46, -30}, {-26, -10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow furnace annotation(
    Placement(transformation(origin = {-36, -53}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowSteam(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(transformation(origin = {30, -20}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Temperature temperatureSteam(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(transformation(origin = {-3, -1}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(transformation(extent = {{10, 18}, {30, 38}})));
  Modelica.Fluid.Valves.ValveLinear SteamValve(redeclare package Medium = Modelica.Media.Water.StandardWater, dp_nominal = 100 * 1000, m_flow_nominal = 1) annotation(
    Placement(transformation(extent = {{50, -10}, {70, -30}})));
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(extent = {{-90, 70}, {-70, 90}})));
  Modelica.Blocks.Sources.Ramp ramp_Q_flow_in(duration = 100, height = 1e6, offset = -1e6, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valveopen(duration = 100, height = 0, offset = 1, startTime = 300) annotation(
    Placement(visible = true, transformation(origin = {40, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T pump(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 15 + 273.15, m_flow = 1, nPorts = 2, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT exitBoundary(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 120 + 273.15, nPorts = 1, p = 1 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {90, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain fracLiquid(k = 1 / evaporator.V_t) annotation(
    Placement(visible = true, transformation(origin = {-32, 15}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_r_liquidLevel(duration = 100, height = 0, offset = 0.4, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.PI pi(T = 30, k = -300) annotation(
    Placement(visible = true, transformation(origin = {-110, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-32, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperatureWater(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-85, -3}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-68, -20}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
equation
  connect(furnace.port, evaporator.heatPort) annotation(
    Line(points = {{-36, -43}, {-36, -30}}, color = {191, 0, 0}));
  connect(pressure.port, massFlowSteam.port_a) annotation(
    Line(points = {{20, 18}, {20, -20}}, color = {0, 127, 255}));
  connect(massFlowSteam.port_b, SteamValve.port_a) annotation(
    Line(points = {{40, -20}, {50, -20}}, color = {0, 127, 255}));
  connect(evaporator.port_b, massFlowSteam.port_a) annotation(
    Line(points = {{-26, -20}, {20, -20}}, color = {0, 127, 255}));
  connect(temperatureSteam.port, massFlowSteam.port_a) annotation(
    Line(points = {{-3, -11}, {-3, -20}, {20, -20}}, color = {0, 127, 255}));
  connect(ramp_Q_flow_in.y, furnace.Q_flow) annotation(
    Line(points = {{-58, -70}, {-36, -70}, {-36, -62}}, color = {0, 0, 127}));
  connect(ramp_valveopen.y, SteamValve.opening) annotation(
    Line(points = {{52, -60}, {60, -60}, {60, -28}}, color = {0, 0, 127}));
  connect(SteamValve.port_b, exitBoundary.ports[1]) annotation(
    Line(points = {{70, -20}, {80, -20}}, color = {0, 127, 255}));
  connect(evaporator.V, fracLiquid.u) annotation(
    Line(points = {{-32, -8}, {-32, 10}}, color = {0, 0, 127}));
  connect(fracLiquid.y, feedback.u2) annotation(
    Line(points = {{-32, 20}, {-32, 32}}, color = {0, 0, 127}));
  connect(ramp_r_liquidLevel.y, feedback.u1) annotation(
    Line(points = {{-10, 60}, {-10, 40}, {-24, 40}}, color = {0, 0, 127}));
  connect(pi.u, feedback.y) annotation(
    Line(points = {{-98, 40}, {-40, 40}}, color = {0, 0, 127}));
  connect(pi.y, pump.m_flow_in) annotation(
    Line(points = {{-121, 40}, {-137, 40}, {-137, -12}, {-121, -12}}, color = {0, 0, 127}));
  connect(pump.ports[1], temperatureWater.port) annotation(
    Line(points = {{-100, -20}, {-85, -20}, {-85, -13}}, color = {0, 127, 255}));
  connect(pump.ports[2], massFlowRate.port_a) annotation(
    Line(points = {{-100, -20}, {-78, -20}}, color = {0, 127, 255}));
  connect(massFlowRate.port_b, evaporator.port_a) annotation(
    Line(points = {{-58, -20}, {-46, -20}}, color = {0, 127, 255}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(lineColor = {0, 0, 255}, extent = {{-151, 165}, {138, 102}}, textString = "%name"), Text(extent = {{-79, 67}, {67, 21}}, textString = "drum"), Text(extent = {{-90, -14}, {88, -64}}, textString = "boiler")}),
    experiment(StopTime = 1000, StartTime = 0, Tolerance = 1e-06, Interval = 0.1),
    Documentation(info = "<html>

</html>"),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,nonewInst -d=initialization, --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 -d=nonewInst -d= --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 -d=nonewInst -d= --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 -d=nonewInst -d= --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 -d=nonewInst -d= --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-140, -100}, {100, 100}})));
end SteamGenerator_002;
