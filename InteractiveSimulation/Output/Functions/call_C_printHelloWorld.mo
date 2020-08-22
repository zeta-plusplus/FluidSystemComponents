within FluidSystemComponents.InteractiveSimulation.Output.Functions;

function call_C_printHelloWorld
  external "C" printHelloWorld() annotation(
    Include = "#include \"printHelloWorld.c\"",
    IncludeDirectory = "modelica://FluidSystemComponents/InteractiveSimulation/Output/Functions");
    
end call_C_printHelloWorld;
