within FluidSystemComponents.HydroThermal.Examples;

model test_hydroCylinder001
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  // redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-190, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.CheckValveSpringLoad_Linear checkValveSpringLoad_Linear1(redeclare package Medium = liquid1, deltapCrack = 5 * 101.3 * 1000, gradientQP = 0.001 * 50 / (100 * 1000)) annotation(
    Placement(visible = true, transformation(origin = {-100, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = liquid1, V = 0.01, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-130, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, T = 288.15, nPorts = 3, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-120, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.HydroThermal.Components.PumpConstQflow_ideal pumpConstQflow_ideal1(redeclare package Medium = liquid1, qFlowDes = 1.0 * 10 ^ (-6)) annotation(
    Placement(visible = true, transformation(origin = {-120, -90}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-150, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 10000) annotation(
    Placement(visible = true, transformation(origin = {-180, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume sweptVolume1(redeclare package Medium = liquid1, clearance = 1e-6, nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.1 ^ 2, s(fixed = false, start = 0.1), use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-100, 130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Machines.SweptVolume sweptVolume2(redeclare package Medium = liquid1, clearance = 1e-6, nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.1 ^ 2, s(fixed = false, start = 0.4), use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {100, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = liquid1, diameter = 0.001, zeta = 1) annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HydroThermal.Components.CheckValveSpringLoad_Linear checkValveSpringLoad_Linear2(redeclare package Medium = liquid1, deltapCrack = 10 * 1000, gradientQP = 0.001 * 100 / (100 * 1000)) annotation(
    Placement(visible = true, transformation(origin = {118, -26}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice1(redeclare package Medium = liquid1, diameter = 0.1, zeta = 0.05) annotation(
    Placement(visible = true, transformation(origin = {-120, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Components.Mass mass1(L = 0.5, m = 5, s(fixed = true, start = 0.2 + mass1.L / 2))  annotation(
    Placement(visible = true, transformation(origin = {130, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor1 annotation(
    Placement(visible = true, transformation(origin = {-60, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = -1) annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {20, 90}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant length(k = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {10, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Sources.Position position1 annotation(
    Placement(visible = true, transformation(origin = {40, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor1 annotation(
    Placement(visible = true, transformation(origin = {70, 130}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = -1) annotation(
    Placement(visible = true, transformation(origin = {-20, 130}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force force1 annotation(
    Placement(visible = true, transformation(origin = {-50, 130}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(checkValveSpringLoad_Linear2.port_1, orifice.port_b) annotation(
    Line(points = {{118, -16}, {118, -16}, {118, 10}, {-20, 10}, {-20, 10}}, color = {0, 127, 255}));
  connect(checkValveSpringLoad_Linear2.port_1, sweptVolume2.ports[1]) annotation(
    Line(points = {{118, -16}, {118, -16}, {118, 130}, {110, 130}, {110, 130}}, color = {0, 127, 255}));
  connect(orifice1.port_b, orifice.port_a) annotation(
    Line(points = {{-120, -20}, {-120, -20}, {-120, 10}, {-40, 10}, {-40, 10}}, color = {0, 127, 255}));
  connect(orifice1.port_b, sweptVolume1.ports[1]) annotation(
    Line(points = {{-120, -20}, {-120, -20}, {-120, 130}, {-110, 130}, {-110, 130}}, color = {0, 127, 255}));
  connect(boundary.ports[3], checkValveSpringLoad_Linear2.port_2) annotation(
    Line(points = {{-120, -110}, {118, -110}, {118, -36}}, color = {0, 127, 255}));
  connect(sweptVolume1.flange, mass1.flange_a) annotation(
    Line(points = {{-90, 130}, {-85, 130}, {-85, 170}, {120, 170}}, color = {0, 127, 0}));
  connect(boundary.ports[2], checkValveSpringLoad_Linear1.port_2) annotation(
    Line(points = {{-120, -110}, {-100, -110}, {-100, -80}}, color = {0, 127, 255}));
  connect(boundary.ports[1], pumpConstQflow_ideal1.port_1) annotation(
    Line(points = {{-120, -110}, {-120, -100}}, color = {0, 127, 255}));
  connect(volume.ports[3], checkValveSpringLoad_Linear1.port_1) annotation(
    Line(points = {{-120, -60}, {-100, -60}}, color = {0, 127, 255}));
  connect(pumpConstQflow_ideal1.port_2, volume.ports[1]) annotation(
    Line(points = {{-120, -80}, {-120, -60}}, color = {0, 127, 255}));
  connect(volume.ports[2], orifice1.port_a) annotation(
    Line(points = {{-120, -60}, {-120, -40}}, color = {0, 127, 255}));
  connect(speed1.flange, pumpConstQflow_ideal1.flange_1) annotation(
    Line(points = {{-140, -90}, {-130, -90}}));
  connect(const.y, speed1.w_ref) annotation(
    Line(points = {{-169, -90}, {-163, -90}}, color = {0, 0, 127}));
  connect(forceSensor1.flange_a, sweptVolume2.flange) annotation(
    Line(points = {{80, 130}, {90, 130}, {90, 130}, {90, 130}}, color = {0, 127, 0}));
  connect(sweptVolume1.flange, force1.flange) annotation(
    Line(points = {{-90, 130}, {-60, 130}}, color = {0, 127, 0}));
  connect(sweptVolume1.flange, positionSensor1.flange) annotation(
    Line(points = {{-90, 130}, {-70, 130}, {-70, 70}}, color = {0, 127, 0}));
  connect(position1.flange, forceSensor1.flange_b) annotation(
    Line(points = {{50, 130}, {60, 130}, {60, 130}, {60, 130}}, color = {0, 127, 0}));
  connect(add1.y, position1.s_ref) annotation(
    Line(points = {{20, 101}, {20, 130}, {28, 130}}, color = {0, 0, 127}));
  connect(gain1.u, forceSensor1.f) annotation(
    Line(points = {{-8, 130}, {0, 130}, {0, 150}, {78, 150}, {78, 142}, {78, 142}}, color = {0, 0, 127}));
  connect(force1.f, gain1.y) annotation(
    Line(points = {{-38, 130}, {-31, 130}}, color = {0, 0, 127}));
  connect(gain3.u, positionSensor1.s) annotation(
    Line(points = {{-42, 70}, {-49, 70}}, color = {0, 0, 127}));
  connect(add1.u1, gain3.y) annotation(
    Line(points = {{14, 78}, {14, 70}, {-19, 70}}, color = {0, 0, 127}));
  connect(add1.u2, length.y) annotation(
    Line(points = {{26, 78}, {26, 63.5}, {10, 63.5}, {10, 51}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -140}, {160, 200}}), graphics = {Text(origin = {-103, 187}, extent = {{-37, 13}, {87, -7}}, textString = "piston cylinder actuator", fontSize = 8, horizontalAlignment = TextAlignment.Left), Rectangle(origin = {-10, 84}, pattern = LinePattern.Dash, extent = {{-158, 96}, {160, -96}}), Text(origin = {-33, 25}, extent = {{-21, 7}, {15, -3}}, textString = "leak path"), Text(origin = {134, 154}, extent = {{-20, 6}, {22, -8}}, textString = "cylinder(rod)")}),
    Icon(coordinateSystem(extent = {{-100, -140}, {100, 100}})),
    __OpenModelica_commandLineOptions = "");
end test_hydroCylinder001;
