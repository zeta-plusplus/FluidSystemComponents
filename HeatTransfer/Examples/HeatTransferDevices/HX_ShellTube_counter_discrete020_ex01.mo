within FluidSystemComponents.HeatTransfer.Examples.HeatTransferDevices;

model HX_ShellTube_counter_discrete020_ex01
  extends Modelica.Icons.Example;
  import units = Modelica.SIunits;
  //--------------------
  //replaceable package liquidHside = Modelica.Media.Incompressible.Examples.Glycol47;
  replaceable package liquidHside = Modelica.Media.Water.StandardWater;
  //redeclare package Medium = liquidHside
  replaceable package liquidCside = Modelica.Media.Water.StandardWater;
  //redeclare package Medium = liquidCside
  //--------------------
  parameter units.CoefficientOfHeatTransfer hConvHot(start = 500.0) = 500.0 "heat transfer coefficient, hot side";
  parameter units.CoefficientOfHeatTransfer hConvCold(start = 500.0) = 500.0 "heat transfer coefficient, cold side";
  parameter units.Area areaH(start = 1.0) = 1.0;
  parameter units.Area areaC(start = 1.0) = 1.0;
  parameter Real nHot = 20;
  parameter Real nCold = nHot;
  parameter Real kSize(start = 1.0) = 1.0;
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
    Placement(visible = true, transformation(origin = {-250, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T souce_coolant(redeclare package Medium = liquidCside, T = 10 + 273.15, m_flow = 2, nPorts = 1, use_T_in = true, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {228, -250}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT sink_hotFluid(redeclare package Medium = liquidHside, T = 273.15, nPorts = 1, p = 101.325 * 1000.0) annotation(
    Placement(visible = true, transformation(origin = {230, -130}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT sink_coolant(redeclare package Medium = liquidCside, T = 273.15, nPorts = 1, p = 101.325 * 1000.0) annotation(
    Placement(visible = true, transformation(origin = {-230, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volH(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-140, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH1(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH2(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH3(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH4(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC(redeclare package Medium = liquidCside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-140, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume volC1(redeclare package Medium = liquidCside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume volC2(redeclare package Medium = liquidCside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume volC3(redeclare package Medium = liquidCside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume volC4(redeclare package Medium = liquidCside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-20, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH annotation(
    Placement(visible = true, transformation(origin = {-140, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH1 annotation(
    Placement(visible = true, transformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH2 annotation(
    Placement(visible = true, transformation(origin = {-80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH3 annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH4 annotation(
    Placement(visible = true, transformation(origin = {-20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC annotation(
    Placement(visible = true, transformation(origin = {-140, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC1 annotation(
    Placement(visible = true, transformation(origin = {-110, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC2 annotation(
    Placement(visible = true, transformation(origin = {-80, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC3 annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC4 annotation(
    Placement(visible = true, transformation(origin = {-20, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_hotOut(redeclare package Medium = liquidHside) annotation(
    Placement(visible = true, transformation(origin = {205, -130}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_coldOut(redeclare package Medium = liquidCside) annotation(
    Placement(visible = true, transformation(origin = {-200, -60}, extent = {{5, 5}, {-5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_hotIn(redeclare package Medium = liquidHside) annotation(
    Placement(visible = true, transformation(origin = {-225, 60}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_coldIn(redeclare package Medium = liquidCside) annotation(
    Placement(visible = true, transformation(origin = {204, -250}, extent = {{5, 5}, {-5, -5}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(visible = true, transformation(origin = {-140, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(visible = true, transformation(origin = {-110, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor2 annotation(
    Placement(visible = true, transformation(origin = {-80, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor3 annotation(
    Placement(visible = true, transformation(origin = {-50, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor4 annotation(
    Placement(visible = true, transformation(origin = {-20, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Blocks.Math.Sum Q_flow_actual(nin = 20) annotation(
    Placement(visible = true, transformation(origin = {215, -7}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate m_flow_hot(redeclare package Medium = liquidHside) annotation(
    Placement(visible = true, transformation(origin = {-210, 60}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate m_flow_cold(redeclare package Medium = liquidCside) annotation(
    Placement(visible = true, transformation(origin = {180, -250}, extent = {{5, 5}, {-5, -5}}, rotation = 0)));
  FluidSystemComponents.Sensor.SpecificHeatCapacity Cp_hotIn(redeclare package Medium = liquidHside) annotation(
    Placement(visible = true, transformation(origin = {-195, 57}, extent = {{-5, -5}, {5, 5}}, rotation = 270)));
  FluidSystemComponents.Sensor.SpecificHeatCapacity Cp_coldIn(redeclare package Medium = liquidCside) annotation(
    Placement(visible = true, transformation(origin = {193, -257}, extent = {{-5, -5}, {5, 5}}, rotation = 270)));
  Modelica.Blocks.Sources.RealExpression Q_flow_ideal(y = min(m_flow_hot.m_flow * Cp_hotIn.y_Cp, m_flow_cold.m_flow * Cp_coldIn.y_Cp) * (T_hotIn.T - T_coldIn.T)) annotation(
    Placement(visible = true, transformation(origin = {210, -24}, extent = {{-10, -8}, {10, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Division effHX annotation(
    Placement(visible = true, transformation(origin = {235, -10}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product Capacity_hotIn annotation(
    Placement(visible = true, transformation(origin = {183, -279}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Math.Product capacity_coldIn annotation(
    Placement(visible = true, transformation(origin = {-207, 41}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_T_hotIn(duration = 0, height = 0, offset = 95 + 273.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-275, 64}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_coldIn(duration = 1, height = 0, offset = 10 + 273.15, startTime = 25) annotation(
    Placement(visible = true, transformation(origin = {255, -246}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_hot(duration = 1, height = 0, offset = 1, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-275, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_cold(duration = 1, height = 0, offset = 2, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {255, -228}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression hA_Hot(y = hAhot_discrete) annotation(
    Placement(visible = true, transformation(origin = {-250, 30}, extent = {{-10, -8}, {10, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression hA_Cold(y = hAcold_discrete) annotation(
    Placement(visible = true, transformation(origin = {-250, -30}, extent = {{-10, -8}, {10, 8}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC5 annotation(
    Placement(visible = true, transformation(origin = {20, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH5 annotation(
    Placement(visible = true, transformation(origin = {20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC5(redeclare package Medium = liquidCside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {20, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume volH5(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor5 annotation(
    Placement(visible = true, transformation(origin = {20, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volC6(redeclare package Medium = liquidCside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC6 annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH6 annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor6 annotation(
    Placement(visible = true, transformation(origin = {50, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volH6(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC7(redeclare package Medium = liquidCside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC7 annotation(
    Placement(visible = true, transformation(origin = {80, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor7 annotation(
    Placement(visible = true, transformation(origin = {80, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH7 annotation(
    Placement(visible = true, transformation(origin = {80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH7(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC8(redeclare package Medium = liquidCside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC8 annotation(
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor8 annotation(
    Placement(visible = true, transformation(origin = {110, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH8 annotation(
    Placement(visible = true, transformation(origin = {110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH8(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC9(redeclare package Medium = liquidCside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {140, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC9 annotation(
    Placement(visible = true, transformation(origin = {140, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor9 annotation(
    Placement(visible = true, transformation(origin = {140, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH9 annotation(
    Placement(visible = true, transformation(origin = {140, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH9(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {140, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH16(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {60, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor12 annotation(
    Placement(visible = true, transformation(origin = {-70, -188}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volH18(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {120, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC18(redeclare package Medium = liquidCside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {120, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH10 annotation(
    Placement(visible = true, transformation(origin = {-130, -162}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH15 annotation(
    Placement(visible = true, transformation(origin = {30, -162}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC10 annotation(
    Placement(visible = true, transformation(origin = {-130, -220}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC11(redeclare package Medium = liquidCside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-100, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor10 annotation(
    Placement(visible = true, transformation(origin = {-130, -188}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH18 annotation(
    Placement(visible = true, transformation(origin = {120, -162}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor17 annotation(
    Placement(visible = true, transformation(origin = {90, -188}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor15 annotation(
    Placement(visible = true, transformation(origin = {30, -188}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volH19(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {150, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC19(redeclare package Medium = liquidCside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {150, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume volH12(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-70, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor13 annotation(
    Placement(visible = true, transformation(origin = {-40, -188}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor18 annotation(
    Placement(visible = true, transformation(origin = {120, -188}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC18 annotation(
    Placement(visible = true, transformation(origin = {120, -220}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC16(redeclare package Medium = liquidCside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {60, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH13 annotation(
    Placement(visible = true, transformation(origin = {-40, -162}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor19 annotation(
    Placement(visible = true, transformation(origin = {150, -188}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volH14(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-10, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH15(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {30, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC13 annotation(
    Placement(visible = true, transformation(origin = {-40, -220}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC13(redeclare package Medium = liquidCside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-40, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC14 annotation(
    Placement(visible = true, transformation(origin = {-10, -220}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH19 annotation(
    Placement(visible = true, transformation(origin = {150, -162}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC12(redeclare package Medium = liquidCside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-70, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume volH13(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-40, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC14(redeclare package Medium = liquidCside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-10, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC16 annotation(
    Placement(visible = true, transformation(origin = {60, -220}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH10(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-130, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC12 annotation(
    Placement(visible = true, transformation(origin = {-70, -220}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC19 annotation(
    Placement(visible = true, transformation(origin = {150, -220}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor11 annotation(
    Placement(visible = true, transformation(origin = {-100, -188}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volC17(redeclare package Medium = liquidCside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {90, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume volC15(redeclare package Medium = liquidCside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {30, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor16 annotation(
    Placement(visible = true, transformation(origin = {60, -188}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC17 annotation(
    Placement(visible = true, transformation(origin = {90, -220}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH17 annotation(
    Placement(visible = true, transformation(origin = {90, -162}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH14 annotation(
    Placement(visible = true, transformation(origin = {-10, -162}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC11 annotation(
    Placement(visible = true, transformation(origin = {-100, -220}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH11(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-100, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH12 annotation(
    Placement(visible = true, transformation(origin = {-70, -162}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH17(redeclare package Medium = liquidHside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {90, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH16 annotation(
    Placement(visible = true, transformation(origin = {60, -162}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC15 annotation(
    Placement(visible = true, transformation(origin = {30, -220}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor14 annotation(
    Placement(visible = true, transformation(origin = {-10, -188}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volC10(redeclare package Medium = liquidCside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-130, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH11 annotation(
    Placement(visible = true, transformation(origin = {-100, -162}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature_hot(redeclare package Medium = liquidHside) annotation(
    Placement(visible = true, transformation(origin = {-155, -130}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature_cold(redeclare package Medium = liquidCside) annotation(
    Placement(visible = true, transformation(origin = {-165, -250}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
equation
  connect(volH.ports[1], volH1.ports[1]) annotation(
    Line(points = {{-130, 60}, {-100, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(volH1.ports[2], volH2.ports[1]) annotation(
    Line(points = {{-100, 60}, {-70, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(volH2.ports[2], volH3.ports[1]) annotation(
    Line(points = {{-70, 60}, {-40, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(volH3.ports[2], volH4.ports[1]) annotation(
    Line(points = {{-40, 60}, {-10, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(volC.ports[1], volC1.ports[1]) annotation(
    Line(points = {{-150, -60}, {-120, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(volC1.ports[2], volC2.ports[1]) annotation(
    Line(points = {{-120, -60}, {-90, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(volC2.ports[2], volC3.ports[1]) annotation(
    Line(points = {{-90, -60}, {-60, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(volC3.ports[2], volC4.ports[1]) annotation(
    Line(points = {{-60, -60}, {-30, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(volH.heatPort, convectionH.fluid) annotation(
    Line(points = {{-140, 50}, {-140, 40}}, color = {191, 0, 0}, thickness = 1));
  connect(volH1.heatPort, convectionH1.fluid) annotation(
    Line(points = {{-110, 50}, {-110, 40}}, color = {191, 0, 0}, thickness = 1));
  connect(volH2.heatPort, convectionH2.fluid) annotation(
    Line(points = {{-80, 50}, {-80, 40}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH3.fluid, volH3.heatPort) annotation(
    Line(points = {{-50, 40}, {-50, 50}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH4.fluid, volH4.heatPort) annotation(
    Line(points = {{-20, 40}, {-20, 50}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionC.fluid, volC.heatPort) annotation(
    Line(points = {{-140, -40}, {-140, -50}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionC1.fluid, volC1.heatPort) annotation(
    Line(points = {{-110, -40}, {-110, -50}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionC2.fluid, volC2.heatPort) annotation(
    Line(points = {{-80, -40}, {-80, -50}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionC3.fluid, volC3.heatPort) annotation(
    Line(points = {{-50, -40}, {-50, -50}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionC4.fluid, volC4.heatPort) annotation(
    Line(points = {{-20, -40}, {-20, -50}}, color = {191, 0, 0}, thickness = 1));
  connect(T_hotOut.port_b, sink_hotFluid.ports[1]) annotation(
    Line(points = {{210, -130}, {220, -130}}, color = {0, 127, 255}, thickness = 1));
  connect(T_coldOut.port_b, sink_coolant.ports[1]) annotation(
    Line(points = {{-205, -60}, {-220, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(source_hotFluid.ports[1], T_hotIn.port_a) annotation(
    Line(points = {{-240, 60}, {-230, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(souce_coolant.ports[1], T_coldIn.port_a) annotation(
    Line(points = {{218, -250}, {209, -250}}, color = {0, 127, 255}, thickness = 1));
  connect(convectionH.solid, heatFlowSensor.port_a) annotation(
    Line(points = {{-140, 20}, {-140, 9}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor.port_b, convectionC.solid) annotation(
    Line(points = {{-140, -1}, {-140, -20}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH1.solid, heatFlowSensor1.port_a) annotation(
    Line(points = {{-110, 20}, {-110, 9}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor1.port_b, convectionC1.solid) annotation(
    Line(points = {{-110, -1}, {-110, -20}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH2.solid, heatFlowSensor2.port_a) annotation(
    Line(points = {{-80, 20}, {-80, 9}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor2.port_b, convectionC2.solid) annotation(
    Line(points = {{-80, -1}, {-80, -20}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH3.solid, heatFlowSensor3.port_a) annotation(
    Line(points = {{-50, 20}, {-50, 9}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor3.port_b, convectionC3.solid) annotation(
    Line(points = {{-50, -1}, {-50, -20}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH4.solid, heatFlowSensor4.port_a) annotation(
    Line(points = {{-20, 20}, {-20, 9}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor4.port_b, convectionC4.solid) annotation(
    Line(points = {{-20, -1}, {-20, -20}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor4.Q_flow, Q_flow_actual.u[5]) annotation(
    Line(points = {{-15, 4}, {-15, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor.Q_flow, Q_flow_actual.u[1]) annotation(
    Line(points = {{-135, 4}, {-135, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor1.Q_flow, Q_flow_actual.u[2]) annotation(
    Line(points = {{-105, 4}, {-105, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor2.Q_flow, Q_flow_actual.u[3]) annotation(
    Line(points = {{-75, 4}, {-76, 4}, {-76, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor3.Q_flow, Q_flow_actual.u[4]) annotation(
    Line(points = {{-45, 4}, {-45, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(T_hotIn.port_b, m_flow_hot.port_a) annotation(
    Line(points = {{-220, 60}, {-214, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(T_coldIn.port_b, m_flow_cold.port_a) annotation(
    Line(points = {{199, -250}, {185, -250}}, color = {0, 127, 255}, thickness = 1));
  connect(m_flow_hot.port_b, volH.ports[2]) annotation(
    Line(points = {{-205, 60}, {-130, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(m_flow_hot.port_b, Cp_hotIn.port) annotation(
    Line(points = {{-205, 60}, {-200, 60}, {-200, 57}}, color = {0, 127, 255}));
  connect(m_flow_cold.port_b, Cp_coldIn.port) annotation(
    Line(points = {{175, -250}, {188, -250}, {188, -257}}, color = {0, 127, 255}));
  connect(Q_flow_actual.y, effHX.u1) annotation(
    Line(points = {{220.5, -7}, {229, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(Q_flow_ideal.y, effHX.u2) annotation(
    Line(points = {{221, -24}, {225, -24}, {225, -13}, {229, -13}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(m_flow_hot.m_flow, capacity_coldIn.u2) annotation(
    Line(points = {{-210, 54.5}, {-210, 47}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(Cp_hotIn.y_Cp, capacity_coldIn.u1) annotation(
    Line(points = {{-195, 51.5}, {-195, 50}, {-204, 50}, {-204, 47}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(m_flow_cold.m_flow, Capacity_hotIn.u2) annotation(
    Line(points = {{180, -255.5}, {180, -273}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(ramp_T_hotIn.y, source_hotFluid.T_in) annotation(
    Line(points = {{-269.5, 64}, {-262, 64}}, color = {0, 0, 127}));
  connect(ramp_T_coldIn.y, souce_coolant.T_in) annotation(
    Line(points = {{249.5, -246}, {240, -246}}, color = {0, 0, 127}));
  connect(ramp_m_flow_hot.y, source_hotFluid.m_flow_in) annotation(
    Line(points = {{-269.5, 80}, {-264.75, 80}, {-264.75, 68}, {-260, 68}}, color = {0, 0, 127}));
  connect(ramp_m_flow_cold.y, souce_coolant.m_flow_in) annotation(
    Line(points = {{249.5, -228}, {243.75, -228}, {243.75, -242}, {238, -242}}, color = {0, 0, 127}));
//--------------------
  hAhot_discrete = hConvHot * kSize * areaH / nHot;
  hAcold_discrete = hConvCold * kSize * areaC / nCold;
  Rtotal = 1.0 / (hAhot_discrete * nHot) + 1.0 / (hAcold_discrete * nCold);
  UAtotal = 1.0 / Rtotal;
  Cmin = min(Capacity_hotIn.y, capacity_coldIn.y);
  Cmax = max(Capacity_hotIn.y, capacity_coldIn.y);
  Cratio = Cmin / Cmax;
  NTU = UAtotal / Cmin;
  //----
  if(Cratio==1.0)then
    effHX_theoretical=NTU/(1.0+NTU);
  else
    effHX_theoretical = (1.0 - exp(-1.0 * NTU * (1.0 - Cratio))) / (1.0 - Cratio*exp(-1.0*NTU*(1.0 - Cratio)));
  end if;
//--------------------
  connect(hA_Hot.y, convectionH.Gc) annotation(
    Line(points = {{-239, 30}, {-150, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Hot.y, convectionH1.Gc) annotation(
    Line(points = {{-239, 30}, {-120, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Hot.y, convectionH2.Gc) annotation(
    Line(points = {{-239, 30}, {-90, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Hot.y, convectionH3.Gc) annotation(
    Line(points = {{-239, 30}, {-60, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Hot.y, convectionH4.Gc) annotation(
    Line(points = {{-239, 30}, {-30, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC.Gc) annotation(
    Line(points = {{-239, -30}, {-150, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC1.Gc) annotation(
    Line(points = {{-239, -30}, {-120, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC2.Gc) annotation(
    Line(points = {{-239, -30}, {-90, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC3.Gc) annotation(
    Line(points = {{-239, -30}, {-60, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC4.Gc) annotation(
    Line(points = {{-239, -30}, {-30, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(volH5.heatPort, convectionH5.fluid) annotation(
    Line(points = {{20, 50}, {20, 40}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH5.solid, heatFlowSensor5.port_a) annotation(
    Line(points = {{20, 20}, {20, 9}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor5.port_b, convectionC5.solid) annotation(
    Line(points = {{20, -1}, {20, -20}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionC5.fluid, volC5.heatPort) annotation(
    Line(points = {{20, -40}, {20, -50}}, color = {191, 0, 0}, thickness = 1));
  connect(volH4.ports[2], volH5.ports[1]) annotation(
    Line(points = {{-10, 60}, {30, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(volC4.ports[2], volC5.ports[1]) annotation(
    Line(points = {{-30, -60}, {10, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(volH6.heatPort, convectionH6.fluid) annotation(
    Line(points = {{50, 50}, {50, 40}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH6.solid, heatFlowSensor6.port_a) annotation(
    Line(points = {{50, 20}, {50, 9}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor6.port_b, convectionC6.solid) annotation(
    Line(points = {{50, -1}, {50, -21}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionC6.fluid, volC6.heatPort) annotation(
    Line(points = {{50, -40}, {50, -50}}, color = {191, 0, 0}, thickness = 1));
  connect(volH5.ports[2], volH6.ports[1]) annotation(
    Line(points = {{30, 60}, {60, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(volC5.ports[2], volC6.ports[1]) annotation(
    Line(points = {{10, -60}, {40, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(volH6.ports[2], volH7.ports[1]) annotation(
    Line(points = {{60, 60}, {90, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(volC6.ports[2], volC7.ports[1]) annotation(
    Line(points = {{40, -60}, {70, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(volH7.heatPort, convectionH7.fluid) annotation(
    Line(points = {{80, 50}, {80, 40}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH7.solid, heatFlowSensor7.port_a) annotation(
    Line(points = {{80, 20}, {80, 9}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor7.port_b, convectionC7.solid) annotation(
    Line(points = {{80, -1}, {80, -21}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionC7.fluid, volC7.heatPort) annotation(
    Line(points = {{80, -40}, {80, -50}}, color = {191, 0, 0}, thickness = 1));
  connect(volH7.ports[2], volH8.ports[1]) annotation(
    Line(points = {{90, 60}, {120, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(volH8.ports[2], volH9.ports[1]) annotation(
    Line(points = {{120, 60}, {150, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(convectionH8.solid, heatFlowSensor8.port_a) annotation(
    Line(points = {{110, 20}, {110, 9}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor8.port_b, convectionC8.solid) annotation(
    Line(points = {{110, -1}, {110, -21}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionC8.fluid, volC8.heatPort) annotation(
    Line(points = {{110, -40}, {110, -50}}, color = {191, 0, 0}, thickness = 1));
  connect(volH8.heatPort, convectionH8.fluid) annotation(
    Line(points = {{110, 50}, {110, 40}}, color = {191, 0, 0}, thickness = 1));
  connect(volH9.heatPort, convectionH9.fluid) annotation(
    Line(points = {{140, 50}, {140, 40}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH9.solid, heatFlowSensor9.port_a) annotation(
    Line(points = {{140, 20}, {140, 9}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor9.port_b, convectionC9.solid) annotation(
    Line(points = {{140, -1}, {140, -21}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionC9.fluid, volC9.heatPort) annotation(
    Line(points = {{140, -40}, {140, -50}}, color = {191, 0, 0}, thickness = 1));
  connect(volC7.ports[2], volC8.ports[1]) annotation(
    Line(points = {{70, -60}, {100, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(volC8.ports[2], volC9.ports[1]) annotation(
    Line(points = {{100, -60}, {130, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(hA_Hot.y, convectionH9.Gc) annotation(
    Line(points = {{-239, 30}, {130, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Hot.y, convectionH8.Gc) annotation(
    Line(points = {{-239, 30}, {100, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Hot.y, convectionH7.Gc) annotation(
    Line(points = {{-239, 30}, {70, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Hot.y, convectionH6.Gc) annotation(
    Line(points = {{-239, 30}, {40, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Hot.y, convectionH5.Gc) annotation(
    Line(points = {{-239, 30}, {10, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC9.Gc) annotation(
    Line(points = {{-239, -30}, {130, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC8.Gc) annotation(
    Line(points = {{-239, -30}, {100, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC7.Gc) annotation(
    Line(points = {{-239, -30}, {70, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC6.Gc) annotation(
    Line(points = {{-239, -30}, {40, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC5.Gc) annotation(
    Line(points = {{-239, -30}, {10, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor5.Q_flow, Q_flow_actual.u[6]) annotation(
    Line(points = {{25, 4}, {25, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor6.Q_flow, Q_flow_actual.u[7]) annotation(
    Line(points = {{55, 4}, {55, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor7.Q_flow, Q_flow_actual.u[8]) annotation(
    Line(points = {{85, 4}, {85, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor8.Q_flow, Q_flow_actual.u[9]) annotation(
    Line(points = {{115, 4}, {115, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor9.Q_flow, Q_flow_actual.u[10]) annotation(
    Line(points = {{145, 4}, {145, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(volH15.heatPort, convectionH15.fluid) annotation(
    Line(points = {{30, -140}, {30, -152}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionC16.fluid, volC16.heatPort) annotation(
    Line(points = {{60, -230}, {60, -240}}, color = {191, 0, 0}, thickness = 1));
  connect(volH14.ports[2], volH15.ports[1]) annotation(
    Line(points = {{0, -130}, {40, -130}}, color = {0, 127, 255}, thickness = 1));
  connect(volC17.ports[2], volC18.ports[1]) annotation(
    Line(points = {{80, -250}, {110, -250}}, color = {0, 127, 255}, thickness = 1));
  connect(volC14.ports[2], volC15.ports[1]) annotation(
    Line(points = {{-20, -250}, {20, -250}}, color = {0, 127, 255}, thickness = 1));
  connect(convectionC18.fluid, volC18.heatPort) annotation(
    Line(points = {{120, -230}, {120, -240}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor15.port_b, convectionC15.solid) annotation(
    Line(points = {{30, -193}, {30, -210}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionC13.fluid, volC13.heatPort) annotation(
    Line(points = {{-40, -230}, {-40, -240}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH12.solid, heatFlowSensor12.port_a) annotation(
    Line(points = {{-70, -172}, {-70, -183}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH15.solid, heatFlowSensor15.port_a) annotation(
    Line(points = {{30, -172}, {30, -183}}, color = {191, 0, 0}, thickness = 1));
  connect(volH16.ports[2], volH17.ports[1]) annotation(
    Line(points = {{70, -130}, {100, -130}}, color = {0, 127, 255}, thickness = 1));
  connect(convectionH14.solid, heatFlowSensor14.port_a) annotation(
    Line(points = {{-10, -172}, {-10, -183}}, color = {191, 0, 0}, thickness = 1));
  connect(volH12.ports[2], volH13.ports[1]) annotation(
    Line(points = {{-60, -130}, {-30, -130}}, color = {0, 127, 255}, thickness = 1));
  connect(convectionH13.fluid, volH13.heatPort) annotation(
    Line(points = {{-40, -152}, {-40, -140}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor13.port_b, convectionC13.solid) annotation(
    Line(points = {{-40, -193}, {-40, -210}}, color = {191, 0, 0}, thickness = 1));
  connect(volH10.ports[1], volH11.ports[1]) annotation(
    Line(points = {{-120, -130}, {-90, -130}}, color = {0, 127, 255}, thickness = 1));
  connect(convectionC11.fluid, volC11.heatPort) annotation(
    Line(points = {{-100, -230}, {-100, -240}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionC19.fluid, volC19.heatPort) annotation(
    Line(points = {{150, -230}, {150, -240}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH18.solid, heatFlowSensor18.port_a) annotation(
    Line(points = {{120, -172}, {120, -183}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH17.solid, heatFlowSensor17.port_a) annotation(
    Line(points = {{90, -172}, {90, -183}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionC17.fluid, volC17.heatPort) annotation(
    Line(points = {{90, -230}, {90, -240}}, color = {191, 0, 0}, thickness = 1));
  connect(volH17.ports[2], volH18.ports[1]) annotation(
    Line(points = {{100, -130}, {130, -130}}, color = {0, 127, 255}, thickness = 1));
  connect(volC12.ports[2], volC13.ports[1]) annotation(
    Line(points = {{-80, -250}, {-50, -250}}, color = {0, 127, 255}, thickness = 1));
  connect(heatFlowSensor17.port_b, convectionC17.solid) annotation(
    Line(points = {{90, -193}, {90, -210}}, color = {191, 0, 0}, thickness = 1));
  connect(volH16.heatPort, convectionH16.fluid) annotation(
    Line(points = {{60, -140}, {60, -152}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionC12.fluid, volC12.heatPort) annotation(
    Line(points = {{-70, -230}, {-70, -240}}, color = {191, 0, 0}, thickness = 1));
  connect(volH15.ports[2], volH16.ports[1]) annotation(
    Line(points = {{40, -130}, {70, -130}}, color = {0, 127, 255}, thickness = 1));
  connect(volC15.ports[2], volC16.ports[1]) annotation(
    Line(points = {{20, -250}, {50, -250}}, color = {0, 127, 255}, thickness = 1));
  connect(heatFlowSensor14.port_b, convectionC14.solid) annotation(
    Line(points = {{-10, -193}, {-10, -210}}, color = {191, 0, 0}, thickness = 1));
  connect(volC13.ports[2], volC14.ports[1]) annotation(
    Line(points = {{-50, -250}, {-20, -250}}, color = {0, 127, 255}, thickness = 1));
  connect(convectionC10.fluid, volC10.heatPort) annotation(
    Line(points = {{-130, -230}, {-130, -240}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH10.solid, heatFlowSensor10.port_a) annotation(
    Line(points = {{-130, -172}, {-130, -183}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH13.solid, heatFlowSensor13.port_a) annotation(
    Line(points = {{-40, -172}, {-40, -183}}, color = {191, 0, 0}, thickness = 1));
  connect(volC11.ports[2], volC12.ports[1]) annotation(
    Line(points = {{-110, -250}, {-80, -250}}, color = {0, 127, 255}, thickness = 1));
  connect(heatFlowSensor11.port_b, convectionC11.solid) annotation(
    Line(points = {{-100, -193}, {-100, -210}}, color = {191, 0, 0}, thickness = 1));
  connect(volH17.heatPort, convectionH17.fluid) annotation(
    Line(points = {{90, -140}, {90, -152}}, color = {191, 0, 0}, thickness = 1));
  connect(volH18.ports[2], volH19.ports[1]) annotation(
    Line(points = {{130, -130}, {160, -130}}, color = {0, 127, 255}, thickness = 1));
  connect(convectionH16.solid, heatFlowSensor16.port_a) annotation(
    Line(points = {{60, -172}, {60, -183}}, color = {191, 0, 0}, thickness = 1));
  connect(volC18.ports[2], volC19.ports[1]) annotation(
    Line(points = {{110, -250}, {140, -250}}, color = {0, 127, 255}, thickness = 1));
  connect(convectionC15.fluid, volC15.heatPort) annotation(
    Line(points = {{30, -230}, {30, -240}}, color = {191, 0, 0}, thickness = 1));
  connect(volC16.ports[2], volC17.ports[1]) annotation(
    Line(points = {{50, -250}, {80, -250}}, color = {0, 127, 255}, thickness = 1));
  connect(convectionC14.fluid, volC14.heatPort) annotation(
    Line(points = {{-10, -230}, {-10, -240}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor16.port_b, convectionC16.solid) annotation(
    Line(points = {{60, -193}, {60, -210}}, color = {191, 0, 0}, thickness = 1));
  connect(volH11.heatPort, convectionH11.fluid) annotation(
    Line(points = {{-100, -140}, {-100, -152}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH11.solid, heatFlowSensor11.port_a) annotation(
    Line(points = {{-100, -172}, {-100, -183}}, color = {191, 0, 0}, thickness = 1));
  connect(volH10.heatPort, convectionH10.fluid) annotation(
    Line(points = {{-130, -140}, {-130, -152}}, color = {191, 0, 0}, thickness = 1));
  connect(volH12.heatPort, convectionH12.fluid) annotation(
    Line(points = {{-70, -140}, {-70, -152}}, color = {191, 0, 0}, thickness = 1));
  connect(convectionH19.solid, heatFlowSensor19.port_a) annotation(
    Line(points = {{150, -172}, {150, -183}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor18.port_b, convectionC18.solid) annotation(
    Line(points = {{120, -193}, {120, -210}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor19.port_b, convectionC19.solid) annotation(
    Line(points = {{150, -193}, {150, -210}}, color = {191, 0, 0}, thickness = 1));
  connect(volH18.heatPort, convectionH18.fluid) annotation(
    Line(points = {{120, -140}, {120, -152}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor10.port_b, convectionC10.solid) annotation(
    Line(points = {{-130, -193}, {-130, -210}}, color = {191, 0, 0}, thickness = 1));
  connect(volC10.ports[1], volC11.ports[1]) annotation(
    Line(points = {{-140, -250}, {-110, -250}}, color = {0, 127, 255}, thickness = 1));
  connect(heatFlowSensor12.port_b, convectionC12.solid) annotation(
    Line(points = {{-70, -193}, {-70, -210}}, color = {191, 0, 0}, thickness = 1));
  connect(volH19.heatPort, convectionH19.fluid) annotation(
    Line(points = {{150, -140}, {150, -152}}, color = {191, 0, 0}, thickness = 1));
  connect(volH11.ports[2], volH12.ports[1]) annotation(
    Line(points = {{-90, -130}, {-60, -130}}, color = {0, 127, 255}, thickness = 1));
  connect(volH13.ports[2], volH14.ports[1]) annotation(
    Line(points = {{-30, -130}, {0, -130}}, color = {0, 127, 255}, thickness = 1));
  connect(convectionH14.fluid, volH14.heatPort) annotation(
    Line(points = {{-10, -152}, {-10, -140}}, color = {191, 0, 0}, thickness = 1));
  connect(volH19.ports[2], T_hotOut.port_a) annotation(
    Line(points = {{160, -130}, {200, -130}}, color = {0, 127, 255}, thickness = 1));
  connect(temperature_hot.port_b, volH10.ports[2]) annotation(
    Line(points = {{-150, -130}, {-120, -130}}, color = {0, 127, 255}, thickness = 1));
  connect(temperature_hot.port_a, volH9.ports[2]) annotation(
    Line(points = {{-160, -130}, {-160, -108}, {172, -108}, {172, 60}, {150, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(temperature_cold.port_b, volC10.ports[2]) annotation(
    Line(points = {{-160, -250}, {-140, -250}}, color = {0, 127, 255}, thickness = 1));
  connect(volC9.ports[2], temperature_cold.port_a) annotation(
    Line(points = {{130, -60}, {164, -60}, {164, -92}, {-170, -92}, {-170, -250}}, color = {0, 127, 255}, thickness = 1));
  connect(hA_Hot.y, convectionH19.Gc) annotation(
    Line(points = {{-238, 30}, {-176, 30}, {-176, -162}, {140, -162}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Hot.y, convectionH18.Gc) annotation(
    Line(points = {{-238, 30}, {-176, 30}, {-176, -162}, {110, -162}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Hot.y, convectionH17.Gc) annotation(
    Line(points = {{-238, 30}, {-176, 30}, {-176, -162}, {80, -162}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Hot.y, convectionH16.Gc) annotation(
    Line(points = {{-238, 30}, {-176, 30}, {-176, -162}, {50, -162}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Hot.y, convectionH15.Gc) annotation(
    Line(points = {{-238, 30}, {-176, 30}, {-176, -162}, {20, -162}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Hot.y, convectionH14.Gc) annotation(
    Line(points = {{-238, 30}, {-176, 30}, {-176, -162}, {-20, -162}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Hot.y, convectionH13.Gc) annotation(
    Line(points = {{-238, 30}, {-176, 30}, {-176, -162}, {-50, -162}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Hot.y, convectionH12.Gc) annotation(
    Line(points = {{-238, 30}, {-176, 30}, {-176, -162}, {-80, -162}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Hot.y, convectionH11.Gc) annotation(
    Line(points = {{-238, 30}, {-176, 30}, {-176, -162}, {-110, -162}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Hot.y, convectionH10.Gc) annotation(
    Line(points = {{-238, 30}, {-176, 30}, {-176, -162}, {-140, -162}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC19.Gc) annotation(
    Line(points = {{-238, -30}, {-188, -30}, {-188, -220}, {140, -220}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC18.Gc) annotation(
    Line(points = {{-238, -30}, {-188, -30}, {-188, -220}, {110, -220}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC17.Gc) annotation(
    Line(points = {{-238, -30}, {-188, -30}, {-188, -220}, {80, -220}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC16.Gc) annotation(
    Line(points = {{-238, -30}, {-188, -30}, {-188, -220}, {50, -220}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC15.Gc) annotation(
    Line(points = {{-238, -30}, {-188, -30}, {-188, -220}, {20, -220}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC14.Gc) annotation(
    Line(points = {{-238, -30}, {-188, -30}, {-188, -220}, {-20, -220}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC13.Gc) annotation(
    Line(points = {{-238, -30}, {-188, -30}, {-188, -220}, {-50, -220}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC12.Gc) annotation(
    Line(points = {{-238, -30}, {-188, -30}, {-188, -220}, {-80, -220}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC11.Gc) annotation(
    Line(points = {{-238, -30}, {-188, -30}, {-188, -220}, {-110, -220}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(hA_Cold.y, convectionC10.Gc) annotation(
    Line(points = {{-238, -30}, {-188, -30}, {-188, -220}, {-140, -220}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor10.Q_flow, Q_flow_actual.u[11]) annotation(
    Line(points = {{-125, -188}, {184, -188}, {184, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor11.Q_flow, Q_flow_actual.u[12]) annotation(
    Line(points = {{-95, -188}, {184, -188}, {184, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor12.Q_flow, Q_flow_actual.u[13]) annotation(
    Line(points = {{-65, -188}, {184, -188}, {184, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor13.Q_flow, Q_flow_actual.u[14]) annotation(
    Line(points = {{-35, -188}, {184, -188}, {184, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor14.Q_flow, Q_flow_actual.u[15]) annotation(
    Line(points = {{-5, -188}, {184, -188}, {184, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor15.Q_flow, Q_flow_actual.u[16]) annotation(
    Line(points = {{35, -188}, {184, -188}, {184, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor16.Q_flow, Q_flow_actual.u[17]) annotation(
    Line(points = {{65, -188}, {184, -188}, {184, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor17.Q_flow, Q_flow_actual.u[18]) annotation(
    Line(points = {{95, -188}, {184, -188}, {184, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor18.Q_flow, Q_flow_actual.u[19]) annotation(
    Line(points = {{125, -188}, {184, -188}, {184, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(heatFlowSensor19.Q_flow, Q_flow_actual.u[20]) annotation(
    Line(points = {{155, -188}, {184, -188}, {184, -7}, {209, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dot));
  connect(Capacity_hotIn.u1, Cp_coldIn.y_Cp) annotation(
    Line(points = {{186, -273}, {186, -267}, {193, -267}, {193, -262.5}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(T_coldOut.port_a, volC.ports[2]) annotation(
    Line(points = {{-194, -60}, {-150, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(volC19.ports[2], m_flow_cold.port_b) annotation(
    Line(points = {{140, -250}, {175, -250}}, color = {0, 127, 255}, thickness = 1));
  annotation(
    Diagram(coordinateSystem(extent = {{-280, -300}, {260, 120}})),
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-6, Interval = 0.06));
end HX_ShellTube_counter_discrete020_ex01;
