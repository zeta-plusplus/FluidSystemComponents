within FluidSystemComponents.InteractiveSimulation.Examples;

model DisplayOnCommand00_ex01
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  // redeclare package Medium = liquid1
  //----------
  
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = liquid1, diameter = 0.05, zeta = 1)  annotation(
    Placement(visible = true, transformation(origin = {20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  FluidSystemComponents.InteractiveSimulation.Output.DisplayOnCommand00 DispOnCmd(name2disp = "p_in[Pa]")  annotation(
    Placement(visible = true, transformation(origin = {-20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_in(duration = 10, height = 1, offset = 1, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pressure1.p, DispOnCmd.u_val) annotation(
    Line(points = {{-11, 0}, {-20, 0}, {-20, -19}}, color = {0, 0, 127}));
  connect(ramp_m_flow_in.y, boundary1.m_flow_in) annotation(
    Line(points = {{-59, 30}, {-55, 30}, {-55, 18}, {-41, 18}}, color = {0, 0, 127}));
  connect(orifice.port_b, boundary.ports[1]) annotation(
    Line(points = {{30, 10}, {40, 10}, {40, 10}, {40, 10}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], pressure1.port) annotation(
    Line(points = {{-20, 10}, {0, 10}, {0, 10}, {0, 10}}, color = {0, 127, 255}));
  connect(pressure1.port, orifice.port_a) annotation(
    Line(points = {{0, 10}, {10, 10}, {10, 10}, {10, 10}}, color = {0, 127, 255}));

annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-6, Interval = 0.06),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
    
end DisplayOnCommand00_ex01;
