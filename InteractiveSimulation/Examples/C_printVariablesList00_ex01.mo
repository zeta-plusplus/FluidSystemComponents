within FluidSystemComponents.InteractiveSimulation.Examples;

model C_printVariablesList00_ex01
  import FluidSystemComponents.InteractiveSimulation.Output.Functions;
  extends Modelica.Icons.Example;
  
  /* ---------------------------------------------
      parameters
  --------------------------------------------- */
  parameter String str[2]={"time[s]", "sin(time)[nond]"};
  
  
  /* ---------------------------------------------
      Internal variables
  --------------------------------------------- */
  Real var[2];
  
  
//******************************************************************************************
algorithm
  var[1]:= time;
  var[2]:= sin(time);
  Functions.C_printVariablesList00(str, var);

//******************************************************************************************
annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));

end C_printVariablesList00_ex01;
