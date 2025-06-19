within FluidSystemComponents.MSLfluidWithVisualization.Fittings.Examples;

model SimpleGenericOrifice_ex01
  extends Modelica.Icons.Example;
  //-----
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = fluid1
  //-----
  //--------------------
  import units = Modelica.Units.SI;
  //--------------------
  parameter units.Pressure pContourMin = 100*1000 "";
  parameter units.Pressure pContourMax = 1000*1000 "";
  parameter units.Pressure TcontourMin = 100*1000 "";
  parameter units.Pressure TcontourMax = 1000*1000 "";
  parameter units.MassFlowRate m_flow_arrow_Min = 0.0001;
  parameter units.MassFlowRate m_flow_arrow_Max = 0.1;
  parameter Real arrowMin = 0.01;
  parameter Real arrowMax = 30;
  parameter Integer sigDigit_p = 4;
  //--------------------
  Vessels.ClosedVolume volume(nPorts = 2, redeclare package Medium = fluid1, valMin = pContourMin, valMax = pContourMax, use_portsData = false, V = 0.001, sigDigits = sigDigit_p, switchUnitP = FluidSystemComponents.Visualizers.Types.SwitchUnitVisPressure.kPa) annotation(
    Placement(transformation(origin = {-18, 19}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary1(nPorts = 1, redeclare package Medium = fluid1, p = 1e5) annotation(
    Placement(transformation(origin = {84, 14}, extent = {{10, -10}, {-10, 10}})));
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {-80, 88}, extent = {{-10, -10}, {10, 10}})));
  SimpleGenericOrifice orifice(redeclare package Medium = fluid1, diameter = 0.05, zeta = 1, sigDigits = sigDigit_p, valMin = pContourMin, valMax = pContourMax)  annotation(
    Placement(transformation(origin = {14, 14}, extent = {{-14, -12}, {14, 12}})));
  FluidSystemComponents.MSLfluidWithVisualization.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, V = 0.001, nPorts = 2, sigDigits = sigDigit_p, use_portsData = false, valMax = pContourMax, valMin = pContourMin, switchUnitP = FluidSystemComponents.Visualizers.Types.SwitchUnitVisPressure.kPa) annotation(
    Placement(transformation(origin = {44, 19}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, nPorts = 1, p = 1e5, use_p_in = true) annotation(
    Placement(transformation(origin = {-44, 14}, extent = {{-10, -10}, {10, 10}}, rotation = -0)));
  Modelica.Blocks.Sources.TimeTable tT_p_boundary(table = [0, 100*1000; 1, 100*1000; 11, 1000*1000; 20, 1000*1000])  annotation(
    Placement(transformation(origin = {-82, 22}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(volume.ports[1], orifice.port_a) annotation(
    Line(points = {{-18, 14}, {2, 14}}, color = {0, 127, 255}));
  connect(orifice.port_b, volume1.ports[1]) annotation(
    Line(points = {{26, 14}, {44, 14}}, color = {0, 127, 255}));
  connect(volume1.ports[2], boundary1.ports[1]) annotation(
    Line(points = {{44, 14}, {74, 14}}, color = {0, 127, 255}));
  connect(boundary.ports[1], volume.ports[2]) annotation(
    Line(points = {{-34, 14}, {-18, 14}}, color = {0, 127, 255}));
  connect(tT_p_boundary.y, boundary.p_in) annotation(
    Line(points = {{-70, 22}, {-56, 22}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.01));
end SimpleGenericOrifice_ex01;
