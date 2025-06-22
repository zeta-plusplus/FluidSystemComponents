within FluidSystemComponents.MSLfluidWithVisualization.CommonBaseClasses;

model Tank_Vis_Base
  //----------------------------------------
  // Import
  //----------------------------------------
  import units = Modelica.Units.SI;
  import Colors = Modelica.Mechanics.MultiBody.Visualizers.Colors;
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Visualizers.Types.SwitchUnitVisPressure switchUnitP = Visualizers.Types.SwitchUnitVisPressure.kPa annotation(
    Dialog(tab = "Visualization", group = "Pressure"));
  parameter Integer sigDigits(min = 1) = 6 "" annotation(
    Dialog(tab = "Visualization", group = "Pressure"));
  parameter Real valMin = 100 "" annotation(
    Dialog(tab = "Visualization", group = "Pressure"));
  parameter Real valMax = 1000 "" annotation(
    Dialog(tab = "Visualization", group = "Pressure"));
  parameter Real colorMap[:, 3] = Colors.ColorMaps.jet() annotation(
    HideResult = true,
    Dialog(tab = "Visualization", group = "Pressure"));
  //----------------------------------------
  // constants
  //----------------------------------------
  constant Integer nMid = 2;
  //----------------------------------------
  // variables
  //----------------------------------------
  Real vecRGB_top[3];
  Real vecRGB_bottom[3];
  Real vecRGB_mid[nMid, 3];
  units.Pressure pVis_top;
  units.Pressure pVis_bottom;
  units.Pressure pVis_mid[nMid];
  units.Pressure delta_p;
  units.Pressure pMinContour;
  units.Pressure pMaxContour;
equation

  annotation(
    Diagram(graphics),
    Icon(graphics = {
    
    
    Rectangle(origin = {0, 87}, fillColor = DynamicSelect({245, 245, 245}, {vecRGB_top[1], vecRGB_top[2], vecRGB_top[3]}), pattern = LinePattern.Dot, fillPattern = FillPattern.Solid, extent = {{-200, 33}, {200, -28}}), 
    
    Rectangle(origin = {0, -93}, fillColor = DynamicSelect({245, 245, 245}, {vecRGB_bottom[1], vecRGB_bottom[2], vecRGB_bottom[3]}), pattern = LinePattern.Dot, fillPattern = FillPattern.Solid, extent = {{-200, 33}, {200, -28}}), 
    
    
    Rectangle(origin = {0, 27}, fillColor = DynamicSelect({245, 245, 245}, {vecRGB_mid[2, 1], vecRGB_mid[2, 2], vecRGB_mid[2, 3]}), pattern = LinePattern.Dot, fillPattern = FillPattern.Solid, extent = {{-200, 33}, {200, -28}}),
    
    Rectangle(origin = {0, -33}, fillColor = DynamicSelect({245, 245, 245}, {vecRGB_mid[1,1], vecRGB_mid[1,2], vecRGB_mid[1,3]}), pattern = LinePattern.Dot, fillPattern = FillPattern.Solid, extent = {{-200, 33}, {200, -28}}), 
    
    
    Text(origin = {150, 97}, extent = {{-50, 9}, {50, -9}}, textString = DynamicSelect("0.0", String(pVis_top, sigDigits, 0, true))),
    Text(origin = {150, -83}, extent = {{-50, 9}, {50, -9}}, textString = DynamicSelect("0.0", String(pVis_bottom, sigDigits, 0, true))), 
    
    
    Text(origin = {150, 31}, extent = {{-50, 9}, {50, -9}}, textString = DynamicSelect("0.0", String(pVis_mid[2], sigDigits, 0, true))),
    
    Text(origin = {150, -27}, extent = {{-50, 9}, {50, -9}}, textString = DynamicSelect("0.0", String(pVis_mid[1], sigDigits, 0, true)))
    
    }, coordinateSystem(extent = {{-200, -120}, {200, 120}})));
end Tank_Vis_Base;
