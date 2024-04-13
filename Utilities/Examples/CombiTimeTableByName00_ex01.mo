within FluidSystemComponents.Utilities.Examples;

model CombiTimeTableByName00_ex01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(tableOnFile = true, fileName = Modelica.Utilities.Files.loadResource("modelica://FluidSystemComponents/Utilities/Examples/exampleTimeTable01.csv"), columns = {1, 2, 3, 4, 5}, tableName = "table01", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments) annotation(
    Placement(transformation(origin = {-6, 56}, extent = {{-10, -10}, {10, 10}})));
equation

  annotation(
    experiment(StartTime = 0, StopTime = 15, Tolerance = 1e-06, Interval = 0.01));
end CombiTimeTableByName00_ex01;
