within FluidSystemComponents.Compressible.BaseClasses;

partial model NozzleFlowEquation_base03
  extends Modelica.Fluid.Interfaces.PartialTwoPortTransport(allowFlowReversal = true, showDesignFlowDirection = false);
  //*****************************************************************
  import units = Modelica.Units.SI;
  import consts = Modelica.Constants;
  /*-----------------------------------
      parameters
      -----------------------------------*/
  parameter units.MassFlowRate m_flow_homotopy_init = 1.0 "" annotation(
    Dialog(tab = "General", group = "For initial convergence"));
  parameter units.Pressure dp_homotopy_init = 100.0*1000.0 "" annotation(
    Dialog(tab = "General", group = "For initial convergence"));
  parameter Real PRsmall = 1.00001;
  //-----
  parameter Integer significantDigits_m_flow(min = 1) = 4 "Number of significant digits to be shown";
  //-----
  parameter units.MassFlowRate m_flow_Min = 0.001;
  parameter units.MassFlowRate m_flow_Max = 10;
  parameter Real thickArrowMin = 0.001;
  parameter Real thickArrowMax = 40;
  
  //----------------------------------------
  // variable
  //----------------------------------------
  
  
  
  
  /*-----------------------------------
      internal objects
      -----------------------------------*/
  units.Area AmechTot;
  units.Area Aeff;
  Real Cd;
  //-----
  Real PR;
  Real PRinv;
  Real PRabs;
  units.PressureDifference dpAbs;
  Boolean flagChoke;
  Boolean flagClosed;
  Real PRcr;
  Real PRcrInv;
  //Real gams_H "gamma, static, high-p side";
  Real gamtH "";
  Real gamtL "";
  //-----
  units.MassFlowRate m_flow_abs(start = m_flow_homotopy_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  //-----
  units.Pressure pH;
  units.Temperature Th;
  units.SpecificEnthalpy hH;
  units.MassFraction Xh[Medium.nXi];
  units.Pressure pL;
  units.SpecificEnthalpy hL;
  units.Temperature Tl;
  units.MassFraction Xl[Medium.nXi];
  units.SpecificEnthalpy hsTh;
  units.Density rhoTh;
  units.SpecificHeatCapacity Rg;
  units.Pressure pHsmall;
  Real inSqrtSmall;
  units.Velocity Vth;
  
  //-----
  Real thickArrowFwd;
  Real thickArrowBwd;
  Real sizeArrowFwd;
  Real sizeArrowBwd;
  
  
  //----------
  Medium.BaseProperties fluid_a(p(min = 0.0 + 1.0e-10), T(min = 0.0 + 1.0e-10), h(min = 0.0 + 1.0e-10)) "";
  Medium.BaseProperties fluid_b(p(min = 0.0 + 1.0e-10), T(min = 0.0 + 1.0e-10), h(min = 0.0 + 1.0e-10)) "";
  
  //************************************************************
algorithm
  //************************************************************
equation
  fluid_a.state = state_a;
  fluid_b.state = state_b;
//-----
  pH = noEvent(if port_a.p >= port_b.p then state_a.p else state_b.p);
  Th = noEvent(if port_a.p >= port_b.p then state_a.T else state_b.T);
  hH = noEvent(if port_a.p >= port_b.p then Medium.specificEnthalpy(state_a) else Medium.specificEnthalpy(state_b));
  Xh=  noEvent(if port_a.p >= port_b.p then inStream(port_a.Xi_outflow) else inStream(port_b.Xi_outflow)); 
  Rg = noEvent(if port_a.p >= port_b.p then fluid_a.R_s else fluid_b.R_s);
  gamtH = noEvent(if port_a.p >= port_b.p then Medium.specificHeatCapacityCp(state_a)/Medium.specificHeatCapacityCv(state_a) else Medium.specificHeatCapacityCp(state_b)/Medium.specificHeatCapacityCv(state_b));
  pL = noEvent(if port_a.p >= port_b.p then state_b.p else state_a.p);
  Tl = noEvent(if port_a.p >= port_b.p then state_b.T else state_a.T);
  hL = noEvent(if port_a.p >= port_b.p then Medium.specificEnthalpy(state_b) else Medium.specificEnthalpy(state_a));
  Xh=  noEvent(if port_a.p >= port_b.p then inStream(port_b.Xi_outflow) else inStream(port_a.Xi_outflow));
  gamtL = noEvent(if port_a.p >= port_b.p then Medium.specificHeatCapacityCp(state_b)/Medium.specificHeatCapacityCv(state_b) else Medium.specificHeatCapacityCp(state_a)/Medium.specificHeatCapacityCv(state_a));

  rhoTh= Medium.density(Medium.setState_pTX(pL, Th, Xh));
  
//-----
  
//-----
  PR = state_a.p/state_b.p;
  PRabs = pH/pL;
  dpAbs = pH - pL;
  
  PRinv = 1.0/PR;
  PRcrInv = 1.0/PRcr;
// Isenthalpic state transformation (no storage and no loss of energy)
  port_a.h_outflow = inStream(port_b.h_outflow);
  port_b.h_outflow = inStream(port_a.h_outflow);
//-----
  PRcr = FluidSystemComponents.Compressible.Function.CriticalPressureRatio(gamma_in = gamtH);
  pHsmall = pL*PRsmall;
  inSqrtSmall = 2.0*gamtH/(Th*Rg*(gamtH - 1.0 + Modelica.Constants.small))*((pL/pHsmall)^(2.0/gamtH) - (pL/pHsmall)^((gamtH + 1.0)/gamtH));
  
  
//---------------
  if(flagClosed==false)then
    Aeff = abs(AmechTot*Cd);
    hH = hsTh + 1/2*Vth^2;
    Vth= V_flow/Aeff;
    
    if PRabs < PRcr then
      flagChoke = false;
      m_flow_abs = homotopy(Aeff*pH*Modelica.Fluid.Utilities.regRoot2(x = (2.0*gamtH/(Th*Rg*(gamtH - 1.0 + Modelica.Constants.small))*((pL/pH)^(2.0/gamtH) - (pL/pH)^((gamtH + 1.0)/gamtH))), x_small = inSqrtSmall), dp*m_flow_homotopy_init/dp_homotopy_init);
      m_flow = homotopy(sign(dp)*Aeff*pH*Modelica.Fluid.Utilities.regRoot2(x = (2.0*gamtH/(Th*Rg*(gamtH - 1.0 + Modelica.Constants.small))*((pL/pH)^(2.0/gamtH) - (pL/pH)^((gamtH + 1.0)/gamtH))), x_small = inSqrtSmall), dp*m_flow_homotopy_init/dp_homotopy_init);
    else
      flagChoke = true;
      m_flow_abs = homotopy(Aeff*pH/sqrt(Rg*Th)*sqrt(gamtH)*((gamtH + 1.0)/2.0)^(-1.0*(gamtH + 1.0)/(2.0*(gamtH - 1.0 + Modelica.Constants.small))), dp*m_flow_homotopy_init/dp_homotopy_init);
      m_flow = homotopy(sign(dp)*Aeff*pH/sqrt(Rg*Th)*sqrt(gamtH)*((gamtH + 1.0)/2.0)^(-1.0*(gamtH + 1.0)/(2.0*(gamtH - 1.0 + Modelica.Constants.small))), dp*m_flow_homotopy_init/dp_homotopy_init);
    end if;
  else
    Aeff = 0.0;
    hH = hsTh;
    Vth= 0.0;
    flagChoke = false;
    m_flow_abs =0.0;
    m_flow =0.0;
  end if;
  
  
  //--------------------
  if (0 <= m_flow) then
    thickArrowFwd = max(thickArrowMin, min(thickArrowMax, thickArrowMin + m_flow*(thickArrowMax - thickArrowMin)/(m_flow_Max - m_flow_Min)));
    sizeArrowFwd = 3.5*thickArrowFwd;
    thickArrowBwd = 0.0;
    sizeArrowBwd = 0.0;
  else
    thickArrowBwd = max(thickArrowMin, min(thickArrowMax, thickArrowMin + abs(m_flow)*(thickArrowMax - thickArrowMin)/(m_flow_Max - m_flow_Min)));
    sizeArrowBwd = 3.5*thickArrowBwd;
    thickArrowFwd = 0.0;
    sizeArrowFwd = 0.0;
  end if;
  
  //************************************************************
  annotation(
    defaultComponentName = "restriction",
    Icon(graphics = {Line(origin = {-2, 45.21}, points = {{-77.9965, 14.7929}, {-47.9965, -15.2071}, {-17.9965, -15.2071}, {22.0035, -15.2071}, {52.0035, -15.2071}, {82.0035, 14.7929}}, thickness = 4), Line(origin = {-2, -45.24}, points = {{-77.9964, -14.7964}, {-47.9964, 15.2036}, {-19.9964, 15.2036}, {22.0036, 15.2036}, {52.0036, 15.2036}, {82.0036, -14.7964}}, thickness = 4), Line(origin = {-2.8, -0.42}, points = {{-100, 0}, {90, 0}}, color = {0, 0, 255}, thickness = DynamicSelect(3, thickArrowFwd), arrow = {Arrow.None, Arrow.Open}, arrowSize = DynamicSelect(14, sizeArrowFwd)), Line(origin = {-177.049, -0.954371}, points = {{270, 0}, {90, 0}}, color = {0, 0, 255}, pattern = LinePattern.Dash, thickness = DynamicSelect(0.25, thickArrowBwd), arrow = {Arrow.None, Arrow.Open}, arrowSize = DynamicSelect(0, sizeArrowBwd)), Text(origin = {0, 85}, extent = {{-100, 11}, {100, -11}}, textString = DynamicSelect("0.0", String(m_flow, significantDigits_m_flow, 0, true))), Text(origin = {20, 60}, extent = {{-20, 6}, {20, -6}}, textString = "kg/s", horizontalAlignment = TextAlignment.Right)}, coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
    
    
    
end NozzleFlowEquation_base03;
