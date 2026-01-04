within FluidSystemComponents.Sensor;

model Ts_FluidWithMach_DispColor00
  //----------------------------------------
  // Import
  //----------------------------------------
  import Colors = Modelica.Mechanics.MultiBody.Visualizers.Colors;
  
  //----------------------------------------
  // replaceable
  //----------------------------------------
  replaceable package Medium =
      Modelica.Media.Interfaces.PartialMedium "Medium in the component"
      annotation (choicesAllMatching = true);
  
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Integer sigDigits(min=1) = 6
    "";
  parameter Real valMin = 273.15 "";
  parameter Real valMax = 2000 "";
  parameter Real colorMap[:, 3] = Colors.ColorMaps.jet();
  
  //----------------------------------------
  // variables
  //----------------------------------------
  Real vecRGB[3];
  Real valDisp(final quantity="ThermodynamicTemperature",
               final unit = "K", displayUnit = "degC", min=0);
  //----------------------------------------
  // interface
  //----------------------------------------
  FluidSystemComponents.Interfaces.FluidWithMach_a port(redeclare package Medium=Medium) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  //
  port.portStat.m_flow=0;
  port.portStat.h_outflow = Medium.h_default;
  port.portStat.Xi_outflow = Medium.X_default[1:Medium.nXi];
  port.portStat.C_outflow = zeros(Medium.nC);
  valDisp = Medium.temperature(Medium.setState_phX(port.portStat.p, inStream(port.portStat.h_outflow), inStream(port.portStat.Xi_outflow)));
  //
  vecRGB = Colors.scalarToColor(valDisp, valMin, valMax, colorMap);
  
  
annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -40}, {100, 40}}), graphics = {Rectangle( fillColor = DynamicSelect({192, 192, 192}, {vecRGB[1], vecRGB[2], vecRGB[3]}), pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 40}, {100, -40}}),Rectangle(origin = {0, -60}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 20}, {100, -20}}), Text(origin = {0, -59}, extent = {{-100, 15}, {100, -15}}, textString = DynamicSelect("0.0", String(valDisp, sigDigits, 0, true)))}),
    defaultComponentName = "Temperature"
    );


end Ts_FluidWithMach_DispColor00;