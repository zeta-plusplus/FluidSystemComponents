within FluidSystemComponents.HeatTransfer.Components;

model HX_modulatedEff00
  extends FluidSystemComponents.HeatTransfer.BaseClasses.HX_Base_effHX;
  /********************************************************
        imports
  ********************************************************/
  import Modelica.Constants;
  import units=Modelica.Units.SI;
  import unitsNonSI=Modelica.Units.NonSI;
  import unitConversions=Modelica.Units.Conversions;
  
  
  /********************************************************
            Declaration
  ********************************************************/
  parameter FluidSystemComponents.Types.Switches.switchHowToDetVar swDetermine_eff= FluidSystemComponents.Types.Switches.switchHowToDetVar.viaRealInput "switch how to determine effHX" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true); 
  
  
  parameter Real eff_par=0.7;
  
  /********************************************************
            Interface
  ********************************************************/
  Modelica.Blocks.Interfaces.RealInput u_eff if swDetermine_eff==FluidSystemComponents.Types.Switches.switchHowToDetVar.viaRealInput annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

//*************************************************************************************
equation
  //--
  if(swDetermine_eff==FluidSystemComponents.Types.Switches.switchHowToDetVar.param)then
    effHX=eff_par;
  elseif(swDetermine_eff==FluidSystemComponents.Types.Switches.switchHowToDetVar.viaRealInput)then
    effHX= u_eff;
  end if;
  
  //--
  if(flagHotSide==1)then
    Q_flow1= -1.0*Q_flow;
    Q_flow2= Q_flow;
  elseif(flagHotSide==2)then
    Q_flow1= Q_flow;
    Q_flow2= -1.0* Q_flow;
  else
    Q_flow1=0.0;
    Q_flow2=0.0;
  end if; 
  
  
annotation(
    defaultComponentName="HX",
    Documentation(
    info = "<html>
  <a href=modelica://FluidSystemComponents/docs/HeatTransfer/Components/HX_modulatedEff00.html> Document html page</a>
  
  <h4>example/demo models</h4>
    <ul>
    <li><a href=\"modelica://FluidSystemComponents.HeatTransfer.Examples.test.HX_modulatedEff00_test01\"> FluidSystemComponents.HeatTransfer.Examples.test.HX_modulatedEff00_test01 </a> </li>
    <li><a href=\"modelica://FluidSystemComponents.HeatTransfer.Examples.test.HX_modulatedEff00_test02\"> FluidSystemComponents.HeatTransfer.Examples.test.HX_modulatedEff00_test02 </a> </li>
    <li><a href=\"modelica://FluidSystemComponents.HeatTransfer.Examples.test.HX_modulatedEff00_test03\"> FluidSystemComponents.HeatTransfer.Examples.test.HX_modulatedEff00_test03 </a> </li>
    <li><a href=\"modelica://FluidSystemComponents.HeatTransfer.Examples.test.HX_modulatedEff00_test04\"> FluidSystemComponents.HeatTransfer.Examples.test.HX_modulatedEff00_test04 </a> </li>
    </ul>
    
  <h4>classes which this component call (those in MSL are not listed) </h4>
    <p> -> none </p>

</html>"
    ),
  Icon(graphics = {Text(origin = {0, -118}, extent = {{-140, 18}, {140, -2}}, textString = "%name"), Rectangle(origin = {0, 11}, fillColor = {211, 211, 211}, fillPattern = FillPattern.Solid, extent = {{-140, 71}, {140, -91}}), Line(origin = {-1.97, -4.44}, points = {{-136.029, -71.556}, {-78.029, -63.556}, {-56.029, 52.444}, {1.97098, -39.556}, {61.971, 54.444}, {81.971, -63.556}, {135.971, -73.556}}, thickness = 10)}, coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}}, initialScale = 0.1)),
  __OpenModelica_commandLineOptions = "");

end HX_modulatedEff00;
