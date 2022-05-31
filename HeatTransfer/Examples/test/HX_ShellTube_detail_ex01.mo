within FluidSystemComponents.HeatTransfer.Examples.test;

model HX_ShellTube_detail_ex01
  extends Modelica.Icons.Example;
  //--------------------
  Modelica.SIunits.CoefficientOfHeatTransfer kConvH=500.0 "heat transfer coefficient, hot side";
  Modelica.SIunits.CoefficientOfHeatTransfer kConvC=500.0 "heat transfer coefficient, cold side";
  Modelica.SIunits.Area areaH=1.0;
  Modelica.SIunits.Area areaC=1.0;
  Real nHot=5;
  Real nCold=nHot;
  //--------------------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T source_hotFluid(T = 100, m_flow = 1, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {-130, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T souce_coolant(T = 15, m_flow = 2, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {-130, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT sink_hotFluid(nPorts = 1, p = 101.325 * 1000.0)  annotation(
    Placement(visible = true, transformation(origin = {130, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT sink_coolant(nPorts = 1, p = 101.325 * 1000.0)  annotation(
    Placement(visible = true, transformation(origin = {130, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volH(V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2)  annotation(
    Placement(visible = true, transformation(origin = {-60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH1(V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH2(V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {0, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH3(V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volH4(V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volC(V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume volC1(V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume volC2(V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume volC3(V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Vessels.ClosedVolume volC4(V = 0.001, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(visible = true, transformation(origin = {-60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection2 annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection3 annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection4 annotation(
    Placement(visible = true, transformation(origin = {60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection5 annotation(
    Placement(visible = true, transformation(origin = {-60, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection6 annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection7 annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection8 annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection9 annotation(
    Placement(visible = true, transformation(origin = {60, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant kA_H(k = kConvH * areaH / nHot)  annotation(
    Placement(visible = true, transformation(origin = {-95, 13}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant kA_C(k = kConvC * areaC / nCold)  annotation(
    Placement(visible = true, transformation(origin = {-95, -11}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_hotOut annotation(
    Placement(visible = true, transformation(origin = {100, 60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_coldOut annotation(
    Placement(visible = true, transformation(origin = {100, -60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_hotIn annotation(
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_coldIn annotation(
    Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
equation
  connect(volH.ports[1], volH1.ports[1]) annotation(
    Line(points = {{-50, 60}, {-20, 60}}, color = {0, 127, 255}));
  connect(volH1.ports[2], volH2.ports[1]) annotation(
    Line(points = {{-20, 60}, {10, 60}}, color = {0, 127, 255}));
  connect(volH2.ports[2], volH3.ports[1]) annotation(
    Line(points = {{10, 60}, {40, 60}}, color = {0, 127, 255}));
  connect(volH3.ports[2], volH4.ports[1]) annotation(
    Line(points = {{40, 60}, {70, 60}}, color = {0, 127, 255}));
  connect(volC.ports[1], volC1.ports[1]) annotation(
    Line(points = {{-70, -60}, {-40, -60}}, color = {0, 127, 255}));
  connect(volC1.ports[2], volC2.ports[1]) annotation(
    Line(points = {{-40, -60}, {-10, -60}}, color = {0, 127, 255}));
  connect(volC2.ports[2], volC3.ports[1]) annotation(
    Line(points = {{-10, -60}, {20, -60}}, color = {0, 127, 255}));
  connect(volC3.ports[2], volC4.ports[1]) annotation(
    Line(points = {{20, -60}, {50, -60}}, color = {0, 127, 255}));
  connect(volH.heatPort, convection.fluid) annotation(
    Line(points = {{-60, 50}, {-60, 40}}, color = {191, 0, 0}));
  connect(volH1.heatPort, convection1.fluid) annotation(
    Line(points = {{-30, 50}, {-30, 40}}, color = {191, 0, 0}));
  connect(volH2.heatPort, convection2.fluid) annotation(
    Line(points = {{0, 50}, {0, 40}}, color = {191, 0, 0}));
  connect(convection3.fluid, volH3.heatPort) annotation(
    Line(points = {{30, 40}, {30, 50}}, color = {191, 0, 0}));
  connect(convection4.fluid, volH4.heatPort) annotation(
    Line(points = {{60, 40}, {60, 50}}, color = {191, 0, 0}));
  connect(convection5.fluid, volC.heatPort) annotation(
    Line(points = {{-60, -40}, {-60, -50}}, color = {191, 0, 0}));
  connect(convection6.fluid, volC1.heatPort) annotation(
    Line(points = {{-30, -40}, {-30, -50}}, color = {191, 0, 0}));
  connect(convection7.fluid, volC2.heatPort) annotation(
    Line(points = {{0, -40}, {0, -50}}, color = {191, 0, 0}));
  connect(convection8.fluid, volC3.heatPort) annotation(
    Line(points = {{30, -40}, {30, -50}}, color = {191, 0, 0}));
  connect(convection9.fluid, volC4.heatPort) annotation(
    Line(points = {{60, -40}, {60, -50}}, color = {191, 0, 0}));
  connect(convection.solid, convection5.solid) annotation(
    Line(points = {{-60, 20}, {-60, -20}}, color = {191, 0, 0}));
  connect(convection1.solid, convection6.solid) annotation(
    Line(points = {{-30, 20}, {-30, -20}}, color = {191, 0, 0}));
  connect(convection2.solid, convection7.solid) annotation(
    Line(points = {{0, 20}, {0, -20}}, color = {191, 0, 0}));
  connect(convection3.solid, convection8.solid) annotation(
    Line(points = {{30, 20}, {30, -20}}, color = {191, 0, 0}));
  connect(convection4.solid, convection9.solid) annotation(
    Line(points = {{60, 20}, {60, -20}}, color = {191, 0, 0}));
  connect(kA_H.y, convection.Gc) annotation(
    Line(points = {{-89.5, 13}, {-70, 13}, {-70, 30}}, color = {0, 0, 127}));
  connect(kA_H.y, convection1.Gc) annotation(
    Line(points = {{-89.5, 13}, {-40, 13}, {-40, 30}}, color = {0, 0, 127}));
  connect(kA_H.y, convection2.Gc) annotation(
    Line(points = {{-89.5, 13}, {-10, 13}, {-10, 30}}, color = {0, 0, 127}));
  connect(kA_H.y, convection3.Gc) annotation(
    Line(points = {{-89.5, 13}, {20, 13}, {20, 30}}, color = {0, 0, 127}));
  connect(kA_H.y, convection4.Gc) annotation(
    Line(points = {{-89.5, 13}, {50, 13}, {50, 30}}, color = {0, 0, 127}));
  connect(kA_C.y, convection5.Gc) annotation(
    Line(points = {{-89.5, -11}, {-70, -11}, {-70, -30}}, color = {0, 0, 127}));
  connect(kA_C.y, convection6.Gc) annotation(
    Line(points = {{-89.5, -11}, {-40, -11}, {-40, -30}}, color = {0, 0, 127}));
  connect(kA_C.y, convection7.Gc) annotation(
    Line(points = {{-89.5, -11}, {-10, -11}, {-10, -30}}, color = {0, 0, 127}));
  connect(kA_C.y, convection8.Gc) annotation(
    Line(points = {{-89.5, -11}, {20, -11}, {20, -30}}, color = {0, 0, 127}));
  connect(kA_C.y, convection9.Gc) annotation(
    Line(points = {{-89.5, -11}, {50, -11}, {50, -30}}, color = {0, 0, 127}));
  connect(volH4.ports[2], T_hotOut.port_a) annotation(
    Line(points = {{70, 60}, {90, 60}}, color = {0, 127, 255}));
  connect(T_hotOut.port_b, sink_hotFluid.ports[1]) annotation(
    Line(points = {{110, 60}, {120, 60}}, color = {0, 127, 255}));
  connect(volC4.ports[2], T_coldOut.port_a) annotation(
    Line(points = {{50, -60}, {90, -60}}, color = {0, 127, 255}));
  connect(T_coldOut.port_b, sink_coolant.ports[1]) annotation(
    Line(points = {{110, -60}, {120, -60}}, color = {0, 127, 255}));
  connect(source_hotFluid.ports[1], T_hotIn.port_a) annotation(
    Line(points = {{-120, 60}, {-110, 60}}, color = {0, 127, 255}));
  connect(T_hotIn.port_b, volH.ports[2]) annotation(
    Line(points = {{-90, 60}, {-50, 60}}, color = {0, 127, 255}));
  connect(souce_coolant.ports[1], T_coldIn.port_a) annotation(
    Line(points = {{-120, -60}, {-110, -60}}, color = {0, 127, 255}));
  connect(T_coldIn.port_b, volC.ports[2]) annotation(
    Line(points = {{-90, -60}, {-70, -60}}, color = {0, 127, 255}));

annotation(
    Diagram(coordinateSystem(extent = {{-140, -100}, {140, 100}})));
end HX_ShellTube_detail_ex01;
