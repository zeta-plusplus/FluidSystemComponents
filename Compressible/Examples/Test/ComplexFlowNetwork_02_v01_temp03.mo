within FluidSystemComponents.Compressible.Examples.Test;

model ComplexFlowNetwork_02_v01_temp03
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
  Modelica.Blocks.Sources.Ramp ramp_p_bc(duration = 1, height = 2 * 100 * 1000, offset = 30 * 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-202, 170}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc1(duration = 1, height = 2 * 100 * 1000, offset = 28 * 100 * 1000, startTime = 13) annotation(
    Placement(visible = true, transformation(origin = {-128, 164}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc2(duration = 1, height = -1 * 100 * 1000, offset = 10 * 100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {102, 166}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume5(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {24, 73}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-174, 68}, extent = {{-4, 4}, {4, -4}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 6)  annotation(
    Placement(visible = true, transformation(origin = {-170, 58}, extent = {{-7, -4}, {7, 4}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-138, -16}, extent = {{-4, 4}, {4, -4}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-132, -24}, extent = {{-7, -4}, {7, 4}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2)  annotation(
    Placement(visible = true, transformation(origin = {-164, 110}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction1(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.005 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-164, 20}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction2(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-100, -14}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction3(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-40, -14}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction4(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-66, 30}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction5(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-84, 116}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction6(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.001 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-56, 68}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction7(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {24, 106}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction8(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.005 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {54, 74}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction9(redeclare package Medium = fluid1,AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {24, 20}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
equation
  connect(ramp_p_bc.y, boundary.p_in) annotation(
    Line(points = {{-195, 170}, {-186, 170}}, color = {0, 0, 127}));
  connect(ramp_p_bc1.y, boundary1.p_in) annotation(
    Line(points = {{-121, 164}, {-111.4, 164}}, color = {0, 0, 127}));
  connect(boundary2.p_in, ramp_p_bc2.y) annotation(
    Line(points = {{86, 158}, {91, 158}, {91, 166}, {95, 166}}, color = {0, 0, 127}));
  connect(p.port, volume.ports[1]) annotation(
    Line(points = {{-174, 64}, {-169, 64}, {-169, 66}, {-164, 66}}, color = {0, 127, 255}));
  connect(p.p, realValue.numberPort) annotation(
    Line(points = {{-178.4, 68}, {-178.4, 58}}, color = {0, 0, 127}));
  connect(p1.port, volume1.ports[1]) annotation(
    Line(points = {{-138, -20}, {-132, -20}, {-132, -14}}, color = {0, 127, 255}));
  connect(p1.p, realValue1.numberPort) annotation(
    Line(points = {{-142.4, -16}, {-144.4, -16}, {-144.4, -24}, {-140.4, -24}}, color = {0, 0, 127}));
  connect(restriction.port_a, boundary.ports[1]) annotation(
    Line(points = {{-164, 118}, {-164, 162}}, color = {0, 127, 255}));
  connect(restriction.port_b, volume.ports[2]) annotation(
    Line(points = {{-164, 102}, {-164, 66}}, color = {0, 127, 255}));
  connect(restriction1.port_a, volume.ports[3]) annotation(
    Line(points = {{-164, 28}, {-164, 66}}, color = {0, 127, 255}));
  connect(restriction1.port_b, volume1.ports[2]) annotation(
    Line(points = {{-164, 12}, {-164, -14}, {-132, -14}}, color = {0, 127, 255}));
  connect(restriction2.port_b, volume2.ports[1]) annotation(
    Line(points = {{-92, -14}, {-72, -14}}, color = {0, 127, 255}));
  connect(restriction2.port_a, volume1.ports[3]) annotation(
    Line(points = {{-108, -14}, {-132, -14}}, color = {0, 127, 255}));
  connect(restriction3.port_a, volume2.ports[2]) annotation(
    Line(points = {{-48, -14}, {-72, -14}}, color = {0, 127, 255}));
  connect(restriction3.port_b, volume3.ports[1]) annotation(
    Line(points = {{-32, -14}, {6, -14}, {6, -4}}, color = {0, 127, 255}));
  connect(restriction4.port_a, volume4.ports[1]) annotation(
    Line(points = {{-74, 30}, {-84, 30}, {-84, 68}}, color = {0, 127, 255}));
  connect(restriction4.port_b, volume3.ports[2]) annotation(
    Line(points = {{-58, 30}, {-18, 30}, {-18, -4}, {6, -4}}, color = {0, 127, 255}));
  connect(restriction5.port_b, volume4.ports[2]) annotation(
    Line(points = {{-84, 108}, {-84, 68}}, color = {0, 127, 255}));
  connect(restriction5.port_a, boundary1.ports[1]) annotation(
    Line(points = {{-84, 124}, {-84, 156}, {-90, 156}}, color = {0, 127, 255}));
  connect(restriction6.port_a, volume4.ports[3]) annotation(
    Line(points = {{-64, 68}, {-84, 68}}, color = {0, 127, 255}));
  connect(restriction6.port_b, volume5.ports[1]) annotation(
    Line(points = {{-48, 68}, {24, 68}}, color = {0, 127, 255}));
  connect(restriction7.port_a, volume5.ports[2]) annotation(
    Line(points = {{24, 98}, {24, 68}}, color = {0, 127, 255}));
  connect(restriction7.port_b, boundary2.ports[1]) annotation(
    Line(points = {{24, 114}, {24, 150}, {64, 150}}, color = {0, 127, 255}));
  connect(restriction8.port_b, boundary2.ports[2]) annotation(
    Line(points = {{54, 82}, {54, 150}, {64, 150}}, color = {0, 127, 255}));
  connect(restriction8.port_a, volume3.ports[3]) annotation(
    Line(points = {{54, 66}, {54, -4}, {6, -4}}, color = {0, 127, 255}));
  connect(volume3.ports[4], restriction9.port_a) annotation(
    Line(points = {{6, -4}, {24, -4}, {24, 12}}, color = {0, 127, 255}));
  connect(restriction9.port_b, volume5.ports[3]) annotation(
    Line(points = {{24, 28}, {24, 68}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,nonewInst -d=nonewInst -d=nonewInst -d=nonewInst -d=nonewInst",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end ComplexFlowNetwork_02_v01_temp03;
