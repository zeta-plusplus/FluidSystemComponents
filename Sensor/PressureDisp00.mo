within FluidSystemComponents.Sensor;

model PressureDisp00
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
  Real valDisp(final quantity = "Pressure", final unit = "kPa", displayUnit = "kPa", min = 0);
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
  valDisp = port.p/1000.0;
//
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -40}, {60, 40}}), graphics = {Rectangle(fillColor = {255, 255, 255}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, extent = {{-60, 40}, {60, -40}}), Text(origin = {-2, 6}, extent = {{-58, 16}, {58, -16}}, textString = DynamicSelect("0.0", String(valDisp, sigDigits, 0, true))), Text(origin = {36, -23}, extent = {{-22, 17}, {22, -17}}, textString = "kPa")}),
    defaultComponentName = "Pressure");
end PressureDisp00;
