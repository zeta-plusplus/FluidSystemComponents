within FluidSystemComponents.MSLfluidWithVisualization.Fittings.Examples;

model SimpleGenericOrifice_ex01
  extends Modelica.Icons.Example;
  //-----
  package fluid1 = Modelica.Media.Air.DryAirNasa(extraPropertiesNames = {"trace1"}, C_default = {0.0},C_nominal = {1e-6});
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
  parameter units.MassFlowRate m_flow_arrow_Max = 10;
  parameter Real arrowMin = 0.001;
  parameter Real arrowMax = 40;
  parameter Integer sigDigit_p = 4;
  parameter Integer sigDigit_m_flow = 4;
  //--------------------
  Vessels.ClosedVolume volume(nPorts = 2, redeclare package Medium = fluid1, valMin = pContourMin, valMax = pContourMax, use_portsData = false, V = 1, sigDigits = sigDigit_p, switchUnitP = FluidSystemComponents.Visualizers.Types.SwitchUnitVisPressure.kPa) annotation(
    Placement(transformation(origin = {-24, 56}, extent = {{-12, -12}, {12, 12}})));
  FluidSystemComponents.MSLfluidWithVisualization.Sources.Boundary_pT boundary1(nPorts = 1, redeclare package Medium = fluid1, p = 1e5, valMin = pContourMin, valMax = pContourMax, switchUnitP = FluidSystemComponents.Visualizers.Types.SwitchUnitVisPressure.kPa, sigDigits = sigDigit_p) annotation(
    Placement(transformation(origin = {92, 50}, extent = {{14, -14}, {-14, 14}})));
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {-80, 84}, extent = {{-10, -10}, {10, 10}})));
  SimpleGenericOrifice orifice(redeclare package Medium = fluid1, diameter = 0.05, zeta = 1, sigDigits = sigDigit_p, valMin = pContourMin, valMax = pContourMax, thickArrowMin = arrowMin, thickArrowMax = arrowMax, significantDigits_m_flow = sigDigit_m_flow, m_flow_Min = m_flow_arrow_Min, m_flow_Max = m_flow_arrow_Max) annotation(
    Placement(transformation(origin = {15, 50}, extent = {{-17, -12}, {17, 12}})));
  FluidSystemComponents.MSLfluidWithVisualization.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, V = 1, nPorts = 2, sigDigits = sigDigit_p, use_portsData = false, valMax = pContourMax, valMin = pContourMin, switchUnitP = FluidSystemComponents.Visualizers.Types.SwitchUnitVisPressure.kPa) annotation(
    Placement(transformation(origin = {54, 56}, extent = {{-12, -12}, {12, 12}})));
  FluidSystemComponents.MSLfluidWithVisualization.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, nPorts = 1, p = 1e5, use_p_in = true, use_C_in = true, valMin = pContourMin, valMax = pContourMax, switchUnitP = FluidSystemComponents.Visualizers.Types.SwitchUnitVisPressure.kPa) annotation(
    Placement(transformation(origin = {-63, 50}, extent = {{-13, -13}, {13, 13}})));
  Modelica.Blocks.Sources.TimeTable tT_p_boundary(table = [0, 100*1000; 1, 100*1000; 11, 1000*1000; 20, 1000*1000]) annotation(
    Placement(transformation(origin = {-102, 58}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.TimeTable tT_trc_boundary(table = [0, 0; 15, 0; 15, 0.1; 15.1, 0.1; 15.1, 0; 20, 0]) annotation(
    Placement(transformation(origin = {-100, 26}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sensors.TraceSubstancesTwoPort trc_boundary_out(redeclare package Medium = fluid1, substanceName = "trace1")  annotation(
    Placement(transformation(origin = {-41, 50}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Fluid.Sensors.TraceSubstancesTwoPort trc_volume_out(redeclare package Medium = fluid1, substanceName = "trace1") annotation(
    Placement(transformation(origin = {-7, 50}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Fluid.Sensors.TraceSubstancesTwoPort trc_orifice_out(redeclare package Medium = fluid1, substanceName = "trace1") annotation(
    Placement(transformation(origin = {37, 50}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Fluid.Sensors.TraceSubstancesTwoPort trc_volume1_out(redeclare package Medium = fluid1, substanceName = "trace1") annotation(
    Placement(transformation(origin = {71, 50}, extent = {{-3, -3}, {3, 3}})));
equation
  connect(tT_p_boundary.y, boundary.p_in) annotation(
    Line(points = {{-91, 58}, {-83, 58}, {-83, 55}, {-71, 55}}, color = {0, 0, 127}));
  connect(tT_trc_boundary.y, boundary.C_in[1]) annotation(
    Line(points = {{-89, 26}, {-85, 26}, {-85, 45}, {-71, 45}}, color = {0, 0, 127}));
  connect(boundary.ports[1], trc_boundary_out.port_a) annotation(
    Line(points = {{-56.5, 50}, {-44, 50}}, color = {0, 127, 255}));
  connect(trc_boundary_out.port_b, volume.ports[1]) annotation(
    Line(points = {{-38, 50}, {-24, 50}}, color = {0, 127, 255}));
  connect(trc_volume_out.port_a, volume.ports[2]) annotation(
    Line(points = {{-10, 50}, {-24, 50}}, color = {0, 127, 255}));
  connect(trc_volume_out.port_b, orifice.port_a) annotation(
    Line(points = {{-4, 50}, {1, 50}}, color = {0, 127, 255}));
  connect(orifice.port_b, trc_orifice_out.port_a) annotation(
    Line(points = {{29.1667, 50}, {33.1667, 50}}, color = {0, 127, 255}));
  connect(trc_orifice_out.port_b, volume1.ports[1]) annotation(
    Line(points = {{40, 50}, {54, 50}}, color = {0, 127, 255}));
  connect(volume1.ports[2], trc_volume1_out.port_a) annotation(
    Line(points = {{54, 50}, {68, 50}}, color = {0, 127, 255}));
  connect(trc_volume1_out.port_b, boundary1.ports[1]) annotation(
    Line(points = {{74, 50}, {85, 50}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.01),
    Diagram(coordinateSystem(extent = {{-120, 0}, {120, 100}})));
end SimpleGenericOrifice_ex01;
