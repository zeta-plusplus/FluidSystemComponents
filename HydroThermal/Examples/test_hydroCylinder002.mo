within FluidSystemComponents.HydroThermal.Examples;

model test_hydroCylinder002
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  // redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-150, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.CheckValveSpringLoad_Linear checkValveSpringLoad_Linear1(redeclare package Medium = liquid1, deltapCrack = 5 * 101.3 * 1000, gradientQP = 0.001 * 50 / (100 * 1000)) annotation(
    Placement(visible = true, transformation(origin = {-40, -160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = liquid1, V = 0.01, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-70, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, T = 288.15, nPorts = 3, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-60, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.HydroThermal.Components.PumpConstQflow_ideal pumpConstQflow_ideal1(redeclare package Medium = liquid1, qFlowDes = 10 * 10 ^ (-6)) annotation(
    Placement(visible = true, transformation(origin = {-60, -180}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-90, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 10000) annotation(
    Placement(visible = true, transformation(origin = {-120, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume sweptVolume1(redeclare package Medium = liquid1, clearance = 1e-6, nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.1 ^ 2, s(fixed = false, start = 0.1), use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-40, 130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Machines.SweptVolume sweptVolume2(redeclare package Medium = liquid1, clearance = 1e-6, nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.1 ^ 2, s(fixed = false, start = 0.4), use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {160, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Components.Mass mass1(L = 0.05, m = 10, s(fixed = true, start = 0.2 + mass1.L / 2)) annotation(
    Placement(visible = true, transformation(origin = {30, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor1 annotation(
    Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = -1) annotation(
    Placement(visible = true, transformation(origin = {30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {80, 90}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant length(k = 0.5) annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Sources.Position position1 annotation(
    Placement(visible = true, transformation(origin = {100, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor1 annotation(
    Placement(visible = true, transformation(origin = {130, 130}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = -1) annotation(
    Placement(visible = true, transformation(origin = {40, 130}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force force1 annotation(
    Placement(visible = true, transformation(origin = {10, 130}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.DirValve_4ports3positions dirValve_4ports3positions1(redeclare package Medium = liquid1, dp_nominal =  1000, m_flow_nominal = 0.01) annotation(
    Placement(visible = true, transformation(origin = {0, -110}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Rod rod1(L = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {70, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.IntegerStep integerStep1(height = 0, offset = -1, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {50, -110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(dirValve_4ports3positions1.port_4, sweptVolume2.ports[1]) annotation(
    Line(points = {{16, -90}, {176, -90}, {176, 128}, {170, 128}, {170, 130}}, color = {0, 127, 255}));
  connect(dirValve_4ports3positions1.port_3, sweptVolume1.ports[1]) annotation(
    Line(points = {{-16, -90}, {-56, -90}, {-56, 130}, {-50, 130}, {-50, 130}}, color = {0, 127, 255}));
  connect(dirValve_4ports3positions1.u_ctrl, integerStep1.y) annotation(
    Line(points = {{20, -110}, {38, -110}, {38, -110}, {38, -110}}, color = {255, 127, 0}));
  connect(mass1.flange_b, rod1.flange_a) annotation(
    Line(points = {{40, 170}, {60, 170}, {60, 170}, {60, 170}}, color = {0, 127, 0}));
  connect(sweptVolume1.flange, mass1.flange_a) annotation(
    Line(points = {{-30, 130}, {-25, 130}, {-25, 170}, {20, 170}}, color = {0, 127, 0}));
  connect(add1.u2, length.y) annotation(
    Line(points = {{86, 78}, {86, 65.5}, {70, 65.5}, {70, 61}}, color = {0, 0, 127}));
  connect(dirValve_4ports3positions1.port_1, volume.ports[2]) annotation(
    Line(points = {{-16, -130}, {-16, -142}, {-60, -142}, {-60, -150}}, color = {0, 127, 255}));
  connect(dirValve_4ports3positions1.port_2, boundary.ports[3]) annotation(
    Line(points = {{16, -130}, {16, -200}, {-60, -200}}, color = {0, 127, 255}));
  connect(const.y, speed1.w_ref) annotation(
    Line(points = {{-109, -180}, {-103, -180}}, color = {0, 0, 127}));
  connect(boundary.ports[1], pumpConstQflow_ideal1.port_1) annotation(
    Line(points = {{-60, -200}, {-60, -190}}, color = {0, 127, 255}));
  connect(boundary.ports[2], checkValveSpringLoad_Linear1.port_2) annotation(
    Line(points = {{-60, -200}, {-40, -200}, {-40, -170}}, color = {0, 127, 255}));
  connect(pumpConstQflow_ideal1.port_2, volume.ports[1]) annotation(
    Line(points = {{-60, -170}, {-60, -150}}, color = {0, 127, 255}));
  connect(speed1.flange, pumpConstQflow_ideal1.flange_1) annotation(
    Line(points = {{-80, -180}, {-70, -180}}));
  connect(volume.ports[3], checkValveSpringLoad_Linear1.port_1) annotation(
    Line(points = {{-60, -150}, {-40, -150}}, color = {0, 127, 255}));
  connect(gain3.u, positionSensor1.s) annotation(
    Line(points = {{18, 70}, {11, 70}}, color = {0, 0, 127}));
  connect(sweptVolume1.flange, positionSensor1.flange) annotation(
    Line(points = {{-30, 130}, {-10, 130}, {-10, 70}}, color = {0, 127, 0}));
  connect(add1.u1, gain3.y) annotation(
    Line(points = {{74, 78}, {74, 70}, {41, 70}}, color = {0, 0, 127}));
  connect(forceSensor1.flange_a, sweptVolume2.flange) annotation(
    Line(points = {{140, 130}, {150, 130}, {150, 130}, {150, 130}}, color = {0, 127, 0}));
  connect(add1.y, position1.s_ref) annotation(
    Line(points = {{80, 101}, {80, 130}, {88, 130}}, color = {0, 0, 127}));
  connect(position1.flange, forceSensor1.flange_b) annotation(
    Line(points = {{110, 130}, {120, 130}, {120, 130}, {120, 130}}, color = {0, 127, 0}));
  connect(gain1.u, forceSensor1.f) annotation(
    Line(points = {{52, 130}, {60, 130}, {60, 150}, {138, 150}, {138, 142}, {138, 142}}, color = {0, 0, 127}));
  connect(force1.f, gain1.y) annotation(
    Line(points = {{22, 130}, {29, 130}}, color = {0, 0, 127}));
  connect(sweptVolume1.flange, force1.flange) annotation(
    Line(points = {{-30, 130}, {0, 130}}, color = {0, 127, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 15, Tolerance = 1e-06, Interval = 0.03),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-160, -240}, {220, 200}}, initialScale = 0.1), graphics = {Rectangle(origin = {34, 80}, pattern = LinePattern.Dash, lineThickness = 0.5, extent = {{-170, 102}, {180, -60}}), Text(origin = {-104, 187}, extent = {{-28, 9}, {92, -3}}, textString = "piston cylinder actuator", fontSize = 8, horizontalAlignment = TextAlignment.Left), Text(origin = {106, 168}, extent = {{-26, 4}, {0, -4}}, textString = "rod"), Text(origin = {22, 160}, extent = {{-26, 4}, {0, -4}}, textString = "piston")}),
    Icon(coordinateSystem(extent = {{-100, -140}, {100, 100}})),
    __OpenModelica_commandLineOptions = "");
end test_hydroCylinder002;
