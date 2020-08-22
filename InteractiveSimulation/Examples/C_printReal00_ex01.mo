within FluidSystemComponents.InteractiveSimulation.Examples;

model C_printReal00_ex01
  import FluidSystemComponents.InteractiveSimulation.Output.Functions;
  extends Modelica.Icons.Example;
algorithm
  Functions.C_printReal00(time);

annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end C_printReal00_ex01;
