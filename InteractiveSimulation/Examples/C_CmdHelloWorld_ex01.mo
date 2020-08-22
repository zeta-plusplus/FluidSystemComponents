within FluidSystemComponents.InteractiveSimulation.Examples;

model C_CmdHelloWorld_ex01
  import FluidSystemComponents.InteractiveSimulation.Output.Functions;
  extends Modelica.Icons.Example;
algorithm
  Functions.call_C_printHelloWorld();
equation

end C_CmdHelloWorld_ex01;
