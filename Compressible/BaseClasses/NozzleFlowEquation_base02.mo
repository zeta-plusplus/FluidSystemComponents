within FluidSystemComponents.Compressible.BaseClasses;

model NozzleFlowEquation_base02
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
  parameter Real PRsmall=1.0001;
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
  Real PRabs;
  units.PressureDifference dp;
  units.PressureDifference dpAbs;
  Boolean flagChoke;
  Real PRcr;
  //Real gams_H "gamma, static, high-p side";
  Real gamtH "";
  Real gamtL "";
  //-----
  units.MassFlowRate m_flow(start = m_flow1_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.MassFlowRate m_flow_abs(start = m_flow1_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  
  units.Pressure pH;
  units.Temperature Th;
  units.Pressure pL;
  units.SpecificHeatCapacity Rg;
  units.Pressure pHsmall;
  Real inSqrtSmall;
  
  //-----
  Medium.BaseProperties fluid_1(p(start = p1_init, min = 0.0 + 1.0e-10), T(start = T1_init, min = 0.0 + 1.0e-10), h(start = h1_init, min = 0.0 + 1.0e-10)) "";
  Medium.BaseProperties fluid_2(p(start = p2_init, min = 0.0 + 1.0e-10), T(start = T2_init, min = 0.0 + 1.0e-10), h(start = h2_init, min = 0.0 + 1.0e-10)) "";
  
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
  
  pH=noEvent(if port_1.p>=port_2.p then fluid_1.p else fluid_2.p);
  Th=noEvent(if port_1.p>=port_2.p then fluid_1.T else fluid_2.T);
  Rg=noEvent(if port_1.p>=port_2.p then fluid_1.R else fluid_2.R);
  gamtH=noEvent(if port_1.p>=port_2.p then Medium.specificHeatCapacityCp(fluid_1.state) / Medium.specificHeatCapacityCv(fluid_1.state)
                  else Medium.specificHeatCapacityCp(fluid_2.state) / Medium.specificHeatCapacityCv(fluid_2.state) );
  
  pL=noEvent(if port_1.p>=port_2.p then fluid_2.p else fluid_1.p);
  gamtL=noEvent(if port_1.p>=port_2.p then Medium.specificHeatCapacityCp(fluid_2.state) / Medium.specificHeatCapacityCv(fluid_2.state)
                  else Medium.specificHeatCapacityCp(fluid_1.state) / Medium.specificHeatCapacityCv(fluid_1.state) );
  

  /**/
  if allowFlowReversal == false then
// fluid_1 is upstream side
    port_1.h_outflow = fluid_1.h;
    port_1.Xi_outflow = fluid_1.Xi;
  else
    if fluid_1.p > fluid_2.p then
// fluid_1 is upstream side
      port_1.h_outflow = fluid_1.h;
      port_1.Xi_outflow = fluid_1.Xi;
    else
// fluid_2 is upstream side
      port_2.h_outflow = fluid_2.h;
      port_2.Xi_outflow = fluid_2.Xi;
    end if;
  end if;
  
//****************************************
  Aeff = AmechTot * Cd;
  m_flow= port_1.m_flow;
//-- conservation of mass --
  port_1.m_flow + port_2.m_flow = 0;
  fluid_2.Xi = fluid_1.Xi;
//-- conservation of energy --
  port_1.m_flow * fluid_1.h + port_2.m_flow * fluid_2.h = 0;
//---
  PR= fluid_1.p / fluid_2.p;
  PRabs= pH/pL;
  dp = fluid_1.p - fluid_2.p;
  dpAbs= pH - pL;
//---
  //PRcr = ((gamtH + 1.0) / 2.0) ^ (gamtH / (gamtH - 1.0+ 1e-9));
  PRcr=FluidSystemComponents.Compressible.Function.CriticalPressureRatio(gamma_in=gamtH);
  pHsmall= pL*PRsmall;
  
  inSqrtSmall= 2.0 * gamtH / (Th* Rg * (gamtH - 1.0+ Modelica.Constants.small)) * ((pL / pHsmall) ^ (2.0 / gamtH) - (pL / pHsmall) ^ ((gamtH + 1.0) / gamtH));
                                                              
  //-----
  if PRabs < PRcr then
    flagChoke = false;
    m_flow_abs= homotopy( Aeff * pH * Modelica.Fluid.Utilities.regRoot2( x=(  2.0 * gamtH / (Th* Rg * (gamtH - 1.0+ Modelica.Constants.small)) * ((pL / pH) ^ (2.0 / gamtH) - (pL / pH) ^ ((gamtH + 1.0) / gamtH))), 
                                                              x_small=inSqrtSmall ),
                          dp*m_flow_homotopy_init/dp_homotopy_init );
    
    m_flow= homotopy( sign(dp)* Aeff * pH * Modelica.Fluid.Utilities.regRoot2( x=(  2.0 * gamtH / (Th* Rg * (gamtH - 1.0+ Modelica.Constants.small)) * ((pL / pH) ^ (2.0 / gamtH) - (pL / pH) ^ ((gamtH + 1.0) / gamtH))), 
                                                              x_small=inSqrtSmall ),
                          dp*m_flow_homotopy_init/dp_homotopy_init );
  else
    flagChoke = true;
    m_flow_abs= homotopy( Aeff * pH / sqrt(Rg * Th) * sqrt(gamtH) * ((gamtH + 1.0) / 2.0) ^ (-1.0 * (gamtH + 1.0) / (2.0 * (gamtH - 1.0+ Modelica.Constants.small))),
                    dp*m_flow_homotopy_init/dp_homotopy_init );
                    
    m_flow= homotopy( sign(dp)* Aeff * pH / sqrt(Rg * Th) * sqrt(gamtH) * ((gamtH + 1.0) / 2.0) ^ (-1.0 * (gamtH + 1.0) / (2.0 * (gamtH - 1.0+ Modelica.Constants.small))), 
                    dp*m_flow_homotopy_init/dp_homotopy_init );
  end if;
  
  annotation(
    Diagram,
    Icon(graphics = {Line(origin = {-2, 35.21}, points = {{-77.9965, 14.7929}, {-47.9965, -15.2071}, {-17.9965, -15.2071}, {22.0035, -15.2071}, {52.0035, -15.2071}, {82.0035, 14.7929}}, thickness = 2), Line(origin = {-2, -35.2}, points = {{-77.9964, -14.7964}, {-47.9964, 15.2036}, {-19.9964, 15.2036}, {22.0036, 15.2036}, {52.0036, 15.2036}, {82.0036, -14.7964}}, thickness = 2), Line(origin = {46.67, 0}, points = {{33, 0}, {51, 0}}, thickness = 2), Line(origin = {-53.33, 0}, points = {{-45, 0}, {-27, 0}}, thickness = 2), Line(origin = {-15.05, 1.24}, points = {{-45, -2}, {75, -2}}, pattern = LinePattern.Dash, thickness = 2)}));


end NozzleFlowEquation_base02;
