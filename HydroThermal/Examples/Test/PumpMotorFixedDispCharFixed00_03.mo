within FluidSystemComponents.HydroThermal.Examples.Test;

model PumpMotorFixedDispCharFixed00_03
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWater;
  //redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system(massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //----------
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {100, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = liquid1, diameter = 0.01, dp_nominal(displayUnit = "Pa") = 500 * 1000, m_flow_nominal = 1.0, use_zeta = true, zeta = 1) annotation(
    Placement(visible = true, transformation(origin = {100, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.HydroThermal.Components.PumpMotorFixedDispCharFixed00 PumpMotor(redeclare package Medium = liquid1, use_u_effMech = false, use_u_effVol = false) annotation(
    Placement(visible = true, transformation(origin = {100, 20}, extent = {{-20, 20}, {20, -20}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {180, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {210, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.PumpMotorFixedDispCharFixed00 PumpMotor1(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {20, -1.22125e-15}, extent = {{20, -20}, {-20, 20}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.325 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {20, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_speed(duration = 10, height = 4000, offset = 1000, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {150, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {142, -18}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_pwr(duration = 10, height = 1000, offset = 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {142, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice1(redeclare package Medium = liquid1, diameter = 0.01, dp_nominal(displayUnit = "Pa") = 500 * 1000, m_flow_nominal = 1.0, use_zeta = true, zeta = 1) annotation(
    Placement(visible = true, transformation(origin = {70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(orifice1.port_a, PumpMotor1.port_2) annotation(
    Line(points = {{60, 60}, {20, 60}, {20, 20}, {20, 20}}, color = {0, 127, 255}));
  connect(orifice1.port_b, PumpMotor.port_1) annotation(
    Line(points = {{80, 60}, {100, 60}, {100, 40}, {100, 40}}, color = {0, 127, 255}));
  connect(ramp_pwr.y, Constraint.u_targetValue) annotation(
    Line(points = {{142, -39}, {142, -30}}, color = {0, 0, 127}));
  connect(powerSensor1.power, Constraint.u_variable) annotation(
    Line(points = {{142, 8}, {142, 8}, {142, -6}, {142, -6}}, color = {0, 0, 127}));
  connect(powerSensor1.flange_b, torque1.flange) annotation(
    Line(points = {{160, 20}, {170, 20}, {170, 20}, {170, 20}}));
  connect(PumpMotor.flange_1, powerSensor1.flange_a) annotation(
    Line(points = {{120, 20}, {140, 20}, {140, 20}, {140, 20}}));
  connect(VarBySolver.y_independent, torque1.tau) annotation(
    Line(points = {{199, 20}, {192, 20}}, color = {0, 0, 127}));
  connect(ramp_speed.y, from_rpm1.u) annotation(
    Line(points = {{-69, 0}, {-62, 0}}, color = {0, 0, 127}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-38, 0}, {-32, 0}, {-32, 0}, {-32, 0}}, color = {0, 0, 127}));
  connect(speed1.flange, PumpMotor1.flange_1) annotation(
    Line(points = {{-10, 0}, {0, 0}, {0, 0}, {0, 0}}));
  connect(boundary.ports[1], PumpMotor1.port_1) annotation(
    Line(points = {{20, -40}, {20, -40}, {20, -20}, {20, -20}}, color = {0, 127, 255}));
  connect(orifice.port_b, boundary1.ports[1]) annotation(
    Line(points = {{100, -40}, {100, -60}}, color = {0, 127, 255}));
  connect(orifice.port_a, PumpMotor.port_2) annotation(
    Line(points = {{100, -20}, {100, 0}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 70, Tolerance = 1e-06, Interval = 0.0233333),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -140}, {240, 100}})),
  __OpenModelica_commandLineOptions = "");
end PumpMotorFixedDispCharFixed00_03;
