within FluidSystemComponents.Utilities.Examples;

model CombiTimeTableAll00_ex01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(tableOnFile = true, fileName = Modelica.Utilities.Files.loadResource("modelica://FluidSystemComponents/Utilities/Examples/exampleTimeTable01.csv"), columns = {1,2,3}, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, tableName = "table01") annotation(
    Placement(transformation(origin = {-6, 56}, extent = {{-10, -10}, {10, 10}})));
  CombiTimeTableAll00 combiTimeTable1(strFileName = "modelica://FluidSystemComponents/Utilities/Examples/exampleTimeTable02.csv", nColMax = 179) annotation(
    Placement(transformation(origin = {-4, 18}, extent = {{-10, -10}, {10, 10}})));
  StringExpression00 StringExpression(y = "volume.medium.p")  annotation(
    Placement(transformation(origin = {-4, -18}, extent = {{-10, -10}, {10, 10}})));
equation

  annotation(
    experiment(StartTime = 0, StopTime = 15, Tolerance = 1e-06, Interval = 0.01));
end CombiTimeTableAll00_ex01;
