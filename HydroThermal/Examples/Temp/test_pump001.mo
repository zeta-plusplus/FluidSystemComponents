within FluidSystemComponents.HydroThermal.Examples.Temp;

model test_pump001
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //----------
  inner Modelica.Fluid.System system(massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //----------
  FluidSystemComponents.HydroThermal.Components.PumpConstQflow_ideal pumpConstQflow_ideal1(redeclare package Medium = liquid1, qFlowDes = 0.001) annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = liquid1, diameter = 0.01, dp_nominal(displayUnit = "Pa") = 500 * 1000, m_flow_nominal = 1.0, use_zeta = true, zeta = 1) annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1(exact = true, phi(fixed = true), useSupport = false)  annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 5000, offset = 1, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pumpConstQflow_ideal1.port_2, orifice.port_a) annotation(
    Line(points = {{-10, 40}, {-10, 52}, {50, 52}, {50, 40}}, color = {0, 127, 255}));
  connect(ramp1.y, speed1.w_ref) annotation(
    Line(points = {{-58, 30}, {-54, 30}, {-54, 30}, {-52, 30}}, color = {0, 0, 127}));
  connect(speed1.flange, pumpConstQflow_ideal1.flange_1) annotation(
    Line(points = {{-30, 30}, {-20, 30}, {-20, 30}, {-20, 30}}));
  connect(orifice.port_b, boundary1.ports[1]) annotation(
    Line(points = {{50, 20}, {50, 0}}, color = {0, 127, 255}));
  connect(boundary.ports[1], pumpConstQflow_ideal1.port_1) annotation(
    Line(points = {{-10, -10}, {-10, 20}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end test_pump001;
