within FluidSystemComponents.HydroThermal.Examples.Temp;

model flowSupplyNetwork002
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //----------
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //----------
  FluidSystemComponents.HydroThermal.Components.PumpConstQflow_ideal pumpConstQflow_ideal1(redeclare package Medium = liquid1, qFlowDes = 0.001) annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 288.15, nPorts = 2, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1(exact = true, phi(fixed = true), useSupport = false)  annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 10000, offset = 100, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = liquid1,diameter = 0.05, length = 20)  annotation(
    Placement(visible = true, transformation(origin = {50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = liquid1,diameter = 0.05, length = 2)  annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = liquid1,diameter = 0.05, length = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {140, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp3(duration = 10, height = -1, offset = 1, startTime = 30)  annotation(
    Placement(visible = true, transformation(origin = {170, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear2(redeclare package Medium = liquid1,dp_nominal(displayUnit = "Pa") = 40 * 101.3 * 1000, m_flow_nominal = 5)  annotation(
    Placement(visible = true, transformation(origin = {140, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 10, height = 0, offset = 1, startTime = 30)  annotation(
    Placement(visible = true, transformation(origin = {100, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(redeclare package Medium = liquid1,dp_nominal(displayUnit = "Pa") = 40 * 101.3 * 1000, m_flow_nominal = 5)  annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = liquid1,T_start = 288.15,V = 0.010, nPorts = 2, p_start = 101.3 * 1000, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(boundary.ports[1], pumpConstQflow_ideal1.port_1) annotation(
    Line(points = {{-10, -40}, {-10, -10}}, color = {0, 127, 255}));
  connect(speed1.flange, pumpConstQflow_ideal1.flange_1) annotation(
    Line(points = {{-30, 0}, {-20, 0}, {-20, 0}, {-20, 0}}));
  connect(pumpConstQflow_ideal1.port_2, volume.ports[1]) annotation(
    Line(points = {{-10, 10}, {-10, 40}}, color = {0, 127, 255}));
  connect(ramp1.y, speed1.w_ref) annotation(
    Line(points = {{-59, 0}, {-55, 0}, {-55, 0}, {-53, 0}}, color = {0, 0, 127}));
  connect(volume.ports[2], pipe.port_a) annotation(
    Line(points = {{-10, 40}, {-10, 40}, {-10, 60}, {40, 60}, {40, 60}}, color = {0, 127, 255}));
  connect(valveLinear1.opening, ramp2.y) annotation(
    Line(points = {{78, -30}, {88, -30}, {88, -30}, {90, -30}}, color = {0, 0, 127}));
  connect(valveLinear1.port_b, boundary1.ports[1]) annotation(
    Line(points = {{70, -40}, {70, -40}, {70, -60}, {70, -60}}, color = {0, 127, 255}));
  connect(pipe1.port_b, valveLinear1.port_a) annotation(
    Line(points = {{70, 0}, {70, 0}, {70, -20}, {70, -20}}, color = {0, 127, 255}));
  connect(valveLinear2.opening, ramp3.y) annotation(
    Line(points = {{148, -30}, {160, -30}, {160, -30}, {160, -30}}, color = {0, 0, 127}));
  connect(pipe2.port_b, valveLinear2.port_a) annotation(
    Line(points = {{140, 0}, {140, 0}, {140, -20}, {140, -20}}, color = {0, 127, 255}));
  connect(valveLinear2.port_b, boundary1.ports[2]) annotation(
    Line(points = {{140, -40}, {140, -54}, {70, -54}, {70, -60}}, color = {0, 127, 255}));
  connect(pipe.port_b, pipe2.port_a) annotation(
    Line(points = {{60, 60}, {140, 60}, {140, 20}}, color = {0, 127, 255}));
  connect(pipe.port_b, pipe1.port_a) annotation(
    Line(points = {{60, 60}, {70, 60}, {70, 20}, {70, 20}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-100, -100}, {180, 100}})),
  Icon(coordinateSystem(extent = {{-100, -100}, {180, 100}})),
  __OpenModelica_commandLineOptions = "");

end flowSupplyNetwork002;
