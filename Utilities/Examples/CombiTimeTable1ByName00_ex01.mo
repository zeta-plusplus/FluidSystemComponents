within FluidSystemComponents.Utilities.Examples;

model CombiTimeTable1ByName00_ex01
  extends Modelica.Icons.Example;
  CombiTimeTable1VarByName00 combiTimeTable(strVar = "der(volume.medium.T)", strFileName = "modelica://FluidSystemComponents/Utilities/Examples/exampleTimeTable01.csv", nColMax = 7)  annotation(
    Placement(transformation(origin = {-18, 22}, extent = {{-10, -10}, {10, 10}})));
equation

  annotation(
    experiment(StartTime = 0, StopTime = 15, Tolerance = 1e-06, Interval = 0.01));
end CombiTimeTable1ByName00_ex01;
