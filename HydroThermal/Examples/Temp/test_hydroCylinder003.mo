within FluidSystemComponents.HydroThermal.Examples.Temp;

model test_hydroCylinder003
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  // redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-150, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.CheckValveSpringLoad_Linear checkValveSpringLoad_Linear1(redeclare package Medium = liquid1, deltapCrack = 5 * 100.0 * 1000, gradientQP = 0.001 * 50 / (100 * 1000)) annotation(
    Placement(visible = true, transformation(origin = {-40, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = liquid1, V = 0.01, nPorts = 3, p_start = 1 *101.3 * 1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-70, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, T = 288.15, nPorts = 3, p = 1.0 *101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-60, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.HydroThermal.Components.PumpConstQflow_ideal pumpConstQflow_ideal1(redeclare package Medium = liquid1, qFlowDes = 1 * 10 ^ (-6)) annotation(
    Placement(visible = true, transformation(origin = {-60, -110}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 10000) annotation(
    Placement(visible = true, transformation(origin = {-120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume sweptVolume2(redeclare package Medium = liquid1, clearance = 10e-6, nPorts = 1, p_start = 1 *101.3 * 1000, pistonCrossArea = Modelica.Constants.pi / 4 * 0.1 ^ 2, s(each fixed = false, each start = 0.2), use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-90, 130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.HydroThermal.Components.DirValve_4ports3positions dirValve_4ports3positions1(redeclare package Medium = liquid1, dp_nominal =  10 * 1000, m_flow_nominal = 0.01) annotation(
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.IntegerStep integerStep1(height = 1, offset = -1, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {70, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume sweptVolume4(redeclare package Medium = liquid1,clearance = 10e-6, nPorts = 1, p_start = 1 *101.3 * 1000, pistonCrossArea = Modelica.Constants.pi / 4 * 0.1 ^ 2, s(each fixed = false), use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {170, 130}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Translational.Components.Rod rod2(L = 0.5) annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.RelPositionSensor relPositionSensor1 annotation(
    Placement(visible = true, transformation(origin = {60, 100}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor1 annotation(
    Placement(visible = true, transformation(origin = {130, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  model test_hydroCylinder004
  equation

  end test_hydroCylinder004;
  Modelica.Mechanics.Translational.Components.Mass mass1(L = 0.1, m = 0.1, s(fixed = true, start = 0.2 + mass1.L / 2))  annotation(
    Placement(visible = true, transformation(origin = {-10, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force force1 annotation(
    Placement(visible = true, transformation(origin = {70, 80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k =  1) annotation(
    Placement(visible = true, transformation(origin = {110, 80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position position1 annotation(
    Placement(visible = true, transformation(origin = {90, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Rod rod1(L = 0.5) annotation(
    Placement(visible = true, transformation(origin = {30, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Damper damper(d = 0.001) annotation(
    Placement(visible = true, transformation(origin = {-50, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(boundary.ports[2], checkValveSpringLoad_Linear1.port_2) annotation(
    Line(points = {{-60, -130}, {-40, -130}, {-40, -100}}, color = {0, 127, 255}));
  connect(boundary.ports[1], pumpConstQflow_ideal1.port_1) annotation(
    Line(points = {{-60, -130}, {-60, -120}}, color = {0, 127, 255}));
  connect(dirValve_4ports3positions1.port_2, boundary.ports[3]) annotation(
    Line(points = {{16, -60}, {16, -130}, {-60, -130}}, color = {0, 127, 255}));
  connect(speed1.flange, pumpConstQflow_ideal1.flange_1) annotation(
    Line(points = {{-80, -110}, {-70, -110}}));
  connect(pumpConstQflow_ideal1.port_2, volume.ports[1]) annotation(
    Line(points = {{-60, -100}, {-60, -80}}, color = {0, 127, 255}));
  connect(const.y, speed1.w_ref) annotation(
    Line(points = {{-109, -110}, {-103, -110}}, color = {0, 0, 127}));
  connect(volume.ports[3], checkValveSpringLoad_Linear1.port_1) annotation(
    Line(points = {{-60, -80}, {-40, -80}}, color = {0, 127, 255}));
  connect(dirValve_4ports3positions1.port_1, volume.ports[2]) annotation(
    Line(points = {{-16, -60}, {-16, -72}, {-60, -72}, {-60, -80}}, color = {0, 127, 255}));
  connect(dirValve_4ports3positions1.u_ctrl, integerStep1.y) annotation(
    Line(points = {{20, -40}, {60, -40}, {60, -40}, {60, -40}}, color = {255, 127, 0}));
  connect(sweptVolume2.ports[1], dirValve_4ports3positions1.port_3) annotation(
    Line(points = {{-100, 130}, {-118, 130}, {-118, -20}, {-16, -20}}, color = {0, 127, 255}));
  connect(dirValve_4ports3positions1.port_4, sweptVolume4.ports[1]) annotation(
    Line(points = {{16, -20}, {204, -20}, {204, 130}, {180, 130}}, color = {0, 127, 255}));
  connect(mass1.flange_b, rod1.flange_a) annotation(
    Line(points = {{0, 130}, {8, 130}, {8, 170}, {20, 170}, {20, 170}}, color = {0, 127, 0}));
  connect(mass1.flange_b, force1.flange) annotation(
    Line(points = {{0, 130}, {32, 130}, {32, 80}, {60, 80}}, color = {0, 127, 0}));
  connect(mass1.flange_b, relPositionSensor1.flange_a) annotation(
    Line(points = {{0, 130}, {39, 130}, {39, 100}, {50, 100}}, color = {0, 127, 0}));
  connect(gain3.u, forceSensor1.f) annotation(
    Line(points = {{122, 80}, {130, 80}, {130, 112}, {122, 112}, {122, 120}, {122, 120}}, color = {0, 0, 127}));
  connect(forceSensor1.flange_b, sweptVolume4.flange) annotation(
    Line(points = {{140, 130}, {160, 130}, {160, 130}, {160, 130}}, color = {0, 127, 0}));
  connect(position1.flange, forceSensor1.flange_a) annotation(
    Line(points = {{100, 130}, {120, 130}, {120, 130}, {120, 130}}, color = {0, 127, 0}));
  connect(relPositionSensor1.s_rel, position1.s_ref) annotation(
    Line(points = {{60, 112}, {60, 112}, {60, 130}, {78, 130}, {78, 130}}, color = {0, 0, 127}));
  connect(force1.f, gain3.y) annotation(
    Line(points = {{82, 80}, {98, 80}, {98, 80}, {100, 80}}, color = {0, 0, 127}));
  connect(relPositionSensor1.flange_b, rod2.flange_b) annotation(
    Line(points = {{70, 100}, {90, 100}, {90, 50}, {80, 50}}, color = {0, 127, 0}));
  connect(fixed1.flange, rod2.flange_a) annotation(
    Line(points = {{-90, 50}, {60, 50}}, color = {0, 127, 0}));
  connect(sweptVolume2.flange, damper.flange_a) annotation(
    Line(points = {{-80, 130}, {-60, 130}}, color = {0, 127, 0}));
  connect(damper.flange_b, mass1.flange_a) annotation(
    Line(points = {{-40, 130}, {-20, 130}}, color = {0, 127, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 15, Tolerance = 1e-06, Interval = 0.05),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-160, -240}, {220, 200}}, initialScale = 0.1), graphics = {Rectangle(origin = {34, 82}, pattern = LinePattern.Dash, lineThickness = 0.5, extent = {{-164, 108}, {178, -88}}), Text(origin = {-288, -361}, extent = {{-28, 9}, {92, -3}}, textString = "piston cylinder actuator", fontSize = 8, horizontalAlignment = TextAlignment.Left), Text(origin = {81, 36}, extent = {{-21, 4}, {21, -4}}, textString = "cylinder body"), Text(origin = {-13, 112}, extent = {{-21, 4}, {21, -4}}, textString = "piston head"), Text(origin = {53, 176}, extent = {{-21, 4}, {21, -4}}, textString = "rod")}),
    Icon(coordinateSystem(extent = {{-100, -140}, {100, 100}})),
    __OpenModelica_commandLineOptions = "");
end test_hydroCylinder003;
