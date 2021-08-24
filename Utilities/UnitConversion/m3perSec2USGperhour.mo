within FluidSystemComponents.Utilities.UnitConversion;

block m3perSec2USGperhour
  extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="m3/s", displayUnit="m3/s"), y(
        unit="USG/h", displayUnit="USG/h"));
equation
  y=951019.3884893342953676397177929850286533582577340019185611538213566252267998962*u;
  annotation(
    defaultComponentName = "m3perSec2USGperhour",
    Diagram,
    Icon(graphics = {Text(origin = {-65, 60}, extent = {{-27, 28}, {27, -28}}, textString = "W"), Text(origin = {61, -60}, extent = {{-27, 28}, {27, -28}}, textString = "hp")}, coordinateSystem(initialScale = 0.1)));
end m3perSec2USGperhour;
