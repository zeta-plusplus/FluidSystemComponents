within FluidSystemComponents.MSLfluidWithVisualization.Vessels.Examples;

model OpenTank_ex01
  extends Modelica.Icons.Example;
  //-----
  //package fluid1 = Modelica.Media.Air.DryAirNasa;
  package fluid1 = Modelica.Media.Water.StandardWater;
  //redeclare package Medium = fluid1
  //-----
  //--------------------
  import units = Modelica.Units.SI;
  //--------------------
  parameter units.Pressure pContourMin = 100*1000 "";
  parameter units.Pressure pContourMax = 500*1000 "";
  parameter units.Pressure TcontourMin = 100*1000 "";
  parameter units.Pressure TcontourMax = 1000*1000 "";
  parameter units.MassFlowRate m_flow_arrow_Min = 0.0001;
  parameter units.MassFlowRate m_flow_arrow_Max = 10;
  parameter Real arrowMin = 0.001;
  parameter Real arrowMax = 40;
  parameter Integer sigDigit_p = 4;
  parameter Integer sigDigit_m_flow = 4;
  //--------------------
  Vessels.ClosedVolume volume(nPorts = 2, redeclare package Medium = fluid1, valMin = pContourMin, valMax = pContourMax, use_portsData = false, V = 1, sigDigits = sigDigit_p, switchUnitP = FluidSystemComponents.Visualizers.Types.SwitchUnitVisPressure.kPa) annotation(
    Placement(transformation(origin = {-58, 55}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.MSLfluidWithVisualization.Sources.Boundary_pT boundary1(nPorts = 1, redeclare package Medium = fluid1, p = 1e5, valMin = pContourMin, valMax = pContourMax, switchUnitP = FluidSystemComponents.Visualizers.Types.SwitchUnitVisPressure.kPa, sigDigits = sigDigit_p) annotation(
    Placement(transformation(origin = {75, 34}, extent = {{13, -13}, {-13, 13}})));
  inner Modelica.Fluid.System system(p_ambient = 1e5, T_ambient = 288.15)  annotation(
    Placement(transformation(origin = {-84, 86}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.MSLfluidWithVisualization.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = fluid1, diameter = 0.01, zeta = 1, sigDigits = sigDigit_p, valMin = pContourMin, valMax = pContourMax, thickArrowMin = arrowMin, thickArrowMax = arrowMax, significantDigits_m_flow = sigDigit_m_flow, m_flow_Min = m_flow_arrow_Min, m_flow_Max = m_flow_arrow_Max) annotation(
    Placement(transformation(origin = {-34, 50}, extent = {{-12, -8}, {12, 8}})));
  FluidSystemComponents.MSLfluidWithVisualization.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, nPorts = 1, p = 1e5, use_p_in = true, use_C_in = false, valMin = pContourMin, valMax = pContourMax, switchUnitP = FluidSystemComponents.Visualizers.Types.SwitchUnitVisPressure.kPa) annotation(
    Placement(transformation(origin = {-80, 50}, extent = {{-11, -11}, {11, 11}})));
  Modelica.Blocks.Sources.TimeTable tT_p_boundary(table = [0, 200*1000; 0.001, 200*1000; 10, 500*1000; 20, 500*1000]) annotation(
    Placement(transformation(origin = {-104, 54}, extent = {{-8, -8}, {8, 8}})));
  OpenTank tank(nPorts = 2, height = 5, crossArea = 1, use_portsData = true, portsData(each diameter = 0.05, each height = 0), redeclare package Medium = fluid1, switchUnitP = FluidSystemComponents.Visualizers.Types.SwitchUnitVisPressure.kPa, sigDigits = sigDigit_p, valMin = pContourMin, valMax = pContourMax, p_ambient = 2e5)  annotation(
    Placement(transformation(origin = {5, 45}, extent = {{-21, -13}, {21, 13}})));
  FluidSystemComponents.MSLfluidWithVisualization.Fittings.SimpleGenericOrifice orifice1(redeclare package Medium = fluid1, diameter = 0.01, m_flow_Max = m_flow_arrow_Max, m_flow_Min = m_flow_arrow_Min, sigDigits = sigDigit_p, significantDigits_m_flow = sigDigit_m_flow, thickArrowMax = arrowMax, thickArrowMin = arrowMin, valMax = pContourMax, valMin = pContourMin, zeta = 1) annotation(
    Placement(transformation(origin = {44, 34}, extent = {{-12, -8}, {12, 8}})));
equation
  connect(tT_p_boundary.y, boundary.p_in) annotation(
    Line(points = {{-95, 54}, {-87, 54}}, color = {0, 0, 127}));
  connect(boundary.ports[1], volume.ports[1]) annotation(
    Line(points = {{-74.5, 50}, {-58.5, 50}}, color = {0, 127, 255}));
  connect(orifice.port_a, volume.ports[2]) annotation(
    Line(points = {{-44, 50}, {-58, 50}}, color = {0, 127, 255}));
  connect(orifice.port_b, tank.ports[1]) annotation(
    Line(points = {{-24, 50}, {-24, 34}, {5, 34}}, color = {0, 127, 255}));
  connect(orifice1.port_b, boundary1.ports[1]) annotation(
    Line(points = {{54, 34}, {68.5, 34}}, color = {0, 127, 255}));
  connect(tank.ports[2], orifice1.port_a) annotation(
    Line(points = {{5, 34}, {34, 34}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.01),
    Diagram(coordinateSystem(extent = {{-120, 0}, {120, 100}})));
  
end OpenTank_ex01;
