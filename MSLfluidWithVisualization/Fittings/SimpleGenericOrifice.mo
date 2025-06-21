within FluidSystemComponents.MSLfluidWithVisualization.Fittings;

model SimpleGenericOrifice
  extends FluidSystemComponents.MSLfluidWithVisualization.Fittings.BaseClasses.SimpleGenericOrifice_Vis_Base;
  extends Modelica.Fluid.Fittings.SimpleGenericOrifice;
  //----------------------------------------
  // Import
  //----------------------------------------
  import units = Modelica.Units.SI;
  import Colors = Modelica.Mechanics.MultiBody.Visualizers.Colors;
  
  
equation
  
  //----------
  if (switchUnitP == Visualizers.Types.SwitchUnitVisPressure.kPa) then
    pVis_a = port_a.p/1000.0;
    pVis_b = port_b.p/1000.0;
    pMinContour = valMin/1000.0;
    pMaxContour = valMax/1000.0;
  else
    pVis_a = port_a.p;
    pVis_b = port_b.p;
    pMinContour = valMin;
    pMaxContour = valMax;
  end if;
  //----------
  delta_p= (pVis_b-pVis_a)/(nMid+1);
  vecRGB_a = Colors.scalarToColor(pVis_a, pMinContour, pMaxContour, colorMap);
  vecRGB_b = Colors.scalarToColor(pVis_b, pMinContour, pMaxContour, colorMap);
  
  for i in 1:nMid loop
    pVis_mid[i]= pVis_a + i*delta_p;
    vecRGB_mid[i,:] = Colors.scalarToColor(pVis_mid[i], pMinContour, pMaxContour, colorMap);
  end for;
  
  
  annotation(
    defaultComponentName = "orifice",
    Icon(coordinateSystem(preserveAspectRatio = false)));
end SimpleGenericOrifice;
