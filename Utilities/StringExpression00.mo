within FluidSystemComponents.Utilities;

block StringExpression00 "Set output signal to String expression"
  FluidSystemComponents.Interfaces.StringOutput y = "" "Value of String output" annotation(
    Dialog(group = "output signal"),
    Placement(transformation(extent = {{100, -10}, {120, 10}})));
  annotation(
    defaultComponentName = "StringExpression",
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(fillColor = {235, 235, 235}, fillPattern = FillPattern.Solid, borderPattern = BorderPattern.Raised, extent = {{-100, 40}, {100, -40}}), Text(extent = {{-96, 15}, {96, -15}}, textString = "%y"), Text(textColor = {0, 0, 255}, extent = {{-150, 90}, {150, 50}}, textString = "%name")}),
    Documentation(info = "<html>
</html>"));
end StringExpression00;
