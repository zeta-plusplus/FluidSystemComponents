within FluidSystemComponents.HydroThermal.Examples;

model test_hydroCylinder002
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  // redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-190, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.CheckValveSpringLoad_Linear checkValveSpringLoad_Linear1(redeclare package Medium = liquid1, deltapCrack = 5 * 101.3 * 1000, gradientQP = 0.001 * 50 / (100 * 1000)) annotation(
    Placement(visible = true, transformation(origin = {-40, -180}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = liquid1, V = 0.01, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-70, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, T = 288.15, nPorts = 3, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-60, -230}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.HydroThermal.Components.PumpConstQflow_ideal pumpConstQflow_ideal1(redeclare package Medium = liquid1, qFlowDes = 1.0 * 10 ^ (-6)) annotation(
    Placement(visible = true, transformation(origin = {-60, -200}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-90, -200}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 10000) annotation(
    Placement(visible = true, transformation(origin = {-130, -200}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume sweptVolume1(redeclare package Medium = liquid1, clearance = 1e-6, nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.1 ^ 2, s(fixed = false, start = 0.1), use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-40, 130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Machines.SweptVolume sweptVolume2(redeclare package Medium = liquid1, clearance = 1e-6, nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.1 ^ 2, s(fixed = false, start = 0.4), use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {160, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = liquid1, diameter = 0.001, zeta = 1) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.CheckValveSpringLoad_Linear checkValveSpringLoad_Linear2(redeclare package Medium = liquid1, deltapCrack = 10 * 1000) annotation(
    Placement(visible = true, transformation(origin = {180, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice1(redeclare package Medium = liquid1, diameter = 0.1, zeta = 0.05) annotation(
    Placement(visible = true, transformation(origin = {-60, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = liquid1, V = 1e-6, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {190, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = liquid1, V = 1e-6, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Components.Mass mass1(L = 0.5, m = 5, s(fixed = true, start = 0.2 + mass1.L / 2)) annotation(
    Placement(visible = true, transformation(origin = {170, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor1 annotation(
    Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = -1) annotation(
    Placement(visible = true, transformation(origin = {30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {80, 90}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant length(k = 0.5) annotation(
    Placement(visible = true, transformation(origin = {70, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Sources.Position position1 annotation(
    Placement(visible = true, transformation(origin = {100, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor1 annotation(
    Placement(visible = true, transformation(origin = {130, 130}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = -1) annotation(
    Placement(visible = true, transformation(origin = {40, 130}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force force1 annotation(
    Placement(visible = true, transformation(origin = {10, 130}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.DirValve_4ports3positions dirValve_4ports3positions1(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.IntegerStep integerStep1(height = 1, offset = -1, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {50, -120}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(volume1.ports[3], checkValveSpringLoad_Linear2.port_1) annotation(
    Line(points = {{180, 10}, {180, -60}}, color = {0, 127, 255}));
  connect(dirValve_4ports3positions1.port_4, checkValveSpringLoad_Linear2.port_2) annotation(
    Line(points = {{16, -100}, {16, -90}, {180, -90}, {180, -80}}, color = {0, 127, 255}));
  connect(orifice1.port_b, volume2.ports[1]) annotation(
    Line(points = {{-60, -60}, {-60, 10}}, color = {0, 127, 255}));
  connect(orifice1.port_a, dirValve_4ports3positions1.port_3) annotation(
    Line(points = {{-60, -80}, {-60, -92}, {-16, -92}, {-16, -100}}, color = {0, 127, 255}));
  connect(dirValve_4ports3positions1.u_ctrl, integerStep1.y) annotation(
    Line(points = {{20, -120}, {38, -120}, {38, -120}, {38, -120}}, color = {255, 127, 0}));
  connect(dirValve_4ports3positions1.port_1, volume.ports[2]) annotation(
    Line(points = {{-16, -140}, {-16, -150}, {-60, -150}, {-60, -170}}, color = {0, 127, 255}));
  connect(dirValve_4ports3positions1.port_2, boundary.ports[3]) annotation(
    Line(points = {{16, -140}, {16, -220}, {-60, -220}}, color = {0, 127, 255}));
  connect(volume.ports[3], checkValveSpringLoad_Linear1.port_1) annotation(
    Line(points = {{-60, -170}, {-40, -170}}, color = {0, 127, 255}));
  connect(boundary.ports[2], checkValveSpringLoad_Linear1.port_2) annotation(
    Line(points = {{-60, -220}, {-40, -220}, {-40, -190}}, color = {0, 127, 255}));
  connect(boundary.ports[1], pumpConstQflow_ideal1.port_1) annotation(
    Line(points = {{-60, -220}, {-60, -210}}, color = {0, 127, 255}));
  connect(speed1.flange, pumpConstQflow_ideal1.flange_1) annotation(
    Line(points = {{-80, -200}, {-70, -200}}));
  connect(pumpConstQflow_ideal1.port_2, volume.ports[1]) annotation(
    Line(points = {{-60, -190}, {-60, -170}}, color = {0, 127, 255}));
  connect(const.y, speed1.w_ref) annotation(
    Line(points = {{-119, -200}, {-103, -200}, {-103, -200}, {-103, -200}}, color = {0, 0, 127}));
  connect(gain3.u, positionSensor1.s) annotation(
    Line(points = {{18, 70}, {11, 70}}, color = {0, 0, 127}));
  connect(sweptVolume1.flange, positionSensor1.flange) annotation(
    Line(points = {{-30, 130}, {-10, 130}, {-10, 70}}, color = {0, 127, 0}));
  connect(add1.u1, gain3.y) annotation(
    Line(points = {{74, 78}, {74, 70}, {41, 70}}, color = {0, 0, 127}));
  connect(sweptVolume2.ports[1], volume1.ports[1]) annotation(
    Line(points = {{170, 130}, {180, 130}, {180, 10}}, color = {0, 127, 255}, thickness = 0.5));
  connect(orifice.port_b, volume1.ports[2]) annotation(
    Line(points = {{40, 10}, {180, 10}}, color = {0, 127, 255}));
  connect(volume2.ports[2], orifice.port_a) annotation(
    Line(points = {{-60, 10}, {20, 10}}, color = {0, 127, 255}));
  connect(volume2.ports[3], sweptVolume1.ports[1]) annotation(
    Line(points = {{-60, 10}, {-60, 130}, {-50, 130}}, color = {0, 127, 255}, thickness = 0.5));
  connect(add1.u2, length.y) annotation(
    Line(points = {{86, 78}, {86, 63.5}, {70, 63.5}, {70, 51}}, color = {0, 0, 127}));
  connect(forceSensor1.flange_a, sweptVolume2.flange) annotation(
    Line(points = {{140, 130}, {150, 130}, {150, 130}, {150, 130}}, color = {0, 127, 0}));
  connect(sweptVolume1.flange, mass1.flange_a) annotation(
    Line(points = {{-30, 130}, {-25, 130}, {-25, 170}, {160, 170}}, color = {0, 127, 0}));
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
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -260}, {200, 200}}), graphics = {Rectangle(origin = {34, 80}, pattern = LinePattern.Dash, lineThickness = 0.5, extent = {{-182, 114}, {182, -114}}), Text(origin = {-116, 183}, extent = {{-28, 9}, {62, -3}}, textString = "piston cylinder actuator", fontSize = 6, horizontalAlignment = TextAlignment.Left), Text(origin = {30, -15}, extent = {{-28, 9}, {32, 1}}, textString = "leak path")}),
    Icon(coordinateSystem(extent = {{-100, -140}, {100, 100}})),
    __OpenModelica_commandLineOptions = "");
end test_hydroCylinder002;
