within FluidSystemComponents.MSLfluidWithVisualization.Fittings.BaseClasses;

model SimpleGenericOrifice_Vis_Base
  //----------------------------------------
  // Import
  //----------------------------------------
  import units= Modelica.Units.SI;
  import Colors = Modelica.Mechanics.MultiBody.Visualizers.Colors;
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Visualizers.Types.SwitchUnitVisPressure switchUnitP = Visualizers.Types.SwitchUnitVisPressure.kPa annotation(Dialog(tab="Visualization", group = "Pressure"));
  parameter Integer sigDigits(min = 1) = 6 "" annotation(Dialog(tab="Visualization", group = "Pressure"));
  parameter Real valMin = 100 "" annotation(Dialog(tab="Visualization", group = "Pressure"));
  parameter Real valMax = 1000 "" annotation(Dialog(tab="Visualization", group = "Pressure"));
  parameter Real colorMap[:, 3] = Colors.ColorMaps.jet() annotation(HideResult = true, Dialog(tab = "Visualization", group = "Pressure"));
  //----------------------------------------
  // variables
  //----------------------------------------
  Real vecRGB_a[3];
  Real vecRGB_b[3];
  Real vecRGB_mid[3];
  units.Pressure pVis_a;
  units.Pressure pVis_b;
  units.Pressure pVis_mid;
  units.Pressure pMinContour;
  units.Pressure pMaxContour;
  
equation

annotation(
    Icon(coordinateSystem(extent = {{-120, -100}, {120, 100}}), 
    graphics = {
      Rectangle(origin = {-80, -7}, fillColor = DynamicSelect({245, 245, 245}, {vecRGB_a[1], vecRGB_a[2], vecRGB_a[3]}), pattern = LinePattern.Dot, fillPattern = FillPattern.Solid, extent = {{-40, 107}, {40, -94}}), 
      Rectangle(origin = {0, -7}, fillColor = DynamicSelect({245, 245, 245}, {vecRGB_mid[1], vecRGB_mid[2], vecRGB_mid[3]}), pattern = LinePattern.Dot, fillPattern = FillPattern.Solid, extent = {{-40, 107}, {40, -94}}), 
      Rectangle(origin = {80, -8}, fillColor = DynamicSelect({245, 245, 245}, {vecRGB_b[1], vecRGB_b[2], vecRGB_b[3]}), pattern = LinePattern.Dot, fillPattern = FillPattern.Solid, extent = {{-40, 108}, {40, -93}})
      }),
    Diagram(graphics));
end SimpleGenericOrifice_Vis_Base;
