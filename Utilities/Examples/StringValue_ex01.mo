within FluidSystemComponents.Utilities.Examples;

model StringValue_ex01
  StringValule StringValue annotation(
    Placement(transformation(origin = {28, 28}, extent = {{-10, -10}, {10, 10}})));
  StringExpression00 StringExpression(y = "hogehoge")  annotation(
    Placement(transformation(origin = {-26, 30}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(StringExpression.y, StringValue.u) annotation(
    Line(points = {{-14, 30}, {0, 30}, {0, 28}, {16, 28}}, color = {0, 170, 0}));
end StringValue_ex01;
