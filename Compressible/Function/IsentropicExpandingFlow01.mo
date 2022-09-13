within FluidSystemComponents.Compressible.Function;

function IsentropicExpandingFlow01
  extends Modelica.Icons.Function;
  //----------
  import units = Modelica.SIunits;
  //----------
  input units.Area Aeff;
  input units.Pressure pH_in;
  input units.Temperature Th_in;
  input units.Pressure pL_in;
  input units.SpecificHeatCapacity Rg;
  input Real gamma;
  //----------
  output units.MassFlowRate m_flow;
  //----------
protected
  units.Pressure pSmall= Modelica.Constants.small;
  units.Temperature Tsmall= Modelica.Constants.small;
  units.Pressure pH;
  units.Temperature Th;
  units.Pressure pL;
  Real PR;
  Real PRcr;
  
algorithm
  if(pH_in<1.001*pSmall)then
    pH:=1.001*pSmall;
  else
    pH:=pH_in;
  end if;
  
  if(pL_in<pSmall)then
    pL:=pSmall;
  else
    pL:=pL_in;
  end if;
  
  if(Th<1.001*Tsmall)then
    Th:=1.001*Tsmall;
  else
    Th:=Th_in;
  end if;
  
  PR:= pH / pL;
  PRcr:= ((gamma + 1.0) / 2.0) ^ (gamma / (gamma - 1.0));
  //-----
  if PR < PRcr then
    m_flow:= Aeff * pH / sqrt(Th) * sqrt(2.0 * gamma / (Rg * (gamma - 1.0)) * ((pL / pH) ^ (2.0 / gamma) - (pL / pH) ^ ((gamma + 1.0) / gamma)));
  else
    m_flow:= Aeff * pH / sqrt(Rg * Th) * sqrt(gamma) * ((gamma + 1.0) / 2.0) ^ (-1.0 * (gamma + 1.0) / (2.0 * (gamma - 1.0)));
  end if;
  
end IsentropicExpandingFlow01;
