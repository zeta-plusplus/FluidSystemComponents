within FluidSystemComponents.Compressible.Function;

function CriticalPressureRatio
  extends Modelica.Icons.Function;
  //-----
  input Real gamma_in;
  //-----
  output Real PRcr;

protected
  Real gamma;
  
algorithm
  gamma:= gamma_in + Modelica.Constants.eps;
  PRcr := ((gamma + 1.0) / 2.0) ^ (gamma / (gamma - 1.0));
  
end CriticalPressureRatio;
