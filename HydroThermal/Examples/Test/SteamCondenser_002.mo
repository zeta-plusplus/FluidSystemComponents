within FluidSystemComponents.HydroThermal.Examples.Test;

model SteamCondenser_002
  "Complete drum boiler model, including evaporator and supplementary components"
  extends Modelica.Icons.Example;
  parameter Boolean use_inputs = false "use external inputs instead of test data contained internally";
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler condenser(redeclare package Medium = Modelica.Media.Water.StandardWater, V_l(fixed = true), V_l_start = 0.5, V_t = 1, cp_D = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_D = 1e-6, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p(fixed = false, start = 101.325 * 1000), p_start = 3 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {2, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow furnace annotation(
    Placement(visible = true, transformation(origin = {2, -29}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowSteam(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-58, 0}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Temperature temperatureSteam(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-28, 20}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(extent = {{-58, 20}, {-38, 40}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear SteamValve(redeclare package Medium = Modelica.Media.Water.StandardWater, dp_nominal = 100 * 1000, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(extent = {{-140, 80}, {-120, 100}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Q_flow_in(duration = 100, height = -1e6, offset = -1e6, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {-20, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valveopen(duration = 100, height = 0, offset = 1, startTime = 300) annotation(
    Placement(visible = true, transformation(origin = {-110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T pump(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 15 + 273.15, m_flow = 1, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT exitBoundary(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 120 + 273.15, nPorts = 1, p = 1.5 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-130, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain fracLiquid(k = 1 / condenser.V_t) annotation(
    Placement(visible = true, transformation(origin = {-2, 45}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_r_liquidLevel(duration = 100, height = 0, offset = 0.4, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {-38, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.PI pi(T = 30, k = 300) annotation(
    Placement(visible = true, transformation(origin = {32, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-2, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperatureWater(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowWater(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Nonlinear.Limiter limiter(limitsAtInit = true, uMax = 10, uMin = -10)  annotation(
    Placement(visible = true, transformation(origin = {72, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(furnace.port, condenser.heatPort) annotation(
    Line(points = {{2, -19}, {2, -10}}, color = {191, 0, 0}));
  connect(ramp_Q_flow_in.y, furnace.Q_flow) annotation(
    Line(points = {{-9, -50}, {2, -50}, {2, -38}, {1, -38}}, color = {0, 0, 127}));
  connect(ramp_valveopen.y, SteamValve.opening) annotation(
    Line(points = {{-99, -30}, {-90, -30}, {-90, -8}}, color = {0, 0, 127}));
  connect(SteamValve.port_b, exitBoundary.ports[1]) annotation(
    Line(points = {{-80, 0}, {-120, 0}}, color = {0, 127, 255}));
  connect(condenser.V, fracLiquid.u) annotation(
    Line(points = {{-2, 11}, {-2, 39}}, color = {0, 0, 127}));
  connect(fracLiquid.y, feedback.u2) annotation(
    Line(points = {{-2, 50.5}, {-2, 62}}, color = {0, 0, 127}));
  connect(ramp_r_liquidLevel.y, feedback.u1) annotation(
    Line(points = {{-27, 70}, {-10, 70}}, color = {0, 0, 127}));
  connect(pi.u, feedback.y) annotation(
    Line(points = {{20, 70}, {7, 70}}, color = {0, 0, 127}));
  connect(massFlowSteam.port_a, SteamValve.port_a) annotation(
    Line(points = {{-68, 0}, {-100, 0}}, color = {0, 127, 255}));
  connect(condenser.port_b, massFlowSteam.port_b) annotation(
    Line(points = {{-8, 0}, {-48, 0}}, color = {0, 127, 255}));
  connect(pressure.port, massFlowSteam.port_b) annotation(
    Line(points = {{-48, 20}, {-48, 0}}, color = {0, 127, 255}));
  connect(pump.ports[1], massFlowWater.port_b) annotation(
    Line(points = {{60, 0}, {40, 0}}, color = {0, 127, 255}));
  connect(temperatureWater.port, massFlowWater.port_b) annotation(
    Line(points = {{40, 10}, {40, 0}}, color = {0, 127, 255}));
  connect(massFlowWater.port_a, condenser.port_a) annotation(
    Line(points = {{20, 0}, {12, 0}}, color = {0, 127, 255}));
  connect(temperatureSteam.port, condenser.port_b) annotation(
    Line(points = {{-28, 10}, {-28, 0}, {-8, 0}}, color = {0, 127, 255}));
  connect(limiter.u, pi.y) annotation(
    Line(points = {{60, 70}, {43, 70}}, color = {0, 0, 127}));
  connect(limiter.y, pump.m_flow_in) annotation(
    Line(points = {{83, 70}, {91.5, 70}, {91.5, 8}, {80, 8}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(textColor = {0, 0, 255}, extent = {{-151, 165}, {138, 102}}, textString = "%name"), Text(extent = {{-79, 67}, {67, 21}}, textString = "drum"), Text(extent = {{-90, -14}, {88, -64}}, textString = "boiler")}),
    experiment(StopTime = 1000, StartTime = 0, Tolerance = 1e-06, Interval = 0.1),
    Documentation(info = "<html>

</html>"),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,nonewInst -d=initialization, --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 -d=nonewInst -d= --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 -d=nonewInst -d= --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 -d=nonewInst -d= --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 -d=nonewInst -d= --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-140, -100}, {100, 100}})));
end SteamCondenser_002;
