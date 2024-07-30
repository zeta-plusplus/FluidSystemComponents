within FluidSystemComponents.Compressible.Examples.Temp;

model FluidGridNW_ex01_v001
  extends Modelica.Icons.Example;
  //-------------------------
  import units = Modelica.Units.SI;
  //-------------------------
  parameter units.Volume volStd = 0.1;
  parameter Modelica.Units.SI.Pressure pContourMin = 0*1000 "";
  parameter Modelica.Units.SI.Pressure pContourMax = 1200*1000 "";
  parameter units.MassFlowRate m_flow_Min = 0.0001;
  parameter units.MassFlowRate m_flow_Max = 0.1;
  parameter Real arrowMassFlowMin = 0.01;
  parameter Real arrowMassFlowMax = 30;
  //-------------------------
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium= fluid1,
  //-------------------------
  inner Modelica.Fluid.System system(T_ambient(displayUnit = "K") = 288.15, T_start(displayUnit = "K") = 288.15, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 0, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_ambient = 100*1000, p_start = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {-340, 526}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_0_1(duration = 10, height = 700*1000, offset = 100*1000, startTime = 25) annotation(
    Placement(transformation(origin = {-250, 190}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_0_1(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {-250, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Compressible.Components.NozzleFlowEquation03 rst_0_1_to_1_1(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.01^2) annotation(
    Placement(transformation(origin = {-220, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Compressible.Components.NozzleFlowEquation03 rst_0_2_to_1_2(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.02^2) annotation(
    Placement(transformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_0_2(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {-130, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p_0_2(duration = 10, height = 200*1000, offset = 100*1000, startTime = 20) annotation(
    Placement(transformation(origin = {-130, 190}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Compressible.Components.NozzleFlowEquation03 rst_1_1_to_1_2(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.02^2) annotation(
    Placement(transformation(origin = {-170, 30}, extent = {{-10, -10}, {10, 10}})));
  Compressible.Components.NozzleFlowEquation03 rst_0_3_to_1_3(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.005^2) annotation(
    Placement(transformation(origin = {10, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_0_3(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {-20, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p_0_3(duration = 10, height = -50*1000, offset = 100*1000, startTime = 15) annotation(
    Placement(transformation(origin = {-20, 190}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Compressible.Components.NozzleFlowEquation03 rst_1_2_to_1_3(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.015^2) annotation(
    Placement(transformation(origin = {-60, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_1_0(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {-358, 38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_p_1_0(duration = 10, height = 1000*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(transformation(origin = {-390, 38}, extent = {{-10, -10}, {10, 10}})));
  Compressible.Components.NozzleFlowEquation03 rst_1_0_to_1_1(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.002^2) annotation(
    Placement(transformation(origin = {-284, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_1_6(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {360, 38}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Modelica.Blocks.Sources.Ramp ramp_p_1_6(duration = 10, height = 600*1000, offset = 100*1000, startTime = 20) annotation(
    Placement(transformation(origin = {390, 38}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Compressible.Components.NozzleFlowEquation03 rst_1_3_to_1_4(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.002^2) annotation(
    Placement(transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}})));
  InteractiveSimulation.System.getCPUclock CPUtime annotation(
    Placement(transformation(origin = {-266, 222}, extent = {{-10, -10}, {10, 10}})));
  InteractiveSimulation.System.terminateByCPUtimer terminateByCPUtimer annotation(
    Placement(transformation(origin = {-238, 238}, extent = {{-10, -10}, {10, 10}})));
  Sensor.MonitorMassFlow00 m_flow_1_0_to_1_1(thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-259.667, 30}, extent = {{-10.3333, -5}, {10.3333, 5}})));
  Sensor.MonitorMassFlow00 m_flow_1_1_to_1_2(redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {-139.667, 30}, extent = {{-10.3333, -6}, {10.3333, 6}})));
  Sensor.MonitorMassFlow00 m_flow_1_2_to_1_3(redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {-29.667, 30}, extent = {{-10.3333, -5}, {10.3333, 5}})));
  Sensor.MonitorMassFlow00 m_flow_1_3_to_1_4(redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {78.333, 30}, extent = {{-10.3333, -5}, {10.3333, 5}})));
  Sensor.MonitorMassFlow00 m_flow_0_1_to_1_1(redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {-219.667, 70}, extent = {{-10.3333, -6}, {10.3333, 6}}, rotation = -90)));
  Sensor.MonitorMassFlow00 m_flow_0_2_to_1_2(redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {-99.667, 70}, extent = {{-10.3333, -6}, {10.3333, 6}}, rotation = -90)));
  Sensor.MonitorMassFlow00 m_flow_0_3_to_1_3(redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {10.333, 70}, extent = {{-10.3333, -6}, {10.3333, 6}}, rotation = -90)));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_1_1(nPorts = 3, redeclare package Medium = fluid1, use_portsData = false, V = volStd, sigDigits = 4, valMin = pContourMin, valMax = pContourMax) annotation(
    Placement(transformation(origin = {-220, 30}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_1_2(redeclare package Medium = fluid1, V = volStd, nPorts = 3, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-100, 30}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_1_3(redeclare package Medium = fluid1, V = volStd, nPorts = 3, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary_1_0(nPorts = 1, redeclare package Medium = fluid1, use_p_in = true, sigDigits = 4, valMin = pContourMin, valMax = pContourMax, T = 700) annotation(
    Placement(transformation(origin = {-320, 30}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary_1_6(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {320, 30}, extent = {{10, -10}, {-10, 10}})));
  Sources.Boundary_pT_colorP boundary_0_1(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-230, 130}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary_0_2(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-110, 130}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary_0_3(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {0, 130}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_1_4(redeclare package Medium = fluid1, V = volStd, nPorts = 3, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {110, 30}, extent = {{-10, -10}, {10, 10}})));
  Sensor.MonitorMassFlow00 m_flow_0_4_to_1_4(redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {110.333, 70}, extent = {{-10.3333, -6}, {10.3333, 6}}, rotation = -90)));
  Components.NozzleFlowEquation03 rst_0_4_to_1_4(AmechTot_par = Modelica.Constants.pi/4*0.005^2, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {110, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Sources.Boundary_pT_colorP boundary_0_4(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {100, 130}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_p_0_4(duration = 10, height = -10*1000, offset = 100*1000, startTime = 15) annotation(
    Placement(transformation(origin = {80, 190}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_0_4(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {80, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_1_5(redeclare package Medium = fluid1, V = volStd, nPorts = 3, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {210, 30}, extent = {{-10, -10}, {10, 10}})));
  Components.NozzleFlowEquation03 rst_1_4_to_1_5(AmechTot_par = Modelica.Constants.pi/4*0.01^2, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {144, 30}, extent = {{-10, -10}, {10, 10}})));
  Sensor.MonitorMassFlow00 m_flow_1_4_to_1_5(redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {174.333, 30}, extent = {{-10.3333, -5}, {10.3333, 5}})));
  Modelica.Blocks.Sources.Ramp ramp_p_0_5(duration = 10, height = 200*1000, offset = 100*1000, startTime = 15) annotation(
    Placement(transformation(origin = {180, 190}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_0_5(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {180, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Sources.Boundary_pT_colorP boundary_0_5(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {200, 130}, extent = {{-10, -10}, {10, 10}})));
  Components.NozzleFlowEquation03 rst_1_5_to_1_6(AmechTot_par = Modelica.Constants.pi/4*0.01^2, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {250, 30}, extent = {{-10, -10}, {10, 10}})));
  Sensor.MonitorMassFlow00 m_flow_1_5_to_1_6(redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {280.333, 30}, extent = {{-10.3333, -5}, {10.3333, 5}})));
  Components.NozzleFlowEquation03 rst_0_5_to_1_5(AmechTot_par = Modelica.Constants.pi/4*0.01^2, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {210, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Sensor.MonitorMassFlow00 m_flow_0_5_to_0_6(redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {210.333, 70}, extent = {{-10.3333, -6}, {10.3333, 6}}, rotation = -90)));
equation
  connect(ramp_p_0_1.y, firstOrder_p_0_1.u) annotation(
    Line(points = {{-250, 179}, {-250, 171}}, color = {0, 0, 127}));
  connect(ramp_p_0_2.y, firstOrder_p_0_2.u) annotation(
    Line(points = {{-130, 179}, {-130, 171}}, color = {0, 0, 127}));
  connect(ramp_p_0_3.y, firstOrder_p_0_3.u) annotation(
    Line(points = {{-20, 179}, {-20, 171}}, color = {0, 0, 127}));
  connect(ramp_p_1_0.y, firstOrder_p_1_0.u) annotation(
    Line(points = {{-379, 38}, {-370, 38}}, color = {0, 0, 127}));
  connect(ramp_p_1_6.y, firstOrder_p_1_6.u) annotation(
    Line(points = {{379, 38}, {372, 38}}, color = {0, 0, 127}));
  connect(rst_1_0_to_1_1.port_b, m_flow_1_0_to_1_1.port_a) annotation(
    Line(points = {{-274, 30}, {-270, 30}}, color = {0, 127, 255}));
  connect(rst_1_1_to_1_2.port_b, m_flow_1_1_to_1_2.port_a) annotation(
    Line(points = {{-160, 30}, {-150, 30}}, color = {0, 127, 255}));
  connect(rst_1_2_to_1_3.port_b, m_flow_1_2_to_1_3.port_a) annotation(
    Line(points = {{-50, 30}, {-40, 30}}, color = {0, 127, 255}));
  connect(rst_1_3_to_1_4.port_b, m_flow_1_3_to_1_4.port_a) annotation(
    Line(points = {{60, 30}, {68, 30}}, color = {0, 127, 255}));
  connect(rst_0_1_to_1_1.port_b, m_flow_0_1_to_1_1.port_a) annotation(
    Line(points = {{-220, 90}, {-220, 80}}, color = {0, 127, 255}));
  connect(rst_0_2_to_1_2.port_b, m_flow_0_2_to_1_2.port_a) annotation(
    Line(points = {{-100, 90}, {-100, 80}}, color = {0, 127, 255}));
  connect(rst_0_3_to_1_3.port_b, m_flow_0_3_to_1_3.port_a) annotation(
    Line(points = {{10, 90}, {10, 80}}, color = {0, 127, 255}));
  connect(m_flow_1_0_to_1_1.port_b, vol_1_1.ports[1]) annotation(
    Line(points = {{-249, 30}, {-219.334, 30}, {-219.334, 20}}, color = {0, 127, 255}));
  connect(m_flow_0_1_to_1_1.port_b, vol_1_1.ports[2]) annotation(
    Line(points = {{-219.667, 59.6667}, {-219.667, 19.6667}}, color = {0, 127, 255}));
  connect(rst_1_1_to_1_2.port_a, vol_1_1.ports[3]) annotation(
    Line(points = {{-180, 30}, {-220, 30}, {-220, 20}}, color = {0, 127, 255}));
  connect(m_flow_1_1_to_1_2.port_b, vol_1_2.ports[1]) annotation(
    Line(points = {{-129, 30}, {-99.3322, 30}, {-99.3322, 20}}, color = {0, 127, 255}));
  connect(m_flow_0_2_to_1_2.port_b, vol_1_2.ports[2]) annotation(
    Line(points = {{-99.667, 59.6667}, {-99.667, 19.6667}}, color = {0, 127, 255}));
  connect(rst_1_2_to_1_3.port_a, vol_1_2.ports[3]) annotation(
    Line(points = {{-70, 30}, {-100, 30}, {-100, 20}}, color = {0, 127, 255}));
  connect(m_flow_1_2_to_1_3.port_b, vol_1_3.ports[1]) annotation(
    Line(points = {{-19, 30}, {10.666, 30}, {10.666, 20}}, color = {0, 127, 255}));
  connect(m_flow_0_3_to_1_3.port_b, vol_1_3.ports[2]) annotation(
    Line(points = {{10.333, 59.6667}, {10.333, 19.6667}}, color = {0, 127, 255}));
  connect(rst_1_3_to_1_4.port_a, vol_1_3.ports[3]) annotation(
    Line(points = {{40, 30}, {10, 30}, {10, 20}}, color = {0, 127, 255}));
  connect(boundary_1_0.ports[1], rst_1_0_to_1_1.port_a) annotation(
    Line(points = {{-310, 30}, {-294, 30}}, color = {0, 127, 255}));
  connect(firstOrder_p_1_0.y, boundary_1_0.p_in) annotation(
    Line(points = {{-347, 38}, {-332, 38}}, color = {0, 0, 127}));
  connect(boundary_1_6.p_in, firstOrder_p_1_6.y) annotation(
    Line(points = {{332, 38}, {349, 38}}, color = {0, 0, 127}));
  connect(boundary_0_1.ports[1], rst_0_1_to_1_1.port_a) annotation(
    Line(points = {{-220, 130}, {-220, 110}}, color = {0, 127, 255}));
  connect(firstOrder_p_0_1.y, boundary_0_1.p_in) annotation(
    Line(points = {{-250, 149}, {-250, 138}, {-242, 138}}, color = {0, 0, 127}));
  connect(boundary_0_2.ports[1], rst_0_2_to_1_2.port_a) annotation(
    Line(points = {{-100, 130}, {-100, 110}}, color = {0, 127, 255}));
  connect(firstOrder_p_0_2.y, boundary_0_2.p_in) annotation(
    Line(points = {{-130, 149}, {-130, 137}, {-122, 137}}, color = {0, 0, 127}));
  connect(boundary_0_3.ports[1], rst_0_3_to_1_3.port_a) annotation(
    Line(points = {{10, 130}, {10, 110}}, color = {0, 127, 255}));
  connect(firstOrder_p_0_3.y, boundary_0_3.p_in) annotation(
    Line(points = {{-20, 149}, {-20, 137}, {-12, 137}}, color = {0, 0, 127}));
  connect(m_flow_1_3_to_1_4.port_b, vol_1_4.ports[1]) annotation(
    Line(points = {{89, 30}, {110.666, 30}, {110.666, 20}}, color = {0, 127, 255}));
  connect(boundary_0_4.ports[1], rst_0_4_to_1_4.port_a) annotation(
    Line(points = {{110, 130}, {110, 110}}, color = {0, 127, 255}));
  connect(rst_0_4_to_1_4.port_b, m_flow_0_4_to_1_4.port_a) annotation(
    Line(points = {{110, 90}, {110, 80}}, color = {0, 127, 255}));
  connect(m_flow_0_4_to_1_4.port_b, vol_1_4.ports[2]) annotation(
    Line(points = {{110.333, 59.6667}, {110.333, 19.6667}}, color = {0, 127, 255}));
  connect(ramp_p_0_4.y, firstOrder_p_0_4.u) annotation(
    Line(points = {{80, 179}, {80, 171}}, color = {0, 0, 127}));
  connect(firstOrder_p_0_4.y, boundary_0_4.p_in) annotation(
    Line(points = {{80, 149}, {80, 137}, {88, 137}}, color = {0, 0, 127}));
  connect(ramp_p_0_5.y, firstOrder_p_0_5.u) annotation(
    Line(points = {{180, 179}, {180, 171}}, color = {0, 0, 127}));
  connect(firstOrder_p_0_5.y, boundary_0_5.p_in) annotation(
    Line(points = {{180, 149}, {180, 137}, {188, 137}}, color = {0, 0, 127}));
  connect(rst_1_4_to_1_5.port_a, vol_1_4.ports[3]) annotation(
    Line(points = {{134, 30}, {110, 30}, {110, 20}}, color = {0, 127, 255}));
  connect(rst_1_4_to_1_5.port_b, m_flow_1_4_to_1_5.port_a) annotation(
    Line(points = {{154, 30}, {164, 30}}, color = {0, 127, 255}));
  connect(m_flow_1_4_to_1_5.port_b, vol_1_5.ports[1]) annotation(
    Line(points = {{185, 30}, {210.666, 30}, {210.666, 20}}, color = {0, 127, 255}));
  connect(rst_1_5_to_1_6.port_a, vol_1_5.ports[2]) annotation(
    Line(points = {{240, 30}, {210, 30}, {210, 20}}, color = {0, 127, 255}));
  connect(rst_1_5_to_1_6.port_b, m_flow_1_5_to_1_6.port_a) annotation(
    Line(points = {{260, 30}, {270, 30}}, color = {0, 127, 255}));
  connect(m_flow_1_5_to_1_6.port_b, boundary_1_6.ports[1]) annotation(
    Line(points = {{290.666, 30}, {309.666, 30}}, color = {0, 127, 255}));
  connect(boundary_0_5.ports[1], rst_0_5_to_1_5.port_a) annotation(
    Line(points = {{210, 130}, {210, 110}}, color = {0, 127, 255}));
  connect(rst_0_5_to_1_5.port_b, m_flow_0_5_to_0_6.port_a) annotation(
    Line(points = {{210, 90}, {210, 80}}, color = {0, 127, 255}));
  connect(m_flow_0_5_to_0_6.port_b, vol_1_5.ports[3]) annotation(
    Line(points = {{210, 60}, {210, 20}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-400, -260}, {400, 260}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01),
    Icon(coordinateSystem(extent = {{-300, -260}, {300, 260}})));
end FluidGridNW_ex01_v001;
