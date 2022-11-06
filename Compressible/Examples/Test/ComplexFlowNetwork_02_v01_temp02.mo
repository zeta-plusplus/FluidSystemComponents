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
    Placement(visible = true, transformation(origin = {-164, 71}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 550, nPorts = 1, p = 28 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-100, 156}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = fluid1, T = 1200, nPorts = 2, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {74, 150}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 3) annotation(
    Placement(visible = true, transformation(origin = {-127, -14}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-73, -9}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume3(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 4) annotation(
    Placement(visible = true, transformation(origin = {5, 1}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume4(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 3) annotation(
    Placement(visible = true, transformation(origin = {-84, 73}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-164, 100}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-151, 100}, extent = {{3, -3}, {-3, 3}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-151, 18}, extent = {{3, -3}, {-3, 3}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible1(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0,dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-164, 18}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-104, 0}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible2(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0,dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-104, -14}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp3(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-71, 102}, extent = {{3, -3}, {-3, 3}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible3(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-84, 102}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible4(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-36, 16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp4(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-36, 28}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp5(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-44, 0}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible5(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-44, -14}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp6(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {67, 72}, extent = {{-3, -3}, {3, 3}}, rotation = 180)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible6(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {52, 72}, extent = {{-6, 6}, {6, -6}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc(duration = 1, height = 2 * 100 * 1000, offset = 30 * 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-202, 170}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc1(duration = 1, height = 2 * 100 * 1000, offset = 28 * 100 * 1000, startTime = 13) annotation(
    Placement(visible = true, transformation(origin = {-126, 164}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc2(duration = 1, height = -1 * 100 * 1000, offset = 10 * 100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {102, 166}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp7(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {37, 96}, extent = {{3, -3}, {-3, 3}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible7(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {24, 96}, extent = {{6, -6}, {-6, 6}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume5(redeclare package Medium = fluid1,V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {24, 73}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp8(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {37, 48}, extent = {{3, -3}, {-3, 3}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible8(redeclare package Medium = fluid1,Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {24, 48}, extent = {{6, -6}, {-6, 6}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible9(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-51, 68}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp9(duration = 1, height = 0, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-51, 82}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.Pressure p(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-174, 68}, extent = {{-4, 4}, {4, -4}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 6)  annotation(
    Placement(visible = true, transformation(origin = {-170, 58}, extent = {{-7, -4}, {7, 4}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-138, -16}, extent = {{-4, 4}, {4, -4}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-132, -24}, extent = {{-7, -4}, {7, 4}}, rotation = 0)));
equation
  connect(valveCompressible.opening, ramp.y) annotation(
    Line(points = {{-159.2, 100}, {-154.2, 100}}, color = {0, 0, 127}));
  connect(ramp1.y, valveCompressible1.opening) annotation(
    Line(points = {{-154.3, 18}, {-160.3, 18}}, color = {0, 0, 127}));
  connect(ramp2.y, valveCompressible2.opening) annotation(
    Line(points = {{-104, -3.3}, {-104, -9.3}}, color = {0, 0, 127}));
  connect(ramp3.y, valveCompressible3.opening) annotation(
    Line(points = {{-74.3, 102}, {-79.3, 102}}, color = {0, 0, 127}));
  connect(ramp4.y, valveCompressible4.opening) annotation(
    Line(points = {{-36, 24.7}, {-36, 20.4}}, color = {0, 0, 127}));
  connect(ramp5.y, valveCompressible5.opening) annotation(
    Line(points = {{-44, -3.3}, {-44, -9.3}}, color = {0, 0, 127}));
  connect(ramp6.y, valveCompressible6.opening) annotation(
    Line(points = {{63.7, 72}, {56.7, 72}}, color = {0, 0, 127}));
  connect(boundary.ports[1], valveCompressible.port_a) annotation(
    Line(points = {{-164, 162}, {-164, 106}}, color = {0, 127, 255}));
  connect(valveCompressible.port_b, volume.ports[1]) annotation(
    Line(points = {{-164, 94}, {-164, 66}}, color = {0, 127, 255}));
  connect(valveCompressible1.port_a, volume.ports[2]) annotation(
    Line(points = {{-164, 24}, {-164, 66}}, color = {0, 127, 255}));
  connect(valveCompressible1.port_b, volume1.ports[1]) annotation(
    Line(points = {{-164, 12}, {-164, -14}, {-132, -14}}, color = {0, 127, 255}));
  connect(valveCompressible2.port_a, volume1.ports[2]) annotation(
    Line(points = {{-110, -14}, {-132, -14}}, color = {0, 127, 255}));
  connect(valveCompressible2.port_b, volume2.ports[1]) annotation(
    Line(points = {{-98, -14}, {-72, -14}}, color = {0, 127, 255}));
  connect(valveCompressible5.port_a, volume2.ports[2]) annotation(
    Line(points = {{-50, -14}, {-72, -14}}, color = {0, 127, 255}));
  connect(valveCompressible3.port_a, boundary1.ports[1]) annotation(
    Line(points = {{-84, 108}, {-84, 156}, {-90, 156}}, color = {0, 127, 255}));
  connect(valveCompressible3.port_b, volume4.ports[1]) annotation(
    Line(points = {{-84, 96}, {-84, 68}}, color = {0, 127, 255}));
  connect(valveCompressible4.port_a, volume4.ports[2]) annotation(
    Line(points = {{-42, 16}, {-84, 16}, {-84, 68}}, color = {0, 127, 255}));
  connect(valveCompressible4.port_b, volume3.ports[1]) annotation(
    Line(points = {{-30, 16}, {-14, 16}, {-14, -4}, {6, -4}}, color = {0, 127, 255}));
  connect(valveCompressible5.port_b, volume3.ports[2]) annotation(
    Line(points = {{-38, -14}, {6, -14}, {6, -4}}, color = {0, 127, 255}));
  connect(valveCompressible6.port_a, volume3.ports[3]) annotation(
    Line(points = {{52, 66}, {52, -4}, {6, -4}}, color = {0, 127, 255}));
  connect(valveCompressible6.port_b, boundary2.ports[1]) annotation(
    Line(points = {{52, 78}, {52, 150}, {64, 150}}, color = {0, 127, 255}));
  connect(ramp_p_bc.y, boundary.p_in) annotation(
    Line(points = {{-195, 170}, {-186, 170}}, color = {0, 0, 127}));
  connect(ramp_p_bc1.y, boundary1.p_in) annotation(
    Line(points = {{-119, 164}, {-111.4, 164}}, color = {0, 0, 127}));
  connect(boundary2.p_in, ramp_p_bc2.y) annotation(
    Line(points = {{86, 158}, {91, 158}, {91, 166}, {95, 166}}, color = {0, 0, 127}));
  connect(valveCompressible7.port_b, boundary2.ports[2]) annotation(
    Line(points = {{24, 102}, {24, 150}, {64, 150}}, color = {0, 127, 255}));
  connect(ramp7.y, valveCompressible7.opening) annotation(
    Line(points = {{33.7, 96}, {27.7, 96}}, color = {0, 0, 127}));
  connect(valveCompressible7.port_a, volume5.ports[1]) annotation(
    Line(points = {{24, 90}, {24, 68}}, color = {0, 127, 255}));
  connect(valveCompressible8.port_b, volume5.ports[2]) annotation(
    Line(points = {{24, 54}, {24, 68}}, color = {0, 127, 255}));
  connect(valveCompressible8.port_a, volume3.ports[4]) annotation(
    Line(points = {{24, 42}, {24, 28}, {6, 28}, {6, -4}}, color = {0, 127, 255}));
  connect(ramp8.y, valveCompressible8.opening) annotation(
    Line(points = {{33.7, 48}, {27.7, 48}}, color = {0, 0, 127}));
  connect(ramp9.y, valveCompressible9.opening) annotation(
    Line(points = {{-51, 78.7}, {-51, 72.7}}, color = {0, 0, 127}));
  connect(valveCompressible9.port_a, volume4.ports[3]) annotation(
    Line(points = {{-57, 68}, {-85, 68}}, color = {0, 127, 255}));
  connect(valveCompressible9.port_b, volume5.ports[3]) annotation(
    Line(points = {{-45, 68}, {23, 68}}, color = {0, 127, 255}));
  connect(p.port, volume.ports[3]) annotation(
    Line(points = {{-174, 64}, {-169, 64}, {-169, 66}, {-164, 66}}, color = {0, 127, 255}));
  connect(p.p, realValue.numberPort) annotation(
    Line(points = {{-178.4, 68}, {-178.4, 58}}, color = {0, 0, 127}));
  connect(p1.port, volume1.ports[3]) annotation(
    Line(points = {{-138, -20}, {-132, -20}, {-132, -14}}, color = {0, 127, 255}));
  connect(p1.p, realValue1.numberPort) annotation(
    Line(points = {{-142.4, -16}, {-144.4, -16}, {-144.4, -24}, {-140.4, -24}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,nonewInst -d=nonewInst -d=nonewInst -d=nonewInst -d=nonewInst",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end ComplexFlowNetwork_02_v01_temp02;
