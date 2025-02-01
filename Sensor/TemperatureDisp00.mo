within FluidSystemComponents.Sensor;

model TemperatureDisp00
  //----------------------------------------
  // Import
  //----------------------------------------
  import Colors = Modelica.Mechanics.MultiBody.Visualizers.Colors;
  //----------------------------------------
  // replaceable
  //----------------------------------------
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium "Medium in the component" annotation(
    choicesAllMatching = true);
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Integer sigDigits(min = 1) = 4 "";
  //----------------------------------------
  // variables
  //----------------------------------------
  Real valDisp(final quantity = "ThermodynamicTemperature", final unit = "K", displayUnit = "K", min = 0);
  //----------------------------------------
  // interface
  //----------------------------------------
  Modelica.Fluid.Interfaces.FluidPort_a port(redeclare package Medium = Medium) annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}})));
equation
//
  port.m_flow = 0;
  port.h_outflow = Medium.h_default;
  port.Xi_outflow = Medium.X_default[1:Medium.nXi];
  port.C_outflow = zeros(Medium.nC);
  valDisp = Medium.temperature(Medium.setState_phX(port.p, inStream(port.h_outflow), inStream(port.Xi_outflow)));
//
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -40}, {60, 40}}), graphics = {Rectangle(fillColor = {255, 255, 255}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, extent = {{-60, 40}, {60, -40}}), Text(origin = {-2, 6}, extent = {{-58, 16}, {58, -16}}, textString = DynamicSelect("0.0", String(valDisp, sigDigits, 0, true))), Text(origin = {35, -26}, extent = {{-11, 10}, {11, -10}}, textString = "K")}),
    defaultComponentName = "Temperature");
end TemperatureDisp00;
