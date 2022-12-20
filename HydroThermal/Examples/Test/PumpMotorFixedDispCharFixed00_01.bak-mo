within FluidSystemComponents.HydroThermal.Examples.Test;

model PumpMotorFixedDispCharFixed00_01
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system(massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //----------
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {90, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = liquid1, diameter = 0.01, dp_nominal(displayUnit = "Pa") = 500 * 1000, m_flow_nominal = 1.0, use_zeta = true, zeta = 1) annotation(
    Placement(visible = true, transformation(origin = {20, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1(exact = true, phi(fixed = true), useSupport = false) annotation(
    Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_omega(duration = 10, height = 4900, offset = 100, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.PumpMotorFixedDispCharFixed00 PumpMotor(redeclare package Medium = liquid1, use_u_effMech = true, use_u_effVol = true) annotation(
    Placement(visible = true, transformation(origin = {20, 20}, extent = {{-20, 20}, {20, -20}}, rotation = 90)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_effVol(duration = 10, height = 0.05, offset = 0.9, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_effMech(duration = 10, height = 0.05, offset = 0.9, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(PumpMotor.u_effVol, ramp_effVol.y) annotation(
    Line(points = {{42, 4}, {64, 4}, {64, -30}, {80, -30}, {80, -30}}, color = {0, 0, 127}));
  connect(PumpMotor.u_effMech, ramp_effMech.y) annotation(
    Line(points = {{42, 12}, {70, 12}, {70, 0}, {80, 0}, {80, 0}}, color = {0, 0, 127}));
  connect(PumpMotor.port_1, boundary.ports[1]) annotation(
    Line(points = {{20, -1.49012e-07}, {20, -30}}, color = {0, 127, 255}));
  connect(orifice.port_b, boundary1.ports[1]) annotation(
    Line(points = {{20, 80}, {80, 80}}, color = {0, 127, 255}));
  connect(orifice.port_a, PumpMotor.port_2) annotation(
    Line(points = {{20, 60}, {20, 40}}, color = {0, 127, 255}));
  connect(ramp_omega.y, from_rpm1.u) annotation(
    Line(points = {{-78, 20}, {-62, 20}, {-62, 20}, {-62, 20}}, color = {0, 0, 127}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-38, 20}, {-32, 20}, {-32, 20}, {-32, 20}}, color = {0, 0, 127}));
  connect(speed1.flange, PumpMotor.flange_1) annotation(
    Line(points = {{-10, 20}, {0, 20}}));
  annotation(
    experiment(StartTime = 0, StopTime = 70, Tolerance = 1e-06, Interval = 0.0233333),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {160, 100}})),
  __OpenModelica_commandLineOptions = "");
end PumpMotorFixedDispCharFixed00_01;
