within FluidSystemComponents.Utilities;

function f_signChangeSmoothing
  extends Modelica.Icons.Function;
  //-----
  input Real x;
  input Real x_small;
  //-----
  output Real y;
  
  //****************************************
algorithm
  
  
  y:= tanh(x/x_small);
  
end f_signChangeSmoothing;