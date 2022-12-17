within FluidSystemComponents.Compressible.Examples.AssyComponents;

model ComplexFNW_ex02_v01
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
    Placement(visible = true, transformation(origin = {-226, 210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 500, nPorts = 2, p = 30 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-173, 163}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 3) annotation(
    Placement(visible = true, transformation(origin = {-164, 53}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 550, nPorts = 1, p = 28 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-99, 157}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = fluid1, T = 1200, nPorts = 4, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {63, 231}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 4) annotation(
    Placement(visible = true, transformation(origin = {-159, -60}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {-73, -55}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume3(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 5) annotation(
    Placement(visible = true, transformation(origin = {5, -45}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume4(redeclare package Medium = fluid1, V = volStd, use_portsData = false, nPorts = 4) annotation(
    Placement(visible = true, transformation(origin = {-84, 55}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc(duration = 1, height = 3.2 * 100 * 1000 - 100 * 1000, offset =  100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-218, 170}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc1(duration = 1, height = 3.8 * 100 * 1000 - 100 * 1000, offset =  100 * 1000, startTime = 13) annotation(
    Placement(visible = true, transformation(origin = {-143, 164}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc2(duration = 1, height = 4 * 100 * 1000 - 100 * 1000, offset =  100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {83, 276}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume5(redeclare package Medium = fluid1, V = volStd, nPorts = 4, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {24, 67}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-174, 50}, extent = {{-4, 4}, {4, -4}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-170, 40}, extent = {{-7, -4}, {7, 4}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-170, -62}, extent = {{-4, 4}, {4, -4}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 6) annotation(
    Placement(visible = true, transformation(origin = {-164, -70}, extent = {{-7, -4}, {7, 4}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-164, 92}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction1(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.005 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-164, 2}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction2(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction3(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-40, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction4(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-66, -10}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction5(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-84, 98}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction6(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.001 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-56, 50}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction7(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {24, 120}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction8(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.005 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {54, 68}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction9(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {24, 2}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {109, 209}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc3(duration = 1, height = 4.5 * 100 * 1000 - 100 * 1000, offset =  100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {127, 250}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume6(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {54, 97}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction10(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {54, 130}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction11(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.001 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {78, 92}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume7(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {100, 97}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction12(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {100, 122}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc4(duration = 1, height = 4.8 * 100 * 1000 - 100 * 1000, offset =  100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {179, 225}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary4(redeclare package Medium = fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {157, 187}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction13(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.001 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {148, 12}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume8(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {100, 39}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume9(redeclare package Medium = fluid1, V = volStd, nPorts = 6, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {148, 39}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction14(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {100, 64}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction15(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {76, 34}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction16(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {148, 86}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction17(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {124, 34}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume10(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {54, 19}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction18(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {54, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction19(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.001 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-56, 84}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume11(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-34, 84}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction20(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-2, 84}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction21(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-12, 112}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary5(redeclare package Medium = fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-125, 325}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc5(duration = 1, height = 0, offset =  100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {-178, 332}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume12(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-164, 265}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction22(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-164, 220}, extent = {{8, -8}, {-8, 8}}, rotation = -90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction23(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.001 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-96, 260}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible(redeclare package Medium = fluid1, Av = 0.8 * Modelica.Constants.pi / 4 * 0.01 ^ 2, CvData = Modelica.Fluid.Types.CvTypes.Av, Fxt_full = 1.0, dp_nominal = 2 * 100 * 1000, m_flow_nominal = 0.1, p_nominal = 30 * 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-164, 284}, extent = {{6, 6}, {-6, -6}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_valve(duration = 1, height = -0.9, offset = 1, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-208, 284}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction24(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-136, 302}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume13(redeclare package Medium = fluid1, V = volStd, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-159, 302}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary6(redeclare package Medium = fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {215, 195}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc6(duration = 1, height = 4.9 * 100 * 1000 - 100 * 1000, offset =  100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {239, 232}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume14(redeclare package Medium = fluid1, V = volStd, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {206, 75}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction25(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {182, 70}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction26(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {206, 158}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction27(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.005 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {148, 156}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume15(redeclare package Medium = fluid1, V = volStd, nPorts = 4, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {148, 119}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume16(redeclare package Medium = fluid1, V = volStd, nPorts = 4, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {206, 133}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction28(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {206, 100}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction29(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.015 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {180, 114}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume17(redeclare package Medium = fluid1, V = volStd, nPorts = 3, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {100, 153}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction30(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.01 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {100, 178}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction31(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {126, 144}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc7(duration = 1, height = 5.0 * 100 * 1000 - 100 * 1000, offset =  100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {211, 260}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary7(redeclare package Medium = fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {249, 254}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary8(redeclare package Medium = fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {277, 219}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc8(duration = 1, height = 5.2 * 100 * 1000 - 100 * 1000, offset =  100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {291, 259}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_p_bc81(duration = 1, height = 5.5 * 100 * 1000 - 100 * 1000, offset =  100 * 1000, startTime = 11) annotation(
    Placement(visible = true, transformation(origin = {332, 274}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary9(redeclare package Medium = fluid1, T = 1200, nPorts = 1, p = 10 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {318, 235}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume18(redeclare package Medium = fluid1, V = volStd, nPorts = 5, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {290, 155}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction32(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.001 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {238, 142}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction33(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.02 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {290, 106}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction34(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.05 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {256, 193}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction35(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.04 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {270, 174}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction36(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.05 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {312, 184}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-260, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_18(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {180, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {20, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation03 restriction37(redeclare package Medium = fluid1, AmechTot_par = Modelica.Constants.pi / 4 * 0.001 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {180, -20}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder2(T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {83, 255}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-198, 170}, extent = {{6, -6}, {-6, 6}}, rotation = 180)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-123, 164}, extent = {{6, -6}, {-6, 6}}, rotation = 180)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder3(T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {127, 231}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder4(T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {179, 207}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder6(T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {239, 213}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder7(T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {229, 260}, extent = {{6, 6}, {-6, -6}}, rotation = 180)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder8(T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {291, 239}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder9(T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {332, 255}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_valve(T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-186, 284}, extent = {{6, 6}, {-6, -6}}, rotation = 180)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder5(T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-154, 332}, extent = {{6, 6}, {-6, -6}}, rotation = 180)));
equation
  connect(p.port, volume.ports[1]) annotation(
    Line(points = {{-174, 46}, {-169, 46}, {-169, 48}, {-164, 48}}, color = {0, 127, 255}));
  connect(p.p, realValue.numberPort) annotation(
    Line(points = {{-178.4, 50}, {-178.4, 40}}, color = {0, 0, 127}));
  connect(p1.port, volume1.ports[1]) annotation(
    Line(points = {{-170, -66}, {-164, -66}, {-164, -60}}, color = {0, 127, 255}));
  connect(p1.p, realValue1.numberPort) annotation(
    Line(points = {{-174.4, -62}, {-176.4, -62}, {-176.4, -70}, {-172.4, -70}}, color = {0, 0, 127}));
  connect(restriction.port_a, boundary.ports[1]) annotation(
    Line(points = {{-164, 100}, {-164, 163}}, color = {0, 127, 255}));
  connect(restriction.port_b, volume.ports[2]) annotation(
    Line(points = {{-164, 84}, {-164, 48}}, color = {0, 127, 255}));
  connect(restriction1.port_a, volume.ports[3]) annotation(
    Line(points = {{-164, 10}, {-164, 48}}, color = {0, 127, 255}));
  connect(restriction1.port_b, volume1.ports[2]) annotation(
    Line(points = {{-164, -6}, {-164, -60}}, color = {0, 127, 255}));
  connect(restriction2.port_b, volume2.ports[1]) annotation(
    Line(points = {{-92, -60}, {-72, -60}}, color = {0, 127, 255}));
  connect(restriction2.port_a, volume1.ports[3]) annotation(
    Line(points = {{-108, -60}, {-164, -60}}, color = {0, 127, 255}));
  connect(restriction3.port_a, volume2.ports[2]) annotation(
    Line(points = {{-48, -60}, {-72, -60}}, color = {0, 127, 255}));
  connect(restriction3.port_b, volume3.ports[1]) annotation(
    Line(points = {{-32, -60}, {6, -60}, {6, -50}}, color = {0, 127, 255}));
  connect(restriction4.port_a, volume4.ports[1]) annotation(
    Line(points = {{-74, -10}, {-84, -10}, {-84, 50}}, color = {0, 127, 255}));
  connect(restriction4.port_b, volume3.ports[2]) annotation(
    Line(points = {{-58, -10}, {-18, -10}, {-18, -50}, {5, -50}}, color = {0, 127, 255}));
  connect(restriction5.port_b, volume4.ports[2]) annotation(
    Line(points = {{-84, 90}, {-84, 50}}, color = {0, 127, 255}));
  connect(restriction5.port_a, boundary1.ports[1]) annotation(
    Line(points = {{-84, 106}, {-84, 157}, {-90, 157}}, color = {0, 127, 255}));
  connect(restriction6.port_a, volume4.ports[3]) annotation(
    Line(points = {{-64, 50}, {-84, 50}}, color = {0, 127, 255}));
  connect(restriction6.port_b, volume5.ports[1]) annotation(
    Line(points = {{-48, 50}, {-12, 50}, {-12, 62}, {24, 62}}, color = {0, 127, 255}));
  connect(restriction7.port_a, volume5.ports[2]) annotation(
    Line(points = {{24, 112}, {24, 62}}, color = {0, 127, 255}));
  connect(restriction7.port_b, boundary2.ports[1]) annotation(
    Line(points = {{24, 128}, {24, 231}, {54, 231}}, color = {0, 127, 255}));
  connect(volume3.ports[3], restriction9.port_a) annotation(
    Line(points = {{5, -50}, {23, -50}, {23, -6}}, color = {0, 127, 255}));
  connect(restriction9.port_b, volume5.ports[3]) annotation(
    Line(points = {{24, 10}, {24, 62}}, color = {0, 127, 255}));
  connect(restriction8.port_b, volume6.ports[1]) annotation(
    Line(points = {{54, 76}, {54, 92}}, color = {0, 127, 255}));
  connect(restriction10.port_a, volume6.ports[2]) annotation(
    Line(points = {{54, 122}, {54, 92}}, color = {0, 127, 255}));
  connect(restriction10.port_b, boundary2.ports[2]) annotation(
    Line(points = {{54, 138}, {54, 231}}, color = {0, 127, 255}));
  connect(restriction11.port_a, volume6.ports[3]) annotation(
    Line(points = {{70, 92}, {54, 92}}));
  connect(restriction11.port_b, volume7.ports[1]) annotation(
    Line(points = {{86, 92}, {100, 92}}, color = {0, 127, 255}));
  connect(restriction12.port_a, volume7.ports[2]) annotation(
    Line(points = {{100, 114}, {100, 92}}, color = {0, 127, 255}));
  connect(restriction13.port_a, volume3.ports[4]) annotation(
    Line(points = {{148, 4}, {148, -50}, {5, -50}}, color = {0, 127, 255}));
  connect(restriction14.port_b, volume7.ports[3]) annotation(
    Line(points = {{100, 72}, {100, 92}}, color = {0, 127, 255}));
  connect(restriction14.port_a, volume8.ports[1]) annotation(
    Line(points = {{100, 56}, {100, 34}}, color = {0, 127, 255}));
  connect(restriction15.port_b, volume8.ports[2]) annotation(
    Line(points = {{84, 34}, {100, 34}}, color = {0, 127, 255}));
  connect(restriction18.port_a, volume3.ports[5]) annotation(
    Line(points = {{54, -12}, {54, -50}, {5, -50}}, color = {0, 127, 255}));
  connect(restriction18.port_b, volume10.ports[1]) annotation(
    Line(points = {{54, 4}, {54, 14}}, color = {0, 127, 255}));
  connect(volume10.ports[2], restriction8.port_a) annotation(
    Line(points = {{54, 14}, {54, 60}}, color = {0, 127, 255}));
  connect(restriction15.port_a, volume10.ports[3]) annotation(
    Line(points = {{68, 34}, {54, 34}, {54, 14}}, color = {0, 127, 255}));
  connect(restriction17.port_a, volume8.ports[3]) annotation(
    Line(points = {{116, 34}, {100, 34}}, color = {0, 127, 255}));
  connect(restriction17.port_b, volume9.ports[1]) annotation(
    Line(points = {{132, 34}, {148, 34}}, color = {0, 127, 255}));
  connect(restriction13.port_b, volume9.ports[2]) annotation(
    Line(points = {{148, 20}, {148, 34}}));
  connect(restriction16.port_a, volume9.ports[3]) annotation(
    Line(points = {{148, 78}, {148, 34}}, color = {0, 127, 255}));
  connect(restriction19.port_a, volume4.ports[4]) annotation(
    Line(points = {{-64, 84}, {-72, 84}, {-72, 50}, {-84, 50}}, color = {0, 127, 255}));
  connect(restriction19.port_b, volume11.ports[1]) annotation(
    Line(points = {{-48, 84}, {-39, 84}}, color = {0, 127, 255}));
  connect(restriction21.port_a, volume11.ports[2]) annotation(
    Line(points = {{-20, 112}, {-38, 112}, {-38, 84}}, color = {0, 127, 255}));
  connect(restriction20.port_a, volume11.ports[3]) annotation(
    Line(points = {{-10, 84}, {-38, 84}}, color = {0, 127, 255}));
  connect(restriction20.port_b, volume5.ports[4]) annotation(
    Line(points = {{6, 84}, {24, 84}, {24, 62}}, color = {0, 127, 255}));
  connect(restriction21.port_b, boundary2.ports[3]) annotation(
    Line(points = {{-4, 112}, {-4, 231}, {54, 231}}, color = {0, 127, 255}));
  connect(restriction22.port_a, boundary.ports[2]) annotation(
    Line(points = {{-164, 212}, {-164, 163}}, color = {0, 127, 255}));
  connect(restriction22.port_b, volume12.ports[1]) annotation(
    Line(points = {{-164, 228}, {-164, 260}}, color = {0, 127, 255}));
  connect(restriction23.port_a, volume12.ports[2]) annotation(
    Line(points = {{-104, 260}, {-164, 260}}, color = {0, 127, 255}));
  connect(restriction23.port_b, boundary2.ports[4]) annotation(
    Line(points = {{-88, 260}, {54, 260}, {54, 231}}, color = {0, 127, 255}));
  connect(valveCompressible.port_a, volume12.ports[3]) annotation(
    Line(points = {{-164, 278}, {-164, 260}}, color = {0, 127, 255}));
  connect(restriction24.port_a, volume13.ports[1]) annotation(
    Line(points = {{-144, 302}, {-164, 302}}, color = {0, 127, 255}));
  connect(valveCompressible.port_b, volume13.ports[2]) annotation(
    Line(points = {{-164, 290}, {-164, 302}}, color = {0, 127, 255}));
  connect(restriction24.port_b, boundary5.ports[1]) annotation(
    Line(points = {{-128, 302}, {-116, 302}, {-116, 325}}, color = {0, 127, 255}));
  connect(restriction25.port_b, volume14.ports[1]) annotation(
    Line(points = {{190, 70}, {206, 70}}, color = {0, 127, 255}));
  connect(restriction25.port_a, volume9.ports[4]) annotation(
    Line(points = {{174, 70}, {174, 34}, {148, 34}}, color = {0, 127, 255}));
  connect(restriction26.port_b, boundary6.ports[1]) annotation(
    Line(points = {{206, 166}, {206, 196}}, color = {0, 127, 255}));
  connect(restriction27.port_b, boundary4.ports[1]) annotation(
    Line(points = {{148, 164}, {148, 188}}, color = {0, 127, 255}));
  connect(restriction27.port_a, volume15.ports[1]) annotation(
    Line(points = {{148, 148}, {148, 114}}, color = {0, 127, 255}));
  connect(restriction16.port_b, volume15.ports[2]) annotation(
    Line(points = {{148, 94}, {148, 114}}, color = {0, 127, 255}));
  connect(restriction26.port_a, volume16.ports[1]) annotation(
    Line(points = {{206, 150}, {206, 128}}, color = {0, 127, 255}));
  connect(restriction28.port_a, volume14.ports[2]) annotation(
    Line(points = {{206, 92}, {206, 70}}, color = {0, 127, 255}));
  connect(restriction28.port_b, volume16.ports[2]) annotation(
    Line(points = {{206, 108}, {206, 128}}, color = {0, 127, 255}));
  connect(restriction29.port_b, volume16.ports[3]) annotation(
    Line(points = {{188, 114}, {206, 114}, {206, 128}}, color = {0, 127, 255}));
  connect(restriction29.port_a, volume15.ports[3]) annotation(
    Line(points = {{172, 114}, {148, 114}}, color = {0, 127, 255}));
  connect(restriction12.port_b, volume17.ports[1]) annotation(
    Line(points = {{100, 130}, {100, 148}}, color = {0, 127, 255}));
  connect(restriction30.port_a, volume17.ports[2]) annotation(
    Line(points = {{100, 170}, {100, 148}}, color = {0, 127, 255}));
  connect(restriction30.port_b, boundary3.ports[1]) annotation(
    Line(points = {{100, 186}, {100, 210}}, color = {0, 127, 255}));
  connect(restriction31.port_b, volume17.ports[3]) annotation(
    Line(points = {{118, 144}, {100, 144}, {100, 148}}, color = {0, 127, 255}));
  connect(restriction31.port_a, volume15.ports[4]) annotation(
    Line(points = {{134, 144}, {134, 114}, {148, 114}}, color = {0, 127, 255}));
  connect(restriction32.port_a, volume16.ports[4]) annotation(
    Line(points = {{230, 142}, {206, 142}, {206, 128}}, color = {0, 127, 255}));
  connect(restriction32.port_b, volume18.ports[1]) annotation(
    Line(points = {{246, 142}, {290, 142}, {290, 150}}, color = {0, 127, 255}));
  connect(restriction33.port_b, volume18.ports[2]) annotation(
    Line(points = {{290, 114}, {290, 150}}, color = {0, 127, 255}));
  connect(restriction33.port_a, volume9.ports[5]) annotation(
    Line(points = {{290, 98}, {290, 34}, {148, 34}}, color = {0, 127, 255}));
  connect(restriction35.port_a, volume18.ports[3]) annotation(
    Line(points = {{270, 168}, {270, 164}, {290, 164}, {290, 150}}, color = {0, 127, 255}));
  connect(restriction34.port_a, volume18.ports[4]) annotation(
    Line(points = {{256, 187}, {256, 158}, {290, 158}, {290, 150}}, color = {0, 127, 255}));
  connect(restriction36.port_a, volume18.ports[5]) annotation(
    Line(points = {{312, 178}, {312, 172}, {290, 172}, {290, 150}}, color = {0, 127, 255}));
  connect(restriction34.port_b, boundary7.ports[1]) annotation(
    Line(points = {{256, 199}, {256, 254}}, color = {0, 127, 255}));
  connect(restriction35.port_b, boundary8.ports[1]) annotation(
    Line(points = {{270, 180}, {270, 219}}, color = {0, 127, 255}));
  connect(restriction36.port_b, boundary9.ports[1]) annotation(
    Line(points = {{312, 190}, {312, 236}}, color = {0, 127, 255}));
  connect(volume1.ports[4], port_1) annotation(
    Line(points = {{-164, -60}, {-260, -60}}, color = {0, 127, 255}));
  connect(restriction37.port_a, volume9.ports[6]) annotation(
    Line(points = {{180, -12}, {180, 28}, {148, 28}, {148, 34}}, color = {0, 127, 255}));
  connect(restriction37.port_b, port_18) annotation(
    Line(points = {{180, -28}, {180, -100}}, color = {0, 127, 255}));
  connect(boundary2.p_in, firstOrder2.y) annotation(
    Line(points = {{74, 238}, {83, 238}, {83, 248}}, color = {0, 0, 127}));
  connect(firstOrder2.u, ramp_p_bc2.y) annotation(
    Line(points = {{83, 262.2}, {83, 269.2}}, color = {0, 0, 127}));
  connect(ramp_p_bc.y, firstOrder.u) annotation(
    Line(points = {{-211, 170}, {-205, 170}}, color = {0, 0, 127}));
  connect(firstOrder.y, boundary.p_in) annotation(
    Line(points = {{-191, 170}, {-184, 170}}, color = {0, 0, 127}));
  connect(ramp_p_bc1.y, firstOrder1.u) annotation(
    Line(points = {{-136, 164}, {-130, 164}}, color = {0, 0, 127}));
  connect(firstOrder1.y, boundary1.p_in) annotation(
    Line(points = {{-116, 164}, {-110, 164}}, color = {0, 0, 127}));
  connect(ramp_p_bc3.y, firstOrder3.u) annotation(
    Line(points = {{127, 243.4}, {127, 238.4}}, color = {0, 0, 127}));
  connect(boundary3.p_in, firstOrder3.y) annotation(
    Line(points = {{120, 216}, {127, 216}, {127, 224}}, color = {0, 0, 127}));
  connect(boundary4.p_in, firstOrder4.y) annotation(
    Line(points = {{168, 194}, {179, 194}, {179, 200}}, color = {0, 0, 127}));
  connect(ramp_p_bc4.y, firstOrder4.u) annotation(
    Line(points = {{179, 218.4}, {179, 214.4}}, color = {0, 0, 127}));
  connect(boundary6.p_in, firstOrder6.y) annotation(
    Line(points = {{226, 202}, {239, 202}, {239, 206}}, color = {0, 0, 127}));
  connect(firstOrder6.u, ramp_p_bc6.y) annotation(
    Line(points = {{239, 220}, {239, 225}}, color = {0, 0, 127}));
  connect(ramp_p_bc7.y, firstOrder7.u) annotation(
    Line(points = {{218, 260}, {222, 260}}, color = {0, 0, 127}));
  connect(firstOrder7.y, boundary7.p_in) annotation(
    Line(points = {{236, 260}, {240, 260}}, color = {0, 0, 127}));
  connect(boundary8.p_in, firstOrder8.y) annotation(
    Line(points = {{286, 224}, {291, 224}, {291, 232}}, color = {0, 0, 127}));
  connect(firstOrder8.u, ramp_p_bc8.y) annotation(
    Line(points = {{291, 246}, {291, 252}}, color = {0, 0, 127}));
  connect(boundary9.p_in, firstOrder9.y) annotation(
    Line(points = {{326, 240}, {332, 240}, {332, 248}}, color = {0, 0, 127}));
  connect(firstOrder9.u, ramp_p_bc81.y) annotation(
    Line(points = {{332, 262}, {332, 268}}, color = {0, 0, 127}));
  connect(firstOrder_valve.y, valveCompressible.opening) annotation(
    Line(points = {{-179, 284}, {-168, 284}}, color = {0, 0, 127}));
  connect(ramp_valve.y, firstOrder_valve.u) annotation(
    Line(points = {{-202, 284}, {-194, 284}}, color = {0, 0, 127}));
  connect(ramp_p_bc5.y, firstOrder5.u) annotation(
    Line(points = {{-172, 332}, {-162, 332}}, color = {0, 0, 127}));
  connect(firstOrder5.y, boundary5.p_in) annotation(
    Line(points = {{-148, 332}, {-136, 332}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-260, -100}, {340, 340}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,nonewInst -d=nonewInst -d=nonewInst -d=nonewInst -d=nonewInst",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end ComplexFNW_ex02_v01;
