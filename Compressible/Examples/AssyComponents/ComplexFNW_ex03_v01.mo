within FluidSystemComponents.Compressible.Examples.AssyComponents;

model ComplexFNW_ex03_v01
  //-------------------------
  import units = Modelica.SIunits;
  //-------------------------
  parameter units.Volume volStd = 0.1;
  //-------------------------
  replaceable package fluid1 = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  //redeclare package Medium= fluid1,
  //-------------------------
  inner Modelica.Fluid.System system(T_start(displayUnit = "K") = 288.15, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 0, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_start =  100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-74, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-95, 93}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc(duration = 1, height = 2.5 * 100 * 1000 - 100 * 1000, offset =  100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {-53, 100}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc1(duration = 1, height = 2.0 * 100 * 1000 - 100 * 1000, offset =  100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {-199, 91}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-155, 84}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-73, -25}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-130, 23}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-130, 48}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction1(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-104, 52}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction2(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-104, -8}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = fluid1, V = volStd, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-164, -50}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction3(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-92, -50}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume3(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-10, -25}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction4(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-40, -32}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction5(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-204, -84}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction6(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {26, -32}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume4(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {60, -25}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction7(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {94, -32}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc4(duration = 1, height = 2.6 * 100 * 1000 - 100 * 1000, offset =  100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {-17, 146}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary4(redeclare package Medium = fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-10, 99}, extent = {{9, -9}, {-9, 9}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction8(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary5(redeclare package Medium = fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {60, 103}, extent = {{9, -9}, {-9, 9}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction9(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {60, 74}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc41(duration = 1, height = 2.8 * 100 * 1000 - 100 * 1000, offset =  100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {53, 146}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume5(redeclare package Medium = fluid1, V = volStd, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-166, -124}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction10(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-132, -124}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_3(redeclare package Medium= fluid1) annotation(
    Placement(visible = true, transformation(origin = {196, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_2(redeclare package Medium= fluid1) annotation(
    Placement(visible = true, transformation(origin = {-100, -198}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-20, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-180, 91}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-72, 100}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder4(T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-17, 125}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder5(T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {53, 127}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
equation
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
  connect(restriction7.port_a, volume4.ports[2]) annotation(
    Line(points = {{86, -32}, {60, -32}}, color = {0, 127, 255}));
  connect(restriction8.port_a, boundary4.ports[1]) annotation(
    Line(points = {{-10, 78}, {-10, 90}}, color = {0, 127, 255}));
  connect(restriction8.port_b, volume3.ports[3]) annotation(
    Line(points = {{-10, 62}, {-10, -32}}, color = {0, 127, 255}));
  connect(restriction9.port_a, boundary5.ports[1]) annotation(
    Line(points = {{60, 82}, {60, 94}}, color = {0, 127, 255}));
  connect(restriction9.port_b, volume4.ports[3]) annotation(
    Line(points = {{60, 66}, {60, -32}}, color = {0, 127, 255}));
  connect(restriction5.port_b, volume5.ports[1]) annotation(
    Line(points = {{-204, -92}, {-204, -124}, {-173, -124}}, color = {0, 127, 255}));
  connect(restriction10.port_a, volume5.ports[2]) annotation(
    Line(points = {{-140, -124}, {-173, -124}}, color = {0, 127, 255}));
  connect(restriction7.port_b, port_3) annotation(
    Line(points = {{102, -32}, {196, -32}}, color = {0, 127, 255}));
  connect(restriction10.port_b, port_2) annotation(
    Line(points = {{-124, -124}, {-100, -124}, {-100, -198}}, color = {0, 127, 255}));
  connect(ramp_p_bc1.y, firstOrder1.u) annotation(
    Line(points = {{-192, 91}, {-187, 91}}, color = {0, 0, 127}));
  connect(firstOrder1.y, boundary1.p_in) annotation(
    Line(points = {{-173, 91}, {-166, 91}}, color = {0, 0, 127}));
  connect(boundary.p_in, firstOrder.y) annotation(
    Line(points = {{-84, 100}, {-78, 100}}, color = {0, 0, 127}));
  connect(firstOrder.u, ramp_p_bc.y) annotation(
    Line(points = {{-64, 100}, {-60, 100}}, color = {0, 0, 127}));
  connect(firstOrder4.u, ramp_p_bc4.y) annotation(
    Line(points = {{-17, 132}, {-17, 139}}, color = {0, 0, 127}));
  connect(firstOrder4.y, boundary4.p_in) annotation(
    Line(points = {{-17, 118}, {-17, 110}}, color = {0, 0, 127}));
  connect(ramp_p_bc41.y, firstOrder5.u) annotation(
    Line(points = {{53, 139}, {53, 134}}, color = {0, 0, 127}));
  connect(firstOrder5.y, boundary5.p_in) annotation(
    Line(points = {{53, 120}, {53, 114}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-240, -200}, {200, 200}})));
end ComplexFNW_ex03_v01;
