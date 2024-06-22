within FluidSystemComponents.Utilities;

model StringValule
  Interfaces.StringInput u annotation(
    Placement(transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}})));
equation

annotation(
    defaultComponentName = "StringValue",
    Diagram,
  Icon(graphics = {Text(textColor = {0, 0, 255}, extent = {{-150, 90}, {150, 50}}, textString = "%name"), Rectangle(fillColor = {235, 235, 235}, fillPattern = FillPattern.Solid, borderPattern = BorderPattern.Raised, extent = {{-100, 40}, {100, -40}}), Text(extent = {{-96, 15}, {96, -15}}, textString = "%u")}));
end StringValule;
