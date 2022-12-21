within FluidSystemComponents.Sensor;

model StaticPressureTwoPort
  extends FluidSystemComponents.CommonAnyFluid.BaseClasses.flow1d2ports00;
  extends FluidSystemComponents.Sensor.icons.SensorFlow1d;
  
  /********************************************************
        imports   
  ********************************************************/
  import units=Modelica.Units.SI;
  import unitsNonSI=Modelica.Units.NonSI;
  import unitConversions=Modelica.Units.Conversions;
  
  
  /********************************************************
                 Declaration
  ********************************************************/
  /* ---------------------------------------------
        parameters
  --------------------------------------------- */
  //********** Initialization Parameters **********
  parameter units.Length diam_paramInput=0.01 "diameter, valid if isCircular==true" annotation(
    Dialog(group = "Geometory"));
  parameter units.Area Apath_paramInput = Modelica.Constants.pi/4.0*diam_paramInput^2 "mechanical area of 'throat', valid if isCircular==false" annotation(
    Dialog(group = "Geometory"));
  
  
  /* ---------------------------------------------
                      Interface
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealOutput y_ps(quantity = "Pressure", unit = "Pa", displayUnit = "Pa") annotation(
    Placement(visible = true, transformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  
equation
  
  if(isCircular==true)then
    AeffPath= Modelica.Constants.pi/4.0*diam_paramInput^2.0;
  else
    AeffPath = Apath_paramInput;
  end if;
  
  y_ps= fluidStat_path.p;
  
  
  fluid_1.p= fluid_2.p;
  
  annotation(
    defaultComponentName = "StaticPressure",
  Icon(graphics = {Text(origin = {0, -90}, extent = {{-100, 10}, {100, -10}}, textString = "%name"), Rectangle(origin = {1, 21}, fillPattern = FillPattern.Solid, extent = {{-7, 25}, {5, -23}}), Line(origin = {-75, 38.6701}, points = {{-25, -39}, {35, -39}}, thickness = 2), Line(origin = {65.4381, 38.7165}, points = {{-25, -39}, {35, -39}}, thickness = 2)}),
  __OpenModelica_commandLineOptions = "");
  
end StaticPressureTwoPort;
