within FluidSystemComponents.HeatTransfer.Examples.HeatTransferDevices;

model HX_ShellTube_parallel_discrete005_ex01
  extends Modelica.Icons.Example;
  import units = Modelica.Units.SI;
  //--------------------
  //replaceable package liquidHside = Modelica.Media.Incompressible.Examples.Glycol47;
  replaceable package liquidHside = Modelica.Media.Water.StandardWater;
  //redeclare package Medium = liquidHside
  replaceable package liquidCside = Modelica.Media.Water.StandardWater;
  //redeclare package Medium = liquidCside
  //--------------------
  parameter units.CoefficientOfHeatTransfer hConvHot(start = 500.0)=500.0 "heat transfer coefficient, hot side";
  parameter units.CoefficientOfHeatTransfer hConvCold(start = 500.0)=500.0 "heat transfer coefficient, cold side";
  parameter units.Area areaH(start = 1.0)=1.0;
  parameter units.Area areaC(start = 1.0)=1.0;
  parameter Real nHot = 5;
  parameter Real nCold = nHot;
  parameter Real kSize(start=1.0)=1.0;
  
  //--------------------
  units.ThermalConductance hAhot_discrete;
  units.ThermalConductance hAcold_discrete;
  units.ThermalResistance Rtotal;
  units.ThermalConductance UAtotal;
  Real Cratio;
  Real Cmin;
  Real Cmax;
  Real NTU;
  Real effHX_theoretical;
  //--------------------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T source_hotFluid(redeclare package Medium = liquidHside, T = 90 + 273.15, m_flow = 1, nPorts = 1, use_T_in = true, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-140, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T souce_coolant(redeclare package Medium = liquidCside, T = 10 + 273.15, m_flow = 2, nPorts = 1, use_T_in = true, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-140, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT sink_hotFluid(redeclare package Medium = liquidHside, T = 273.15, nPorts = 1, p = 101.325 * 1000.0) annotation(
    Placement(visible = true, transformation(origin = {150, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT sink_coolant(redeclare package Medium = liquidCside, T = 273.15, nPorts = 1, p = 101.325 * 1000.0) annotation(
    Placement(visible = true, transformation(origin = {150, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volH(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH1(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH2(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH3(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH4(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC(redeclare package Medium = liquidCside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-40, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume volC1(redeclare package Medium = liquidCside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume volC2(redeclare package Medium = liquidCside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {20, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume volC3(redeclare package Medium = liquidCside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume volC4(redeclare package Medium = liquidCside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection2 annotation(
    Placement(visible = true, transformation(origin = {20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection3 annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection4 annotation(
    Placement(visible = true, transformation(origin = {80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection5 annotation(
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection6 annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection7 annotation(
    Placement(visible = true, transformation(origin = {20, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection8 annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection9 annotation(
    Placement(visible = true, transformation(origin = {80, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_hotOut(redeclare package Medium = liquidHside) annotation(
    Placement(visible = true, transformation(origin = {115, 60}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_coldOut(redeclare package Medium = liquidCside) annotation(
    Placement(visible = true, transformation(origin = {115, -60}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_hotIn(redeclare package Medium = liquidHside) annotation(
    Placement(visible = true, transformation(origin = {-115, 60}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_coldIn(redeclare package Medium = liquidCside) annotation(
    Placement(visible = true, transformation(origin = {-115, -60}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(visible = true, transformation(origin = {-40, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(visible = true, transformation(origin = {-10, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor2 annotation(
    Placement(visible = true, transformation(origin = {20, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor3 annotation(
    Placement(visible = true, transformation(origin = {50, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor4 annotation(
    Placement(visible = true, transformation(origin = {80, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Blocks.Math.Sum Q_flow_actual(nin = 5) annotation(
    Placement(visible = true, transformation(origin = {115, -7}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate m_flow_hot(redeclare package Medium = liquidHside) annotation(
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate m_flow_cold(redeclare package Medium = liquidCside) annotation(
    Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  FluidSystemComponents.Sensor.SpecificHeatCapacity Cp_hotIn(redeclare package Medium = liquidHside) annotation(
    Placement(visible = true, transformation(origin = {-85, 57}, extent = {{-5, -5}, {5, 5}}, rotation = 270)));
  FluidSystemComponents.Sensor.SpecificHeatCapacity Cp_coldIn(redeclare package Medium = liquidCside) annotation(
    Placement(visible = true, transformation(origin = {-85, -63}, extent = {{-5, -5}, {5, 5}}, rotation = 270)));
  Modelica.Blocks.Sources.RealExpression Q_flow_ideal(y = min(m_flow_hot.m_flow * Cp_hotIn.y_Cp, m_flow_cold.m_flow * Cp_coldIn.y_Cp) * (T_hotIn.T - T_coldIn.T)) annotation(
    Placement(visible = true, transformation(origin = {110, -24}, extent = {{-10, -8}, {10, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Division effHX annotation(
    Placement(visible = true, transformation(origin = {135, -10}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product Capacity_hotIn annotation(
    Placement(visible = true, transformation(origin = {-97, -85}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Math.Product capacity_coldIn annotation(
    Placement(visible = true, transformation(origin = {-97, 35}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_T_hotIn(duration = 0, height = 0, offset = 95 + 273.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-165, 64}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_coldIn(duration = 1, height = 0, offset = 10 + 273.15, startTime = 25) annotation(
    Placement(visible = true, transformation(origin = {-165, -56}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_hot(duration = 1, height = 0, offset = 1, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-165, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_cold(duration = 1, height = 0, offset = 2, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-165, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression hA_Hot(y = hAhot_discrete) annotation(
    Placement(visible = true, transformation(origin = {-130, 14}, extent = {{-10, -8}, {10, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression hA_Cold(y = hAcold_discrete) annotation(
    Placement(visible = true, transformation(origin = {-130, -12}, extent = {{-10, -8}, {10, 8}}, rotation = 0)));
equation
  connect(volH.ports[1], volH1.ports[1]) annotation(
    Line(points = {{-30, 60}, {0, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(volH1.ports[2], volH2.ports[1]) annotation(
    Line(points = {{0, 60}, {30, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(volH2.ports[2], volH3.ports[1]) annotation(
    Line(points = {{30, 60}, {60, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(volH3.ports[2], volH4.ports[1]) annotation(
    Line(points = {{60, 60}, {90, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(volC.ports[1], volC1.ports[1]) annotation(
    Line(points = {{-50, -60}, {-20, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(volC1.ports[2], volC2.ports[1]) annotation(
    Line(points = {{-20, -60}, {10, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(volC2.ports[2], volC3.ports[1]) annotation(
    Line(points = {{10, -60}, {40, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(volC3.ports[2], volC4.ports[1]) annotation(
    Line(points = {{40, -60}, {70, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(volH.heatPort, convection.fluid) annotation(
    Line(points = {{-40, 50}, {-40, 40}}, color = {191, 0, 0}, thickness = 1));
  connect(volH1.heatPort, convection1.fluid) annotation(
    Line(points = {{-10, 50}, {-10, 40}}, color = {191, 0, 0}, thickness = 1));
  connect(volH2.heatPort, convection2.fluid) annotation(
    Line(points = {{20, 50}, {20, 40}}, color = {191, 0, 0}, thickness = 1));
  connect(convection3.fluid, volH3.heatPort) annotation(
    Line(points = {{50, 40}, {50, 50}}, color = {191, 0, 0}, thickness = 1));
  connect(convection4.fluid, volH4.heatPort) annotation(
    Line(points = {{80, 40}, {80, 50}}, color = {191, 0, 0}, thickness = 1));
  connect(convection5.fluid, volC.heatPort) annotation(
    Line(points = {{-40, -40}, {-40, -50}}, color = {191, 0, 0}, thickness = 1));
  connect(convection6.fluid, volC1.heatPort) annotation(
    Line(points = {{-10, -40}, {-10, -50}}, color = {191, 0, 0}, thickness = 1));
  connect(convection7.fluid, volC2.heatPort) annotation(
    Line(points = {{20, -40}, {20, -50}}, color = {191, 0, 0}, thickness = 1));
  connect(convection8.fluid, volC3.heatPort) annotation(
    Line(points = {{50, -40}, {50, -50}}, color = {191, 0, 0}, thickness = 1));
  connect(convection9.fluid, volC4.heatPort) annotation(
    Line(points = {{80, -40}, {80, -50}}, color = {191, 0, 0}, thickness = 1));
  connect(volH4.ports[2], T_hotOut.port_a) annotation(
    Line(points = {{90, 60}, {110, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(T_hotOut.port_b, sink_hotFluid.ports[1]) annotation(
    Line(points = {{120, 60}, {140, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(volC4.ports[2], T_coldOut.port_a) annotation(
    Line(points = {{70, -60}, {110, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(T_coldOut.port_b, sink_coolant.ports[1]) annotation(
    Line(points = {{120, -60}, {140, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(source_hotFluid.ports[1], T_hotIn.port_a) annotation(
    Line(points = {{-130, 60}, {-120, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(souce_coolant.ports[1], T_coldIn.port_a) annotation(
    Line(points = {{-130, -60}, {-120, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(convection.solid, heatFlowSensor.port_a) annotation(
    Line(points = {{-40, 20}, {-40, 9}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor.port_b, convection5.solid) annotation(
    Line(points = {{-40, -1}, {-40, -20}}, color = {191, 0, 0}, thickness = 1));
  connect(convection1.solid, heatFlowSensor1.port_a) annotation(
    Line(points = {{-10, 20}, {-10, 9}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor1.port_b, convection6.solid) annotation(
    Line(points = {{-10, -1}, {-10, -20}}, color = {191, 0, 0}, thickness = 1));
  connect(convection2.solid, heatFlowSensor2.port_a) annotation(
    Line(points = {{20, 20}, {20, 9}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor2.port_b, convection7.solid) annotation(
    Line(points = {{20, -1}, {20, -20}}, color = {191, 0, 0}, thickness = 1));
  connect(convection3.solid, heatFlowSensor3.port_a) annotation(
    Line(points = {{50, 20}, {50, 9}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor3.port_b, convection8.solid) annotation(
    Line(points = {{50, -1}, {50, -20}}, color = {191, 0, 0}, thickness = 1));
  connect(convection4.solid, heatFlowSensor4.port_a) annotation(
    Line(points = {{80, 20}, {80, 9}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor4.port_b, convection9.solid) annotation(
    Line(points = {{80, -1}, {80, -20}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor4.Q_flow, Q_flow_actual.u[5]) annotation(
    Line(points = {{85, 4}, {85, -7}, {109, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor.Q_flow, Q_flow_actual.u[1]) annotation(
    Line(points = {{-35, 4}, {-35, -7}, {109, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor1.Q_flow, Q_flow_actual.u[2]) annotation(
    Line(points = {{-5, 4}, {-5, -7}, {109, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor2.Q_flow, Q_flow_actual.u[3]) annotation(
    Line(points = {{25, 4}, {24, 4}, {24, -7}, {109, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor3.Q_flow, Q_flow_actual.u[4]) annotation(
    Line(points = {{55, 4}, {55, -7}, {109, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(T_hotIn.port_b, m_flow_hot.port_a) annotation(
    Line(points = {{-110, 60}, {-104, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(T_coldIn.port_b, m_flow_cold.port_a) annotation(
    Line(points = {{-110, -60}, {-104, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(m_flow_hot.port_b, volH.ports[2]) annotation(
    Line(points = {{-95, 60}, {-31, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(m_flow_cold.port_b, volC.ports[2]) annotation(
    Line(points = {{-95, -60}, {-51, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(m_flow_hot.port_b, Cp_hotIn.port) annotation(
    Line(points = {{-95, 60}, {-90, 60}, {-90, 57}}, color = {0, 127, 255}));
  connect(m_flow_cold.port_b, Cp_coldIn.port) annotation(
    Line(points = {{-95, -60}, {-90, -60}, {-90, -63}}, color = {0, 127, 255}));
  connect(Q_flow_actual.y, effHX.u1) annotation(
    Line(points = {{120.5, -7}, {129, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(Q_flow_ideal.y, effHX.u2) annotation(
    Line(points = {{121, -24}, {125, -24}, {125, -13}, {129, -13}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(m_flow_hot.m_flow, capacity_coldIn.u2) annotation(
    Line(points = {{-100, 54}, {-100, 41}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(Cp_hotIn.y_Cp, capacity_coldIn.u1) annotation(
    Line(points = {{-85, 51.5}, {-85, 50}, {-94, 50}, {-94, 41}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(m_flow_cold.m_flow, Capacity_hotIn.u2) annotation(
    Line(points = {{-100, -66}, {-100, -79}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(Cp_coldIn.y_Cp, Capacity_hotIn.u1) annotation(
    Line(points = {{-85, -68.5}, {-85, -70}, {-94, -70}, {-94, -79}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(ramp_T_hotIn.y, source_hotFluid.T_in) annotation(
    Line(points = {{-159.5, 64}, {-152, 64}}, color = {0, 0, 127}));
  connect(ramp_T_coldIn.y, souce_coolant.T_in) annotation(
    Line(points = {{-159.5, -56}, {-152, -56}}, color = {0, 0, 127}));
  connect(ramp_m_flow_hot.y, source_hotFluid.m_flow_in) annotation(
    Line(points = {{-159.5, 80}, {-154.75, 80}, {-154.75, 68}, {-150, 68}}, color = {0, 0, 127}));
  connect(ramp_m_flow_cold.y, souce_coolant.m_flow_in) annotation(
    Line(points = {{-159.5, -40}, {-156, -40}, {-156, -52}, {-150, -52}}, color = {0, 0, 127}));
//--------------------
  hAhot_discrete= hConvHot*kSize*areaH/nHot;
  hAcold_discrete= hConvCold*kSize*areaC/nCold;
  Rtotal = 1.0 / (hAhot_discrete*nHot) + 1.0 / (hAcold_discrete*nCold);
  UAtotal = 1.0 / Rtotal;
  Cmin = min(Capacity_hotIn.y, capacity_coldIn.y);
  Cmax = max(Capacity_hotIn.y, capacity_coldIn.y);
  Cratio = Cmin / Cmax;
  NTU = UAtotal / Cmin;
  effHX_theoretical = (1.0 - exp(-1.0 * NTU * (1.0 + Cratio))) / (1.0 + Cratio);
//--------------------
  connect(hA_Hot.y, convection.Gc) annotation(
    Line(points = {{-119, 14}, {-50, 14}, {-50, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Hot.y, convection1.Gc) annotation(
    Line(points = {{-119, 14}, {-20, 14}, {-20, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Hot.y, convection2.Gc) annotation(
    Line(points = {{-119, 14}, {10, 14}, {10, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Hot.y, convection3.Gc) annotation(
    Line(points = {{-119, 14}, {40, 14}, {40, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Hot.y, convection4.Gc) annotation(
    Line(points = {{-119, 14}, {70, 14}, {70, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Cold.y, convection5.Gc) annotation(
    Line(points = {{-118, -12}, {-50, -12}, {-50, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Cold.y, convection6.Gc) annotation(
    Line(points = {{-118, -12}, {-20, -12}, {-20, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Cold.y, convection7.Gc) annotation(
    Line(points = {{-118, -12}, {10, -12}, {10, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Cold.y, convection8.Gc) annotation(
    Line(points = {{-118, -12}, {40, -12}, {40, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Cold.y, convection9.Gc) annotation(
    Line(points = {{-118, -12}, {70, -12}, {70, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  annotation(
    Diagram(coordinateSystem(extent = {{-180, -100}, {160, 120}})),
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-6, Interval = 0.06));
end HX_ShellTube_parallel_discrete005_ex01;
