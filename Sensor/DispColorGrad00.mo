within FluidSystemComponents.Sensor;

model DispColorGrad00
  //----------------------------------------
  // Import
  //----------------------------------------
  import Colors = Modelica.Mechanics.MultiBody.Visualizers.Colors;
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Integer sigDigits(min=1) = 6;
  
  parameter Real valMin = 0 "";
  parameter Real valMax = 25 "";
  parameter Integer significantDigits(min = 1) = 6 "Number of significant digits to be shown, pressure";
  parameter Real colorMap[:, 3] = Colors.ColorMaps.jet();
  
  //----------------------------------------
  // variables
  //----------------------------------------
  Real vecRGB[3];
  //----------------------------------------
  // interface
  //----------------------------------------
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-104, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  vecRGB = Colors.scalarToColor(u, valMin, valMax, colorMap);
/*
  annotation(
      Icon(graphics = {Rectangle(origin = {0, 0}, fillColor = DynamicSelect({192, 192, 192}, {(125 + (u*5)), (125 - (u*5)), (125 + (u*5))}), pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 40}, {100, -40}})}));
   */
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -40}, {100, 40}}), graphics = {Rectangle(fillColor = DynamicSelect({192, 192, 192}, {vecRGB[1], vecRGB[2], vecRGB[3]}), pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 40}, {100, -40}}), Text(origin = {0, -56}, extent = {{-100, 12}, {100, -12}}, textString = DynamicSelect("0.0", String(u, sigDigits, 0, true)) )}));
end DispColorGrad00;
