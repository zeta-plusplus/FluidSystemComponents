within FluidSystemComponents.Utilities.UnitConversion;

block Pa2inHg
  extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="Pa", displayUnit="Pa"), y(
        unit="inHg", displayUnit="inHg"));
equation
  y=0.00029529983071445*u;
  annotation(
    defaultComponentName = "Pa2inHg",
    Diagram,
    Icon(graphics = {Text(origin = {-65, 60}, extent = {{-27, 28}, {27, -28}}, textString = "Pa"), Text(origin = {65, -66}, extent = {{-51, 52}, {27, -28}}, textString = "inHg")}, coordinateSystem(initialScale = 0.1)));
end Pa2inHg;
