within FluidSystemComponents.InteractiveSimulation.Output.Functions;

function C_printReal01
  input Real variable[:];
  external "C" printReal01(variable, size(variable, 1)) annotation(
    Include = "#include \"printReal01.c\"",
    IncludeDirectory = "modelica://FluidSystemComponents/InteractiveSimulation/Output/Functions");
    
end C_printReal01;
