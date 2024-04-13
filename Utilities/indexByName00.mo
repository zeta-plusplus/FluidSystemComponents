within FluidSystemComponents.Utilities;

block indexByName00
  /*-----------------------------------
      import
  -----------------------------------*/
  import Strings=Modelica.Utilities.Strings;
  
  /*-----------------------------------
          replaceable
  -----------------------------------*/
  replaceable String stringVector[:];
  
  /*-----------------------------------
          interfaces
  -----------------------------------*/
  Interfaces.StringInput u_keyString annotation(
    Placement(transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.IntegerOutput y_index annotation(
    Placement(transformation(origin = {112, -2}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));

//************************************************************
equation
  y_index=FluidSystemComponents.Utilities.f_indexByName00(stringVector, u_keyString);
  
//************************************************************
  annotation(
    defaultComponentName = "indexByName",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-10, 120}, extent = {{-110, 10}, {110, -10}}, textString = "%name")}));
end indexByName00;
