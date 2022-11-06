within FluidSystemComponents.Compressible.Examples.Test;

model ChokingFlowLine_01_v01
  extends Modelica.Icons.Example;
  //-------------------------
  import units = Modelica.SIunits;
  //-------------------------
  parameter units.Volume volStd = 0.1;
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium= fluid1,
  //-------------------------
  inner Modelica.Fluid.System system(T_start(displayUnit = "K") = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, p_start = 10 * 100 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {118, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 500, nPorts = 1, p = 30 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-164, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 3) annotation(
    Placement(visible = true, transformation(origin = {-110, 20}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {130, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.001 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-140, 20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-140, 33}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc(duration = 1, height = 0 * 100 * 1000, offset = 30 * 100 * 1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-192, 27}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc2(duration = 1, height = -9.0 * 100 * 1000, offset = 10 * 100 * 1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {158, 28}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-119, 15}, extent = {{-3, 3}, {3, -3}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 6)  annotation(
    Placement(visible = true, transformation(origin = {-110, 8}, extent = {{-7, -3}, {7, 3}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-88, 33}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible1(redeclare package Medium = fluid1,Av = 0.8 * Modelica.Constants.pi / 4 * 0.001 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-88, 20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-62, 8}, extent = {{-7, -3}, {7, 3}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-71, 15}, extent = {{-3, 3}, {3, -3}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1,V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-62, 20}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-38, 33}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible2(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.03 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-38, 20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-10, 8}, extent = {{-7, -3}, {7, 3}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-19, 15}, extent = {{-3, 3}, {3, -3}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible3(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.05 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {14, 20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp3(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {14, 33}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
equation
  connect(boundary.ports[1], valveCompressible.port_a) annotation(
    Line(points = {{-154, 20}, {-146, 20}}, color = {0, 127, 255}));
  connect(valveCompressible.port_b, volume.ports[1]) annotation(
    Line(points = {{-134, 20}, {-115, 20}}, color = {0, 127, 255}));
  connect(ramp_p_bc.y, boundary.p_in) annotation(
    Line(points = {{-185, 27}, {-180.5, 27}, {-180.5, 28}, {-176, 28}}, color = {0, 0, 127}));
  connect(boundary2.p_in, ramp_p_bc2.y) annotation(
    Line(points = {{142, 28}, {152, 28}}, color = {0, 0, 127}));
  connect(p.port, volume.ports[2]) annotation(
    Line(points = {{-119, 12}, {-115, 12}, {-115, 20}}, color = {0, 127, 255}));
  connect(ramp.y, valveCompressible.opening) annotation(
    Line(points = {{-140, 29.7}, {-140, 25.7}}, color = {0, 0, 127}));
  connect(p.p, realValue.numberPort) annotation(
    Line(points = {{-122.3, 15}, {-124.3, 15}, {-124.3, 8}, {-118.3, 8}}, color = {0, 0, 127}));
  connect(valveCompressible1.port_a, volume.ports[3]) annotation(
    Line(points = {{-94, 20}, {-104, 20}, {-104, 21}, {-114, 21}}, color = {0, 127, 255}));
  connect(ramp1.y, valveCompressible1.opening) annotation(
    Line(points = {{-88, 29.7}, {-88, 25.7}}, color = {0, 0, 127}));
  connect(valveCompressible1.port_b, volume1.ports[1]) annotation(
    Line(points = {{-82, 20}, {-67, 20}}, color = {0, 127, 255}));
  connect(p1.port, volume1.ports[2]) annotation(
    Line(points = {{-71, 12}, {-67, 12}, {-67, 20}}, color = {0, 127, 255}));
  connect(p1.p, realValue1.numberPort) annotation(
    Line(points = {{-74.3, 15}, {-76.3, 15}, {-76.3, 8}, {-70.3, 8}}, color = {0, 0, 127}));
  connect(ramp2.y, valveCompressible2.opening) annotation(
    Line(points = {{-38, 29.7}, {-38, 25.7}}, color = {0, 0, 127}));
  connect(valveCompressible2.port_a, volume1.ports[3]) annotation(
    Line(points = {{-44, 20}, {-55, 20}, {-55, 21}, {-66, 21}}, color = {0, 127, 255}));
  connect(ramp3.y, valveCompressible3.opening) annotation(
    Line(points = {{14, 30}, {14, 24}}, color = {0, 0, 127}));
  connect(valveCompressible2.port_b, volume2.ports[1]) annotation(
    Line(points = {{-32, 20}, {-15, 20}}, color = {0, 127, 255}));
  connect(valveCompressible3.port_a, volume2.ports[2]) annotation(
    Line(points = {{8, 20}, {-15, 20}}, color = {0, 127, 255}));
  connect(p2.port, volume2.ports[3]) annotation(
    Line(points = {{-19, 12}, {-15, 12}, {-15, 20}}, color = {0, 127, 255}));
  connect(p2.p, realValue2.numberPort) annotation(
    Line(points = {{-22, 15}, {-24, 15}, {-24, 8}, {-18, 8}}, color = {0, 0, 127}));
  connect(valveCompressible3.port_b, boundary2.ports[1]) annotation(
    Line(points = {{20, 20}, {120, 20}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,nonewInst -d=nonewInst -d=nonewInst -d=nonewInst -d=nonewInst -d=nonewInst -d=nonewInst",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end ChokingFlowLine_01_v01;
