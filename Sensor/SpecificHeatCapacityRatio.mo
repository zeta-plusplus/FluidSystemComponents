within FluidSystemComponents.Sensor;

model SpecificHeatCapacityRatio
  extends Modelica.Fluid.Sensors.BaseClasses.PartialAbsoluteSensor;
  extends Modelica.Icons.RoundSensor;
  
  import units=Modelica.Units.SI;
  
  units.SpecificHeatCapacityAtConstantPressure Cp;
  units.SpecificHeatCapacityAtConstantVolume Cv;
  Modelica.Blocks.Interfaces.RealOutput y_gamma(final quantity="RatioOfSpecificHeatCapacities", final unit="1") "Specific heat capacity ratio in port medium" annotation(
    Placement(transformation(extent = {{100, -10}, {120, 10}})));
equation
  
  Cp=Medium.specificHeatCapacityCp(Medium.setState_phX(port.p, inStream(port.h_outflow), inStream(port.Xi_outflow)));
  Cv=Medium.specificHeatCapacityCv(Medium.setState_phX(port.p, inStream(port.h_outflow), inStream(port.Xi_outflow)));
  
  y_gamma = Cp/Cv;
  
  
  annotation(
    defaultComponentName = "gamma",
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Line(points = {{0, -70}, {0, -100}}, color = {0, 0, 127}), Text(origin = {50, 0}, textColor = {0, 0, 255}, extent = {{-150, 80}, {50, 100}}, textString = "%name"), Text(origin = {39, 24},extent = {{93, -30}, {29, -60}}, textString = "gamma", horizontalAlignment = TextAlignment.Left), Line(points = {{70, 0}, {100, 0}}, color = {0, 0, 127})}),
    Documentation(info = "<html>
<p>
This component monitors the specific heat capacity of the fluid passing its port.
The sensor is ideal, i.e., it does not influence the fluid.
</p>
</html>"));
end SpecificHeatCapacityRatio;