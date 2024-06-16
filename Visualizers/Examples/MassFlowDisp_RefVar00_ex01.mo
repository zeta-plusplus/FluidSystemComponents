within FluidSystemComponents.Visualizers.Examples;

model MassFlowDisp_RefVar00_ex01
  extends Modelica.Icons.Example;
  //-----
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //package fluid1 = FluidSystemComponents.Media.Mixture_N2O2;
  //-----
  parameter Modelica.Units.SI.MassFlowRate val_m_flow_test = 0.2;
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {-62, 86}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(nPorts = 1, p = 200*1000, T = 288.15, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-74, 26}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary1(nPorts = 3, p = 100*1000, T = 288.15, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {80, 26}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = fluid1, diameter = 0.01, zeta = 1) annotation(
    Placement(transformation(origin = {-42, 26}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary11(nPorts = 1, p = 100*1000, T = 288.15, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {70, -20}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Fluid.Vessels.ClosedVolume volume(nPorts = 5, redeclare package Medium = fluid1, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_start = 100*1000, T_start = 288.15, use_portsData = false, V = 0.001) annotation(
    Placement(transformation(origin = {-12, 26}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice1(redeclare package Medium = fluid1, diameter = 0.01, zeta = 1) annotation(
    Placement(transformation(origin = {28, 26}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice2(redeclare package Medium = fluid1, diameter = 0.005, zeta = 1) annotation(
    Placement(transformation(origin = {22, -20}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.Visualizers.MassFlowDisp_RefVar00 m_flow_orifice1(redeclare package Medium = fluid1, m_flow_ref = orifice1.m_flow) annotation(
    Placement(transformation(origin = {26, 52}, extent = {{-10, -7}, {10, 7}})));
  FluidSystemComponents.Visualizers.MassFlowDisp_RefVar00 m_flow_par_test(redeclare package Medium = fluid1, m_flow_ref = val_m_flow_test) annotation(
    Placement(transformation(origin = {26, 70}, extent = {{-10, -7}, {10, 7}})));
equation
  connect(boundary.ports[1], orifice.port_a) annotation(
    Line(points = {{-64, 26}, {-52, 26}}, color = {0, 127, 255}));
  connect(orifice.port_b, volume.ports[1]) annotation(
    Line(points = {{-32, 26}, {-22, 26}}, color = {0, 127, 255}));
  connect(volume.ports[2], orifice1.port_a) annotation(
    Line(points = {{-22, 26}, {18, 26}}, color = {0, 127, 255}));
  connect(orifice1.port_b, boundary1.ports[1]) annotation(
    Line(points = {{38, 26}, {70, 26}}, color = {0, 127, 255}));
  connect(orifice2.port_b, boundary11.ports[1]) annotation(
    Line(points = {{32, -20}, {60, -20}}, color = {0, 127, 255}));
  connect(orifice2.port_a, volume.ports[3]) annotation(
    Line(points = {{12, -20}, {-22, -20}, {-22, 26}}, color = {0, 127, 255}));
  connect(volume.ports[4], m_flow_orifice1.port_a) annotation(
    Line(points = {{-22, 26}, {8, 26}, {8, 52}, {16, 52}}, color = {0, 127, 255}));
  connect(m_flow_orifice1.port_b, boundary1.ports[2]) annotation(
    Line(points = {{36, 52}, {64, 52}, {64, 26}, {70, 26}}, color = {0, 127, 255}));
  connect(volume.ports[5], m_flow_par_test.port_a) annotation(
    Line(points = {{-22, 26}, {8, 26}, {8, 70}, {16, 70}}, color = {0, 127, 255}));
  connect(boundary1.ports[3], m_flow_par_test.port_b) annotation(
    Line(points = {{70, 26}, {64, 26}, {64, 70}, {36, 70}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.01));
end MassFlowDisp_RefVar00_ex01;
