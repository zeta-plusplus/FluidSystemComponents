within FluidSystemComponents.HeatTransfer.Components;

model HX_modulatedEff00
  extends FluidSystemComponents.HeatTransfer.BaseClasses.HX_Base;
  /********************************************************
        imports
  ********************************************************/
  import Modelica.Constants;
  import Modelica.SIunits;
  
  
  /********************************************************
            Declaration
  ********************************************************/
  
  Modelica.Blocks.Interfaces.RealInput u_eff annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  
  effHX= u_eff;
  
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
  Icon(graphics = {Text(origin = {0, -98}, extent = {{-140, 18}, {140, -2}}, textString = "%name"), Rectangle(origin = {0, 11}, fillColor = {211, 211, 211}, fillPattern = FillPattern.Solid, extent = {{-140, 71}, {140, -91}}), Line(origin = {-3.55, 47.07}, points = {{-136, 27.6465}, {-114, -10.3535}, {-96, 9.64643}, {-80, -10.3536}, {-60, 9.64645}, {-40, -10.3536}, {-20, 9.64645}, {0, -10.3536}, {20, 9.64645}, {40, -10.3536}, {60, 9.64645},  {80, -10.3536}, {100, 9.64645}, {118, -10.3535}, {142, 29.6465}}, thickness = 3), Line(origin = {0.45, -46.93}, rotation = 180, points = {{-138, 25.6465}, {-120, -11.3535}, {-100, 9.64643}, {-80, -10.3536}, {-60, 9.64645}, {-40, -10.3536}, {-20, 9.64645}, {0, -10.3536}, {20, 9.64645}, {40, -10.3536}, {60, 9.64645}, {80, -10.3536}, {100, 9.64645}, {120, -10.3535}, {142, 29.6465}}, thickness = 3), Line(origin = {-2, 6.9656}, points = {{0, 18}, {0, -30}}, thickness = 4.5, arrow = {Arrow.Half, Arrow.Half}, arrowSize = 8), Text(origin = {32, 8}, extent = {{-14, 8}, {32, -22}}, textString = "Q_flow"), Text(origin = {-16, 80}, extent = {{-14, 8}, {50, -20}}, textString = "medium1"), Text(origin = {-16, -62}, extent = {{-14, 8}, {50, -20}}, textString = "medium2")}, coordinateSystem(extent = {{-140, -100}, {140, 100}}, initialScale = 0.1)),
  __OpenModelica_commandLineOptions = "");

end HX_modulatedEff00;
