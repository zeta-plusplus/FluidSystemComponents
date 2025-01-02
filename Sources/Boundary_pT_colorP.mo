within FluidSystemComponents.Sources;

model Boundary_pT_colorP
  extends Modelica.Fluid.Sources.Boundary_pT;
  //----------------------------------------
  // Import
  //----------------------------------------
  import Colors = Modelica.Mechanics.MultiBody.Visualizers.Colors;
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
equation
//----------
  if (switchUnitP == Visualizers.Types.SwitchUnitVisPressure.kPa) then
    pVis = medium.p/1000.0;
    pMinContour = valMin/1000.0;
    pMaxContour = valMax/1000.0;
  else
    pVis = medium.p;
    pMinContour = valMin;
    pMaxContour = valMax;
  end if;
//----------
  vecRGB = Colors.scalarToColor(pVis, pMinContour, pMaxContour, colorMap);
  annotation(
    defaultComponentName = "boundary",
    Icon(graphics = {Text(origin = {0, -116}, extent = {{-100, 10}, {100, -10}}, textString = DynamicSelect("0.0", String(pVis, sigDigits, 0, true))), Ellipse(fillColor = DynamicSelect({85, 170, 255}, {vecRGB[1], vecRGB[2], vecRGB[3]}), fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-100, 100}, {100, -100}})}));
end Boundary_pT_colorP;
