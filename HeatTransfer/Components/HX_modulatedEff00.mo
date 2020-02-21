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
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

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
<p>
</p>
</html>"
    ),
    Icon(graphics = {Text(origin = {0, -90}, extent = {{-100, 10}, {100, -10}}, textString = "%name"), Rectangle(origin = {0, 9}, fillColor = {211, 211, 211}, fillPattern = FillPattern.Solid, extent = {{-100, 71}, {100, -89}}), Line(origin = {0.45, 51.07}, points = {{-100, 9.64645}, {-80, -10.3536}, {-60, 9.64645}, {-40, -10.3536}, {-20, 9.64645}, {0, -10.3536}, {20, 9.64645}, {40, -10.3536}, {60, 9.64645}, {80, -10.3536}, {100, 9.64645}}, thickness = 3), Line(origin = {0.45, -50.93}, rotation = 180, points = {{-100, 9.64645}, {-80, -10.3536}, {-60, 9.64645}, {-40, -10.3536}, {-20, 9.64645}, {0, -10.3536}, {20, 9.64645}, {40, -10.3536}, {60, 9.64645}, {80, -10.3536}, {100, 9.64645}}, thickness = 3), Line(origin = {-2, 6.9656}, points = {{0, 26}, {0, -38}}, thickness = 4.5, arrow = {Arrow.Half, Arrow.Half}, arrowSize = 8), Text(origin = {26, 10}, extent = {{-14, 8}, {32, -22}}, textString = "Q_flow")}, coordinateSystem(initialScale = 0.1)));

end HX_modulatedEff00;
