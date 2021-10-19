within FluidSystemComponents.Sensor;

model PressureRatio
  extends Modelica.Fluid.Sensors.BaseClasses.PartialRelativeSensor;

  Modelica.Blocks.Interfaces.RealOutput p_ratio
    "Relative pressure signal" annotation (Placement(transformation(
        origin={0,-90},
        extent={{10,-10},{-10,10}},
        rotation=90)));
equation

  // pressrue ratio
  p_ratio = port_a.p / port_b.p;
  annotation (
    Icon(graphics = {Line(points = {{0, -30}, {0, -80}}, color = {0, 0, 127}), Text(origin = {-12, 0},extent = {{126, -74}, {4, -100}}, textString = "p_a/p_b")}, coordinateSystem(initialScale = 0.1)),
    Documentation(info="<html>

</html>"));
end PressureRatio;
