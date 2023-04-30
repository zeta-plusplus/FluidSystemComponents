within FluidSystemComponents.InteractiveSimulation.Output;

model DispColorGrad00
  //----------------------------------------
  // Import
  //----------------------------------------
  import Colors = Modelica.Mechanics.MultiBody.Visualizers.Colors;
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Real valMin = 0 "";
  parameter Real valMax = 25 "";
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
    Icon(graphics = {Rectangle(origin = {0, 0}, fillColor = DynamicSelect({192, 192, 192}, {vecRGB[1], vecRGB[2], vecRGB[3]}), pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 40}, {100, -40}})}),
    defaultComponentName = "disp"
    );
end DispColorGrad00;
