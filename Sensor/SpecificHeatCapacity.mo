within FluidSystemComponents.Sensor;

model SpecificHeatCapacity

  extends Modelica.Fluid.Sensors.BaseClasses.PartialAbsoluteSensor;
  extends Modelica.Icons.RoundSensor;
  Modelica.Blocks.Interfaces.RealOutput y_Cp(final quantity="SpecificHeatCapacity",
                                              final unit="J/kg/K")
    "Specific heat capacity in port medium"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

equation
  
  y_Cp = Medium.specificHeatCapacityCp(Medium.setState_phX(port.p, inStream(port.h_outflow), inStream(port.Xi_outflow)));
  
  
annotation (defaultComponentName="specificHeatCapacity",
  Icon(coordinateSystem(preserveAspectRatio=false, initialScale = 0.1), graphics={
        Line(points={{0,-70},{0,-100}}, color={0,0,127}),
Text(origin = {50, 0},lineColor = {0, 0, 255}, extent = {{-150, 80}, {50, 100}}, textString = "%name"), Text(extent = {{168, -30}, {52, -60}}, textString = "Cp"), Line(points = {{70, 0}, {100, 0}}, color = {0, 0, 127})}),
  Documentation(info="<html>
<p>
This component monitors the specific heat capacity of the fluid passing its port.
The sensor is ideal, i.e., it does not influence the fluid.
</p>
</html>"));

end SpecificHeatCapacity;
