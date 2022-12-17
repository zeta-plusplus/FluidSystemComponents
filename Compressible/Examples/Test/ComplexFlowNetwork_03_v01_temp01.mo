within FluidSystemComponents.Compressible.Examples.Test;

model ComplexFlowNetwork_03_v01_temp01
  extends Modelica.Icons.Example;
  //-------------------------
  import units = Modelica.SIunits;
  //-------------------------
  parameter units.Volume volStd = 0.1;
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium= fluid1,
  //-------------------------
  
  inner Modelica.Fluid.System system(T_start(displayUnit = "K") = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, p_start = 10 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-74, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium= fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-95, 93}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc(duration = 1, height = -1 * 100 * 1000, offset = 1.3 * 100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {-67, 100}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc1(duration = 1, height = -1 * 100 * 1000, offset = 1.2 * 100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {-185, 91}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium= fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-155, 84}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium= fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-73, -25}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium= fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-130, 23}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction(redeclare package Medium= fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-130, 48}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction1(redeclare package Medium= fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-104, 52}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction2(redeclare package Medium= fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-104, -8}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium= fluid1, V = volStd, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-164, -50}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction3(redeclare package Medium= fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-92, -50}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc2(duration = 1, height = -1 * 100 * 1000, offset = 1 * 100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {-63, -117}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium= fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-91, -124}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume3(redeclare package Medium= fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-10, -25}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction4(redeclare package Medium= fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-40, -32}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction5(redeclare package Medium= fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-204, -84}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction6(redeclare package Medium= fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {26, -32}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume4(redeclare package Medium= fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {60, -25}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium= fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {133, -32}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc3(duration = 1, height = -1 * 100 * 1000, offset = 3 * 100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {163, -25}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction7(redeclare package Medium= fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {94, -32}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc4(duration = 1, height = -1 * 100 * 1000, offset = 5 * 100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {-17, 128}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary4(redeclare package Medium= fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-10, 99}, extent = {{9, -9}, {-9, 9}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction8(redeclare package Medium= fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary5(redeclare package Medium= fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {60, 103}, extent = {{9, -9}, {-9, 9}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction9(redeclare package Medium= fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {60, 74}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc41(duration = 1, height = -1 * 100 * 1000, offset = 10 * 100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {53, 132}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume5(redeclare package Medium= fluid1, V = volStd, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-166, -124}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction10(redeclare package Medium= fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-132, -124}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
equation
  connect(ramp_p_bc.y, boundary.p_in) annotation(
    Line(points = {{-73.6, 100}, {-83.6, 100}}, color = {0, 0, 127}));
  connect(ramp_p_bc1.y, boundary1.p_in) annotation(
    Line(points = {{-178.4, 91}, {-166.4, 91}}, color = {0, 0, 127}));
  connect(restriction.port_a, boundary1.ports[1]) annotation(
    Line(points = {{-130, 56}, {-130, 84}, {-146, 84}}, color = {0, 127, 255}));
  connect(restriction.port_b, volume1.ports[1]) annotation(
    Line(points = {{-130, 40}, {-130, 16}}, color = {0, 127, 255}));
  connect(restriction1.port_b, boundary.ports[1]) annotation(
    Line(points = {{-104, 60}, {-104, 93}}, color = {0, 127, 255}));
  connect(volume1.ports[2], restriction1.port_a) annotation(
    Line(points = {{-130, 16}, {-104, 16}, {-104, 44}}, color = {0, 127, 255}));
  connect(restriction2.port_a, volume1.ports[3]) annotation(
    Line(points = {{-112, -8}, {-130, -8}, {-130, 16}}, color = {0, 127, 255}));
  connect(restriction2.port_b, volume.ports[1]) annotation(
    Line(points = {{-96, -8}, {-73, -8}, {-73, -32}}, color = {0, 127, 255}));
  connect(restriction4.port_a, volume.ports[2]) annotation(
    Line(points = {{-48, -32}, {-73, -32}}, color = {0, 127, 255}));
  connect(restriction4.port_b, volume3.ports[1]) annotation(
    Line(points = {{-32, -32}, {-10, -32}}, color = {0, 127, 255}));
  connect(restriction3.port_a, volume.ports[3]) annotation(
    Line(points = {{-84, -50}, {-73, -50}, {-73, -32}}, color = {0, 127, 255}));
  connect(restriction3.port_b, volume2.ports[1]) annotation(
    Line(points = {{-100, -50}, {-171, -50}}, color = {0, 127, 255}));
  connect(restriction5.port_a, volume2.ports[2]) annotation(
    Line(points = {{-204, -76}, {-204, -50}, {-171, -50}}, color = {0, 127, 255}));
  connect(restriction6.port_a, volume3.ports[2]) annotation(
    Line(points = {{18, -32}, {-10, -32}}, color = {0, 127, 255}));
  connect(restriction6.port_b, volume4.ports[1]) annotation(
    Line(points = {{34, -32}, {60, -32}}, color = {0, 127, 255}));
  connect(ramp_p_bc2.y, boundary2.p_in) annotation(
    Line(points = {{-69.6, -117}, {-79.6, -117}}, color = {0, 0, 127}));
  connect(restriction7.port_a, volume4.ports[2]) annotation(
    Line(points = {{86, -32}, {60, -32}}, color = {0, 127, 255}));
  connect(restriction7.port_b, boundary3.ports[1]) annotation(
    Line(points = {{102, -32}, {124, -32}}, color = {0, 127, 255}));
  connect(ramp_p_bc3.y, boundary3.p_in) annotation(
    Line(points = {{156.4, -25}, {144.4, -25}}, color = {0, 0, 127}));
  connect(ramp_p_bc4.y, boundary4.p_in) annotation(
    Line(points = {{-17, 121.4}, {-17, 109.4}}, color = {0, 0, 127}));
  connect(restriction8.port_a, boundary4.ports[1]) annotation(
    Line(points = {{-10, 78}, {-10, 90}}, color = {0, 127, 255}));
  connect(restriction8.port_b, volume3.ports[3]) annotation(
    Line(points = {{-10, 62}, {-10, -32}}, color = {0, 127, 255}));
  connect(ramp_p_bc41.y, boundary5.p_in) annotation(
    Line(points = {{53, 125.4}, {53, 114.4}}, color = {0, 0, 127}));
  connect(restriction9.port_a, boundary5.ports[1]) annotation(
    Line(points = {{60, 82}, {60, 94}}, color = {0, 127, 255}));
  connect(restriction9.port_b, volume4.ports[3]) annotation(
    Line(points = {{60, 66}, {60, -32}}, color = {0, 127, 255}));
  connect(restriction5.port_b, volume5.ports[1]) annotation(
    Line(points = {{-204, -92}, {-204, -124}, {-173, -124}}, color = {0, 127, 255}));
  connect(restriction10.port_a, volume5.ports[2]) annotation(
    Line(points = {{-140, -124}, {-173, -124}}, color = {0, 127, 255}));
  connect(restriction10.port_b, boundary2.ports[1]) annotation(
    Line(points = {{-124, -124}, {-100, -124}}, color = {0, 127, 255}));

annotation(
    Diagram(coordinateSystem(extent = {{-240, -200}, {200, 200}})));
end ComplexFlowNetwork_03_v01_temp01;
