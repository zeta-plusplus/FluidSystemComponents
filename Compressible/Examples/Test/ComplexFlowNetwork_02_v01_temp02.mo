within FluidSystemComponents.Compressible.Examples.Test;

model ComplexFlowNetwork_02_v01_temp02
  extends Modelica.Icons.Example;
  //-------------------------
  import units = Modelica.SIunits;
  //-------------------------
  parameter units.Volume volStd = 0.1;
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium= fluid1,
  //-------------------------
  inner Modelica.Fluid.System system(T_start(displayUnit = "K") = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, p_start = 10 * 100 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {58, 186}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 500, nPorts = 1, p = 30 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-174, 162}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 3) annotation(
    Placement(visible = true, transformation(origin = {-164, 101}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 550, nPorts = 1, p = 28 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-100, 156}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = fluid1, T = 1200, nPorts = 2, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {74, 140}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 3) annotation(
    Placement(visible = true, transformation(origin = {-127, 16}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-73, 21}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume3(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 4) annotation(
    Placement(visible = true, transformation(origin = {5, 31}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume4(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 3) annotation(
    Placement(visible = true, transformation(origin = {-84, 103}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-164, 130}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-151, 130}, extent = {{3, -3}, {-3, 3}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-151, 48}, extent = {{3, -3}, {-3, 3}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible1(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0,dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-164, 48}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-104, 30}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible2(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0,dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-104, 16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp3(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-71, 132}, extent = {{3, -3}, {-3, 3}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible3(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-84, 132}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible4(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-36, 46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp4(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-36, 58}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp5(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-44, 30}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible5(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-44, 16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp6(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {67, 102}, extent = {{-3, -3}, {3, 3}}, rotation = 180)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible6(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {52, 102}, extent = {{-6, 6}, {6, -6}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc(duration = 1, height = 2 * 100 * 1000, offset = 30 * 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-202, 170}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc1(duration = 1, height = 2 * 100 * 1000, offset = 28 * 100 * 1000, startTime = 13) annotation(
    Placement(visible = true, transformation(origin = {-126, 164}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc2(duration = 1, height = -1 * 100 * 1000, offset = 10 * 100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {102, 148}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp7(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {37, 126}, extent = {{3, -3}, {-3, 3}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible7(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {24, 126}, extent = {{6, -6}, {-6, 6}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume5(redeclare package Medium = fluid1,V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {24, 103}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp8(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {37, 78}, extent = {{3, -3}, {-3, 3}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible8(redeclare package Medium = fluid1,Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {24, 78}, extent = {{6, -6}, {-6, 6}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible9(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-51, 98}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp9(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-51, 112}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.Pressure p(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-174, 98}, extent = {{-4, 4}, {4, -4}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 6)  annotation(
    Placement(visible = true, transformation(origin = {-170, 88}, extent = {{-7, -4}, {7, 4}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-138, 14}, extent = {{-4, 4}, {4, -4}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-132, 6}, extent = {{-7, -4}, {7, 4}}, rotation = 0)));
equation
  connect(valveCompressible.opening, ramp.y) annotation(
    Line(points = {{-159, 130}, {-154, 130}}, color = {0, 0, 127}));
  connect(ramp1.y, valveCompressible1.opening) annotation(
    Line(points = {{-154, 48}, {-160, 48}}, color = {0, 0, 127}));
  connect(ramp2.y, valveCompressible2.opening) annotation(
    Line(points = {{-104, 26}, {-104, 20}}, color = {0, 0, 127}));
  connect(ramp3.y, valveCompressible3.opening) annotation(
    Line(points = {{-74.3, 132}, {-79.3, 132}}, color = {0, 0, 127}));
  connect(ramp4.y, valveCompressible4.opening) annotation(
    Line(points = {{-36, 54.7}, {-36, 50.4}}, color = {0, 0, 127}));
  connect(ramp5.y, valveCompressible5.opening) annotation(
    Line(points = {{-44, 27}, {-44, 21}}, color = {0, 0, 127}));
  connect(ramp6.y, valveCompressible6.opening) annotation(
    Line(points = {{64, 102}, {57, 102}}, color = {0, 0, 127}));
  connect(boundary.ports[1], valveCompressible.port_a) annotation(
    Line(points = {{-164, 162}, {-164, 136}}, color = {0, 127, 255}));
  connect(valveCompressible.port_b, volume.ports[1]) annotation(
    Line(points = {{-164, 124}, {-164, 96}}, color = {0, 127, 255}));
  connect(valveCompressible1.port_a, volume.ports[2]) annotation(
    Line(points = {{-164, 54}, {-164, 96}}, color = {0, 127, 255}));
  connect(valveCompressible1.port_b, volume1.ports[1]) annotation(
    Line(points = {{-164, 42}, {-164, 16}, {-132, 16}}, color = {0, 127, 255}));
  connect(valveCompressible2.port_a, volume1.ports[2]) annotation(
    Line(points = {{-110, 16}, {-132, 16}}, color = {0, 127, 255}));
  connect(valveCompressible2.port_b, volume2.ports[1]) annotation(
    Line(points = {{-98, 16}, {-72, 16}}, color = {0, 127, 255}));
  connect(valveCompressible5.port_a, volume2.ports[2]) annotation(
    Line(points = {{-50, 16}, {-72, 16}}, color = {0, 127, 255}));
  connect(valveCompressible3.port_a, boundary1.ports[1]) annotation(
    Line(points = {{-84, 138}, {-84, 156}, {-90, 156}}, color = {0, 127, 255}));
  connect(valveCompressible3.port_b, volume4.ports[1]) annotation(
    Line(points = {{-84, 126}, {-84, 98}}, color = {0, 127, 255}));
  connect(valveCompressible4.port_a, volume4.ports[2]) annotation(
    Line(points = {{-42, 46}, {-84, 46}, {-84, 98}}, color = {0, 127, 255}));
  connect(valveCompressible4.port_b, volume3.ports[1]) annotation(
    Line(points = {{-30, 46}, {-14, 46}, {-14, 26}, {6, 26}}, color = {0, 127, 255}));
  connect(valveCompressible5.port_b, volume3.ports[2]) annotation(
    Line(points = {{-38, 16}, {6, 16}, {6, 26}}, color = {0, 127, 255}));
  connect(valveCompressible6.port_a, volume3.ports[3]) annotation(
    Line(points = {{52, 96}, {52, 26}, {6, 26}}, color = {0, 127, 255}));
  connect(valveCompressible6.port_b, boundary2.ports[1]) annotation(
    Line(points = {{52, 108}, {52, 140}, {64, 140}}, color = {0, 127, 255}));
  connect(ramp_p_bc.y, boundary.p_in) annotation(
    Line(points = {{-195, 170}, {-186, 170}}, color = {0, 0, 127}));
  connect(ramp_p_bc1.y, boundary1.p_in) annotation(
    Line(points = {{-119, 164}, {-111.4, 164}}, color = {0, 0, 127}));
  connect(boundary2.p_in, ramp_p_bc2.y) annotation(
    Line(points = {{86, 148}, {96, 148}}, color = {0, 0, 127}));
  connect(valveCompressible7.port_b, boundary2.ports[2]) annotation(
    Line(points = {{24, 132}, {24, 140}, {64, 140}}, color = {0, 127, 255}));
  connect(ramp7.y, valveCompressible7.opening) annotation(
    Line(points = {{34, 126}, {28, 126}}, color = {0, 0, 127}));
  connect(valveCompressible7.port_a, volume5.ports[1]) annotation(
    Line(points = {{24, 120}, {24, 98}}, color = {0, 127, 255}));
  connect(valveCompressible8.port_b, volume5.ports[2]) annotation(
    Line(points = {{24, 84}, {24, 98}}, color = {0, 127, 255}));
  connect(valveCompressible8.port_a, volume3.ports[4]) annotation(
    Line(points = {{24, 72}, {24, 58}, {6, 58}, {6, 26}}, color = {0, 127, 255}));
  connect(ramp8.y, valveCompressible8.opening) annotation(
    Line(points = {{34, 78}, {28, 78}}, color = {0, 0, 127}));
  connect(ramp9.y, valveCompressible9.opening) annotation(
    Line(points = {{-51, 108.7}, {-51, 102.7}}, color = {0, 0, 127}));
  connect(valveCompressible9.port_a, volume4.ports[3]) annotation(
    Line(points = {{-56, 98}, {-84, 98}}, color = {0, 127, 255}));
  connect(valveCompressible9.port_b, volume5.ports[3]) annotation(
    Line(points = {{-44, 98}, {24, 98}}, color = {0, 127, 255}));
  connect(p.port, volume.ports[3]) annotation(
    Line(points = {{-174, 94}, {-169, 94}, {-169, 96}, {-164, 96}}, color = {0, 127, 255}));
  connect(p.p, realValue.numberPort) annotation(
    Line(points = {{-178, 98}, {-178, 88}}, color = {0, 0, 127}));
  connect(p1.port, volume1.ports[3]) annotation(
    Line(points = {{-138, 10}, {-132, 10}, {-132, 16}}, color = {0, 127, 255}));
  connect(p1.p, realValue1.numberPort) annotation(
    Line(points = {{-142, 14}, {-144, 14}, {-144, 6}, {-140, 6}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,nonewInst -d=nonewInst -d=nonewInst -d=nonewInst",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end ComplexFlowNetwork_02_v01_temp02;
