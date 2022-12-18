within FluidSystemComponents.Compressible.Examples.Tutorial.MultilayerModels;

model MultiFlowNW_ex01_v01
  extends Modelica.Icons.Example;
  //----------
  import units = Modelica.Units.SI;
  //-------------------------
  parameter units.Volume volStd = 0.1;
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium= fluid1,
  //redeclare package fluid1= fluid1,
  //-------------------------
  inner Modelica.Fluid.System system(T_start(displayUnit = "K") = 288.15, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 0, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_start =  100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-54, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Compressible.Examples.AssyComponents.ComplexFNW_ex03_v01 sec1(redeclare package fluid1=fluid1) annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Compressible.Examples.AssyComponents.ComplexFNW_ex02_v01 sec2(redeclare package fluid1=fluid1) annotation(
    Placement(visible = true, transformation(origin = {-12, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium= fluid1, T = 1200, nPorts = 2, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {15, -9}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc2(duration = 1, height = 1.1 * 100 * 1000 - 100 * 1000, offset =  100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {63, -2}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = 1, initType = Modelica.Blocks.Types.Init.SteadyState)  annotation(
    Placement(visible = true, transformation(origin = {42, -2}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
equation
  connect(sec1.port_3, sec2.port_1) annotation(
    Line(points = {{-40, 22}, {-22, 22}}, color = {0, 127, 255}));
  connect(sec2.port_18, boundary2.ports[1]) annotation(
    Line(points = {{-10, 20}, {-10, -9}, {6, -9}}, color = {0, 127, 255}));
  connect(sec1.port_2, boundary2.ports[2]) annotation(
    Line(points = {{-52, 10}, {-52, -9}, {6, -9}}, color = {0, 127, 255}));
  connect(boundary2.p_in, firstOrder.y) annotation(
    Line(points = {{26, -2}, {35, -2}}, color = {0, 0, 127}));
  connect(firstOrder.u, ramp_p_bc2.y) annotation(
    Line(points = {{49, -2}, {56, -2}}, color = {0, 0, 127}));

annotation(
    experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-6, Interval = 0.1));
end MultiFlowNW_ex01_v01;
