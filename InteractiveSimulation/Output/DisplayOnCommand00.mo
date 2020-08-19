within FluidSystemComponents.InteractiveSimulation.Output;

block DisplayOnCommand00
  
  /********************************************************
              imports   
  ********************************************************/
  import Modelica.Utilities.Streams;
  
  /********************************************************
              Declaration   
  ********************************************************/
  /* ---------------------------------------------
              parameters    
    --------------------------------------------- */
  parameter String name2disp="var1";
  
  
  /* ---------------------------------------------
              Interface   
    --------------------------------------------- */
  input Modelica.Blocks.Interfaces.RealInput u_val annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
algorithm
  Streams.print(name2disp+": "+String(u_val));
    
  
  
  
  annotation(
    defaultComponentName = "DispOnCmd",
    Diagram(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}), Text(origin = {-11, 0}, extent = {{-85, 40}, {105, -40}}, textString = "Disp. on command"), Text(origin = {-9, -92}, extent = {{-85, 18}, {103, -2}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
  Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-3, 21}, extent = {{-87, 17}, {87, -17}}, textString = "Print"), Text(origin = {-7, -17}, extent = {{-87, 17}, {97, -27}}, textString = "Command Line")}));


end DisplayOnCommand00;
