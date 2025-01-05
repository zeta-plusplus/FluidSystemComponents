within FluidSystemComponents.Compressible.Components;

model IdealGasNozzleFlow01
  extends Compressible.BaseClasses.IdealGasNozzleFlow_base01;
  //*****************************************************************
  import units = Modelica.Units.SI;
  import consts = Modelica.Constants;
  /*-----------------------------------
        parameters
        -----------------------------------*/
  parameter units.Area AmechTot_par = Modelica.Constants.pi/4*0.05^2.0 "";
  parameter Real Cd_par = 0.8 "";
  /* ******************************************************************************** */
equation
  AmechTot = AmechTot_par;
  Cd = Cd_par;
  
  /* */
  if(Modelica.Constants.small<=AmechTot_par*Cd_par)then
    flagClosed=false;
  else
    flagClosed=true;
  end if;
  
  
  
  annotation(
    defaultComponentName = "Restriction",
    Icon(graphics = {Text(origin = {0, -92}, extent = {{-200, 8}, {200, -8}}, textString = "%AmechTot_par")}));
    
    
end IdealGasNozzleFlow01;
