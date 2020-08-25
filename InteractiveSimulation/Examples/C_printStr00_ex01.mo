within FluidSystemComponents.InteractiveSimulation.Examples;

model C_printStr00_ex01
  import FluidSystemComponents.InteractiveSimulation.Output.Functions;
  extends Modelica.Icons.Example;
algorithm
  Functions.C_printStr00("test");
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
  
end C_printStr00_ex01;
