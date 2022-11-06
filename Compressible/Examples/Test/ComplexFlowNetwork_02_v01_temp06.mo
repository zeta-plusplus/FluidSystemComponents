within FluidSystemComponents.Compressible.Examples.Test;

model ComplexFlowNetwork_02_v01_temp06
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
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 500, nPorts = 2, p = 30 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-173, 163}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 3) annotation(
    Placement(visible = true, transformation(origin = {-164, 53}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 550, nPorts = 1, p = 28 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-99, 157}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = fluid1, T = 1200, nPorts = 4, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {63, 197}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 3) annotation(
    Placement(visible = true, transformation(origin = {-127, -60}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-73, -55}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume3(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 5) annotation(
    Placement(visible = true, transformation(origin = {5, -45}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume4(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 4) annotation(
    Placement(visible = true, transformation(origin = {-84, 55}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc(duration = 1, height = 2 * 100 * 1000, offset = 40 * 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-202, 170}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc1(duration = 1, height = 2 * 100 * 1000, offset = 38 * 100 * 1000, startTime = 13) annotation(
    Placement(visible = true, transformation(origin = {-128, 164}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc2(duration = 1, height = -1 * 100 * 1000, offset = 10 * 100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {91, 204}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume5(redeclare package Medium = fluid1, V = volStd, nPorts = 4, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {24, 67}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
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
    Placement(visible = true, transformation(origin = {24, 120}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction8(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.005 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {54, 68}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction9(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {24, 2}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = fluid1,T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {109, 175}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc3(duration = 1, height = -1 * 100 * 1000, offset = 9 * 100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {137, 182}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume6(redeclare package Medium = fluid1,V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {54, 105}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction10(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {54, 130}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction11(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.001 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {78, 100}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume7(redeclare package Medium = fluid1,V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {100, 105}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction12(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {100, 130}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc4(duration = 1, height = -1 * 100 * 1000, offset = 8.5 * 100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {181, 161}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary4(redeclare package Medium = fluid1,T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {157, 153}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction13(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.001 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {148, 12}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume8(redeclare package Medium = fluid1,V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {100, 39}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume9(redeclare package Medium = fluid1,V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {148, 39}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction14(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {100, 80}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction15(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {76, 34}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction16(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {148, 86}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction17(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {124, 34}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume10(redeclare package Medium = fluid1,V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {54, 19}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction18(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {54, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction19(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.001 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-56, 84}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume11(redeclare package Medium = fluid1,V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-34, 84}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction20(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-2, 84}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction21(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-12, 112}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary5(redeclare package Medium = fluid1,T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-125, 325}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc5(duration = 1, height = 0 * 100 * 1000, offset = 5 * 100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {-152, 332}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume12(redeclare package Medium = fluid1,V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-164, 265}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction22(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-164, 200}, extent = {{8, -8}, {-8, 8}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction23(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.001 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-96, 260}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible(redeclare package Medium = fluid1,Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-164, 284}, extent = {{6, 6}, {-6, -6}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_valve(duration = 1, height = -0.9, offset = 1, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-179, 284}, extent = {{-3, -3}, {3, 3}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction24(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-136, 302}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume13(redeclare package Medium = fluid1,V = volStd, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-159, 302}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
equation
  connect(ramp_p_bc.y, boundary.p_in) annotation(
    Line(points = {{-195, 170}, {-184, 170}}, color = {0, 0, 127}));
  connect(ramp_p_bc1.y, boundary1.p_in) annotation(
    Line(points = {{-121, 164}, {-110, 164}}, color = {0, 0, 127}));
  connect(p.port, volume.ports[1]) annotation(
    Line(points = {{-174, 46}, {-169, 46}, {-169, 48}, {-164, 48}}, color = {0, 127, 255}));
  connect(p.p, realValue.numberPort) annotation(
    Line(points = {{-178.4, 50}, {-178.4, 40}}, color = {0, 0, 127}));
  connect(p1.port, volume1.ports[1]) annotation(
    Line(points = {{-138, -66}, {-132, -66}, {-132, -60}}, color = {0, 127, 255}));
  connect(p1.p, realValue1.numberPort) annotation(
    Line(points = {{-142.4, -62}, {-144.4, -62}, {-144.4, -70}, {-140.4, -70}}, color = {0, 0, 127}));
  connect(restriction.port_a, boundary.ports[1]) annotation(
    Line(points = {{-164, 100}, {-164, 163}}, color = {0, 127, 255}));
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
    Line(points = {{-84, 106}, {-84, 157}, {-90, 157}}, color = {0, 127, 255}));
  connect(restriction6.port_a, volume4.ports[3]) annotation(
    Line(points = {{-64, 50}, {-84, 50}}, color = {0, 127, 255}));
  connect(restriction6.port_b, volume5.ports[1]) annotation(
    Line(points = {{-48, 50}, {-12, 50}, {-12, 62}, {24, 62}}, color = {0, 127, 255}));
  connect(restriction7.port_a, volume5.ports[2]) annotation(
    Line(points = {{24, 112}, {24, 62}}, color = {0, 127, 255}));
  connect(restriction7.port_b, boundary2.ports[1]) annotation(
    Line(points = {{24, 128}, {24, 197}, {54, 197}}, color = {0, 127, 255}));
  connect(volume3.ports[3], restriction9.port_a) annotation(
    Line(points = {{5, -50}, {23, -50}, {23, -6}}, color = {0, 127, 255}));
  connect(restriction9.port_b, volume5.ports[3]) annotation(
    Line(points = {{24, 10}, {24, 62}}, color = {0, 127, 255}));
  connect(ramp_p_bc2.y, boundary2.p_in) annotation(
    Line(points = {{84, 204}, {84, 204.5}, {74, 204.5}, {74, 204}}, color = {0, 0, 127}));
  connect(ramp_p_bc3.y, boundary3.p_in) annotation(
    Line(points = {{130.4, 182}, {120, 182}}, color = {0, 0, 127}));
  connect(restriction8.port_b, volume6.ports[1]) annotation(
    Line(points = {{54, 76}, {54, 100}}, color = {0, 127, 255}));
  connect(restriction10.port_a, volume6.ports[2]) annotation(
    Line(points = {{54, 122}, {54, 100}}, color = {0, 127, 255}));
  connect(restriction10.port_b, boundary2.ports[2]) annotation(
    Line(points = {{54, 138}, {54, 197}}, color = {0, 127, 255}));
  connect(restriction11.port_a, volume6.ports[3]) annotation(
    Line(points = {{70, 100}, {54, 100}}));
  connect(restriction11.port_b, volume7.ports[1]) annotation(
    Line(points = {{86, 100}, {100, 100}}, color = {0, 127, 255}));
  connect(restriction12.port_b, boundary3.ports[1]) annotation(
    Line(points = {{100, 138}, {100, 175}}, color = {0, 127, 255}));
  connect(restriction12.port_a, volume7.ports[2]) annotation(
    Line(points = {{100, 122}, {100, 100}}, color = {0, 127, 255}));
  connect(ramp_p_bc4.y, boundary4.p_in) annotation(
    Line(points = {{174, 161}, {168, 161}, {168, 160}}, color = {0, 0, 127}));
  connect(restriction13.port_a, volume3.ports[4]) annotation(
    Line(points = {{148, 4}, {148, -50}, {5, -50}}, color = {0, 127, 255}));
  connect(restriction14.port_b, volume7.ports[3]) annotation(
    Line(points = {{100, 88}, {100, 100}}, color = {0, 127, 255}));
  connect(restriction14.port_a, volume8.ports[1]) annotation(
    Line(points = {{100, 72}, {100, 34}}, color = {0, 127, 255}));
  connect(restriction15.port_b, volume8.ports[2]) annotation(
    Line(points = {{84, 34}, {100, 34}}, color = {0, 127, 255}));
  connect(restriction18.port_a, volume3.ports[5]) annotation(
    Line(points = {{54, -12}, {54, -50}, {5, -50}}, color = {0, 127, 255}));
  connect(restriction18.port_b, volume10.ports[1]) annotation(
    Line(points = {{54, 4}, {54, 14}}, color = {0, 127, 255}));
  connect(volume10.ports[2], restriction8.port_a) annotation(
    Line(points = {{54, 14}, {54, 60}}, color = {0, 127, 255}));
  connect(restriction15.port_a, volume10.ports[3]) annotation(
    Line(points = {{68, 34}, {54, 34}, {54, 14}}, color = {0, 127, 255}));
  connect(restriction17.port_a, volume8.ports[3]) annotation(
    Line(points = {{116, 34}, {100, 34}}, color = {0, 127, 255}));
  connect(restriction17.port_b, volume9.ports[1]) annotation(
    Line(points = {{132, 34}, {148, 34}}, color = {0, 127, 255}));
  connect(restriction13.port_b, volume9.ports[2]) annotation(
    Line(points = {{148, 20}, {148, 34}}));
  connect(restriction16.port_a, volume9.ports[3]) annotation(
    Line(points = {{148, 78}, {148, 34}}, color = {0, 127, 255}));
  connect(restriction16.port_b, boundary4.ports[1]) annotation(
    Line(points = {{148, 94}, {148, 153}}, color = {0, 127, 255}));
  connect(restriction19.port_a, volume4.ports[4]) annotation(
    Line(points = {{-64, 84}, {-72, 84}, {-72, 50}, {-84, 50}}, color = {0, 127, 255}));
  connect(restriction19.port_b, volume11.ports[1]) annotation(
    Line(points = {{-48, 84}, {-39, 84}}, color = {0, 127, 255}));
  connect(restriction21.port_a, volume11.ports[2]) annotation(
    Line(points = {{-20, 112}, {-38, 112}, {-38, 84}}, color = {0, 127, 255}));
  connect(restriction20.port_a, volume11.ports[3]) annotation(
    Line(points = {{-10, 84}, {-38, 84}}, color = {0, 127, 255}));
  connect(restriction20.port_b, volume5.ports[4]) annotation(
    Line(points = {{6, 84}, {24, 84}, {24, 62}}, color = {0, 127, 255}));
  connect(restriction21.port_b, boundary2.ports[3]) annotation(
    Line(points = {{-4, 112}, {-4, 197}, {54, 197}}, color = {0, 127, 255}));
  connect(restriction22.port_a, boundary.ports[2]) annotation(
    Line(points = {{-164, 192}, {-164, 163}}, color = {0, 127, 255}));
  connect(restriction22.port_b, volume12.ports[1]) annotation(
    Line(points = {{-164, 208}, {-164, 260}}, color = {0, 127, 255}));
  connect(ramp_p_bc5.y, boundary5.p_in) annotation(
    Line(points = {{-145.4, 332}, {-136.4, 332}}, color = {0, 0, 127}));
  connect(restriction23.port_a, volume12.ports[2]) annotation(
    Line(points = {{-104, 260}, {-164, 260}}, color = {0, 127, 255}));
  connect(restriction23.port_b, boundary2.ports[4]) annotation(
    Line(points = {{-88, 260}, {54, 260}, {54, 197}}, color = {0, 127, 255}));
  connect(ramp_valve.y, valveCompressible.opening) annotation(
    Line(points = {{-175.7, 284}, {-168.7, 284}}, color = {0, 0, 127}));
  connect(valveCompressible.port_a, volume12.ports[3]) annotation(
    Line(points = {{-164, 278}, {-164, 260}}, color = {0, 127, 255}));
  connect(restriction24.port_a, volume13.ports[1]) annotation(
    Line(points = {{-144, 302}, {-164, 302}}, color = {0, 127, 255}));
  connect(valveCompressible.port_b, volume13.ports[2]) annotation(
    Line(points = {{-164, 290}, {-164, 302}}, color = {0, 127, 255}));
  connect(restriction24.port_b, boundary5.ports[1]) annotation(
    Line(points = {{-128, 302}, {-116, 302}, {-116, 325}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-260, -100}, {240, 340}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,nonewInst -d=nonewInst -d=nonewInst -d=nonewInst -d=nonewInst",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end ComplexFlowNetwork_02_v01_temp06;
