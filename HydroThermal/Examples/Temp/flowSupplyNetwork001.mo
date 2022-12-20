within FluidSystemComponents.HydroThermal.Examples.Temp;

model flowSupplyNetwork001
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //----------
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //----------
  FluidSystemComponents.HydroThermal.Components.PumpConstQflow_ideal pumpConstQflow_ideal1(redeclare package Medium = liquid1, qFlowDes = 0.001) annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 288.15, nPorts = 2, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1(exact = true, phi(fixed = true), useSupport = false)  annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 10000, offset = 100, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = liquid1,diameter = 0.05, length = 5)  annotation(
    Placement(visible = true, transformation(origin = {30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = liquid1,diameter = 0.05, length = 2)  annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = liquid1,diameter = 0.05, length = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(boundary.ports[1], pumpConstQflow_ideal1.port_1) annotation(
    Line(points = {{-10, -10}, {-10, 20}}, color = {0, 127, 255}));
  connect(pipe2.port_b, boundary1.ports[1]) annotation(
    Line(points = {{90, 0}, {90, 0}, {90, -20}, {90, -20}}, color = {0, 127, 255}));
  connect(pipe.port_b, pipe2.port_a) annotation(
    Line(points = {{40, 60}, {90, 60}, {90, 20}, {90, 20}}, color = {0, 127, 255}));
  connect(pipe.port_b, pipe1.port_a) annotation(
    Line(points = {{40, 60}, {50, 60}, {50, 20}, {50, 20}}, color = {0, 127, 255}));
  connect(pumpConstQflow_ideal1.port_2, pipe.port_a) annotation(
    Line(points = {{-10, 40}, {-10, 40}, {-10, 60}, {20, 60}, {20, 60}}, color = {0, 127, 255}));
  connect(pipe1.port_b, boundary1.ports[2]) annotation(
    Line(points = {{50, 0}, {50, -20}, {90, -20}}, color = {0, 127, 255}));
  connect(ramp1.y, speed1.w_ref) annotation(
    Line(points = {{-58, 30}, {-54, 30}, {-54, 30}, {-52, 30}}, color = {0, 0, 127}));
  connect(speed1.flange, pumpConstQflow_ideal1.flange_1) annotation(
    Line(points = {{-30, 30}, {-20, 30}, {-20, 30}, {-20, 30}}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-100, -100}, {140, 100}})),
  Icon(coordinateSystem(extent = {{-100, -100}, {140, 100}})),
  __OpenModelica_commandLineOptions = "");

end flowSupplyNetwork001;
