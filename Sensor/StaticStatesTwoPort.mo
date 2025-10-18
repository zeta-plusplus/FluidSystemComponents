within FluidSystemComponents.Sensor;

model StaticStatesTwoPort
  extends CommonAnyFluid.BaseClasses.flow1d2ports00;
  extends Sensor.icons.SensorFlow1d;
  /********************************************************
            imports   
      ********************************************************/
  import units = Modelica.Units.SI;
  import unitsNonSI = Modelica.Units.NonSI;
  import unitConversions = Modelica.Units.Conversions;
  /********************************************************
                     Declaration
      ********************************************************/
  /* ---------------------------------------------
            parameters
      --------------------------------------------- */
  parameter FluidSystemComponents.Types.Switches.switch_input_CalcStaticStates sw_input_calcStat= FluidSystemComponents.Types.Switches.switch_input_CalcStaticStates.input_Mn "";
  
  parameter Real Mn_par=0.8 "Mach number"  annotation(
    Dialog(group = "Static fluid state"));
  parameter units.Length diamEff_par = 0.01 "diameter of effective area, valid if isCircular==true" annotation(
    Dialog(group = "Geometory"));
  parameter units.Area AeffPath_par = Modelica.Constants.pi/4.0*diamEff_par^2 "mechanical area of 'throat', valid if isCircular==false" annotation(
    Dialog(group = "Geometory"));
  /* ---------------------------------------------
                                          Interface
                      --------------------------------------------- */
  Interfaces.Bus_FluidStaticStates bus_Static annotation(
    Placement(transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}})));
equation
  if(sw_input_calcStat==FluidSystemComponents.Types.Switches.switch_input_CalcStaticStates.input_Mn)then
    Mn=Mn_par;
  else
    if (isCircular == true) then
      diamEff= diamEff_par;
    else
      AeffPath = AeffPath_par;
    end if;
  end if;
  
  AeffPath = Modelica.Constants.pi/4.0*diamEff^2.0;
  
  //-----
  fluid_1.p = fluid_2.p;
  annotation(
    defaultComponentName = "StaticStates",
    Icon(coordinateSystem(preserveAspectRatio = false),graphics = {Text(origin = {0, -90}, extent = {{-100, 10}, {100, -10}}, textString = "%name"), Rectangle(origin = {1, 20}, fillPattern = FillPattern.Solid, extent = {{-7, 24}, {5, -22}}), Line(origin = {-75, 38.6701}, points = {{-25, -39}, {35, -39}}, thickness = 2), Line(origin = {65.4381, 38.7165}, points = {{-25, -39}, {35, -39}}, thickness = 2)}),
    __OpenModelica_commandLineOptions = "");
end StaticStatesTwoPort;
