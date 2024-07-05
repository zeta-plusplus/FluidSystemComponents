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
  
  //----------------------------------------
  // variable
  //----------------------------------------
  Modelica.Units.SI.MassFlowRate m_flow_vis;
  Integer index_m_flow;
  
  
  //----------------------------------------
  // Interface
  //----------------------------------------
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium, m_flow(min = 0)) "" annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium, m_flow(min = 0)) "" annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}})));
  //************************************************************
equation
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
    Icon(graphics = {Text(origin = {0, 36}, extent = {{-160, 20}, {160, -20}}, textString = DynamicSelect("0.0", String(m_flow_vis, significantDigits_m_flow, 0, true))), Line(origin = {-3.52, 2.22}, points = {{-97, -2}, {103, -2}}, thickness = 6, arrowSize = 5), Line(origin = {47.15, 2.17}, points = {{-9.62371, 17.9835}, {18.3763, -2.01654}, {-9.62371, -22.0165}}, thickness = 5), Text(origin = {0, -41}, extent = {{-120, 7}, {120, -7}}, textString =  "%keyString")}, coordinateSystem(extent = {{-100, -60}, {100, 60}})));
end MassFlowDisp_RefArrAndKey00;
