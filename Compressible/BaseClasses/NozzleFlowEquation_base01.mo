within FluidSystemComponents.Compressible.BaseClasses;

model NozzleFlowEquation_base01
  //*****************************************************************
  import units = Modelica.SIunits;
  import consts = Modelica.Constants;
  /* ---------------------------------------------
  Package
  --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  
  /*-----------------------------------
  parameters
  -----------------------------------*/
  parameter Boolean allowFlowReversal = true "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)" annotation(
    Dialog(tab = "Assumptions"),
    Evaluate = true);
  //-----
  parameter units.MassFlowRate m_flow_homotopy_init=1.0 "" annotation(
    Dialog(tab = "General", group = "For convergence"));
  parameter units.Pressure dp_homotopy_init=100.0*1000.0 "" annotation(
    Dialog(tab = "General", group = "For convergence"));
  
  //--------------- initialization ---------------
  //--- fluid_1 ---
  parameter Modelica.SIunits.MassFlowRate m_flow1_init(displayUnit = "kg/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Pressure p1_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Temperature T1_init(displayUnit = "K") = 500 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.SpecificEnthalpy h1_init(displayUnit = "J/kg") = T1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  //--- fluid_2 ---
  parameter Modelica.SIunits.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Pressure p2_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Temperature T2_init(displayUnit = "K") = 300 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h2_init(displayUnit = "J/kg") = T2_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  //-----
  parameter units.Area AmechTot_init(displayUnit = "m2") = 0.01^2.0*Modelica.Constants.pi/4.0 "" annotation(
    Dialog(tab = "Initialization", group = "Component Characteristics"));
  parameter Real Cd_init = 0.8 "" annotation(
    Dialog(tab = "Initialization", group = "Component Characteristics"));
  //-----
  
  
  
  /*-----------------------------------
  internal objects
  -----------------------------------*/
  units.Area AmechTot(start=AmechTot_init);
  units.Area Aeff(start= AmechTot_init*Cd_init);
  Real Cd(start=Cd_init);
  //-----
  Real PR;
  units.PressureDifference dp;
  Boolean flagChoke;
  Real PRcr;
  Real gams_H "gamma, static, high-p side";
  //-----
  Modelica.SIunits.MassFlowRate m_flow(start = m_flow1_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.MassFlowRate m_flow_abs(start = m_flow1_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  
  //-----
  Medium.BaseProperties fluid_1(p(start = p1_init, min = 0.0 + 1.0e-10), T(start = T1_init, min = 0.0 + 1.0e-10), h(start = h1_init, min = 0.0 + 1.0e-10)) "";
  Medium.BaseProperties fluid_2(p(start = p2_init, min = 0.0 + 1.0e-10), T(start = T2_init, min = 0.0 + 1.0e-10), h(start = h2_init, min = 0.0 + 1.0e-10)) "";
  Medium.BaseProperties fluid_H(p(start = p1_init, min = 0.0 + 1.0e-10), T(start = T1_init, min = 0.0 + 1.0e-10), h(start = h1_init, min = 0.0 + 1.0e-10)) "";
  Medium.BaseProperties fluid_L(p(start = p2_init, min = 0.0 + 1.0e-10), T(start = T2_init, min = 0.0 + 1.0e-10), h(start = h2_init, min = 0.0 + 1.0e-10)) "";
  //-----
  Medium.BaseProperties fluidStat_H(p(start = p2_init, min = 0.0 + 1.0e-10), T(start = T2_init, min = 0.0 + 1.0e-10), h(start = h2_init, min = 0.0 + 1.0e-10)) "";
  
  
  /*-----------------------------------
  interfaces
  -----------------------------------*/
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium = Medium, m_flow(start = m_flow1_init, min = if allowFlowReversal then -consts.inf else 0.0), h_outflow(start = h1_init, min = 0.0 + 1.0e-10), p(start = p1_init, min = 0.0 + 1.0e-10)) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(redeclare package Medium = Medium, m_flow(start = m_flow2_init, max = if allowFlowReversal then +consts.inf else 0.0), h_outflow(start = h2_init, min = 0.0 + 1.0e-10), p(start = p2_init, min = 0.0 + 1.0e-10)) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
/* ******************************************************************************** */
equation
//-- fluidPort_1 --
  fluid_1.p = port_1.p;
  fluid_1.h = actualStream(port_1.h_outflow);
  fluid_1.Xi = actualStream(port_1.Xi_outflow);
//-- fluidPort_2 --
  fluid_2.p = port_2.p;
  fluid_2.h = actualStream(port_2.h_outflow);
  fluid_2.Xi = actualStream(port_2.Xi_outflow);
//-----
  if allowFlowReversal == false then
// fluid_1 is upstream side
    port_1.h_outflow = fluid_1.h;
    port_1.Xi_outflow = fluid_1.Xi;
//-----
    fluid_H.p = fluid_1.p;
    fluid_H.h = fluid_1.h;
    fluid_H.Xi = fluid_1.Xi;
    fluid_L.p = fluid_2.p;
    fluid_L.h = fluid_2.h;
    fluid_L.Xi = fluid_2.Xi;
  else
    if fluid_1.p > fluid_2.p then
// fluid_1 is upstream side
      port_1.h_outflow = fluid_1.h;
      port_1.Xi_outflow = fluid_1.Xi;
//-----
      fluid_H.p = fluid_1.p;
      fluid_H.h = fluid_1.h;
      fluid_H.Xi = fluid_1.Xi;
      fluid_L.p = fluid_2.p;
      fluid_L.h = fluid_2.h;
      fluid_L.Xi = fluid_2.Xi;
    else
// fluid_2 is upstream side
      port_2.h_outflow = fluid_2.h;
      port_2.Xi_outflow = fluid_2.Xi;
//-----
      fluid_H.p = fluid_2.p;
      fluid_H.h = fluid_2.h;
      fluid_H.Xi = fluid_2.Xi;
      fluid_L.p = fluid_1.p;
      fluid_L.h = fluid_1.h;
      fluid_L.Xi = fluid_1.Xi;
    end if;
  end if;
//****************************************
  Aeff = AmechTot * Cd;
  m_flow=port_1.m_flow;
//-- conservation of mass --
  port_1.m_flow + port_2.m_flow = 0;
  fluid_2.Xi = fluid_1.Xi;
//-- conservation of energy --
  port_1.m_flow * fluid_1.h + port_2.m_flow * fluid_2.h = 0;
//---
  PR = fluid_H.p / fluid_L.p;
  dp = fluid_H.p - fluid_L.p;
//---
  fluidStat_H.p = fluid_L.p;
  fluidStat_H.Xi= fluid_L.Xi;
  fluidStat_H.h = Medium.isentropicEnthalpy(fluid_L.p, fluid_H.state);
  gams_H = Medium.specificHeatCapacityCp(fluidStat_H.state) / Medium.specificHeatCapacityCv(fluidStat_H.state);
  PRcr = ((gams_H + 1.0) / 2.0) ^ (gams_H / (gams_H - 1.0));
  m_flow_abs= FluidSystemComponents.Compressible.Function.IsentropicExpandingFlow01(Aeff=Aeff, pH_in=fluid_H.p, Th_in=fluid_H.T, pL_in=fluid_L.p, Rg=fluidStat_H.R, gamma=gams_H);
  m_flow= homotopy( sign(port_1.m_flow)*m_flow_abs, sign(port_1.m_flow)*dp/dp_homotopy_init*m_flow_homotopy_init);
//-----
  if PR < PRcr then
    flagChoke = false;
  else
    flagChoke = true;
  end if;
  /*
  if PR < PRcr then
    flagChoke = false;
    [m_flow_abs]= FluidSystemComponents.Compressible.Function.IsentropicExpandingFlow01(Aeff=Aeff, pH=fluid_H.p, Th=fluid_H.T, pL=fluid_L.p, Rg=fluidStat_H.R, gamma=gams_H);
    
    m_flow = homotopy(Aeff * fluid_H.p / sqrt(fluid_H.T) * sqrt(2.0 * gams_H / (fluidStat_H.R * (gams_H - 1.0)) * ((fluid_L.p / fluid_H.p) ^ (2.0 / gams_H) - (fluid_L.p / fluid_H.p) ^ ((gams_H + 1.0) / gams_H))),
      dp/dp_homotopy_init*m_flow_homotopy_init);
  else
    flagChoke = true;
    m_flow = homotopy(Aeff * fluid_H.p / sqrt(fluidStat_H.R * fluid_H.T) * sqrt(gams_H) * ((gams_H + 1.0) / 2.0) ^ (-1.0 * (gams_H + 1.0) / (2.0 * (gams_H - 1.0))),
      dp/dp_homotopy_init*m_flow_homotopy_init);
  end if;
  */
  annotation(
    Diagram,
    Icon(graphics = {Line(origin = {-2, 35.21}, points = {{-77.9965, 14.7929}, {-47.9965, -15.2071}, {-17.9965, -15.2071}, {22.0035, -15.2071}, {52.0035, -15.2071}, {82.0035, 14.7929}}, thickness = 2), Line(origin = {-2, -35.2}, points = {{-77.9964, -14.7964}, {-47.9964, 15.2036}, {-19.9964, 15.2036}, {22.0036, 15.2036}, {52.0036, 15.2036}, {82.0036, -14.7964}}, thickness = 2), Line(origin = {46.67, 0}, points = {{33, 0}, {51, 0}}, thickness = 2), Line(origin = {-53.33, 0}, points = {{-45, 0}, {-27, 0}}, thickness = 2), Line(origin = {-15.05, 1.24}, points = {{-45, -2}, {75, -2}}, pattern = LinePattern.Dash, thickness = 2)}));


end NozzleFlowEquation_base01;
