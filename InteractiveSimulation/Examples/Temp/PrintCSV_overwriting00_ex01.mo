within FluidSystemComponents.InteractiveSimulation.Examples.Temp;

model PrintCSV_overwriting00_ex01
  extends Modelica.Icons.Example;
  FluidSystemComponents.InteractiveSimulation.Output.PrintCSV_overwriting00 PrintOnCSV annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_DeviceDrivers.Blocks.OperatingSystem.SynchronizeRealtime synchronizeRealtime1(enable = true)  annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end PrintCSV_overwriting00_ex01;
