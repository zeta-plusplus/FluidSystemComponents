within FluidSystemComponents.Sensor;

model MassFractionsArray
  extends Modelica.Fluid.Sensors.BaseClasses.PartialAbsoluteSensor;
  extends Modelica.Icons.RoundSensor;
  //-----
  Modelica.Blocks.Interfaces.RealOutput Xi[Medium.nXi] "array of mass fractions" annotation(
    Placement(transformation(extent = {{100, -10}, {120, 10}})));
equation
  Xi = port.Xi_outflow;
  annotation(
    defaultComponentName = "MassFractionsArray",
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Line(points = {{0, -70}, {0, -100}}, color = {0, 0, 127}), Text(origin = {50, 0}, lineColor = {0, 0, 255}, extent = {{-150, 80}, {50, 100}}, textString = "%name"), Text(extent = {{168, -30}, {52, -60}}, textString = "Xi"), Line(points = {{70, 0}, {100, 0}}, color = {0, 0, 127})}),
    Documentation(info = "<html>
<p>
.
</p>
</html>"));
end MassFractionsArray;
