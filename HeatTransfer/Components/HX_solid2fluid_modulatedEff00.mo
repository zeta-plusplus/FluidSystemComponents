within FluidSystemComponents.HeatTransfer.Components;

model HX_solid2fluid_modulatedEff00
  extends HeatTransfer.BaseClasses.HX_solid2fluid_Base_effHX;
  /********************************************************
            imports
      ********************************************************/
  import Modelica.Constants;
  import units = Modelica.Units.SI;
  import unitsNonSI = Modelica.Units.NonSI;
  import unitConversions = Modelica.Units.Conversions;
  /********************************************************
                Declaration
      ********************************************************/
  parameter Types.Switches.switchHowToDetVar swDetermine_eff = Types.Switches.switchHowToDetVar.viaRealInput "switch how to determine effHX" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter Real eff_par = 0.7;
  Modelica.Blocks.Interfaces.RealInput u_eff if swDetermine_eff == Types.Switches.switchHowToDetVar.viaRealInput annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

//*************************************************************************************
equation
  //--
  if (swDetermine_eff == Types.Switches.switchHowToDetVar.param) then
    effHX = eff_par;
  elseif (swDetermine_eff == Types.Switches.switchHowToDetVar.viaRealInput) then
    effHX = u_eff;
  end if;
  
  //--
  if (TfluidIn > Tsolid) then
    Q_flow_fluid = -1.0*Q_flow;
    Q_flow_solid = Q_flow;
  elseif (TfluidIn < Tsolid) then
    Q_flow_fluid = Q_flow;
    Q_flow_solid = -1.0*Q_flow;
  else
    Q_flow_fluid = 0*Q_flow;
    Q_flow_solid = 0*Q_flow;
  end if;
  
  
  
  annotation(
    defaultComponentName = "HX",
    Documentation(info = "<html>
  <a href=.html> Document html page</a>
  
  <h4>example/demo models</h4>
    <ul>
    <li></li>
    </ul>
    
  <h4>classes which this component call (those in MSL are not listed) </h4>
    <p> -> none </p>

</html>"),
    Icon(graphics = {Text(origin = {0, 102}, extent = {{-140, 18}, {140, -2}}, textString = "%name"), Rectangle(origin = {0, 11}, fillColor = {211, 211, 211}, fillPattern = FillPattern.Solid, extent = {{-140, 71}, {140, -91}}), Line(origin = {21.11, -8.28}, points = {{-121.11, -73.7224}, {-101.11, 70.2776}, {-21.1101, -69.7224}, {58.8899, 72.2776}, {78.8899, -73.7224}}, thickness = 10)}, coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");

end HX_solid2fluid_modulatedEff00;
