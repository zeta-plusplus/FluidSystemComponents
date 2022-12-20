within FluidSystemComponents.HydroThermal.Components;

model PumpMotorFixedDispCharFixed00
  extends FluidSystemComponents.HydroThermal.BaseClasses.PumpMotorFixedDispBase00;
  
  /********************************************************
        imports   
  ********************************************************/
  import Modelica.Constants;
  import units=Modelica.Units.SI;
  import unitConversions=Modelica.Units.Conversions;
  import unitsNonSI=Modelica.Units.NonSI;
  
  
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
  parameter Boolean use_u_effVol = false "get effVol from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  parameter Boolean use_u_effMech = false "get effMech from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  
  
  
  
  /* ---------------------------------------------
        parameters    
  --------------------------------------------- */
  parameter unitsNonSI.AngularVelocity_rpm NmechDes_paramInput = 5000.0 "mechanical rotational speed, design point, valid only when use_u_NmechDes==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  parameter units.VolumeFlowRate V_flow_des_paramInput = 0.001 "volume flow rate, design point, value under effVol=1,  referring to fluid_1.T , valid only when use_u_V_flow_des==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  parameter Real effVolDes_paramInput = 0.90 "volumetric efficiency, valid only when use_u_effVol==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  parameter Real effMechDes_paramInput = 0.90 "mechanical efficiency, valid only when use_u_effMech==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  
  
  
  
  
  
  
  /* ---------------------------------------------
      Interface   
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_effVol if use_u_effVol "" annotation(
    Placement(visible = true, transformation(origin = {-80, 120}, extent = {{20, -20}, {-20, 20}}, rotation = 90), iconTransformation(origin = {-80, 110}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_effMech if use_u_effMech "" annotation(
    Placement(visible = true, transformation(origin = {-40, 120}, extent = {{20, -20}, {-20, 20}}, rotation = 90), iconTransformation(origin = {-40, 110}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_NmechDes if use_u_NmechDes "" annotation(
    Placement(visible = true, transformation(origin = {40, 120}, extent = {{20, -20}, {-20, 20}}, rotation = 90), iconTransformation(origin = {40, 110}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_V_flow_des if use_u_V_flow_des "" annotation(
    Placement(visible = true, transformation(origin = {80, 120}, extent = {{20, -20}, {-20, 20}}, rotation = 90), iconTransformation(origin = {80, 110}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
equation
  
  
  /* ---------------------------------------------
  Connections, interface <-> internal variables   
  --------------------------------------------- */  
  //--------------------
  if (use_u_effVol == false) then
    effVolDes = effVolDes_paramInput;
  elseif (use_u_effVol==true) then
    effVolDes = u_effVol;
  end if; 
  //--------------------
  if (use_u_effMech == false) then
    effMechDes = effMechDes_paramInput;
  elseif (use_u_effMech==true) then
    effMechDes = u_effMech;
  end if; 
  //--------------------
  if (use_u_NmechDes== false) then
    NmechDes = NmechDes_paramInput;
  elseif (use_u_NmechDes==true) then
    NmechDes = u_NmechDes;
  end if; 
  //--------------------
  if (use_u_V_flow_des == false) then
    V_flow_des = V_flow_des_paramInput;
  elseif (use_u_V_flow_des==true) then
    V_flow_des = u_V_flow_des;
  end if; 
  //--------------------
  
  effVol= effVolDes;
  effMech= effMechDes;
  
  
  
  
  
  
  
/******************************
  Graphics
******************************/
  annotation(
    defaultComponentName = "PumpMotor",
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Text(origin = {2, 80}, extent = {{-102, 20}, {98, 0}}, textString = "%name")}));
end PumpMotorFixedDispCharFixed00;
