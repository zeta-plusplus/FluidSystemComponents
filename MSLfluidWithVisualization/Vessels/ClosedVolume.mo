within FluidSystemComponents.MSLfluidWithVisualization.Vessels;

model ClosedVolume
  extends FluidSystemComponents.MSLfluidWithVisualization.Vessels.BaseClasses.ClosedVolume_Vis_Base;
  extends Modelica.Fluid.Vessels.ClosedVolume;
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
end ClosedVolume;
