within FluidSystemComponents.HydroThermal.Examples.Test;

model PumpMotorFixedDispCharFixed00_02
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system(massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //----------
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {90, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = liquid1, diameter = 0.01, dp_nominal(displayUnit = "Pa") = 500 * 1000, m_flow_nominal = 1.0, use_zeta = true, zeta = 1) annotation(
    Placement(visible = true, transformation(origin = {20, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.HydroThermal.Components.PumpMotorFixedDispCharFixed00 PumpMotor(redeclare package Medium = liquid1, use_u_effMech = true, use_u_effVol = true) annotation(
    Placement(visible = true, transformation(origin = {20, 20}, extent = {{-20, 20}, {20, -20}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_effVol(duration = 10, height = 0, offset = 0.9, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_effMech(duration = 10, height = 0, offset = 0.9, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {-30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pin(duration = 10, height = 1 * 101.3 * 1000, offset = 10 * 101.3 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-10, -70}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, T = 20 + 273.15, nPorts = 1, use_T_in = true, use_p_in = true)  annotation(
    Placement(visible = true, transformation(origin = {20, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {-10, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_V_flow(duration = 10, height = 0.0009, offset = 0.0001, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 5, offset = 20 + 273.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
equation
  connect(ramp1.y, boundary.T_in) annotation(
    Line(points = {{12, -100}, {16, -100}, {16, -62}, {16, -62}}, color = {0, 0, 127}));
  connect(ramp_pin.y, boundary.p_in) annotation(
    Line(points = {{1, -70}, {12, -70}, {12, -62}}, color = {0, 0, 127}));
  connect(ramp_V_flow.y, Constraint.u_targetValue) annotation(
    Line(points = {{-28, -20}, {-22, -20}, {-22, -20}, {-22, -20}}, color = {0, 0, 127}));
  connect(Constraint.u_variable, volumeFlowRate1.V_flow) annotation(
    Line(points = {{2, -20}, {10, -20}, {10, -20}, {8, -20}}, color = {0, 0, 127}));
  connect(PumpMotor.port_1, volumeFlowRate1.port_b) annotation(
    Line(points = {{20, 0}, {20, 0}, {20, -10}, {20, -10}}, color = {0, 127, 255}));
  connect(volumeFlowRate1.port_a, boundary.ports[1]) annotation(
    Line(points = {{20, -30}, {20, -30}, {20, -40}, {20, -40}}, color = {0, 127, 255}));
  connect(VarBySolver.y_independent, torque1.tau) annotation(
    Line(points = {{-58, 20}, {-42, 20}, {-42, 20}, {-42, 20}}, color = {0, 0, 127}));
  connect(torque1.flange, PumpMotor.flange_1) annotation(
    Line(points = {{-20, 20}, {0, 20}}));
  connect(PumpMotor.u_effVol, ramp_effVol.y) annotation(
    Line(points = {{42, 4}, {64, 4}, {64, -30}, {80, -30}, {80, -30}}, color = {0, 0, 127}));
  connect(PumpMotor.u_effMech, ramp_effMech.y) annotation(
    Line(points = {{42, 12}, {70, 12}, {70, 0}, {80, 0}, {80, 0}}, color = {0, 0, 127}));
  connect(orifice.port_b, boundary1.ports[1]) annotation(
    Line(points = {{20, 80}, {80, 80}}, color = {0, 127, 255}));
  connect(orifice.port_a, PumpMotor.port_2) annotation(
    Line(points = {{20, 60}, {20, 40}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 70, Tolerance = 1e-06, Interval = 0.0233333),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -140}, {160, 100}})),
  __OpenModelica_commandLineOptions = "");
end PumpMotorFixedDispCharFixed00_02;
