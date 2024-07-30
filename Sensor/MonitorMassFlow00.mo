within FluidSystemComponents.Sensor;

model MonitorMassFlow00
  extends Modelica.Fluid.Sensors.BaseClasses.PartialFlowSensor(showDesignFlowDirection = false);
  //----------------------------------------
  // Import
  //----------------------------------------
  import units = Modelica.Units.SI;
  //----------------------------------------
  // replaceable
  //----------------------------------------
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Integer significantDigits_m_flow(min = 1) = 4 "Number of significant digits to be shown";
  //-----
  parameter units.MassFlowRate m_flow_Min = 0.001;
  parameter units.MassFlowRate m_flow_Max = 10;
  parameter Real thickArrowMin = 0.001;
  parameter Real thickArrowMax = 40;
  //----------------------------------------
  // variable
  //----------------------------------------
  Modelica.Units.SI.MassFlowRate m_flow;
  //-----
  Real thickArrowFwd;
  Real thickArrowBwd;
  Real sizeArrowFwd;
  Real sizeArrowBwd;
  //----------------------------------------
  // Interface
  //----------------------------------------
  //************************************************************
equation
  if (0 <= m_flow) then
    thickArrowFwd = thickArrowMin + m_flow*(thickArrowMax - thickArrowMin)/(m_flow_Max - m_flow_Min);
    sizeArrowFwd = 4*thickArrowFwd;
    thickArrowBwd = 0.0;
    sizeArrowBwd = 0.0;
  else
    thickArrowBwd = thickArrowMin + abs(m_flow)*(thickArrowMax - thickArrowMin)/(m_flow_Max - m_flow_Min);
    sizeArrowBwd = 4*thickArrowBwd;
    thickArrowFwd = 0.0;
    sizeArrowFwd = 0.0;
  end if;
//-------------------------
  m_flow = port_a.m_flow;
//-------------------------
//************************************************************
  annotation(
    defaultComponentName = "m_flow_sensor",
    Icon(graphics = {Text(origin = {0, 52}, extent = {{-100, 8}, {100, -8}}, textString = DynamicSelect("0.0", String(m_flow, significantDigits_m_flow, 0, true))), Line(origin = {-0.595137, 0.250547}, points = {{-100, 0}, {90, 0}}, thickness = DynamicSelect(3, thickArrowFwd), arrow = {Arrow.None, Arrow.Open}, arrowSize = DynamicSelect(14, sizeArrowFwd)), Line(origin = {-179.775, 0.257798}, points = {{270, 0}, {90, 0}}, pattern = LinePattern.Dash, thickness = DynamicSelect(0.25, thickArrowBwd), arrow = {Arrow.None, Arrow.Open}, arrowSize = DynamicSelect(0, sizeArrowBwd)), Text(origin = {50, -46}, extent = {{-50, 6}, {50, -6}}, textString = "kg/s", horizontalAlignment = TextAlignment.Right)}, coordinateSystem(preserveAspectRatio = false, extent = {{-100, -60}, {100, 60}})));
end MonitorMassFlow00;
