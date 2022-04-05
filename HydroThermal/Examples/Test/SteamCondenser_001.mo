within FluidSystemComponents.HydroThermal.Examples.Test;

model SteamCondenser_001
  "Complete drum boiler model, including evaporator and supplementary components"
  extends Modelica.Icons.Example;
  parameter Boolean use_inputs = false "use external inputs instead of test data contained internally";
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler condenser(redeclare package Medium = Modelica.Media.Water.StandardWater, V_l(fixed = true), V_l_start = 0.6, V_t = 1, allowFlowReversal = true, cp_D = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_D = 1e-6, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p(fixed = false, start = 101.325 * 1000), p_start = 1.5 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-72, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow furnace annotation(
    Placement(visible = true, transformation(origin = {-72, -51}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {20, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-47, -1}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(extent = {{0, 10}, {20, 30}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear SteamValve(redeclare package Medium = Modelica.Media.Water.StandardWater, dp_nominal = 1 * 1000, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(extent = {{50, -10}, {70, -30}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(extent = {{-110, 70}, {-90, 90}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Q_flow_in(duration = 100, height = 0, offset = -5e6, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {-106, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valveopen(duration = 100, height = 0, offset = 1, startTime = 300) annotation(
    Placement(visible = true, transformation(origin = {40, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T pump(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 150 + 273.15, m_flow = 1, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT exitBoundary(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 120 + 273.15, nPorts = 1, p = 1.0 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {90, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain fracLiquid(k = 1 / condenser.V_t) annotation(
    Placement(visible = true, transformation(origin = {-68, 15}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_r_liquidLevel(duration = 100, height = 0, offset = 0.5, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.PI pi_inletFlow(T = 200, k = -100) annotation(
    Placement(visible = true, transformation(origin = {-100, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-68, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-10, -70}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_r_m_flow(duration = 100, height = 0, offset = 90 + 273.15, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Continuous.PI pi_Q_flow(T = 50, k = 50) annotation(
    Placement(visible = true, transformation(origin = {-50, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(furnace.port, condenser.heatPort) annotation(
    Line(points = {{-72, -41}, {-72, -30}}, color = {191, 0, 0}));
  connect(pressure.port, massFlowRate.port_a) annotation(
    Line(points = {{10, 10}, {10, -20}}, color = {0, 127, 255}));
  connect(massFlowRate.port_b, SteamValve.port_a) annotation(
    Line(points = {{30, -20}, {50, -20}}, color = {0, 127, 255}));
  connect(temperature.port, massFlowRate.port_a) annotation(
    Line(points = {{-47, -11}, {-47, -20}, {10, -20}}, color = {0, 127, 255}));
  connect(ramp_valveopen.y, SteamValve.opening) annotation(
    Line(points = {{51, -60}, {59, -60}, {59, -28}}, color = {0, 0, 127}));
  connect(condenser.V, fracLiquid.u) annotation(
    Line(points = {{-76, -9}, {-76, 0.5}, {-68, 0.5}, {-68, 10}}, color = {0, 0, 127}));
  connect(fracLiquid.y, feedback.u2) annotation(
    Line(points = {{-68, 20.5}, {-68, 32.5}}, color = {0, 0, 127}));
  connect(ramp_r_liquidLevel.y, feedback.u1) annotation(
    Line(points = {{-30, 59}, {-30, 40}, {-60, 40}}, color = {0, 0, 127}));
  connect(SteamValve.port_b, exitBoundary.ports[1]) annotation(
    Line(points = {{70, -20}, {80, -20}}, color = {0, 127, 255}));
  connect(ramp_r_m_flow.y, feedback1.u1) annotation(
    Line(points = {{10, -99}, {10, -70}, {-2, -70}}, color = {0, 0, 127}));
  connect(condenser.port_a, massFlowRate.port_a) annotation(
    Line(points = {{-62, -20}, {10, -20}}, color = {0, 127, 255}));
  connect(pump.ports[1], condenser.port_b) annotation(
    Line(points = {{-100, -20}, {-82, -20}}, color = {0, 127, 255}));
  connect(temperature.T, feedback1.u2) annotation(
    Line(points = {{-40, -1}, {-10, -1}, {-10, -62}}, color = {0, 0, 127}));
  connect(pi_inletFlow.u, feedback.y) annotation(
    Line(points = {{-88, 40}, {-76, 40}}, color = {0, 0, 127}));
  connect(pi_inletFlow.y, pump.m_flow_in) annotation(
    Line(points = {{-110, 40}, {-134, 40}, {-134, -12}, {-120, -12}}, color = {0, 0, 127}));
  connect(pi_Q_flow.u, feedback1.y) annotation(
    Line(points = {{-38, -70}, {-18, -70}}, color = {0, 0, 127}));
  connect(ramp_Q_flow_in.y, furnace.Q_flow) annotation(
    Line(points = {{-94, -70}, {-72, -70}, {-72, -60}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(lineColor = {0, 0, 255}, extent = {{-151, 165}, {138, 102}}, textString = "%name"), Text(extent = {{-79, 67}, {67, 21}}, textString = "drum"), Text(extent = {{-90, -14}, {88, -64}}, textString = "boiler")}),
    experiment(StopTime = 1000, StartTime = 0, Tolerance = 1e-06, Interval = 0.1),
    Documentation(info = "<html>

</html>"),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,nonewInst -d=nonewInst -d= --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 -d=nonewInst -d= --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 -d=nonewInst -d= --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 -d=nonewInst -d= --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 -d=nonewInst -d= --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-140, -140}, {100, 100}})));
end SteamCondenser_001;
