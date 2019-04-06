within FluidSystemComponents.HydroThermal.Components;

model CheckValveSpringLoad_Linear
  extends FluidSystemComponents.HydroThermal.BaseClasses.Valve_Base;
  //----------
  /********************************************************
    imports
  ********************************************************/
  import Modelica.Constants;
  import Modelica.SIunits;
  //********** Parameters **********
  parameter Real gradientQP= (0.001*50)/(100.0*1000.0)
    "qFlow_1 vs. deltap after crack, [m**3/PaD]"
    annotation(
    Dialog(group = "Characteristics"));
  
  //********** Initialization Parameters **********
  //##### none #####
  //********** Internal variables **********
  //##### none #####
  //----- inner-connected variables -----
  //##### none #####
  //----- inner-outer-connected variables -----
  //##### none #####
  //********** internal component **********
  //##### none #####
  
algorithm
  //##### none #####
equation
  //********** Eqns describing physics **********
  qFlow_1= max(0, gradientQP*(deltap-deltapCrack));
  
/******************************
  Graphics
******************************/
annotation(
    Icon(graphics = {Line(origin = {-69.4255, 0.166894}, points = {{-30, 0}, {20, 0}}, thickness = 2), Line(origin = {70.7114, -0.175103}, points = {{-20, 0}, {30, 0}}, thickness = 2), Ellipse(origin = {-21, -2}, lineThickness = 1, extent = {{-19, 22}, {21, -18}}, endAngle = 360), Line(origin = {25, 9.34}, points = {{-25, -21.3449}, {-25, -1.34493}, {-15, -21.3449}, {-15, -1.34493}, {-5, -21.3449}, {-5, -1.34493}, {5, -21.3449}, {5, -1.34493}, {15, -21.3449}, {15, -1.34493}, {25, -21.3449}, {25, -1.34493}}, thickness = 1), Line(origin = {-28.5021, 20.5746}, points = {{-20, -20}, {20, 20}}, thickness = 1), Line(origin = {-29, -20}, points = {{-20, 20}, {20, -20}}, thickness = 1), Text(origin = {-2, 77}, extent = {{-98, 23}, {102, -17}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));

end CheckValveSpringLoad_Linear;
