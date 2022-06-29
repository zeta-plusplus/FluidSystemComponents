within FluidSystemComponents.HeatTransfer.Examples.HeatTransferDevices;

model HX_ShellTube_counter_discrete010_ex01
  extends Modelica.Icons.Example;
  import units = Modelica.SIunits;
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
  parameter Real nHot = 10;
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
    Placement(visible = true, transformation(origin = {-230, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T souce_coolant(redeclare package Medium = liquidCside, T = 10 + 273.15, m_flow = 2, nPorts = 1, use_T_in = true, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {220, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT sink_hotFluid(redeclare package Medium = liquidHside, T = 273.15, nPorts = 1, p = 101.325 * 1000.0) annotation(
    Placement(visible = true, transformation(origin = {210, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT sink_coolant(redeclare package Medium = liquidCside, T = 273.15, nPorts = 1, p = 101.325 * 1000.0) annotation(
    Placement(visible = true, transformation(origin = {-190, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    Placement(visible = true, transformation(origin = {175, 60}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_coldOut(redeclare package Medium = liquidCside) annotation(
    Placement(visible = true, transformation(origin = {-165, -60}, extent = {{5, 5}, {-5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_hotIn(redeclare package Medium = liquidHside) annotation(
    Placement(visible = true, transformation(origin = {-205, 60}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_coldIn(redeclare package Medium = liquidCside) annotation(
    Placement(visible = true, transformation(origin = {197, -60}, extent = {{5, 5}, {-5, -5}}, rotation = 0)));
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
  Modelica.Blocks.Math.Sum Q_flow_actual(nin = 10) annotation(
    Placement(visible = true, transformation(origin = {175, -7}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate m_flow_hot(redeclare package Medium = liquidHside) annotation(
    Placement(visible = true, transformation(origin = {-190, 60}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate m_flow_cold(redeclare package Medium = liquidCside) annotation(
    Placement(visible = true, transformation(origin = {174, -60}, extent = {{5, 5}, {-5, -5}}, rotation = 0)));
  FluidSystemComponents.Sensor.SpecificHeatCapacity Cp_hotIn(redeclare package Medium = liquidHside) annotation(
    Placement(visible = true, transformation(origin = {-175, 57}, extent = {{-5, -5}, {5, 5}}, rotation = 270)));
  FluidSystemComponents.Sensor.SpecificHeatCapacity Cp_coldIn(redeclare package Medium = liquidCside) annotation(
    Placement(visible = true, transformation(origin = {185, -69}, extent = {{-5, 5}, {5, -5}}, rotation = 270)));
  Modelica.Blocks.Sources.RealExpression Q_flow_ideal(y = min(m_flow_hot.m_flow * Cp_hotIn.y_Cp, m_flow_cold.m_flow * Cp_coldIn.y_Cp) * (T_hotIn.T - T_coldIn.T)) annotation(
    Placement(visible = true, transformation(origin = {170, -24}, extent = {{-10, -8}, {10, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Division effHX annotation(
    Placement(visible = true, transformation(origin = {195, -10}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product Capacity_hotIn annotation(
    Placement(visible = true, transformation(origin = {177, -91}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Math.Product capacity_coldIn annotation(
    Placement(visible = true, transformation(origin = {-187, 35}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_T_hotIn(duration = 0, height = 0, offset = 95 + 273.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-255, 64}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_coldIn(duration = 1, height = 0, offset = 10 + 273.15, startTime = 25) annotation(
    Placement(visible = true, transformation(origin = {247, -56}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_hot(duration = 1, height = 0, offset = 1, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-255, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_cold(duration = 1, height = 0, offset = 2, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {246, -39}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression hA_Hot(y = hAhot_discrete) annotation(
    Placement(visible = true, transformation(origin = {-220, 14}, extent = {{-10, -8}, {10, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression hA_Cold(y = hAcold_discrete) annotation(
    Placement(visible = true, transformation(origin = {-220, -12}, extent = {{-10, -8}, {10, 8}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC5 annotation(
    Placement(visible = true, transformation(origin = {20, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH5 annotation(
    Placement(visible = true, transformation(origin = {20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC5(redeclare package Medium = liquidCside, V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {20, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume volH5(redeclare package Medium = liquidHside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor5 annotation(
    Placement(visible = true, transformation(origin = {20, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volC6(redeclare package Medium = liquidCside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC6 annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH6 annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor6 annotation(
    Placement(visible = true, transformation(origin = {50, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volH6(redeclare package Medium = liquidHside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC7(redeclare package Medium = liquidCside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC7 annotation(
    Placement(visible = true, transformation(origin = {80, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor7 annotation(
    Placement(visible = true, transformation(origin = {80, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH7 annotation(
    Placement(visible = true, transformation(origin = {80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH7(redeclare package Medium = liquidHside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC8(redeclare package Medium = liquidCside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC8 annotation(
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor8 annotation(
    Placement(visible = true, transformation(origin = {110, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH8 annotation(
    Placement(visible = true, transformation(origin = {110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH8(redeclare package Medium = liquidHside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC9(redeclare package Medium = liquidCside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {140, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionC9 annotation(
    Placement(visible = true, transformation(origin = {140, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor9 annotation(
    Placement(visible = true, transformation(origin = {140, 4}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convectionH9 annotation(
    Placement(visible = true, transformation(origin = {140, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH9(redeclare package Medium = liquidHside,V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {140, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
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
    Line(points = {{180, 60}, {200, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(T_coldOut.port_b, sink_coolant.ports[1]) annotation(
    Line(points = {{-170, -60}, {-180, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(source_hotFluid.ports[1], T_hotIn.port_a) annotation(
    Line(points = {{-220, 60}, {-210, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(souce_coolant.ports[1], T_coldIn.port_a) annotation(
    Line(points = {{210, -60}, {202, -60}}, color = {0, 127, 255}, thickness = 1));
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
    Line(points = {{-15, 4}, {-15, -7}, {169, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor.Q_flow, Q_flow_actual.u[1]) annotation(
    Line(points = {{-135, 4}, {-135, -7}, {169, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor1.Q_flow, Q_flow_actual.u[2]) annotation(
    Line(points = {{-105, 4}, {-105, -7}, {169, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor2.Q_flow, Q_flow_actual.u[3]) annotation(
    Line(points = {{-75, 4}, {-76, 4}, {-76, -7}, {169, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor3.Q_flow, Q_flow_actual.u[4]) annotation(
    Line(points = {{-45, 4}, {-45, -7}, {169, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(T_hotIn.port_b, m_flow_hot.port_a) annotation(
    Line(points = {{-200, 60}, {-194, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(T_coldIn.port_b, m_flow_cold.port_a) annotation(
    Line(points = {{192, -60}, {179, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(m_flow_hot.port_b, volH.ports[2]) annotation(
    Line(points = {{-185, 60}, {-130, 60}}, color = {0, 127, 255}, thickness = 1));
  connect(m_flow_hot.port_b, Cp_hotIn.port) annotation(
    Line(points = {{-185, 60}, {-180, 60}, {-180, 57}}, color = {0, 127, 255}));
  connect(m_flow_cold.port_b, Cp_coldIn.port) annotation(
    Line(points = {{169, -60}, {190, -60}, {190, -69}}, color = {0, 127, 255}));
  connect(Q_flow_actual.y, effHX.u1) annotation(
    Line(points = {{180.5, -7}, {189, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(Q_flow_ideal.y, effHX.u2) annotation(
    Line(points = {{181, -24}, {185, -24}, {185, -13}, {189, -13}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(m_flow_hot.m_flow, capacity_coldIn.u2) annotation(
    Line(points = {{-190, 54.5}, {-190, 41.5}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(Cp_hotIn.y_Cp, capacity_coldIn.u1) annotation(
    Line(points = {{-175, 51.5}, {-175, 50}, {-184, 50}, {-184, 41}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(m_flow_cold.m_flow, Capacity_hotIn.u2) annotation(
    Line(points = {{174, -65.5}, {174, -85}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(ramp_T_hotIn.y, source_hotFluid.T_in) annotation(
    Line(points = {{-249.5, 64}, {-242, 64}}, color = {0, 0, 127}));
  connect(ramp_T_coldIn.y, souce_coolant.T_in) annotation(
    Line(points = {{241.5, -56}, {232, -56}}, color = {0, 0, 127}));
  connect(ramp_m_flow_hot.y, source_hotFluid.m_flow_in) annotation(
    Line(points = {{-249.5, 80}, {-244.75, 80}, {-244.75, 68}, {-240, 68}}, color = {0, 0, 127}));
  connect(ramp_m_flow_cold.y, souce_coolant.m_flow_in) annotation(
    Line(points = {{240.5, -39}, {234.25, -39}, {234.25, -52}, {230, -52}}, color = {0, 0, 127}));
//--------------------
  hAhot_discrete= hConvHot*kSize*areaH/nHot;
  hAcold_discrete= hConvCold*kSize*areaC/nCold;
  Rtotal = 1.0 / (hAhot_discrete*nHot) + 1.0 / (hAcold_discrete*nCold);
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
    Line(points = {{-209, 14}, {-150, 14}, {-150, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Hot.y, convectionH1.Gc) annotation(
    Line(points = {{-209, 14}, {-120, 14}, {-120, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Hot.y, convectionH2.Gc) annotation(
    Line(points = {{-209, 14}, {-90, 14}, {-90, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Hot.y, convectionH3.Gc) annotation(
    Line(points = {{-209, 14}, {-60, 14}, {-60, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Hot.y, convectionH4.Gc) annotation(
    Line(points = {{-209, 14}, {-30, 14}, {-30, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Cold.y, convectionC.Gc) annotation(
    Line(points = {{-209, -12}, {-150, -12}, {-150, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Cold.y, convectionC1.Gc) annotation(
    Line(points = {{-209, -12}, {-120, -12}, {-120, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Cold.y, convectionC2.Gc) annotation(
    Line(points = {{-209, -12}, {-90, -12}, {-90, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Cold.y, convectionC3.Gc) annotation(
    Line(points = {{-209, -12}, {-60, -12}, {-60, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Cold.y, convectionC4.Gc) annotation(
    Line(points = {{-209, -12}, {-30, -12}, {-30, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
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
  connect(volH9.ports[2], T_hotOut.port_a) annotation(
    Line(points = {{150, 60}, {170, 60}}, color = {0, 127, 255}, thickness = 1));
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
    Line(points = {{-208, 14}, {130, 14}, {130, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Hot.y, convectionH8.Gc) annotation(
    Line(points = {{-208, 14}, {100, 14}, {100, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Hot.y, convectionH7.Gc) annotation(
    Line(points = {{-208, 14}, {70, 14}, {70, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Hot.y, convectionH6.Gc) annotation(
    Line(points = {{-208, 14}, {40, 14}, {40, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Hot.y, convectionH5.Gc) annotation(
    Line(points = {{-208, 14}, {10, 14}, {10, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Cold.y, convectionC9.Gc) annotation(
    Line(points = {{-208, -12}, {130, -12}, {130, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Cold.y, convectionC8.Gc) annotation(
    Line(points = {{-208, -12}, {100, -12}, {100, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Cold.y, convectionC7.Gc) annotation(
    Line(points = {{-208, -12}, {70, -12}, {70, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Cold.y, convectionC6.Gc) annotation(
    Line(points = {{-208, -12}, {40, -12}, {40, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(hA_Cold.y, convectionC5.Gc) annotation(
    Line(points = {{-208, -12}, {10, -12}, {10, -30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor5.Q_flow, Q_flow_actual.u[6]) annotation(
    Line(points = {{25, 4}, {25, -7}, {169, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor6.Q_flow, Q_flow_actual.u[7]) annotation(
    Line(points = {{55, 4}, {55, -7}, {169, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor7.Q_flow, Q_flow_actual.u[8]) annotation(
    Line(points = {{85, 4}, {85, -7}, {169, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor8.Q_flow, Q_flow_actual.u[9]) annotation(
    Line(points = {{115, 4}, {115, -7}, {169, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor9.Q_flow, Q_flow_actual.u[10]) annotation(
    Line(points = {{145, 4}, {145, -7}, {169, -7}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(Capacity_hotIn.u1, Cp_coldIn.y_Cp) annotation(
    Line(points = {{180, -85}, {180, -80}, {185, -80}, {185, -74.5}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(T_coldOut.port_a, volC.ports[2]) annotation(
    Line(points = {{-160, -60}, {-150, -60}}, color = {0, 127, 255}, thickness = 1));
  connect(volC9.ports[2], m_flow_cold.port_b) annotation(
    Line(points = {{130, -60}, {170, -60}}, color = {0, 127, 255}, thickness = 1));
  annotation(
    Diagram(coordinateSystem(extent = {{-260, -100}, {260, 120}})),
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-6, Interval = 0.06));
end HX_ShellTube_counter_discrete010_ex01;
