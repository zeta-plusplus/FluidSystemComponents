within FluidSystemComponents.Visualizers;

model MassFlowDisp_RefVar00
  //----------------------------------------
  // replaceable
  //----------------------------------------
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium "Medium in the component" annotation(
    choicesAllMatching = true);
  replaceable Real m_flow_ref;
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Integer significantDigits_m_flow(min = 1) = 4 "Number of significant digits to be shown";
  //----------------------------------------
  // variable
  //----------------------------------------
  // none
  //----------------------------------------
  // Interface
  //----------------------------------------
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium, m_flow(min = 0)) "" annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium, m_flow(min = 0)) "" annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}})));
  //************************************************************
equation
  0 = port_a.m_flow + port_b.m_flow;
  port_a.m_flow = 0.0;
  port_a.h_outflow = inStream(port_b.h_outflow);
  port_b.h_outflow = inStream(port_a.h_outflow);
//************************************************************
  annotation(
    defaultComponentName = "m_flow_disp",
    Icon(graphics = {Text(origin = {0, 36}, extent = {{-160, 20}, {160, -20}}, textString = DynamicSelect("0.0", String(m_flow_ref, significantDigits_m_flow, 0, true))), Line(origin = {-3.52, 2.22}, points = {{-97, -2}, {103, -2}}, thickness = 6, arrowSize = 5), Line(origin = {47.15, 2.17}, points = {{-9.62371, 17.9835}, {18.3763, -2.01654}, {-9.62371, -22.0165}}, thickness = 5), Text(origin = {0, -41}, extent = {{-120, 7}, {120, -7}}, textString = "%name")}, coordinateSystem(extent = {{-100, -60}, {100, 60}})));
end MassFlowDisp_RefVar00;
