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
    pVis_top = medium.p/1000.0;
    pMinContour = valMin/1000.0;
    pMaxContour = valMax/1000.0;
  else
    pVis_top = medium.p;
    pMinContour = valMin;
    pMaxContour = valMax;
  end if;
  //----------
  vecRGB = Colors.scalarToColor(pVis_top, pMinContour, pMaxContour, colorMap);
  
  annotation(
    defaultComponentName = "tank",
    Icon(coordinateSystem(preserveAspectRatio = false)));
  
  
end OpenTank;
