within FluidSystemComponents.Utilities.Examples;

model readColumnsFromCSV00_ex02
  extends Modelica.Icons.Example;
  indexByName00 indexByName(stringVector = readColumns.y_arrColumns)  annotation(
    Placement(transformation(origin = {20, 30}, extent = {{-10, -10}, {10, 10}})));
  StringExpression00 StringExpression(y = "volume.medium.p")  annotation(
    Placement(transformation(origin = {-26, 30}, extent = {{-10, -10}, {10, 10}})));
  readHeaderColumnsFromCSV00 readColumns annotation(
    Placement(transformation(origin = {-20, 80}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(StringExpression.y, indexByName.u_keyString) annotation(
    Line(points = {{-15, 30}, {10, 30}}, color = {0, 170, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.1));
end readColumnsFromCSV00_ex02;
