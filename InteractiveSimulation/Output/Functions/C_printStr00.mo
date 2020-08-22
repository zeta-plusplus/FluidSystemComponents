within FluidSystemComponents.InteractiveSimulation.Output.Functions;

function C_printStr00

  external "C" printStr00() annotation(
    Include = "#include \"printStr00.c\"",
    IncludeDirectory = "modelica://FluidSystemComponents/InteractiveSimulation/Output/Functions");
end C_printStr00;
