within FluidSystemComponents.Compressible.Components;

model NozzleFlowEquation02
  extends FluidSystemComponents.Compressible.BaseClasses.NozzleFlowEquation_base02;
  //*****************************************************************
  import units = Modelica.Units.SI;
  import consts = Modelica.Constants;
  
  /*-----------------------------------
    parameters
    -----------------------------------*/
  parameter units.Area AmechTot_par = Modelica.Constants.pi / 4 * 0.05^2.0 "";
  parameter Real Cd_par = 0.8 "";
  /* ******************************************************************************** */
equation
  AmechTot = AmechTot_par;
  Cd = Cd_par;
  annotation(
    defaultComponentName = "FlowPath",
    Icon(graphics = {Text(origin = {0, -90}, extent = {{-100, 10}, {100, -10}}, textString = "%name")}));
end NozzleFlowEquation02;
