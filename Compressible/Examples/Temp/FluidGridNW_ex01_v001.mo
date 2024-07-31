within FluidSystemComponents.Compressible.Examples.Temp;

model FluidGridNW_ex01_v001
  extends Modelica.Icons.Example;
  //-------------------------
  import units = Modelica.Units.SI;
  //-------------------------
  parameter units.Volume volStd = 0.1;
  parameter units.Time durStd=5.0;
  parameter units.Time TconstStd= 1.0;
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
  Modelica.Blocks.Sources.Ramp ramp_p_0_1(duration = durStd, height = 700*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(transformation(origin = {-240, 200}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p_0_2(duration = durStd, height = 200*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(transformation(origin = {-160, 200}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p_0_3(duration = durStd, height = -50*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(transformation(origin = {-80, 200}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p_1_0(duration = durStd, height = 1000*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(transformation(origin = {-360, 58}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_p_1_6(duration = durStd, height = 1100*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(transformation(origin = {260, 58}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Modelica.Blocks.Sources.Ramp ramp_p_0_4(duration = durStd, height = -10*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(transformation(origin = {0, 200}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p_0_5(duration = durStd, height = 200*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(transformation(origin = {80, 200}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p_2_0(duration = durStd, height = 1200*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(transformation(origin = {-360, -22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_p_2_6(duration = durStd, height = -10*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(transformation(origin = {260, -22}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  
  //----------
  
  Modelica.Blocks.Sources.Ramp ramp_fracA_1_2_to_2_2(duration = durStd, height = -1, offset = 1, startTime = 30) annotation(
    Placement(transformation(origin = {-168, 14}, extent = {{-4, -4}, {4, 4}})));
  Modelica.Blocks.Sources.Ramp ramp_fracA_1_4_to_2_4(duration = durStd, height = -1, offset = 1, startTime = 30) annotation(
    Placement(transformation(origin = {-8, 14}, extent = {{-4, -4}, {4, 4}})));

  //----------
  
  Modelica.Blocks.Math.Gain Amech_rst_1_2_to_2_2(k = 0.01^2*Modelica.Constants.pi/4)  annotation(
    Placement(transformation(origin = {-152, 14}, extent = {{-4, -4}, {4, 4}})));
  Modelica.Blocks.Math.Gain Amech_rst_1_4_to_2_4(k = 0.1^2*Modelica.Constants.pi/4) annotation(
    Placement(transformation(origin = {8, 14}, extent = {{-4, -4}, {4, 4}})));
    
  //----------
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_0_3(T = TconstStd, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {-80, 170}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_0_2(T = TconstStd, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {-160, 170}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_0_1(T = TconstStd, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {-240, 170}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_1_0(T = TconstStd, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {-326, 58}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_1_6(T = TconstStd, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {230, 58}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_0_4(T = TconstStd, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {0, 170}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_0_5(T = TconstStd, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {80, 170}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_2_0(T = TconstStd, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {-326, -22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p_2_6(T = TconstStd, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(transformation(origin = {230, -22}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  
  
  //----------
  Sources.Boundary_pT_colorP boundary_1_0(nPorts = 1, redeclare package Medium = fluid1, use_p_in = true, sigDigits = 4, valMin = pContourMin, valMax = pContourMax, T = 700) annotation(
    Placement(transformation(origin = {-290, 50}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary_1_6(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {190, 50}, extent = {{10, -10}, {-10, 10}})));
  Sources.Boundary_pT_colorP boundary_0_1(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-220, 130}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary_0_2(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-140, 130}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary_0_3(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-60, 130}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary_0_4(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {20, 130}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary_0_5(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {100, 130}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary_2_0(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-290, -30}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary_2_6(redeclare package Medium = fluid1, T = 700, nPorts = 1, sigDigits = 4, use_p_in = true, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {190, -30}, extent = {{10, -10}, {-10, 10}})));
  
  
  //----------
  CommonAnyFluid.Components.ClosedVolumeColorP vol_1_1(nPorts = 4, redeclare package Medium = fluid1, use_portsData = false, V = volStd, sigDigits = 4, valMin = pContourMin, valMax = pContourMax) annotation(
    Placement(transformation(origin = {-210, 50}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_1_2(redeclare package Medium = fluid1, V = volStd, nPorts = 4, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-130, 50}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_1_3(redeclare package Medium = fluid1, V = volStd, nPorts = 4, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_1_4(redeclare package Medium = fluid1, V = volStd, nPorts = 4, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_1_5(redeclare package Medium = fluid1, V = volStd, nPorts = 4, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_2_1(redeclare package Medium = fluid1, V = volStd, nPorts = 3, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-210, -30}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_2_2(redeclare package Medium = fluid1, V = volStd, nPorts = 3, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-130, -30}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_2_4(redeclare package Medium = fluid1, V = volStd, nPorts = 3, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_2_5(redeclare package Medium = fluid1, V = volStd, nPorts = 3, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP vol_2_3(redeclare package Medium = fluid1, V = volStd, nPorts = 3, sigDigits = 4, use_portsData = false, valMax = pContourMax, valMin = pContourMin) annotation(
    Placement(transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}})));
  
  
  //----------
  Compressible.Components.NozzleFlowEquation03 rst_1_0_to_1_1(redeclare package Medium = fluid1, AmechTot_par = 0.005^2*Modelica.Constants.pi/4, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax) annotation(
    Placement(transformation(origin = {-250, 50}, extent = {{-10, -10}, {10, 10}})));
  Compressible.Components.NozzleFlowEquation03 rst_0_1_to_1_1(redeclare package Medium = fluid1, AmechTot_par = 0.01^2*Modelica.Constants.pi/4, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {-210, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Compressible.Components.NozzleFlowEquation03 rst_0_2_to_1_2(redeclare package Medium = fluid1, AmechTot_par = 0.05^2*Modelica.Constants.pi/4, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {-130, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Compressible.Components.NozzleFlowEquation03 rst_1_1_to_1_2(redeclare package Medium = fluid1, AmechTot_par = 0.02^2*Modelica.Constants.pi/4, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {-170, 50}, extent = {{-10, -10}, {10, 10}})));
  Compressible.Components.NozzleFlowEquation03 rst_0_3_to_1_3(redeclare package Medium = fluid1, AmechTot_par = 0.02^2*Modelica.Constants.pi/4, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Compressible.Components.NozzleFlowEquation03 rst_1_2_to_1_3(redeclare package Medium = fluid1, AmechTot_par = 0.05^2*Modelica.Constants.pi/4, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}})));
  Compressible.Components.NozzleFlowEquation03 rst_1_3_to_1_4(redeclare package Medium = fluid1, AmechTot_par = 0.05^2*Modelica.Constants.pi/4, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}})));
  Compressible.Components.NozzleFlowEquation03 rst_1_5_to_1_6(AmechTot_par = 0.05^2*Modelica.Constants.pi/4, redeclare package Medium = fluid1, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {150, 50}, extent = {{-10, -10}, {10, 10}})));
  Compressible.Components.NozzleFlowEquation03 rst_1_4_to_1_5(AmechTot_par = 0.01^2*Modelica.Constants.pi/4, redeclare package Medium = fluid1, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}})));
  Compressible.Components.NozzleFlowEquation03 rst_0_4_to_1_4(AmechTot_par = 0.005^2*Modelica.Constants.pi/4, redeclare package Medium = fluid1,thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Compressible.Components.NozzleFlowEquation03 rst_2_0_to_2_1(AmechTot_par = 0.02^2*Modelica.Constants.pi/4, redeclare package Medium = fluid1, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {-250, -30}, extent = {{-10, -10}, {10, 10}})));
  Compressible.Components.NozzleFlowEquation03 rst_1_1_to_2_1(AmechTot_par = 0.01^2*Modelica.Constants.pi/4, redeclare package Medium = fluid1, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {-210, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Compressible.Components.NozzleFlowEquation03 rst_0_5_to_1_5(AmechTot_par = 0.01^2*Modelica.Constants.pi/4, redeclare package Medium = fluid1,thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max) annotation(
    Placement(transformation(origin = {110, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Components.NozzleFlowEquation03 rst_2_1_to_2_2(AmechTot_par = 0.01^2*Modelica.Constants.pi/4, redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {-170, -30}, extent = {{-10, -10}, {10, 10}})));
  Components.NozzleFlowEquation_varArea01 rst_1_2_to_2_2(redeclare package Medium = fluid1, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max, thickArrowMin = arrowMassFlowMin, thickArrowMax = arrowMassFlowMax)  annotation(
    Placement(transformation(origin = {-130, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Components.NozzleFlowEquation03 rst_1_3_to_2_3(AmechTot_par = 0.02^2*Modelica.Constants.pi/4, redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Components.NozzleFlowEquation03 rst_2_3_to_2_4(AmechTot_par = 0.02^2*Modelica.Constants.pi/4, redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}})));
  Components.NozzleFlowEquation03 rst_2_2_to_2_3(AmechTot_par = 0.02^2*Modelica.Constants.pi/4, redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}})));
  Components.NozzleFlowEquation03 rst_2_4_to_2_5(AmechTot_par = 0.05^2*Modelica.Constants.pi/4, redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}})));
  Components.NozzleFlowEquation03 rst_2_5_to_2_6(AmechTot_par = 0.01^2*Modelica.Constants.pi/4, redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {150, -30}, extent = {{-10, -10}, {10, 10}})));
  Components.NozzleFlowEquation_varArea01 rst_1_4_to_2_4(redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {30, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Components.NozzleFlowEquation03 rst_1_5_to_2_5(AmechTot_par = 0.02^2*Modelica.Constants.pi/4, redeclare package Medium = fluid1, m_flow_Max = m_flow_Max, m_flow_Min = m_flow_Min, thickArrowMax = arrowMassFlowMax, thickArrowMin = arrowMassFlowMin) annotation(
    Placement(transformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  
  //----------
  
  

equation
  connect(ramp_p_0_1.y, firstOrder_p_0_1.u) annotation(
    Line(points = {{-240, 189}, {-240, 182}}, color = {0, 0, 127}));
  connect(ramp_p_0_2.y, firstOrder_p_0_2.u) annotation(
    Line(points = {{-160, 189}, {-160, 182}}, color = {0, 0, 127}));
  connect(ramp_p_0_3.y, firstOrder_p_0_3.u) annotation(
    Line(points = {{-80, 189}, {-80, 182}}, color = {0, 0, 127}));
  connect(ramp_p_1_0.y, firstOrder_p_1_0.u) annotation(
    Line(points = {{-349, 58}, {-338, 58}}, color = {0, 0, 127}));
  connect(ramp_p_1_6.y, firstOrder_p_1_6.u) annotation(
    Line(points = {{249, 58}, {242, 58}}, color = {0, 0, 127}));
  connect(boundary_1_0.ports[1], rst_1_0_to_1_1.port_a) annotation(
    Line(points = {{-280, 50}, {-260, 50}}, color = {0, 127, 255}));
  connect(boundary_0_1.ports[1], rst_0_1_to_1_1.port_a) annotation(
    Line(points = {{-210, 130}, {-210, 100}}, color = {0, 127, 255}));
  connect(boundary_0_2.ports[1], rst_0_2_to_1_2.port_a) annotation(
    Line(points = {{-130, 130}, {-130, 100}}, color = {0, 127, 255}));
  connect(boundary_0_3.ports[1], rst_0_3_to_1_3.port_a) annotation(
    Line(points = {{-50, 130}, {-50, 100}}, color = {0, 127, 255}));
  connect(boundary_0_4.ports[1], rst_0_4_to_1_4.port_a) annotation(
    Line(points = {{30, 130}, {30, 100}}, color = {0, 127, 255}));
  connect(ramp_p_0_4.y, firstOrder_p_0_4.u) annotation(
    Line(points = {{0, 189}, {0, 182}}, color = {0, 0, 127}));
  connect(ramp_p_0_5.y, firstOrder_p_0_5.u) annotation(
    Line(points = {{80, 189}, {80, 182}}, color = {0, 0, 127}));
  connect(boundary_0_5.ports[1], rst_0_5_to_1_5.port_a) annotation(
    Line(points = {{110, 130}, {110, 100}}, color = {0, 127, 255}));
  connect(ramp_p_2_0.y, firstOrder_p_2_0.u) annotation(
    Line(points = {{-349, -22}, {-338, -22}}, color = {0, 0, 127}));
  connect(boundary_2_0.ports[1], rst_2_0_to_2_1.port_a) annotation(
    Line(points = {{-280, -30}, {-260, -30}}, color = {0, 127, 255}));
  connect(boundary_1_6.ports[1], rst_1_5_to_1_6.port_b) annotation(
    Line(points = {{180, 50}, {160, 50}}, color = {0, 127, 255}));
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
    Line(points = {{60, 50}, {32, 50}, {32, 40}, {30, 40}}, color = {0, 127, 255}));
  connect(rst_1_4_to_1_5.port_b, vol_1_5.ports[1]) annotation(
    Line(points = {{80, 50}, {110, 50}, {110, 40}}, color = {0, 127, 255}));
  connect(rst_0_5_to_1_5.port_b, vol_1_5.ports[2]) annotation(
    Line(points = {{110, 80}, {110, 40}}, color = {0, 127, 255}));
  connect(rst_1_5_to_1_6.port_a, vol_1_5.ports[3]) annotation(
    Line(points = {{140, 50}, {110, 50}, {110, 40}}, color = {0, 127, 255}));
  connect(rst_1_1_to_2_1.port_a, vol_1_1.ports[4]) annotation(
    Line(points = {{-210, 20}, {-210, 40}}, color = {0, 127, 255}));
  connect(rst_1_1_to_2_1.port_b, vol_2_1.ports[1]) annotation(
    Line(points = {{-210, 0}, {-210, -40}}, color = {0, 127, 255}));
  connect(rst_2_0_to_2_1.port_b, vol_2_1.ports[2]) annotation(
    Line(points = {{-240, -30}, {-210, -30}, {-210, -40}}, color = {0, 127, 255}));
  connect(rst_2_1_to_2_2.port_b, vol_2_2.ports[1]) annotation(
    Line(points = {{-160, -30}, {-130, -30}, {-130, -40}}, color = {0, 127, 255}));
  connect(rst_2_1_to_2_2.port_a, vol_2_1.ports[3]) annotation(
    Line(points = {{-180, -30}, {-210, -30}, {-210, -40}}, color = {0, 127, 255}));
  connect(rst_1_2_to_2_2.port_a, vol_1_2.ports[4]) annotation(
    Line(points = {{-130, 20}, {-130, 40}}, color = {0, 127, 255}));
  connect(rst_1_2_to_2_2.port_b, vol_2_2.ports[2]) annotation(
    Line(points = {{-130, 0}, {-130, -40}}, color = {0, 127, 255}));
  connect(Amech_rst_1_2_to_2_2.y, rst_1_2_to_2_2.u_Amech) annotation(
    Line(points = {{-148, 14}, {-141, 14}}, color = {0, 0, 127}));
  connect(ramp_fracA_1_2_to_2_2.y, Amech_rst_1_2_to_2_2.u) annotation(
    Line(points = {{-164, 14}, {-156, 14}}, color = {0, 0, 127}));
  connect(vol_1_3.ports[4], rst_1_3_to_2_3.port_a) annotation(
    Line(points = {{-50, 40}, {-50, 20}}, color = {0, 127, 255}));
  connect(rst_1_3_to_2_3.port_b, vol_2_3.ports[1]) annotation(
    Line(points = {{-50, 0}, {-50, -40}}, color = {0, 127, 255}));
  connect(rst_2_2_to_2_3.port_a, vol_2_2.ports[3]) annotation(
    Line(points = {{-100, -30}, {-130, -30}, {-130, -40}}, color = {0, 127, 255}));
  connect(rst_2_2_to_2_3.port_b, vol_2_3.ports[2]) annotation(
    Line(points = {{-80, -30}, {-50, -30}, {-50, -40}}, color = {0, 127, 255}));
  connect(ramp_p_2_6.y, firstOrder_p_2_6.u) annotation(
    Line(points = {{249, -22}, {242, -22}}, color = {0, 0, 127}));
  connect(rst_2_3_to_2_4.port_a, vol_2_3.ports[3]) annotation(
    Line(points = {{-20, -30}, {-50, -30}, {-50, -40}}, color = {0, 127, 255}));
  connect(rst_2_3_to_2_4.port_b, vol_2_4.ports[1]) annotation(
    Line(points = {{0, -30}, {30, -30}, {30, -40}}, color = {0, 127, 255}));
  connect(rst_2_4_to_2_5.port_a, vol_2_4.ports[2]) annotation(
    Line(points = {{60, -30}, {30, -30}, {30, -40}}, color = {0, 127, 255}));
  connect(rst_2_4_to_2_5.port_b, vol_2_5.ports[1]) annotation(
    Line(points = {{80, -30}, {100, -30}, {100, -40}, {110, -40}}, color = {0, 127, 255}));
  connect(rst_2_5_to_2_6.port_a, vol_2_5.ports[2]) annotation(
    Line(points = {{140, -30}, {110, -30}, {110, -40}}, color = {0, 127, 255}));
  connect(rst_2_5_to_2_6.port_b, boundary_2_6.ports[1]) annotation(
    Line(points = {{160, -30}, {180, -30}}, color = {0, 127, 255}));
  connect(ramp_fracA_1_4_to_2_4.y, Amech_rst_1_4_to_2_4.u) annotation(
    Line(points = {{-4, 14}, {4, 14}}, color = {0, 0, 127}));
  connect(Amech_rst_1_4_to_2_4.y, rst_1_4_to_2_4.u_Amech) annotation(
    Line(points = {{12, 14}, {20, 14}}, color = {0, 0, 127}));
  connect(rst_1_4_to_2_4.port_a, vol_1_4.ports[4]) annotation(
    Line(points = {{30, 20}, {30, 40}}, color = {0, 127, 255}));
  connect(rst_1_4_to_2_4.port_b, vol_2_4.ports[3]) annotation(
    Line(points = {{30, 0}, {30, -40}}, color = {0, 127, 255}));
  connect(rst_1_5_to_2_5.port_a, vol_1_5.ports[4]) annotation(
    Line(points = {{110, 20}, {110, 40}}, color = {0, 127, 255}));
  connect(rst_1_5_to_2_5.port_b, vol_2_5.ports[3]) annotation(
    Line(points = {{110, 0}, {110, -40}}, color = {0, 127, 255}));
  connect(firstOrder_p_1_0.y, boundary_1_0.p_in) annotation(
    Line(points = {{-314, 58}, {-302, 58}}, color = {0, 0, 127}));
  connect(firstOrder_p_2_0.y, boundary_2_0.p_in) annotation(
    Line(points = {{-314, -22}, {-302, -22}}, color = {0, 0, 127}));
  connect(firstOrder_p_0_1.y, boundary_0_1.p_in) annotation(
    Line(points = {{-240, 159}, {-240, 138}, {-232, 138}}, color = {0, 0, 127}));
  connect(firstOrder_p_0_2.y, boundary_0_2.p_in) annotation(
    Line(points = {{-160, 159}, {-160, 138}, {-152, 138}}, color = {0, 0, 127}));
  connect(firstOrder_p_0_3.y, boundary_0_3.p_in) annotation(
    Line(points = {{-80, 159}, {-80, 138}, {-72, 138}}, color = {0, 0, 127}));
  connect(firstOrder_p_0_4.y, boundary_0_4.p_in) annotation(
    Line(points = {{0, 159}, {0, 138}, {8, 138}}, color = {0, 0, 127}));
  connect(firstOrder_p_0_5.y, boundary_0_5.p_in) annotation(
    Line(points = {{80, 159}, {80, 138}, {88, 138}}, color = {0, 0, 127}));
  connect(boundary_1_6.p_in, firstOrder_p_1_6.y) annotation(
    Line(points = {{202, 58}, {220, 58}}, color = {0, 0, 127}));
  connect(boundary_2_6.p_in, firstOrder_p_2_6.y) annotation(
    Line(points = {{202, -22}, {220, -22}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-400, -260}, {400, 260}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.05),
    Icon(coordinateSystem(extent = {{-300, -260}, {300, 260}})));
end FluidGridNW_ex01_v001;
