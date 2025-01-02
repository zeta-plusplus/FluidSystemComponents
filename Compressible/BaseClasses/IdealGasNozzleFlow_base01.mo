within FluidSystemComponents.Compressible.BaseClasses;

partial model IdealGasNozzleFlow_base01
  extends Modelica.Fluid.Interfaces.PartialTwoPortTransport(allowFlowReversal = true, showDesignFlowDirection = false);
  //*****************************************************************
  import units = Modelica.Units.SI;
  import consts = Modelica.Constants;
  /*-----------------------------------
          parameters
          -----------------------------------*/
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
  //-----
  units.MassFlowRate m_flow;
  units.MassFlowRate m_flow_abs;
  //-----
  units.Pressure pH;
  units.Temperature Th;
  units.MassFraction Xh[Medium.nXi];
  
  units.Pressure pL;
  units.Temperature Tl;
  units.MassFraction Xl[Medium.nXi];
  
  units.SpecificHeatCapacity R_s;
  Real gamma;
  
  units.Pressure pLcalc;
  
  Real PR;
  Real PRinv;
  Real PRabs;
  Real PRinvAbs;
  Real PRcritical;
  Real PRcriticalInv;
  //-----
  
  Real thickArrowFwd;
  Real thickArrowBwd;
  Real sizeArrowFwd;
  Real sizeArrowBwd;
  /*
  Real temp;
  */
  //----------
  Medium.BaseProperties fluid_a "";
  Medium.BaseProperties fluid_b "";
  //************************************************************
algorithm
  //
  Aeff:= AmechTot*Cd;
  
  pH := noEvent(if port_a.p >= port_b.p then state_a.p else state_b.p);
  Th := noEvent(if port_a.p >= port_b.p then state_a.T else state_b.T);
  Xh := noEvent(if port_a.p >= port_b.p then inStream(port_a.Xi_outflow) else inStream(port_b.Xi_outflow));
  
  pL := noEvent(if port_a.p >= port_b.p then state_b.p else state_a.p);
  Tl := noEvent(if port_a.p >= port_b.p then state_b.T else state_a.T);
  Xl := noEvent(if port_a.p >= port_b.p then inStream(port_b.Xi_outflow) else inStream(port_a.Xi_outflow));
  
  R_s := noEvent(if port_a.p >= port_b.p then fluid_a.R_s else fluid_b.R_s);
  gamma := noEvent(if port_a.p >= port_b.p then Medium.specificHeatCapacityCp(state_a)/Medium.specificHeatCapacityCv(state_a) else Medium.specificHeatCapacityCp(state_b)/Medium.specificHeatCapacityCv(state_b));
  
  //
  PR:= fluid_a.p/fluid_b.p;
  PRinv:= 1/PR;
  PRabs:= pH/pL;
  PRinvAbs:= 1/PRabs;
  
  PRcritical:= ((gamma+1)/2)^(gamma/(gamma-1));
  PRcriticalInv:= 1/PRcritical;
  
  if(PRcritical<PRabs)then
    pLcalc:=pH/PRcritical;
  else
    pLcalc:=pL;
  end if;
  
  m_flow_abs:= Aeff*pH/sqrt(Th)*sqrt(2*gamma/(R_s*(gamma-1))*((pLcalc/pH)^(2/gamma)-(pLcalc/pH)^((gamma+1)/gamma)));
  
  
  if(fluid_b.p<=fluid_a.p)then
    m_flow:= m_flow_abs;
    
  else
    m_flow:= -1*m_flow_abs;
  end if;
  
  /*
  */
  
//************************************************************
equation
  fluid_a.state = state_a;
  fluid_b.state = state_b;
//-----
  port_a.h_outflow = inStream(port_b.h_outflow);
  port_b.h_outflow = inStream(port_a.h_outflow);
    
//---------------
  
  if (0 < m_flow) then
    thickArrowFwd = max(thickArrowMin, min(thickArrowMax, thickArrowMin + m_flow*(thickArrowMax - thickArrowMin)/(m_flow_Max - m_flow_Min)));
    sizeArrowFwd = 3.5*thickArrowFwd;
    thickArrowBwd = 0.0;
    sizeArrowBwd = 0.0;
  
  elseif(m_flow < 0) then
    thickArrowBwd = max(thickArrowMin, min(thickArrowMax, thickArrowMin + abs(m_flow)*(thickArrowMax - thickArrowMin)/(m_flow_Max - m_flow_Min)));
    sizeArrowBwd = 3.5*thickArrowBwd;
    thickArrowFwd = 0.0;
    sizeArrowFwd = 0.0;
  else
    thickArrowFwd = thickArrowMin;
    sizeArrowFwd = 3.5*thickArrowFwd;
    thickArrowBwd = 0.0;
    sizeArrowBwd = 0.0;
  end if;
  /**/
  
//************************************************************
  annotation(
    defaultComponentName = "restriction",
    Icon(graphics = {Line(origin = {-2, 45.21}, points = {{-77.9965, 14.7929}, {-47.9965, -15.2071}, {-17.9965, -15.2071}, {22.0035, -15.2071}, {52.0035, -15.2071}, {82.0035, 14.7929}}, thickness = 4), Line(origin = {-2, -45.24}, points = {{-77.9964, -14.7964}, {-47.9964, 15.2036}, {-19.9964, 15.2036}, {22.0036, 15.2036}, {52.0036, 15.2036}, {82.0036, -14.7964}}, thickness = 4), Line(origin = {-2.8, -0.42}, points = {{-100, 0}, {90, 0}}, color = {0, 0, 255}, thickness = DynamicSelect(3, thickArrowFwd), arrow = {Arrow.None, Arrow.Open}, arrowSize = DynamicSelect(14, sizeArrowFwd)), Line(origin = {-177.049, -10.9544}, points = {{270, 0}, {90, 0}}, color = {0, 0, 255}, pattern = LinePattern.Dash, thickness = DynamicSelect(0.25, thickArrowBwd), arrow = {Arrow.None, Arrow.Open}, arrowSize = DynamicSelect(0, sizeArrowBwd)), Text(origin = {0, 85}, extent = {{-100, 11}, {100, -11}}, textString = DynamicSelect("0.0", String(m_flow, significantDigits_m_flow, 0, true))), Text(origin = {20, 60}, extent = {{-20, 6}, {20, -6}}, textString = "kg/s", horizontalAlignment = TextAlignment.Right)}, coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end IdealGasNozzleFlow_base01;
