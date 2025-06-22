within FluidSystemComponents.MSLfluidWithVisualization.Vessels;

model OpenTank
  extends FluidSystemComponents.MSLfluidWithVisualization.CommonBaseClasses.Tank_Vis_Base;
  extends Modelica.Fluid.Vessels.OpenTank;
  
  //----------------------------------------
  // Import
  //----------------------------------------
  import units = Modelica.Units.SI;
  import Colors = Modelica.Mechanics.MultiBody.Visualizers.Colors;
  
equation
  
  //----------
  if (switchUnitP == Visualizers.Types.SwitchUnitVisPressure.kPa) then
    pVis_top = p_ambient/1000.0;
    pVis_bottom = (max(0, level)*system.g*medium.d + p_ambient)/1000;
    pMinContour = valMin/1000.0;
    pMaxContour = valMax/1000.0;
  else
    pVis_top = p_ambient;
    pVis_bottom = (max(0, level)*system.g*medium.d + p_ambient);
    pMinContour = valMin;
    pMaxContour = valMax;
  end if;
  //----------
  vecRGB_top = Colors.scalarToColor(pVis_top, pMinContour, pMaxContour, colorMap);
  vecRGB_bottom = Colors.scalarToColor(pVis_bottom, pMinContour, pMaxContour, colorMap);
  
  
  annotation(
    defaultComponentName = "tank",
    Icon(coordinateSystem(preserveAspectRatio = false)));
  
  
end OpenTank;
