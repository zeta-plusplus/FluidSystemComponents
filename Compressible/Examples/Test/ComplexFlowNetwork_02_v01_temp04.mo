within FluidSystemComponents.Compressible.Examples.Test;

model ComplexFlowNetwork_02_v01_temp04
  extends Modelica.Icons.Example;
  //-------------------------
  import units = Modelica.SIunits;
  //-------------------------
  parameter units.Volume volStd = 0.1;
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium= fluid1,
  //-------------------------
  inner Modelica.Fluid.System system(T_start(displayUnit = "K") = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, p_start = 10 * 100 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {-50, 186}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 500, nPorts = 1, p = 30 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-174, 162}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 3) annotation(
    Placement(visible = true, transformation(origin = {-164, 53}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 550, nPorts = 1, p = 28 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-100, 156}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = fluid1, T = 1200, nPorts = 2, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {54, 150}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 3) annotation(
    Placement(visible = true, transformation(origin = {-127, -60}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-73, -55}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume3(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 5) annotation(
    Placement(visible = true, transformation(origin = {5, -45}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume4(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 3) annotation(
    Placement(visible = true, transformation(origin = {-84, 55}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc(duration = 1, height = 2 * 100 * 1000, offset = 40 * 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-202, 170}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc1(duration = 1, height = 2 * 100 * 1000, offset = 38 * 100 * 1000, startTime = 13) annotation(
    Placement(visible = true, transformation(origin = {-128, 164}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc2(duration = 1, height = -1 * 100 * 1000, offset = 10 * 100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {46, 182}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume5(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {24, 55}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-174, 50}, extent = {{-4, 4}, {4, -4}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 6)  annotation(
    Placement(visible = true, transformation(origin = {-170, 40}, extent = {{-7, -4}, {7, 4}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-138, -62}, extent = {{-4, 4}, {4, -4}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-132, -70}, extent = {{-7, -4}, {7, 4}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2)  annotation(
    Placement(visible = true, transformation(origin = {-164, 92}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction1(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.005 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-164, 2}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction2(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction3(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-40, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction4(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-66, -10}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction5(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-84, 98}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction6(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.001 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-56, 50}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction7(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {24, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction8(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.005 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {54, 56}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction9(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {24, 2}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = fluid1,T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {100, 150}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc3(duration = 1, height = -1 * 100 * 1000, offset = 9 * 100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {92, 180}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume6(redeclare package Medium = fluid1,V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {54, 93}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction10(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {54, 118}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction11(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.001 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {78, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume7(redeclare package Medium = fluid1,V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {100, 93}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction12(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {100, 118}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc4(duration = 1, height = -1 * 100 * 1000, offset = 8.5 * 100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {140, 180}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary4(redeclare package Medium = fluid1,T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {148, 150}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction13(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.001 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {148, 12}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume8(redeclare package Medium = fluid1,V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {100, 39}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume9(redeclare package Medium = fluid1,V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {148, 39}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction14(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {100, 68}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction15(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {76, 34}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction16(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {148, 74}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction17(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {124, 34}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume10(redeclare package Medium = fluid1,V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {54, 19}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction18(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {54, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
equation
  connect(ramp_p_bc.y, boundary.p_in) annotation(
    Line(points = {{-195, 170}, {-186, 170}}, color = {0, 0, 127}));
  connect(ramp_p_bc1.y, boundary1.p_in) annotation(
    Line(points = {{-121, 164}, {-111.4, 164}}, color = {0, 0, 127}));
  connect(p.port, volume.ports[1]) annotation(
    Line(points = {{-174, 46}, {-169, 46}, {-169, 48}, {-164, 48}}, color = {0, 127, 255}));
  connect(p.p, realValue.numberPort) annotation(
    Line(points = {{-178.4, 50}, {-178.4, 40}}, color = {0, 0, 127}));
  connect(p1.port, volume1.ports[1]) annotation(
    Line(points = {{-138, -66}, {-132, -66}, {-132, -60}}, color = {0, 127, 255}));
  connect(p1.p, realValue1.numberPort) annotation(
    Line(points = {{-142.4, -62}, {-144.4, -62}, {-144.4, -70}, {-140.4, -70}}, color = {0, 0, 127}));
  connect(restriction.port_a, boundary.ports[1]) annotation(
    Line(points = {{-164, 100}, {-164, 162}}, color = {0, 127, 255}));
  connect(restriction.port_b, volume.ports[2]) annotation(
    Line(points = {{-164, 84}, {-164, 48}}, color = {0, 127, 255}));
  connect(restriction1.port_a, volume.ports[3]) annotation(
    Line(points = {{-164, 10}, {-164, 48}}, color = {0, 127, 255}));
  connect(restriction1.port_b, volume1.ports[2]) annotation(
    Line(points = {{-164, -6}, {-164, -60}, {-132, -60}}, color = {0, 127, 255}));
  connect(restriction2.port_b, volume2.ports[1]) annotation(
    Line(points = {{-92, -60}, {-72, -60}}, color = {0, 127, 255}));
  connect(restriction2.port_a, volume1.ports[3]) annotation(
    Line(points = {{-108, -60}, {-132, -60}}, color = {0, 127, 255}));
  connect(restriction3.port_a, volume2.ports[2]) annotation(
    Line(points = {{-48, -60}, {-72, -60}}, color = {0, 127, 255}));
  connect(restriction3.port_b, volume3.ports[1]) annotation(
    Line(points = {{-32, -60}, {6, -60}, {6, -50}}, color = {0, 127, 255}));
  connect(restriction4.port_a, volume4.ports[1]) annotation(
    Line(points = {{-74, -10}, {-84, -10}, {-84, 50}}, color = {0, 127, 255}));
  connect(restriction4.port_b, volume3.ports[2]) annotation(
    Line(points = {{-58, -10}, {-18, -10}, {-18, -50}, {5, -50}}, color = {0, 127, 255}));
  connect(restriction5.port_b, volume4.ports[2]) annotation(
    Line(points = {{-84, 90}, {-84, 50}}, color = {0, 127, 255}));
  connect(restriction5.port_a, boundary1.ports[1]) annotation(
    Line(points = {{-84, 106}, {-84, 156}, {-90, 156}}, color = {0, 127, 255}));
  connect(restriction6.port_a, volume4.ports[3]) annotation(
    Line(points = {{-64, 50}, {-84, 50}}, color = {0, 127, 255}));
  connect(restriction6.port_b, volume5.ports[1]) annotation(
    Line(points = {{-48, 50}, {24, 50}}, color = {0, 127, 255}));
  connect(restriction7.port_a, volume5.ports[2]) annotation(
    Line(points = {{24, 80}, {24, 50}}, color = {0, 127, 255}));
  connect(restriction7.port_b, boundary2.ports[1]) annotation(
    Line(points = {{24, 96}, {24, 140}, {54, 140}}, color = {0, 127, 255}));
  connect(volume3.ports[3], restriction9.port_a) annotation(
    Line(points = {{5, -50}, {23, -50}, {23, -6}}, color = {0, 127, 255}));
  connect(restriction9.port_b, volume5.ports[3]) annotation(
    Line(points = {{24, 10}, {24, 50}}, color = {0, 127, 255}));
  connect(ramp_p_bc2.y, boundary2.p_in) annotation(
    Line(points = {{46, 176}, {46, 162}}, color = {0, 0, 127}));
  connect(ramp_p_bc3.y, boundary3.p_in) annotation(
    Line(points = {{92, 173}, {92, 161.4}}, color = {0, 0, 127}));
  connect(restriction8.port_b, volume6.ports[1]) annotation(
    Line(points = {{54, 64}, {54, 88}}, color = {0, 127, 255}));
  connect(restriction10.port_a, volume6.ports[2]) annotation(
    Line(points = {{54, 110}, {54, 88}}, color = {0, 127, 255}));
  connect(restriction10.port_b, boundary2.ports[2]) annotation(
    Line(points = {{54, 126}, {54, 140}}, color = {0, 127, 255}));
  connect(restriction11.port_a, volume6.ports[3]) annotation(
    Line(points = {{70, 88}, {54, 88}}));
  connect(restriction11.port_b, volume7.ports[1]) annotation(
    Line(points = {{86, 88}, {100, 88}}, color = {0, 127, 255}));
  connect(restriction12.port_b, boundary3.ports[1]) annotation(
    Line(points = {{100, 126}, {100, 140}}, color = {0, 127, 255}));
  connect(restriction12.port_a, volume7.ports[2]) annotation(
    Line(points = {{100, 110}, {100, 88}}, color = {0, 127, 255}));
  connect(ramp_p_bc4.y, boundary4.p_in) annotation(
    Line(points = {{140, 173.4}, {140, 161.4}}, color = {0, 0, 127}));
  connect(restriction13.port_a, volume3.ports[4]) annotation(
    Line(points = {{148, 4}, {148, -50}, {5, -50}}, color = {0, 127, 255}));
  connect(restriction14.port_b, volume7.ports[3]) annotation(
    Line(points = {{100, 76}, {100, 88}}, color = {0, 127, 255}));
  connect(restriction14.port_a, volume8.ports[1]) annotation(
    Line(points = {{100, 60}, {100, 34}}, color = {0, 127, 255}));
  connect(restriction15.port_b, volume8.ports[2]) annotation(
    Line(points = {{84, 34}, {100, 34}}, color = {0, 127, 255}));
  connect(restriction18.port_a, volume3.ports[5]) annotation(
    Line(points = {{54, -12}, {54, -50}, {5, -50}}, color = {0, 127, 255}));
  connect(restriction18.port_b, volume10.ports[1]) annotation(
    Line(points = {{54, 4}, {54, 14}}, color = {0, 127, 255}));
  connect(volume10.ports[2], restriction8.port_a) annotation(
    Line(points = {{54, 14}, {54, 48}}, color = {0, 127, 255}));
  connect(restriction15.port_a, volume10.ports[3]) annotation(
    Line(points = {{68, 34}, {54, 34}, {54, 14}}, color = {0, 127, 255}));
  connect(restriction17.port_a, volume8.ports[3]) annotation(
    Line(points = {{116, 34}, {100, 34}}, color = {0, 127, 255}));
  connect(restriction17.port_b, volume9.ports[1]) annotation(
    Line(points = {{132, 34}, {148, 34}}, color = {0, 127, 255}));
  connect(restriction13.port_b, volume9.ports[2]) annotation(
    Line(points = {{148, 20}, {148, 34}}));
  connect(restriction16.port_a, volume9.ports[3]) annotation(
    Line(points = {{148, 66}, {148, 34}}, color = {0, 127, 255}));
  connect(restriction16.port_b, boundary4.ports[1]) annotation(
    Line(points = {{148, 82}, {148, 140}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,nonewInst -d=nonewInst -d=nonewInst -d=nonewInst -d=nonewInst",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end ComplexFlowNetwork_02_v01_temp04;
