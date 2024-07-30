within FluidSystemComponents.Compressible.Components;

model NozzleFlowEquation_varArea01
  extends FluidSystemComponents.Compressible.BaseClasses.NozzleFlowEquation_base03;
  //*****************************************************************
  import units = Modelica.Units.SI;
  import consts = Modelica.Constants;
  /*-----------------------------------
        parameters
        -----------------------------------*/
  parameter Real Cd_par = 1.0 "";
  
  Modelica.Blocks.Interfaces.RealInput u_Amech annotation(
    Placement( transformation(origin = {-40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-40, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  
/* ******************************************************************************** */
equation
  AmechTot= max(u_Amech, Modelica.Constants.small);
  Cd = Cd_par;
  
  if(Modelica.Constants.small<=u_Amech*Cd_par)then
    flagClosed=false;
  else
    flagClosed=true;
  end if;
  
  /* ******************************************************************************** */
  annotation(
    defaultComponentName = "Restriction",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Line(origin = {-5.81, 29.81}, points = {{-34.1882, 72.1882}, {-34.1882, 40.1882}, {51.8118, -101.812}}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Text(origin = {-111, 114}, extent = {{1, 6}, {49, -10}}, textString = "Amech")}));
  
  
end NozzleFlowEquation_varArea01;
