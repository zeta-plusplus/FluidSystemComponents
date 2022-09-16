within FluidSystemComponents.Compressible.Function;

function IsentropicExpandingFlow01
  extends Modelica.Icons.Function;
  //----------
  import units = Modelica.SIunits;
  //----------
  
  input units.Area Aeff;
  input units.Pressure p1_in;
  input units.Temperature T1_in;
  input units.Pressure p2_in;
  input units.Temperature T2_in;
  input units.SpecificHeatCapacity Rg_in;
  input Real gamma_in;
  
  input Real PRsmall=1.000001;
  
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
  units.PressureDifference dp;
  Real gamma;
  units.SpecificHeatCapacity Rg;
  //-----
  units.Pressure pHsmall;
  units.MassFlowRate m_flow_byEqn;
  //units.MassFlowRate m_flow_reg;
  units.MassFlowRate m_flow_small;
  units.PressureDifference dpAbsSmall;
  Real inSqrtSmall;
  
algorithm
  /*
  if(p2_in<=p1_in)then
    pH:=abs(p1_in);
    Th:=abs(T1_in);
    pL:=abs(p2_in);
  else
    pH:=abs(p2_in);
    Th:=abs(T2_in);
    pL:=abs(p1_in);
  end if;
  */
  
  pH:=noEvent(if p1_in>=p2_in then p1_in else p2_in);
  Th:=noEvent(if p1_in>=p2_in then T1_in else T2_in);
  pL:=noEvent(if p1_in>=p2_in then p2_in else p1_in);
  
  /*
  if abs(gamma_in)<Modelica.Constants.small then
    gamma:=gamma_in+Modelica.Constants.small;
  else
    gamma:=gamma_in;
  end if;
  */
  
  gamma:=gamma_in;
  Rg:=Rg_in;
  
  /*
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
  */
  
  PR:= pH / pL;
  PRcr:= ((gamma + 1.0) / 2.0) ^ (gamma / (gamma - 1.0));
  dpAbsSmall:= PRsmall*pL+pL;
  dp:= p1_in- p2_in;
  
  //-----
  pHsmall:= pL*PRsmall;
  m_flow_small:= Aeff * pHsmall * sqrt( 2.0 * gamma / (Th* Rg * (gamma - 1.0)) * ((pL / pHsmall) ^ (2.0 / gamma) - (pL / pHsmall) ^ ((gamma + 1.0) / gamma)));
  
  //m_flow_reg:= m_flow_small/dpAbsSmall*(dp - 1.0);
  //m_flow_reg:= Modelica.Fluid.Utilities.regStep(x=dp, y1=m_flow_small, y2=-1*m_flow_small, x_small=dpAbsSmall);
  
  inSqrtSmall:= 2.0 * gamma / (Th* Rg * (gamma - 1.0)) * ((pL / pHsmall) ^ (2.0 / gamma) - (pL / pHsmall) ^ ((gamma + 1.0) / gamma));
  
  //-----
  if (PR < PRcr) then
    m_flow_byEqn:= Aeff * pH * Modelica.Fluid.Utilities.regRoot2( x=(  2.0 * gamma / (Th* Rg * (gamma - 1.0)) * ((pL / pH) ^ (2.0 / gamma) - (pL / pH) ^ ((gamma + 1.0) / gamma))), 
                                                              x_small=inSqrtSmall );
  elseif (PRcr<=PR)then
    m_flow_byEqn:= Aeff * pH / sqrt(Rg * Th) * sqrt(gamma) * ((gamma + 1.0) / 2.0) ^ (-1.0 * (gamma + 1.0) / (2.0 * (gamma - 1.0)));
  end if;
  
  //-----
  m_flow:=sign(dp)*m_flow_byEqn;
  /*
  m_flow:= smooth(1, if dp<=(-1.0)*dpAbsSmall then -1.0*m_flow_byEqn else
                      if (-1.0)*dpAbsSmall<=dp and dp<=0 then m_flow_reg else
                      if dp==0 then 0 else
                      if 0<=dp and dp<=dpAbsSmall then m_flow_reg else
                      m_flow_byEqn
                      );
  */
  //-----
end IsentropicExpandingFlow01;
