within FluidSystemComponents.InteractiveSimulation.Examples;

model PrintCSV_overwriting00_ex01
  extends Modelica.Icons.Example;
  FluidSystemComponents.InteractiveSimulation.Output.PrintCSV_overwriting00 PrintOnCSV(nVariables = 2, nameVariables = {"sin(time)", "cos(time)"})  annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_DeviceDrivers.Blocks.OperatingSystem.SynchronizeRealtime synchronizeRealtime1(enable = true)  annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 1, freqHz = 1)  annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Cosine cosine1(amplitude = 2, freqHz = 1)  annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(cosine1.y, PrintOnCSV.u_variables[2]) annotation(
    Line(points = {{-39, 20}, {-28, 20}, {-28, 40}, {-20, 40}}, color = {0, 0, 127}));
  connect(sine1.y, PrintOnCSV.u_variables[1]) annotation(
    Line(points = {{-39, 50}, {-33.5, 50}, {-33.5, 40}, {-20, 40}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end PrintCSV_overwriting00_ex01;
