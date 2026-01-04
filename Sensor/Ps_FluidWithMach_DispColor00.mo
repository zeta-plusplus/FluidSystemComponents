within FluidSystemComponents.Sensor;

model Ps_FluidWithMach_DispColor00
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
  parameter Visualizers.Types.SwitchUnitVisPressure switchUnitP = Visualizers.Types.SwitchUnitVisPressure.kPa;
  parameter Integer sigDigits(min = 1) = 6 "";
  parameter Real valMin = 100 "";
  parameter Real valMax = 1000 "";
  parameter Real colorMap[:, 3] = Colors.ColorMaps.jet();
  //----------------------------------------
  // variables
  //----------------------------------------
  Real vecRGB[3];
  Real pVis;
  Real pMinContour;
  Real pMaxContour;
  //----------------------------------------
  // interface
  //----------------------------------------
  FluidSystemComponents.Interfaces.FluidWithMach_a port(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//
  port.portStat.m_flow = 0;
  port.portStat.h_outflow = Medium.h_default;
  port.portStat.Xi_outflow = Medium.X_default[1:Medium.nXi];
  port.portStat.C_outflow = zeros(Medium.nC);
//----------
 if (switchUnitP == Visualizers.Types.SwitchUnitVisPressure.kPa) then
    pVis = port.portStat.p/1000.0;
    pMinContour = valMin/1000.0;
    pMaxContour = valMax/1000.0;
  else
    pVis = port.portStat.p;
    pMinContour = valMin;
    pMaxContour = valMax;
  end if;
//----------
  vecRGB = Colors.scalarToColor(pVis, pMinContour, pMaxContour, colorMap);
  
  
  
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(origin = {0, -116}, extent = {{-100, 10}, {100, -10}}, textString = DynamicSelect("0.0", String(pVis, sigDigits, 0, true))), Ellipse(fillColor = DynamicSelect({192, 192, 192}, {vecRGB[1], vecRGB[2], vecRGB[3]}), pattern = LinePattern.None, fillPattern = FillPattern.Solid,extent = {{-100, 100}, {100, -100}})}),
    defaultComponentName = "Pressure");



end Ps_FluidWithMach_DispColor00;