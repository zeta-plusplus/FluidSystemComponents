within FluidSystemComponents.HeatTransfer.Examples.test;

model HX_modulatedEff00_test04
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWater;
  replaceable package liquid2 = Modelica.Media.Water.StandardWater;
  //----------
    inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = liquid1, T = 80 + 273.15, m_flow = 10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = liquid2, T = 20 + 273.15, m_flow = 5, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HeatTransfer.Components.HX_modulatedEff00 HX(redeclare package Medium1 = liquid1,redeclare package Medium2 = liquid2) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = liquid2, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 5, height = -0.0, offset = 0.9, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(boundary2.ports[1], HX.port_1_med1) annotation(
    Line(points = {{60, 40}, {-32, 40}, {-32, 18}, {-20, 18}, {-20, 18}}, color = {0, 127, 255}));
  connect(boundary.ports[1], HX.port_2_med1) annotation(
    Line(points = {{-60, 50}, {14, 50}, {14, 18}, {0, 18}, {0, 18}}, color = {0, 127, 255}));
  connect(boundary3.ports[1], HX.port_1_med2) annotation(
    Line(points = {{60, -30}, {-32, -30}, {-32, 2}, {-20, 2}, {-20, 2}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], HX.port_2_med2) annotation(
    Line(points = {{-60, -40}, {16, -40}, {16, 2}, {0, 2}, {0, 2}}, color = {0, 127, 255}));
  connect(ramp1.y, HX.u_eff) annotation(
    Line(points = {{-59, 10}, {-22, 10}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-6, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));

end HX_modulatedEff00_test04;
