within FluidSystemComponents.Compressible.Examples.Test;

model ChokingFlowLine_02_v01
  extends Modelica.Icons.Example;
  //-------------------------
  import units = Modelica.SIunits;
  //-------------------------
  parameter units.Volume volStd = 0.1;
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium= fluid1,
  //-------------------------
  inner Modelica.Fluid.System system(T_start(displayUnit = "K") = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, p_start = 25 * 100 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {118, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 500, nPorts = 1, p = 30 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-164, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 3) annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {130, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc(duration = 1, height = 0 * 100 * 1000, offset = 30 * 100 * 1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-192, 18}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc2(duration = 1, height = -9 * 100 * 1000, offset = 10 * 100 * 1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {158, 18}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-119, 5}, extent = {{-3, 3}, {3, -3}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 6)  annotation(
    Placement(visible = true, transformation(origin = {-110, -2}, extent = {{-7, -3}, {7, 3}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-62, -2}, extent = {{-7, -3}, {7, 3}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-71, 5}, extent = {{-3, 3}, {3, -3}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-62, 10}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-10, -2}, extent = {{-7, -3}, {7, 3}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-19, 5}, extent = {{-3, 3}, {3, -3}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.001 ^ 2)  annotation(
    Placement(visible = true, transformation(origin = {-136, 10}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction1(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.001 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-88, 10}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction2(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.03 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-38, 10}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction3(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.05 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {16, 10}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
equation
  connect(ramp_p_bc.y, boundary.p_in) annotation(
    Line(points = {{-185.4, 18}, {-176.4, 18}}, color = {0, 0, 127}));
  connect(boundary2.p_in, ramp_p_bc2.y) annotation(
    Line(points = {{142, 18}, {152, 18}}, color = {0, 0, 127}));
  connect(p.port, volume.ports[1]) annotation(
    Line(points = {{-119, 2}, {-115, 2}, {-115, 10}}, color = {0, 127, 255}));
  connect(p.p, realValue.numberPort) annotation(
    Line(points = {{-122.3, 5}, {-124.3, 5}, {-124.3, -2}, {-118.3, -2}}, color = {0, 0, 127}));
  connect(p1.port, volume1.ports[1]) annotation(
    Line(points = {{-71, 2}, {-67, 2}, {-67, 10}}, color = {0, 127, 255}));
  connect(p1.p, realValue1.numberPort) annotation(
    Line(points = {{-74.3, 5}, {-76.3, 5}, {-76.3, -2}, {-70.3, -2}}, color = {0, 0, 127}));
  connect(p2.port, volume2.ports[1]) annotation(
    Line(points = {{-19, 2}, {-15, 2}, {-15, 10}}, color = {0, 127, 255}));
  connect(p2.p, realValue2.numberPort) annotation(
    Line(points = {{-22.3, 5}, {-24.3, 5}, {-24.3, -2}, {-18.3, -2}}, color = {0, 0, 127}));
  connect(restriction.port_a, boundary.ports[1]) annotation(
    Line(points = {{-144, 10}, {-154, 10}}, color = {0, 127, 255}));
  connect(restriction.port_b, volume.ports[2]) annotation(
    Line(points = {{-128, 10}, {-114, 10}}, color = {0, 127, 255}));
  connect(restriction1.port_a, volume.ports[3]) annotation(
    Line(points = {{-96, 10}, {-114, 10}}, color = {0, 127, 255}));
  connect(restriction1.port_b, volume1.ports[2]) annotation(
    Line(points = {{-80, 10}, {-66, 10}}, color = {0, 127, 255}));
  connect(restriction2.port_a, volume1.ports[3]) annotation(
    Line(points = {{-46, 10}, {-66, 10}}, color = {0, 127, 255}));
  connect(restriction2.port_b, volume2.ports[2]) annotation(
    Line(points = {{-30, 10}, {-14, 10}}, color = {0, 127, 255}));
  connect(restriction3.port_a, volume2.ports[3]) annotation(
    Line(points = {{8, 10}, {-14, 10}}, color = {0, 127, 255}));
  connect(restriction3.port_b, boundary2.ports[1]) annotation(
    Line(points = {{24, 10}, {120, 10}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,nonewInst -d=nonewInst -d=nonewInst -d=nonewInst -d=nonewInst -d=nonewInst -d=nonewInst -d=nonewInst",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end ChokingFlowLine_02_v01;
