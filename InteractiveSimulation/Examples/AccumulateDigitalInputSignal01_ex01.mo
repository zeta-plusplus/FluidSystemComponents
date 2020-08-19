within FluidSystemComponents.InteractiveSimulation.Examples;

model AccumulateDigitalInputSignal01_ex01
  extends Modelica.Icons.Example;
  Modelica_DeviceDrivers.Blocks.OperatingSystem.SynchronizeRealtime synchronizeRealtime1 annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_DeviceDrivers.Blocks.InputDevices.KeyboardInput keyboardInput1 annotation(
    Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.InteractiveSimulation.Input.AccumulateDigitalInputSignal01 Accumulate(scl = 10)  annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(keyboardInput1.keyDown, Accumulate.u) annotation(
    Line(points = {{-50, 59}, {-50, 50}, {-22, 50}}, color = {255, 0, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end AccumulateDigitalInputSignal01_ex01;
