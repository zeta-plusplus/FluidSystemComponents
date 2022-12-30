within FluidSystemComponents.Sensor;

model Monitor_p_kPa_T_K
  
  //----------------------------------------
  // replaceable
  //----------------------------------------
  replaceable package Medium =
      Modelica.Media.Interfaces.PartialMedium "Medium in the component"
      annotation (choicesAllMatching = true);
  
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Integer significantDigits_p(min=1) = 6
    "Number of significant digits to be shown, pressure";
  
  parameter Integer significantDigits_T(min=1) = 6
    "Number of significant digits to be shown, Temperature";
  
  
  //----------------------------------------
  // variables
  //----------------------------------------
  Real var2disp_p;
  Real var2disp_T;
  
  //----------------------------------------
  // interface
  //----------------------------------------
  Modelica.Fluid.Interfaces.FluidPort_a port(redeclare package Medium=Medium) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput y_p(final quantity="Pressure",
                                          final unit="Pa",
                                          displayUnit="bar",
                                          min=0) annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{100, -10}, {120, 10}}, rotation = 0), iconTransformation(origin = {0, 90}, extent = {{100, -10}, {120, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_T(final quantity="ThermodynamicTemperature",
                                          final unit = "K", displayUnit = "K", min=0) annotation(
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{100, -10}, {120, 10}}, rotation = 0), iconTransformation(origin = {0, -90}, extent = {{100, -10}, {120, 10}}, rotation = 0)));
  
  
equation
  port.m_flow=0;
  port.h_outflow = Medium.h_default;
  port.Xi_outflow = Medium.X_default[1:Medium.nXi];
  port.C_outflow = zeros(Medium.nC);
    
  y_p = port.p;
  y_T = Medium.temperature(Medium.setState_phX(port.p, inStream(port.h_outflow), inStream(port.Xi_outflow)));
  var2disp_p=y_p/1000.0;
  var2disp_T=y_T;
    
annotation(
    defaultComponentName ="monitorPT",
    Diagram,
    Icon(graphics = {Line(origin = {-69, 0.28}, points = {{-31, 0}, {-1, 0}}, thickness = 0.5), Text(origin = {0, 60}, extent = {{-160, 30}, {160, -30}}, textString = DynamicSelect("0.0", String(var2disp_p, 6, 0, true))), Text(origin = {0, -40}, extent = {{-160, 30}, {160, -30}}, textString = DynamicSelect("0.0", String(var2disp_T, 6, 0, true))), Text(origin = {59, -84}, extent = {{-25, 14}, {25, -14}}, textString = "K"), Text(origin = {70, 15}, extent = {{-30, 15}, {30, -15}}, textString = "kPa"), Line(origin = {-69.09, 99.72}, points = {{-1, 0}, {169, 0}}), Line(origin = {-69.35, -100.28}, points = {{-1, 0}, {169, 0}})}));


end Monitor_p_kPa_T_K;
