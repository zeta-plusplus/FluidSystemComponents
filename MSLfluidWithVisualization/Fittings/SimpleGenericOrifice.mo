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
  
  //---------------------------------------------
  m_flow_vis=m_flow;
  unitStr_m_flow="kg/s";
  if(0<=m_flow_vis)then
    thickArrowFwd= max(thickArrowMin, min(thickArrowMax, thickArrowMin + m_flow_vis* (thickArrowMax-thickArrowMin)/(m_flow_Max-m_flow_Min) ));
    sizeArrowFwd= 3.5*thickArrowFwd;
    thickArrowBwd= 0.0;
    sizeArrowBwd= 0.0;
  else
    thickArrowBwd= max(thickArrowMin, min(thickArrowMax, thickArrowMin + abs(m_flow_vis)* (thickArrowMax-thickArrowMin)/(m_flow_Max-m_flow_Min) ));
    sizeArrowBwd= 3.5*thickArrowBwd;
    thickArrowFwd= 0.0;
    sizeArrowFwd= 0.0;
  end if;  
  
  
  annotation(
    defaultComponentName = "orifice",
    Icon(coordinateSystem(preserveAspectRatio = false)));
end SimpleGenericOrifice;
