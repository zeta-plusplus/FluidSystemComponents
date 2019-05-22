within FluidSystemComponents.HydroThermal.Examples;

model fluidSupplySystem001
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  // redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //----------
  FluidSystemComponents.HydroThermal.Components.PumpConstQflow_ideal pumpConstQflow_ideal1(redeclare package Medium = liquid1, NmechDes = 10000, qFlowDes = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 288.15, nPorts = 2, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1(exact = true, phi(fixed = true), useSupport = false) annotation(
    Placement(visible = true, transformation(origin = {-40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = (10000 - 100) * (2 * Modelica.Constants.pi / 60), offset = 100 * (2 * Modelica.Constants.pi / 60), startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = liquid1, diameter = 0.5, length = 5) annotation(
    Placement(visible = true, transformation(origin = {50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = liquid1, diameter = 0.2, length = 1) annotation(
    Placement(visible = true, transformation(origin = {70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = liquid1, diameter = 0.2, length = 2) annotation(
    Placement(visible = true, transformation(origin = {140, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp3(duration = 10, height = -1, offset = 1, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {170, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear2(redeclare package Medium = liquid1, dp_nominal(displayUnit = "Pa") = 5 * 101.3 * 1000, m_flow_nominal = 100) annotation(
    Placement(visible = true, transformation(origin = {140, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 10, height = 0, offset = 1, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {100, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(redeclare package Medium = liquid1, dp_nominal(displayUnit = "Pa") = 5 * 101.3 * 1000, m_flow_nominal = 100) annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = liquid1, T_start = 288.15, V = 0.010, nPorts = 2, p_start = 101.3 * 1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = liquid1, T_start = 288.15, V = 0.010, nPorts = 2, p_start = 101.3 * 1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {60, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = liquid1, T_start = 288.15, V = 0.010, nPorts = 2, p_start = 101.3 * 1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {130, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = liquid1, diameter = 0.1, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {70, -80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe4(redeclare package Medium = liquid1, diameter = 0.1, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {140, -80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(boundary1.ports[2], pipe4.port_b) annotation(
    Line(points = {{70, -100}, {70, -100}, {70, -94}, {140, -94}, {140, -90}, {140, -90}}, color = {0, 127, 255}));
  connect(pipe3.port_b, boundary1.ports[1]) annotation(
    Line(points = {{70, -90}, {70, -90}, {70, -100}, {70, -100}}, color = {0, 127, 255}));
  connect(volume2.ports[2], pipe4.port_a) annotation(
    Line(points = {{140, -50}, {140, -50}, {140, -70}, {140, -70}}, color = {0, 127, 255}));
  connect(volume1.ports[2], pipe3.port_a) annotation(
    Line(points = {{70, -50}, {70, -50}, {70, -70}, {70, -70}}, color = {0, 127, 255}));
  connect(valveLinear2.port_b, volume2.ports[1]) annotation(
    Line(points = {{140, -30}, {140, -30}, {140, -50}, {140, -50}}, color = {0, 127, 255}));
  connect(valveLinear1.port_b, volume1.ports[1]) annotation(
    Line(points = {{70, -30}, {70, -30}, {70, -50}, {70, -50}}, color = {0, 127, 255}));
  connect(volume.ports[2], pipe.port_a) annotation(
    Line(points = {{-10, 40}, {-10, 60}, {40, 60}}, color = {0, 127, 255}));
  connect(pipe.port_b, pipe1.port_a) annotation(
    Line(points = {{60, 60}, {70, 60}, {70, 30}}, color = {0, 127, 255}));
  connect(pipe.port_b, pipe2.port_a) annotation(
    Line(points = {{60, 60}, {140, 60}, {140, 30}}, color = {0, 127, 255}));
  connect(pumpConstQflow_ideal1.port_2, volume.ports[1]) annotation(
    Line(points = {{-10, 20}, {-10, 40}}, color = {0, 127, 255}));
  connect(valveLinear2.opening, ramp3.y) annotation(
    Line(points = {{148, -20}, {160, -20}, {160, -20}, {160, -20}}, color = {0, 0, 127}));
  connect(pipe2.port_b, valveLinear2.port_a) annotation(
    Line(points = {{140, 10}, {140, 10}, {140, -10}, {140, -10}}, color = {0, 127, 255}));
  connect(valveLinear1.opening, ramp2.y) annotation(
    Line(points = {{78, -20}, {88, -20}, {88, -20}, {90, -20}}, color = {0, 0, 127}));
  connect(pipe1.port_b, valveLinear1.port_a) annotation(
    Line(points = {{70, 10}, {70, 10}, {70, -10}, {70, -10}}, color = {0, 127, 255}));
  connect(boundary.ports[1], pumpConstQflow_ideal1.port_1) annotation(
    Line(points = {{-10, -30}, {-10, 0}}, color = {0, 127, 255}));
  connect(speed1.flange, pumpConstQflow_ideal1.flange_1) annotation(
    Line(points = {{-30, 10}, {-20, 10}, {-20, 10}, {-20, 10}}));
  connect(ramp1.y, speed1.w_ref) annotation(
    Line(points = {{-59, 10}, {-55, 10}, {-55, 10}, {-53, 10}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-100, -140}, {180, 100}})),
    Icon(coordinateSystem(extent = {{-100, -140}, {180, 100}})),
    __OpenModelica_commandLineOptions = "");
end fluidSupplySystem001;
