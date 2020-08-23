within FluidSystemComponents.InteractiveSimulation.Examples;

model C_printStr01_ex01
  import FluidSystemComponents.InteractiveSimulation.Output.Functions;
  extends Modelica.Icons.Example;
  
  /* ---------------------------------------------
      parameters
  --------------------------------------------- */
  parameter String str[2]={"string #1", "string #2"};
  
  
  
//******************************************************************************************
algorithm
  Functions.C_printStr01(str);
  
  
//******************************************************************************************  
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));

end C_printStr01_ex01;
