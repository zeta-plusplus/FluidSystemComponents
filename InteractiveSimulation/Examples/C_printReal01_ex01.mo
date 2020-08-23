within FluidSystemComponents.InteractiveSimulation.Examples;

model C_printReal01_ex01
  import FluidSystemComponents.InteractiveSimulation.Output.Functions;
  extends Modelica.Icons.Example;
  
  /* ---------------------------------------------
      parameters
  --------------------------------------------- */
  
  
  
  /* ---------------------------------------------
      Internal variables
  --------------------------------------------- */
  Real var[2];
  
  
//******************************************************************************************
algorithm
  var[1]:= time;
  var[2]:= 2*time;
  Functions.C_printReal01(var);

//******************************************************************************************
annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));

end C_printReal01_ex01;
