within FluidSystemComponents.Utilities.Examples;

model CombiTimeTable1ByName00_ex01
  extends Modelica.Icons.Example;
  CombiTimeTable1VarByName00 combiTimeTable annotation(
    Placement(transformation(origin = {-42, 56}, extent = {{-10, -10}, {10, 10}})));
equation

  annotation(
    experiment(StartTime = 0, StopTime = 15, Tolerance = 1e-06, Interval = 0.01));
end CombiTimeTable1ByName00_ex01;
