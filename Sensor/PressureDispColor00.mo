within FluidSystemComponents.Sensor;

model PressureDispColor00
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
  parameter Real valMin = 100*1000 "";
  parameter Real valMax = 1000*1000 "";
  parameter Real colorMap[:, 3] = Colors.ColorMaps.jet();
  
  //----------------------------------------
  // variables
  //----------------------------------------
  Real vecRGB[3];
  
  //----------------------------------------
  // interface
  //----------------------------------------
  Modelica.Fluid.Interfaces.FluidPort_a port(redeclare package Medium=Medium) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  //
  port.m_flow=0;
  port.h_outflow = Medium.h_default;
  port.Xi_outflow = Medium.X_default[1:Medium.nXi];
  port.C_outflow = zeros(Medium.nC);
  //
  vecRGB = Colors.scalarToColor(port.p, valMin, valMax, colorMap);
  
  
annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -40}, {100, 40}}), graphics = {Rectangle( fillColor = DynamicSelect({192, 192, 192}, {vecRGB[1], vecRGB[2], vecRGB[3]}), pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 40}, {100, -40}}),Rectangle(origin = {0, -60}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 20}, {100, -20}}), Text(origin = {0, -59}, extent = {{-100, 15}, {100, -15}}, textString = DynamicSelect("0.0", String(port.p, sigDigits, 0, true)))}),
    defaultComponentName = "Pressure"
    );


end PressureDispColor00;
