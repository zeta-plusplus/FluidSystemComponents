within FluidSystemComponents.MSLfluidWithVisualization.Sources;

model MassFlowSource_T
  extends MSLfluidWithVisualization.CommonBaseClasses.Volume_Vis_Base;
  extends Modelica.Fluid.Sources.MassFlowSource_T;
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
    defaultComponentName = "boundary",
    Icon(coordinateSystem(preserveAspectRatio = false)));
  
end MassFlowSource_T;
