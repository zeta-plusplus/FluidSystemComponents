within FluidSystemComponents.Utilities.Examples;

model readColumnsFromCSV00_ex01
  extends Modelica.Icons.Example;
  readHeaderColumnsFromCSV00 readColumns(filePath = "modelica://FluidSystemComponents/Utilities/Examples/exampleTimeTable01.csv")  annotation(
    Placement(transformation(origin = {-28, 48}, extent = {{-10, -10}, {10, 10}})));

annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.1));
end readColumnsFromCSV00_ex01;
