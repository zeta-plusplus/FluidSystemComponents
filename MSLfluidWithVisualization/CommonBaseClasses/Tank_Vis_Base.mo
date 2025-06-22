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
  // variables
  //----------------------------------------
  Real vecRGB_top[3];
  Real vecRGB_bottom[3];
  units.Pressure pVis_top;
  units.Pressure pVis_bottom;
  units.Pressure pMinContour;
  units.Pressure pMaxContour;
equation

  annotation(
    Diagram(graphics),
    Icon(graphics = {
    
    Text(origin = {150, 97}, extent = {{-50, 9}, {50, -9}}, textString = DynamicSelect("0.0", String(pVis_top, sigDigits, 0, true))),
    
    
    Rectangle(origin = {0, 98}, fillColor = DynamicSelect({245, 245, 245}, {vecRGB_top[1], vecRGB_top[2], vecRGB_top[3]}), pattern = LinePattern.Dot, fillPattern = FillPattern.Solid, extent = {{-200, 22}, {200, -19}}), 
    
    
    Rectangle(origin = {0, -102}, fillColor = DynamicSelect({245, 245, 245}, {vecRGB_bottom[1], vecRGB_bottom[2], vecRGB_bottom[3]}), pattern = LinePattern.Dot, fillPattern = FillPattern.Solid, extent = {{-200, 22}, {200, -19}})
    
    
    
    }, coordinateSystem(extent = {{-200, -120}, {200, 120}})));
end Tank_Vis_Base;
