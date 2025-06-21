within FluidSystemComponents.MSLfluidWithVisualization.Sources;

model Boundary_pT
  extends FluidSystemComponents.MSLfluidWithVisualization.CommonBaseClasses.Volume_Vis_Base;
  extends Modelica.Fluid.Sources.Boundary_pT;
  
  //----------------------------------------
  // Import
  //----------------------------------------
  import units = Modelica.Units.SI;
  import Colors = Modelica.Mechanics.MultiBody.Visualizers.Colors;
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
    defaultComponentName = "volume",
    Icon(coordinateSystem(preserveAspectRatio = false)));
  
end Boundary_pT;
