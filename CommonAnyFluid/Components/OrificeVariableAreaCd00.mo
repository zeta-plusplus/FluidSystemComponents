within FluidSystemComponents.CommonAnyFluid.Components;

model OrificeVariableAreaCd00
  /********************************************************
            imports
      ********************************************************/
  import Modelica.Constants;
  import Modelica.Utilities.Streams;
  import PropulsionSystem.Types.switches;
  /********************************************************
                   Declaration
      ********************************************************/
  /* ---------------------------------------------
          switch
      --------------------------------------------- */
  parameter Boolean allowFlowReversal = false "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)" annotation(
    Dialog(tab = "Assumptions"),
    Evaluate = true);
  parameter Boolean isCircular=true
    "= true if cross sectional area is circular"
    annotation (Evaluate, Dialog(tab="General", group="Geometry"));
  
  /* ---------------------------------------------
          Package
      --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  /* ---------------------------------------------
          parameters
      --------------------------------------------- */
  //********** Initialization Parameters **********
  //--- fluid_1, port_1 ---
  parameter Modelica.SIunits.MassFlowRate m_flow1_init(displayUnit = "kg/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Pressure p1_init(displayUnit = "Pa") = PR_init * p2_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Temperature T1_init(displayUnit = "K") = 500 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.SpecificEnthalpy h1_init(displayUnit = "J/kg") = T1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  //--- fluid_2, port_2 ---
  parameter Modelica.SIunits.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Pressure p2_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Temperature T2_init(displayUnit = "K") = 300 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h2_init(displayUnit = "J/kg") = T2_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  //--- others ---
  parameter Real zeta_init = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Real Cd_init = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Real PR_init = 1.5 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.Pressure dp_init(displayUnit = "Pa") = 100.0 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.Velocity Vth_init = 100.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.SpecificEntropy s_fluid_1_init = 6800.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.SpecificEntropy s_fluid_2_init = 7000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  //********** Design Parameters **********
  parameter Modelica.SIunits.Length diam_paramInput=0.01 "diameter, valid if isCircular==true" annotation(
    Dialog(group = "Geometory"));
  parameter Modelica.SIunits.Area AmechTh_paramInput = Modelica.Constants.pi / 4.0 * diam_paramInput ^ 2 "mechanical area of 'throat', valid if isCircular==false" annotation(
    Dialog(group = "Geometory"));
  /* ---------------------------------------------
          Internal variables
      --------------------------------------------- */
  Modelica.SIunits.MassFlowRate m_flow_max(start = m_flow1_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.MassFlowRate m_flow_min(start = m_flow2_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real zeta(start = zeta_init) "pressure drop coefficient" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real Cd(start = Cd_init) "pressure drop coefficient" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real PR(start = PR_init) "pressure ratio" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Pressure dp(start = dp_init) "pressure difference" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Velocity Vth(start = Vth_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Area AmechTh(start = AmechTh_paramInput) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Area AactualTh(start = AmechTh_paramInput) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.SpecificEntropy s_fluid_1(start = s_fluid_1_init) "specific entropy, fluid_1" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.SpecificEntropy s_fluid_2(start = s_fluid_2_init) "specific entropy, fluid_2" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  /* ---------------------------------------------
          Internal objects
      --------------------------------------------- */
  Medium.BaseProperties fluid_1(p(start = p1_init, min = 0.0 + 1.0e-10), T(start = T1_init, min = 0.0 + 1.0e-10), state.p(start = p1_init, min = 0.0 + 1.0e-10), state.T(start = T1_init, min = 0.0 + 1.0e-10), h(start = h1_init, min = 0.0 + 1.0e-10)) "flow station of inlet";
  Medium.BaseProperties fluid_2(p(start = p2_init, min = 0.0 + 1.0e-10), T(start = T2_init, min = 0.0 + 1.0e-10), state.p(start = p2_init, min = 0.0 + 1.0e-10), state.T(start = T2_init, min = 0.0 + 1.0e-10), h(start = h2_init, min = 0.0 + 1.0e-10)) "flow station of outlet (ambient)";
  /* ---------------------------------------------
          Interface
      --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium = Medium, m_flow(start = m_flow1_init, min = if allowFlowReversal then -Constants.inf else 0.0), h_outflow(start = h1_init, min = 0.0 + 1.0e-10), p(start = p1_init, min = 0.0 + 1.0e-10)) "Exit of nozzle, pipe, etc, total state" annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(redeclare package Medium = Medium, m_flow(start = m_flow2_init, max = if allowFlowReversal then +Constants.inf else 0.0), h_outflow(start = h2_init, min = 0.0 + 1.0e-10), p(start = p2_init, min = 0.0 + 1.0e-10)) "ambient, static state" annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Types.InfoBus infoBus1 annotation(
    Placement(visible = true, transformation(origin = {100, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_Cd annotation(
    Placement(visible = true, transformation(origin = {-50, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  input Modelica.Blocks.Interfaces.RealInput u_kArea annotation(
    Placement(visible = true, transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-20, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  //********************************************************************************
equation
/* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
//-- fluidPort_1 --
  fluid_1.p = port_1.p;
  fluid_1.h = actualStream(port_1.h_outflow);
  fluid_1.Xi = actualStream(port_1.Xi_outflow);
//-- fluidPort_2 --
  fluid_2.p = port_2.p;
  fluid_2.h = actualStream(port_2.h_outflow);
  fluid_2.Xi = actualStream(port_2.Xi_outflow);
// distinguish inlet side
  m_flow_max = max(port_1.m_flow, port_2.m_flow);
  m_flow_min = min(port_1.m_flow, port_2.m_flow);
  if allowFlowReversal == false then
    port_1.h_outflow = fluid_1.h;
    port_1.Xi_outflow = fluid_1.Xi;
  else
    if m_flow_max == port_1.m_flow then
      port_1.h_outflow = fluid_1.h;
      port_1.Xi_outflow = fluid_1.Xi;
    elseif m_flow_max == port_2.m_flow then
      port_2.h_outflow = fluid_2.h;
      port_2.Xi_outflow = fluid_2.Xi;
    else
      port_1.h_outflow = fluid_1.h;
      port_1.Xi_outflow = fluid_1.Xi;
    end if;
  end if;
  Cd = u_Cd;
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
//-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0;
  fluid_2.Xi = fluid_1.Xi;
  port_1.C_outflow = inStream(port_2.C_outflow);
  port_2.C_outflow = inStream(port_1.C_outflow);
//-- energy conservation --
  port_1.m_flow * fluid_1.h + port_2.m_flow * fluid_2.h = 0;
//-- flow at throat --
  if(isCircular==true)then
    AmechTh= u_kArea* Modelica.Constants.pi/4.0*diam_paramInput^2.0;
  else
    AmechTh = u_kArea * AmechTh_paramInput;
  end if;
  AactualTh= AmechTh*Cd;
  if m_flow_max == port_2.m_flow then
    port_2.m_flow = fluid_2.d * Vth * AactualTh;
//-- pressure loss --
    PR = fluid_2.p / fluid_1.p;
    dp = fluid_2.p - fluid_1.p;
    dp = 1.0 / 2.0 * fluid_2.d * (port_2.m_flow / fluid_2.d / AactualTh) ^ 2.0;
    dp = zeta * 1.0 / 2.0 * fluid_2.d * (port_2.m_flow / fluid_2.d / AmechTh) ^ 2.0;
  else
    port_1.m_flow = fluid_1.d * Vth * AactualTh;
//-- pressure loss --
    PR = fluid_1.p / fluid_2.p;
    dp = fluid_1.p - fluid_2.p;
    dp = 1.0 / 2.0 * fluid_1.d * (port_1.m_flow / fluid_1.d / AactualTh) ^ 2.0;
    dp = zeta * 1.0 / 2.0 * fluid_1.d * (port_1.m_flow / fluid_1.d / AmechTh) ^ 2.0;
  end if;
//-- others --
  s_fluid_1 = Medium.specificEntropy(fluid_1.state);
  s_fluid_2 = Medium.specificEntropy(fluid_2.state);
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Orifice",
    Icon(graphics = {Line(origin = {0.28, 0.34}, points = {{-98, 0}, {98, 0}}, thickness = 2.5), Line(origin = {7.21475, -33.3026}, rotation = 180, points = {{-71.2818, -1.5067}, {-63.2818, -7.50673}, {-53.2818, -11.5067}, {-41.2818, -15.5067}, {-27.2818, -19.5067}, {-11.2818, -21.5067}, {0.7182, -21.5067}, {12.7182, -21.5067}, {26.7182, -21.5067}, {38.7182, -19.5067}, {48.7182, -17.5067}, {60.7182, -13.5067}, {70.7182, -9.5067}, {80.7182, -5.5067}, {86.7182, -1.5067}}, thickness = 2), Line(origin = {3.22, -22.26}, points = {{-11.2064, 61.7936}, {-83.2064, -50.2064}, {-83.2064, -80.2064}}, thickness = 1.5, arrow = {Arrow.Filled, Arrow.None}, arrowSize = 6), Text(origin = {-77, -80}, extent = {{1, 8}, {35, -12}}, textString = "Cd"), Text(origin = {0, 90}, extent = {{-100, 10}, {100, -10}}, textString = "%name"), Line(origin = {63.37, -22.24}, points = {{-11.2064, 61.7936}, {-83.2064, -56.2064}, {-83.2064, -80.2064}}, thickness = 1.5, arrow = {Arrow.Filled, Arrow.None}, arrowSize = 6), Text(origin = {19, -68}, extent = {{-23, 8}, {35, -12}}, textString = "kArea"), Line(origin = {-8.7853, 36.4204}, points = {{-71.2818, -1.5067}, {-61.2818, -7.50673}, {-53.2818, -11.5067}, {-41.2818, -15.5067}, {-27.2818, -19.5067}, {-11.2818, -21.5067}, {0.7182, -21.5067}, {12.7182, -21.5067}, {26.7182, -21.5067}, {38.7182, -19.5067}, {48.7182, -17.5067}, {58.7182, -15.5067}, {68.7182, -11.5067}, {78.7182, -7.5067}, {88.7182, -1.5067}}, thickness = 2), Line(origin = {-1, 68.92}, points = {{-39, 0}, {39, 0}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Half}, arrowSize = 5)}, coordinateSystem(initialScale = 0.1)));
end OrificeVariableAreaCd00;
