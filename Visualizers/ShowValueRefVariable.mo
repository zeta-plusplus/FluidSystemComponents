within FluidSystemComponents.Visualizers;

model ShowValueRefVariable
  replaceable Real value_ref;
  parameter Integer sigDigits = 4;
equation

  annotation(
    defaultComponentName = "ShowRefVariable",
    Diagram,
    Icon(graphics = {Rectangle(fillColor = {235, 235, 235}, fillPattern = FillPattern.Solid, borderPattern = BorderPattern.Raised, extent = {{-100, 40}, {100, -40}}), Text(origin = {0, 2}, extent = {{-160, 20}, {160, -20}}, textString = DynamicSelect("0.0", String(value_ref, sigDigits, 0, true))), Text(origin = {0, 60}, extent = {{-100, 10}, {100, -10}}, textString = "%name")}, coordinateSystem(extent = {{-100, -40}, {100, 80}})));
end ShowValueRefVariable;
