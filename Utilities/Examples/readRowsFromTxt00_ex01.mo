within FluidSystemComponents.Utilities.Examples;

model readRowsFromTxt00_ex01
  extends Modelica.Icons.Example;
  readRowsFromTxt00 readRowsFromTxt(filePath = "modelica://FluidSystemComponents/Utilities/Examples/varList_exampleTimeTable01.csv")  annotation(
    Placement(transformation(origin = {-26, 54}, extent = {{-10, -10}, {10, 10}})));

annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.1));
end readRowsFromTxt00_ex01;
