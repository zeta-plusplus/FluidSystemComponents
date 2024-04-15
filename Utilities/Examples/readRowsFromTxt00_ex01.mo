within FluidSystemComponents.Utilities.Examples;

model readRowsFromTxt00_ex01
  extends Modelica.Icons.Example;
  readRowsFromTxt00 readRowsFromTxt(filePath = "modelica://FluidSystemComponents/Utilities/Examples/exampleTimeTable01.csv")  annotation(
    Placement(transformation(origin = {-26, 54}, extent = {{-10, -10}, {10, 10}})));
initial algorithm
  /*for i in 1:readRowsFromTxt00.y_nRows loop
    Modelica.Utilities.Streams.print(readRowsFromTxt00.y_strRows[i]+", ");
  end for;
  */
annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.1));
end readRowsFromTxt00_ex01;
