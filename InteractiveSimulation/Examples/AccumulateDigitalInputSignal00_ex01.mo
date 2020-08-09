within FluidSystemComponents.InteractiveSimulation.Examples;

model AccumulateDigitalInputSignal00_ex01
  extends Modelica.Icons.Example;
  FluidSystemComponents.InteractiveSimulation.Input.AccumulateDigitalInputSignal00 Accumulate annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_DeviceDrivers.Blocks.OperatingSystem.SynchronizeRealtime synchronizeRealtime1 annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_DeviceDrivers.Blocks.InputDevices.KeyboardInput keyboardInput1 annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(keyboardInput1.keyDown, Accumulate.u) annotation(
    Line(points = {{-30, -22}, {-30, -30}, {-1, -30}}, color = {255, 0, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
    
end AccumulateDigitalInputSignal00_ex01;
