within FluidSystemComponents.Utilities;

function f_indexByName00
  extends Modelica.Icons.Function;
  //
  input String[:] arrString;
  input String key;
  //
  output Integer i;
    
algorithm
  i := Modelica.Math.BooleanVectors.firstTrueIndex({k == key for k in arrString});
end f_indexByName00;
