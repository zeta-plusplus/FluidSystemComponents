within FluidSystemComponents.Utilities.Examples;

model CombiTimeTableAll00_ex01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(tableOnFile = true, fileName = Modelica.Utilities.Files.loadResource("modelica://FluidSystemComponents/Utilities/Examples/exampleTimeTable01.csv"), columns = {1, 2, 3, 4, 5}, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, tableName = "table01") annotation(
    Placement(transformation(origin = {-6, 56}, extent = {{-10, -10}, {10, 10}})));
  CombiTimeTableAll00 combiTimeTable1(tableOnFile = true, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, tableName = "table01", columns = {1, 2, 3}) annotation(
    Placement(transformation(origin = {-4, 18}, extent = {{-10, -10}, {10, 10}})));
  indexByName00 indexByName(stringVector = combiTimeTable1.y_arrColumns)  annotation(
    Placement(transformation(origin = {34, -18}, extent = {{-10, -10}, {10, 10}})));
  StringExpression00 StringExpression(y = "volume.medium.p")  annotation(
    Placement(transformation(origin = {-4, -18}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(StringExpression.y, indexByName.u_keyString) annotation(
    Line(points = {{8, -18}, {23, -18}}, color = {0, 170, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 15, Tolerance = 1e-06, Interval = 0.01));
end CombiTimeTableAll00_ex01;
