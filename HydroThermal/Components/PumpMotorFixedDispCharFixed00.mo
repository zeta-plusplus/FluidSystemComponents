within FluidSystemComponents.HydroThermal.Components;

model PumpMotorFixedDispCharFixed00
  extends FluidSystemComponents.HydroThermal.BaseClasses.PumpMotorFixedDispBase00;
  
  /********************************************************
        imports   
  ********************************************************/
  import Modelica.Constants;
  
  
  /********************************************************
        Declaration   
  ********************************************************/
  /* ---------------------------------------------
        switches
  --------------------------------------------- */
  parameter Boolean use_u_NmechDes = false "get NmechDes from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  parameter Boolean use_u_V_flow_des = false "get V_flow_des from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  parameter Boolean use_u_eff = false "get eff from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  
  
  
  
  /* ---------------------------------------------
        parameters    
  --------------------------------------------- */
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm NmechDes_paramInput = 1000.0 "adiabatic efficiency, valid only when use_u_eff==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  parameter Real V_flow_des_paramInput = 0.001 "adiabatic efficiency, valid only when use_u_eff==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  parameter Real effDes_paramInput = 0.80 "adiabatic efficiency, valid only when use_u_eff==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  
  
  
  
  
  /* ---------------------------------------------
      Interface   
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_eff annotation(
    Placement(visible = true, transformation(origin = {-60, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-60, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_NmechDes annotation(
    Placement(visible = true, transformation(origin = {40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {40, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_V_flow_des annotation(
    Placement(visible = true, transformation(origin = {80, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
/******************************
  Graphics
******************************/
  annotation(
    defaultComponentName = "pump",
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Text(origin = {2, 80}, extent = {{-102, 20}, {98, 0}}, textString = "%name")}));
end PumpMotorFixedDispCharFixed00;
