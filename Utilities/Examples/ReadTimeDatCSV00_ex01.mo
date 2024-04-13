within FluidSystemComponents.Utilities.Examples;

model ReadTimeDatCSV00_ex01
  extends Modelica.Icons.Example;
  ReadTimeDatCSV00 readTimeDatCSV00 annotation(
    Placement(transformation(origin = {-20, 6}, extent = {{-10, -10}, {10, 10}})));
equation

  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.1));
end ReadTimeDatCSV00_ex01;
