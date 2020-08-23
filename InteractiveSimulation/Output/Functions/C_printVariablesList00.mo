within FluidSystemComponents.InteractiveSimulation.Output.Functions;

function C_printVariablesList00
  input String variableName[:];
  input Real variable[:];
  
  external "C" printVariablesList00(variableName, size(variableName, 1), variable, size(variable, 1)) annotation(
    Include = "#include \"printVariablesList00.c\"",
    IncludeDirectory = "modelica://FluidSystemComponents/InteractiveSimulation/Output/Functions");
    
end C_printVariablesList00;
