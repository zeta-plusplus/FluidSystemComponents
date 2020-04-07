within FluidSystemComponents.HydroThermal.Examples.Test;

model liquidPowerGenerator00_01
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWater;
  //redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system(massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //----------
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {140, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = liquid1, diameter = 0.01, dp_nominal(displayUnit = "Pa") = 500 * 1000, m_flow_nominal = 1.0, use_zeta = true, zeta = 1) annotation(
    Placement(visible = true, transformation(origin = {140, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.HydroThermal.Components.PumpMotorFixedDispCharFixed00 PumpMotor(redeclare package Medium = liquid1, use_u_effMech = false, use_u_effVol = false) annotation(
    Placement(visible = true, transformation(origin = {140, -30}, extent = {{-20, 20}, {20, -20}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {220, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {250, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.PumpMotorFixedDispCharFixed00 PumpMotor1(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {20, -50}, extent = {{20, -20}, {-20, 20}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.325 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {20, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-20, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_speed(duration = 10, height = 4000, offset = 1000, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-80, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {190, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {182, -68}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_pwr(duration = 10, height = 0, offset = 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {182, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice1(redeclare package Medium = liquid1, diameter = 0.01, dp_nominal(displayUnit = "Pa") = 500 * 1000, m_flow_nominal = 1.0, use_zeta = true, zeta = 1) annotation(
    Placement(visible = true, transformation(origin = {40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice2(redeclare package Medium = liquid1, diameter = 0.01, dp_nominal(displayUnit = "Pa") = 500 * 1000, m_flow_nominal = 1.0, use_zeta = true, zeta = 1) annotation(
    Placement(visible = true, transformation(origin = {120, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_heat(duration = 10, height = 40, offset = 50 + 273.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.HeatTransfer.Components.HeatInjector00 HeatInjector(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Utilities.VariableBySolver VarBySolver1 annotation(
    Placement(visible = true, transformation(origin = {70, 80}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Utilities.ConstrainVariable Constraint1 annotation(
    Placement(visible = true, transformation(origin = {100, 50}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
equation
  connect(orifice.port_a, PumpMotor.port_2) annotation(
    Line(points = {{140, -80}, {140, -50}}, color = {0, 127, 255}));
  connect(orifice.port_b, boundary1.ports[1]) annotation(
    Line(points = {{140, -100}, {140, -110}}, color = {0, 127, 255}));
  connect(Constraint1.u_targetValue, ramp_heat.y) annotation(
    Line(points = {{100, 62}, {100, 62}, {100, 70}, {100, 70}}, color = {0, 0, 127}));
  connect(temperature.T, Constraint1.u_variable) annotation(
    Line(points = {{98, 20}, {100, 20}, {100, 38}}, color = {0, 0, 127}));
  connect(VarBySolver1.y_independent, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{70, 70}, {70, 70}, {70, 60}, {70, 60}}, color = {0, 0, 127}));
  connect(HeatInjector.port_2, temperature.port) annotation(
    Line(points = {{80, 10}, {90, 10}, {90, 10}, {90, 10}}, color = {0, 127, 255}));
  connect(orifice1.port_b, HeatInjector.port_1) annotation(
    Line(points = {{50, 10}, {58, 10}, {58, 10}, {60, 10}, {60, 10}}, color = {0, 127, 255}));
  connect(prescribedHeatFlow1.port, HeatInjector.HeatPort_1) annotation(
    Line(points = {{70, 40}, {70, 40}, {70, 20}, {70, 20}}, color = {191, 0, 0}));
  connect(temperature.port, orifice2.port_a) annotation(
    Line(points = {{90, 10}, {110, 10}, {110, 10}, {110, 10}}, color = {0, 127, 255}));
  connect(VarBySolver.y_independent, torque1.tau) annotation(
    Line(points = {{239, -30}, {232, -30}}, color = {0, 0, 127}));
  connect(powerSensor1.flange_b, torque1.flange) annotation(
    Line(points = {{200, -30}, {210, -30}, {210, -30}, {210, -30}}));
  connect(PumpMotor.flange_1, powerSensor1.flange_a) annotation(
    Line(points = {{160, -30}, {180, -30}}));
  connect(powerSensor1.power, Constraint.u_variable) annotation(
    Line(points = {{182, -41}, {182, -41}, {182, -55}, {182, -55}}, color = {0, 0, 127}));
  connect(ramp_pwr.y, Constraint.u_targetValue) annotation(
    Line(points = {{182, -89}, {182, -80}}, color = {0, 0, 127}));
  connect(orifice2.port_b, PumpMotor.port_1) annotation(
    Line(points = {{130, 10}, {140, 10}, {140, -10}}, color = {0, 127, 255}));
  connect(orifice1.port_a, PumpMotor1.port_2) annotation(
    Line(points = {{30, 10}, {20, 10}, {20, -30}}, color = {0, 127, 255}));
  connect(ramp_speed.y, from_rpm1.u) annotation(
    Line(points = {{-69, -50}, {-62, -50}}, color = {0, 0, 127}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-39, -50}, {-33, -50}, {-33, -50}, {-33, -50}}, color = {0, 0, 127}));
  connect(speed1.flange, PumpMotor1.flange_1) annotation(
    Line(points = {{-10, -50}, {0, -50}, {0, -50}, {0, -50}}));
  connect(boundary.ports[1], PumpMotor1.port_1) annotation(
    Line(points = {{20, -90}, {20, -90}, {20, -70}, {20, -70}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 70, Tolerance = 1e-06, Interval = 0.0233333),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -140}, {280, 100}})),
  __OpenModelica_commandLineOptions = "");
end liquidPowerGenerator00_01;
