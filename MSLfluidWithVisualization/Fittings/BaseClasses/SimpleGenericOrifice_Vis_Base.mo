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
  //-----
  parameter Integer significantDigits_m_flow(min = 1) = 4 "Number of significant digits to be shown" annotation(Dialog(tab="Visualization", group = "mass flow"));
  parameter units.MassFlowRate m_flow_Min= 0.01 annotation(Dialog(tab="Visualization", group = "mass flow"));
  parameter units.MassFlowRate m_flow_Max= 10 annotation(Dialog(tab="Visualization", group = "mass flow"));
  
  parameter Real thickArrowMin=0.001 annotation(Dialog(tab="Visualization", group = "mass flow"));
  parameter Real thickArrowMax=40 annotation(Dialog(tab="Visualization", group = "mass flow"));
  
  //----------------------------------------
  // constants
  //----------------------------------------
  constant Integer nMid=2;
  
  //----------------------------------------
  // variables
  //----------------------------------------
  Real vecRGB_a[3];
  Real vecRGB_b[3];
  Real vecRGB_mid[nMid,3];
  units.Pressure pVis_a;
  units.Pressure pVis_b;
  units.Pressure pVis_mid[nMid];
  units.Pressure delta_p;
  units.Pressure pMinContour;
  units.Pressure pMaxContour;
  //-----
  String unitStr_m_flow;
  units.MassFlowRate m_flow_vis;
  Real thickArrowFwd;
  Real thickArrowBwd;
  Real sizeArrowFwd;
  Real sizeArrowBwd;
  
equation

annotation(
    Icon(coordinateSystem(extent = {{-120, -100}, {120, 100}}), 
    graphics = {
      
      Rectangle(origin = {-90, -7}, fillColor = DynamicSelect({245, 245, 245}, {vecRGB_a[1], vecRGB_a[2], vecRGB_a[3]}), pattern = LinePattern.Dot, fillPattern = FillPattern.Solid, extent = {{-30, 107}, {30, -94}}), 
      Rectangle(origin = {-30, -7}, fillColor = DynamicSelect({245, 245, 245}, {vecRGB_mid[1,1], vecRGB_mid[1,2], vecRGB_mid[1,3]}), pattern = LinePattern.Dot, fillPattern = FillPattern.Solid, extent = {{-30, 107}, {30, -94}}), 
      Rectangle(origin = {30, -8}, fillColor = DynamicSelect({245, 245, 245}, {vecRGB_mid[2,1], vecRGB_mid[2,2], vecRGB_mid[2,3]}), pattern = LinePattern.Dot, fillPattern = FillPattern.Solid, extent = {{-30, 108}, {30, -93}}), 
      Rectangle(origin = {90, -8}, fillColor = DynamicSelect({245, 245, 245}, {vecRGB_b[1], vecRGB_b[2], vecRGB_b[3]}), pattern = LinePattern.Dot, fillPattern = FillPattern.Solid, extent = {{-30, 108}, {30, -93}}),
      
      
      Text(origin = {0, 126}, extent = {{-100, 8}, {100, -8}}, textString = DynamicSelect("0.0", String(m_flow_vis, significantDigits_m_flow, 0, true))),
      Text(origin = {90, 110}, extent = {{-30, 5}, {30, -5}}, textString = DynamicSelect("kg/s",unitStr_m_flow)),
      
      Line(origin = {-0.2, -1.33},points = {{-100, 0}, {90, 0}}, thickness = DynamicSelect(3,thickArrowFwd), arrow = {Arrow.None, Arrow.Open}, arrowSize = DynamicSelect(14,sizeArrowFwd)),
      Line(origin = {-180.17, -0.73}, points = {{270, 0}, {90, 0}}, pattern = LinePattern.Dash, thickness = DynamicSelect(0.25,thickArrowBwd), arrow = {Arrow.None, Arrow.Open}, arrowSize = DynamicSelect(0,sizeArrowBwd))
    
      }),
    Diagram(graphics));
end SimpleGenericOrifice_Vis_Base;
