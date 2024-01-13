within FluidSystemComponents.Compressible.Components;

model NozzleFlowEquation_varMflow01
  extends FluidSystemComponents.Compressible.BaseClasses.NozzleFlowEquation_base03;
  //*****************************************************************
  import units = Modelica.Units.SI;
  import consts = Modelica.Constants;
  /*-----------------------------------
        parameters
        -----------------------------------*/
  parameter Real Cd_par = 1.0 "";
  /* ******************************************************************************** */
  Modelica.Blocks.Interfaces.RealInput u_m_flow_abs annotation(
    Placement(visible = true, transformation(origin = {-40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-40, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  m_flow_abs = u_m_flow_abs;
  Cd = Cd_par;
  annotation(
    defaultComponentName = "Restriction",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(origin = {-35, -56}, extent = {{1, 12}, {47, -18}}, textString = "m_flow"), Line(origin = {-40, 8}, points = {{0, 92}, {0, -92}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 7)}));
end NozzleFlowEquation_varMflow01;
