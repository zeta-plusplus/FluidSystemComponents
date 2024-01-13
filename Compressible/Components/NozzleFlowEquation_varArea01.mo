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
  /* ******************************************************************************** */
  Modelica.Blocks.Interfaces.RealInput u_Amech annotation(
    Placement(visible = true, transformation(origin = {-40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-40, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  AmechTot = u_Amech;
  Cd = Cd_par;
  annotation(
    defaultComponentName = "Restriction",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Line(origin = {-5.81, 29.81}, points = {{-34.1882, 70.1882}, {-34.1882, 40.1882}, {33.8118, -69.8118}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 7), Text(origin = {-35, 80}, extent = {{1, 12}, {47, -18}}, textString = "Amech")}));
end NozzleFlowEquation_varArea01;
