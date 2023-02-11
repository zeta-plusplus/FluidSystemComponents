within FluidSystemComponents.Sensor;

model Monitor_MassFlow
  extends Modelica.Fluid.Sensors.BaseClasses.PartialFlowSensor;
  
  //----------------------------------------
  // replaceable
  //----------------------------------------
  
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Integer significantDigits_m_flow(min=1) = 6
    "Number of significant digits to be shown, pressure";
  
  
  //----------------------------------------
  // variables
  //----------------------------------------
  //none
  
  
  //----------------------------------------
  // interface
  //----------------------------------------
  Modelica.Blocks.Interfaces.RealOutput y_m_flow(final quantity="MassFlowRate",
                                          final unit="kg/s",
                                          displayUnit="kg/s",
                                          min=0) annotation(
    Placement(visible = true, transformation(origin = {0, 80}, extent = {{100, -10}, {120, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{100, -10}, {120, 10}}, rotation = 0)));
  
  
  
equation
  y_m_flow= port_a.m_flow;
  
    
annotation(
    defaultComponentName ="monitorMassFlow",
    Diagram,
    Icon(graphics = {Text(origin = {0, 38}, extent = {{-160, 30}, {160, -30}}, textString = DynamicSelect("0.0", String(y_m_flow, 6, 0, true))), Text(origin = {59, -18}, extent = {{-25, 14}, {25, -14}}, textString = "kg/s"), Line(origin = {-69.09, 99.72}, points = {{-1, 0}, {169, 0}}), Line(origin = {-69.35, -100.28}, points = {{-1, 0}, {169, 0}})}));


end Monitor_MassFlow;
