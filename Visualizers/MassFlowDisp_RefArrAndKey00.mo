within FluidSystemComponents.Visualizers;

model MassFlowDisp_RefArrAndKey00
  //----------------------------------------
  // Import
  //----------------------------------------
  import units = Modelica.Units.SI;
  //----------------------------------------
  // replaceable
  //----------------------------------------
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium "Medium in the component" annotation(
    choicesAllMatching = true);
  replaceable String stringVector[:] "";
  replaceable Real varVector[:] "";
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter String keyString = "" "";
  parameter Integer significantDigits_m_flow(min = 1) = 4 "Number of significant digits to be shown";
  //-----
  parameter units.MassFlowRate m_flow_Min= 0.01;
  parameter units.MassFlowRate m_flow_Max= 10;
  
  parameter Real thickArrowMin=0.001;
  parameter Real thickArrowMax=40;
  
  
  //----------------------------------------
  // variable
  //----------------------------------------
  Modelica.Units.SI.MassFlowRate m_flow_vis;
  Integer index_m_flow;
  //-----
  Real thickArrowFwd;
  Real thickArrowBwd;
  Real sizeArrowFwd;
  Real sizeArrowBwd;
  //----------------------------------------
  // Interface
  //----------------------------------------
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium, m_flow(min = 0)) "" annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium, m_flow(min = 0)) "" annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}})));
  //************************************************************
equation
  
  if(0<=m_flow_vis)then
    thickArrowFwd= max(thickArrowMin, min(thickArrowMax, thickArrowMin + m_flow_vis* (thickArrowMax-thickArrowMin)/(m_flow_Max-m_flow_Min) ));
    sizeArrowFwd= 3.5*thickArrowFwd;
    thickArrowBwd= 0.0;
    sizeArrowBwd= 0.0;
  else
    thickArrowBwd= max(thickArrowMin, min(thickArrowMax, thickArrowMin + abs(m_flow_vis)* (thickArrowMax-thickArrowMin)/(m_flow_Max-m_flow_Min) ));
    sizeArrowBwd= 3.5*thickArrowBwd;
    thickArrowFwd= 0.0;
    sizeArrowFwd= 0.0;
  end if;  
  
//-------------------------
  index_m_flow = FluidSystemComponents.Utilities.f_indexByName00(stringVector, keyString);
//-------------------------
  m_flow_vis = varVector[index_m_flow];
//-------------------------
  0 = port_a.m_flow + port_b.m_flow;
  port_a.m_flow = 0.0;
  port_a.h_outflow = inStream(port_b.h_outflow);
  port_b.h_outflow = inStream(port_a.h_outflow);
//************************************************************
  annotation(
    defaultComponentName = "VisMflow",
    Icon(graphics = 
    {
    
    Text(origin = {0, 52}, extent = {{-100, 8}, {100, -8}}, textString = DynamicSelect("0.0", String(m_flow_vis, significantDigits_m_flow, 0, true))), 
    Text(origin = {0, -51}, extent = {{-100, 5}, {100, -5}}, textString = "%keyString"), 
    
    Line(origin = {-0.2, -1.33},points = {{-100, 0}, {90, 0}}, thickness = DynamicSelect(3,thickArrowFwd), arrow = {Arrow.None, Arrow.Open}, arrowSize = DynamicSelect(14,sizeArrowFwd)), 
    
    Line(origin = {-180.17, -0.73}, points = {{270, 0}, {90, 0}}, pattern = LinePattern.Dash, thickness = DynamicSelect(0.25,thickArrowBwd), arrow = {Arrow.None, Arrow.Open}, arrowSize = DynamicSelect(0,sizeArrowBwd))
    
    }, coordinateSystem(extent = {{-100, -60}, {100, 60}})));
end MassFlowDisp_RefArrAndKey00;
