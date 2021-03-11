within FluidSystemComponents.Utilities.UnitConversion;

block W2hp
  extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="W", displayUnit="W"), y(
        unit="hp", displayUnit="hp"));
equation
  y=0.0013410220888*u;
  annotation(
    defaultComponentName = "W2hp",
    Diagram,
    Icon(graphics = {Text(origin = {-65, 60}, extent = {{-27, 28}, {27, -28}}, textString = "W"), Text(origin = {61, -60}, extent = {{-27, 28}, {27, -28}}, textString = "hp")}, coordinateSystem(initialScale = 0.1)));
end W2hp;
