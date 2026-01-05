within FluidSystemComponents.Sensor;

model TemperatureDispColor00
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
  
  Medium.BaseProperties fluid(p(min = 0.0 + 1.0e-10), T(min = 0.0 + 1.0e-10), h(min = 0.0 + 1.0e-10)) "";
  
  //----------------------------------------
  // interface
  //----------------------------------------
  Modelica.Fluid.Interfaces.FluidPort_a port(redeclare package Medium=Medium) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  //
  port.m_flow=0;
  port.h_outflow = fluid.h;
  port.Xi_outflow = fluid.Xi;
  port.C_outflow = zeros(Medium.nC);
  
  fluid.h=inStream(port.h_outflow);
  fluid.Xi=inStream(port.Xi_outflow);
  
  
  fluid.p= port.p;
  
  valDisp = Medium.temperature(Medium.setState_phX(port.p, inStream(port.h_outflow), inStream(port.Xi_outflow)));
  //
  vecRGB = Colors.scalarToColor(valDisp, valMin, valMax, colorMap);
  
  
  
annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -40}, {100, 40}}), graphics = {Rectangle( fillColor = DynamicSelect({192, 192, 192}, {vecRGB[1], vecRGB[2], vecRGB[3]}), pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 40}, {100, -40}}),Rectangle(origin = {0, -60}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 20}, {100, -20}}), Text(origin = {0, -59}, extent = {{-100, 15}, {100, -15}}, textString = DynamicSelect("0.0", String(valDisp, sigDigits, 0, true)))}),
    defaultComponentName = "Temperature"
    );


end TemperatureDispColor00;
