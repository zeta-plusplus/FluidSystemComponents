within FluidSystemComponents.Compressible.Examples.Temp;

model FluidGridNW_ex01_v001
  extends Modelica.Icons.Example;
  //-------------------------
  import units = Modelica.Units.SI;
  //-------------------------
  parameter units.Volume volStd = 0.1;
  parameter Modelica.Units.SI.Pressure pContourMin = 0*1000 "";
  parameter Modelica.Units.SI.Pressure pContourMax = 1500*1000 "";
  parameter units.MassFlowRate m_flow_Min = 0.0;
  parameter units.MassFlowRate m_flow_Max = 0.2;
  parameter Real arrowMassFlowMin = 0.01;
  parameter Real arrowMassFlowMax = 30;
  //-------------------------
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium= fluid1,
  //-------------------------
  
  //----------
  InteractiveSimulation.System.getCPUclock CPUtime annotation(
    Placement(transformation(origin = {-300, 240}, extent = {{-10, -10}, {10, 10}})));
  InteractiveSimulation.System.terminateByCPUtimer terminateByCPUtimer annotation(
    Placement(transformation(origin = {-270, 240}, extent = {{-10, -10}, {10, 10}})));
  
  //----------
  
  inner Modelica.Fluid.System system(T_ambient(displayUnit = "K") = 288.15, T_start(displayUnit = "K") = 288.15, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 0, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_ambient = 100*1000, p_start = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {-340, 526}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  //----------
  Modelica.Blocks.Sources.Ramp ramp_p_0_1(duration = 10, height = 700*1000, offset = 100*1000, startTime = 25) annotation(
    Placement(transformation(origin = {-240, 190}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p_0_2(duration = 10, height = 200*1000, offset = 100*1000, startTime = 20) annotation(
    Placement(transformation(origin = {-160, 190}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p_0_3(duration = 10, height = -50*1000, offset = 100*1000, startTime = 15) annotation(
    Placement(transformation(origin = {-80, 190}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p_1_0(duration = 10, height = 1000*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(transformation(origin = {-360, 58}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_p_1_6(duration = 10, height = 1100*1000, offset = 100*1000, startTime = 20) annotation(
    Placement(transformation(origin = {250, 58}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Modelica.Blocks.Sources.Ramp ramp_p_0_4(duration = 10, height = -10*1000, offset = 100*1000, startTime = 15) annotation(
    Placement(transformation(origin = {0, 190}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p_0_5(duration = 10, height = 200*1000, offset = 100*1000, startTime = 15) annotation(
    Placement(transformation(origin = {70, 190}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p_2_0(duration = 10, height = 1200*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(transformation(origin = {-360, -22}, extent = {{-10, -10}, {10, 10}})));
  
  
  //----------
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_0_3(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {-80, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_0_2(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {-160, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_0_1(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {-240, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_1_0(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {-328, 58}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_1_6(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {220, 58}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_0_4(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {0, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_0_5(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {70, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_2_0(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {-328, -22}, extent = {{-10, -10}, {10, 10}})));
  
  
  //----------
  Sources.Boundary_pT_colorP boundary_1_0(nPorts = 1, redeclare package Medium = fluid1, use_p_in = true, sigDigits = 4, valMin = pContourMin, valMax = pContourMax, T = 700) annotation(
    Placement(transformation(origin = {-290, 50}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary_1_6(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {180, 50}, extent = {{10, -10}, {-10, 10}})));
  Sources.Boundary_pT_colorP boundary_0_1(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-220, 130}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary_0_2(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-140, 130}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary_0_3(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-60, 130}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary_0_4(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {20, 130}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary_0_5(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {90, 130}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary_2_0(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-290, -30}, extent = {{-10, -10}, {10, 10}})));
  
  
  //----------
  CommonAnyFluid.Components.ClosedVolumeColorP vol_1_1(nPorts = 4, redeclare package Medium = fluid1, use_portsData = false, V = volStd, sigDigits = 4, valMin = pContourMin, valMax = pContourMax) annotation(
    Placement(transformation(origin = {-210, 50}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_1_2(redeclare package Medium = fluid1, V = volStd, nPorts = 3, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-130, 50}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_1_3(redeclare package Medium = fluid1, V = volStd, nPorts = 3, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_1_4(redeclare package Medium = fluid1, V = volStd, nPorts = 3, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_1_5(redeclare package Medium = fluid1, V = volStd, nPorts = 3, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {100, 50}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_2_1(redeclare package Medium = fluid1, V = volStd, nPorts = 2, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-210, -30}, extent = {{-10, -10}, {10, 10}})));
  
  
  //----------
  Compressible.Components.NozzleFlowEquation03 rst_1_0_to_1_1(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.002^2, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax) annotation(
    Placement(transformation(origin = {-250, 50}, extent = {{-10, -10}, {10, 10}})));
  Compressible.Components.NozzleFlowEquation03 rst_0_1_to_1_1(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.01^2, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {-210, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Compressible.Components.NozzleFlowEquation03 rst_0_2_to_1_2(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.05^2, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {-130, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Compressible.Components.NozzleFlowEquation03 rst_1_1_to_1_2(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.02^2, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {-170, 50}, extent = {{-10, -10}, {10, 10}})));
  Compressible.Components.NozzleFlowEquation03 rst_0_3_to_1_3(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.02^2, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Compressible.Components.NozzleFlowEquation03 rst_1_2_to_1_3(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.002^2, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}})));
  Compressible.Components.NozzleFlowEquation03 rst_1_3_to_1_4(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi/4*0.05^2, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}})));
  Compressible.Components.NozzleFlowEquation03 rst_1_5_to_1_6(AmechTot_par = Modelica.Constants.pi/4*0.01^2, redeclare package Medium = fluid1, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {140, 50}, extent = {{-10, -10}, {10, 10}})));
  Compressible.Components.NozzleFlowEquation03 rst_1_4_to_1_5(AmechTot_par = Modelica.Constants.pi/4*0.01^2, redeclare package Medium = fluid1, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {64, 50}, extent = {{-10, -10}, {10, 10}})));
  Compressible.Components.NozzleFlowEquation03 rst_0_4_to_1_4(AmechTot_par = Modelica.Constants.pi/4*0.005^2, redeclare package Medium = fluid1,thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Compressible.Components.NozzleFlowEquation03 rst_2_0_to_2_1(AmechTot_par = Modelica.Constants.pi/4*0.02^2, redeclare package Medium = fluid1, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {-250, -30}, extent = {{-10, -10}, {10, 10}})));
  Compressible.Components.NozzleFlowEquation03 rst_1_1_to_2_1(AmechTot_par = Modelica.Constants.pi/4*0.01^2, redeclare package Medium = fluid1, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {-210, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Compressible.Components.NozzleFlowEquation03 rst_0_5_to_1_5(AmechTot_par = Modelica.Constants.pi/4*0.01^2, redeclare package Medium = fluid1,thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {100, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

//----------
equation
  connect(ramp_p_0_1.y, firstOrder_p_0_1.u) annotation(
    Line(points = {{-240, 179}, {-240, 171}}, color = {0, 0, 127}));
  connect(ramp_p_0_2.y, firstOrder_p_0_2.u) annotation(
    Line(points = {{-160, 179}, {-160, 171}}, color = {0, 0, 127}));
  connect(ramp_p_0_3.y, firstOrder_p_0_3.u) annotation(
    Line(points = {{-80, 179}, {-80, 171}}, color = {0, 0, 127}));
  connect(ramp_p_1_0.y, firstOrder_p_1_0.u) annotation(
    Line(points = {{-349, 58}, {-340, 58}}, color = {0, 0, 127}));
  connect(ramp_p_1_6.y, firstOrder_p_1_6.u) annotation(
    Line(points = {{239, 58}, {232, 58}}, color = {0, 0, 127}));
  connect(boundary_1_0.ports[1], rst_1_0_to_1_1.port_a) annotation(
    Line(points = {{-280, 50}, {-260, 50}}, color = {0, 127, 255}, thickness = 1.5));
  connect(firstOrder_p_1_0.y, boundary_1_0.p_in) annotation(
    Line(points = {{-317, 58}, {-302, 58}}, color = {0, 0, 127}));
  connect(boundary_1_6.p_in, firstOrder_p_1_6.y) annotation(
    Line(points = {{192, 58}, {209, 58}}, color = {0, 0, 127}));
  connect(boundary_0_1.ports[1], rst_0_1_to_1_1.port_a) annotation(
    Line(points = {{-210, 130}, {-210, 100}}, color = {0, 127, 255}, thickness = 1.5));
  connect(firstOrder_p_0_1.y, boundary_0_1.p_in) annotation(
    Line(points = {{-240, 149}, {-240, 138}, {-232, 138}}, color = {0, 0, 127}));
  connect(boundary_0_2.ports[1], rst_0_2_to_1_2.port_a) annotation(
    Line(points = {{-130, 130}, {-130, 100}}, color = {0, 127, 255}, thickness = 1.5));
  connect(firstOrder_p_0_2.y, boundary_0_2.p_in) annotation(
    Line(points = {{-160, 149}, {-160, 137}, {-152, 137}}, color = {0, 0, 127}));
  connect(boundary_0_3.ports[1], rst_0_3_to_1_3.port_a) annotation(
    Line(points = {{-50, 130}, {-50, 100}}, color = {0, 127, 255}, thickness = 1.5));
  connect(firstOrder_p_0_3.y, boundary_0_3.p_in) annotation(
    Line(points = {{-80, 149}, {-80, 137}, {-72, 137}}, color = {0, 0, 127}));
  connect(boundary_0_4.ports[1], rst_0_4_to_1_4.port_a) annotation(
    Line(points = {{30, 130}, {30, 100}}, color = {0, 127, 255}, thickness = 1.5));
  connect(ramp_p_0_4.y, firstOrder_p_0_4.u) annotation(
    Line(points = {{0, 179}, {0, 171}}, color = {0, 0, 127}));
  connect(firstOrder_p_0_4.y, boundary_0_4.p_in) annotation(
    Line(points = {{0, 149}, {0, 137}, {8, 137}}, color = {0, 0, 127}));
  connect(ramp_p_0_5.y, firstOrder_p_0_5.u) annotation(
    Line(points = {{70, 179}, {70, 171}}, color = {0, 0, 127}));
  connect(firstOrder_p_0_5.y, boundary_0_5.p_in) annotation(
    Line(points = {{70, 149}, {70, 137}, {78, 137}}, color = {0, 0, 127}));
  connect(boundary_0_5.ports[1], rst_0_5_to_1_5.port_a) annotation(
    Line(points = {{100, 130}, {100, 100}}, color = {0, 127, 255}, thickness = 1.5));
  connect(ramp_p_2_0.y, firstOrder_p_2_0.u) annotation(
    Line(points = {{-349, -22}, {-341, -22}}, color = {0, 0, 127}));
  connect(firstOrder_p_2_0.y, boundary_2_0.p_in) annotation(
    Line(points = {{-317, -22}, {-303, -22}}, color = {0, 0, 127}));
  connect(boundary_2_0.ports[1], rst_2_0_to_2_1.port_a) annotation(
    Line(points = {{-280, -30}, {-260, -30}}, color = {0, 127, 255}, thickness = 1.5));
  connect(boundary_1_6.ports[1], rst_1_5_to_1_6.port_b) annotation(
    Line(points = {{170, 50}, {150, 50}}, color = {0, 127, 255}, thickness = 1.5));
  connect(rst_1_0_to_1_1.port_b, vol_1_1.ports[1]) annotation(
    Line(points = {{-240, 50}, {-210, 50}, {-210, 40}}, color = {0, 127, 255}));
  connect(rst_0_1_to_1_1.port_b, vol_1_1.ports[2]) annotation(
    Line(points = {{-210, 80}, {-210, 40}}, color = {0, 127, 255}));
  connect(rst_1_1_to_1_2.port_a, vol_1_1.ports[3]) annotation(
    Line(points = {{-180, 50}, {-210, 50}, {-210, 40}}, color = {0, 127, 255}));
  connect(rst_1_1_to_1_2.port_b, vol_1_2.ports[1]) annotation(
    Line(points = {{-160, 50}, {-130, 50}, {-130, 40}}, color = {0, 127, 255}));
  connect(rst_0_2_to_1_2.port_b, vol_1_2.ports[2]) annotation(
    Line(points = {{-130, 80}, {-130, 40}}, color = {0, 127, 255}));
  connect(rst_1_2_to_1_3.port_a, vol_1_2.ports[3]) annotation(
    Line(points = {{-100, 50}, {-130, 50}, {-130, 40}}, color = {0, 127, 255}));
  connect(rst_1_2_to_1_3.port_b, vol_1_3.ports[1]) annotation(
    Line(points = {{-80, 50}, {-50, 50}, {-50, 40}}, color = {0, 127, 255}));
  connect(rst_0_3_to_1_3.port_b, vol_1_3.ports[2]) annotation(
    Line(points = {{-50, 80}, {-50, 40}}, color = {0, 127, 255}));
  connect(rst_1_3_to_1_4.port_a, vol_1_3.ports[3]) annotation(
    Line(points = {{-20, 50}, {-50, 50}, {-50, 40}}, color = {0, 127, 255}));
  connect(rst_1_3_to_1_4.port_b, vol_1_4.ports[1]) annotation(
    Line(points = {{0, 50}, {30, 50}, {30, 40}}, color = {0, 127, 255}));
  connect(rst_0_4_to_1_4.port_b, vol_1_4.ports[2]) annotation(
    Line(points = {{30, 80}, {30, 40}}, color = {0, 127, 255}));
  connect(rst_1_4_to_1_5.port_a, vol_1_4.ports[3]) annotation(
    Line(points = {{54, 50}, {30, 50}, {30, 40}}, color = {0, 127, 255}));
  connect(rst_1_4_to_1_5.port_b, vol_1_5.ports[1]) annotation(
    Line(points = {{74, 50}, {100, 50}, {100, 40}}, color = {0, 127, 255}));
  connect(rst_0_5_to_1_5.port_b, vol_1_5.ports[2]) annotation(
    Line(points = {{100, 80}, {100, 40}}, color = {0, 127, 255}));
  connect(rst_1_5_to_1_6.port_a, vol_1_5.ports[3]) annotation(
    Line(points = {{130, 50}, {100, 50}, {100, 40}}, color = {0, 127, 255}));
  connect(rst_1_1_to_2_1.port_a, vol_1_1.ports[4]) annotation(
    Line(points = {{-210, 20}, {-210, 40}}, color = {0, 127, 255}));
  connect(rst_1_1_to_2_1.port_b, vol_2_1.ports[1]) annotation(
    Line(points = {{-210, 0}, {-210, -40}}, color = {0, 127, 255}));
  connect(rst_2_0_to_2_1.port_b, vol_2_1.ports[2]) annotation(
    Line(points = {{-240, -30}, {-210, -30}, {-210, -40}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-400, -260}, {400, 260}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01),
    Icon(coordinateSystem(extent = {{-300, -260}, {300, 260}})));
end FluidGridNW_ex01_v001;
