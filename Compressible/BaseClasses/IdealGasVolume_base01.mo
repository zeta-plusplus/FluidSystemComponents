within FluidSystemComponents.Compressible.BaseClasses;

model IdealGasVolume_base01
  import units= Modelica.Units.SI;
  
  //
  replaceable package Medium =
    Modelica.Media.Interfaces.PartialMedium "Medium in the component"
      annotation (choicesAllMatching = true);
  
  //
  parameter Integer nPorts=0 "Number of ports"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  
  
  parameter Boolean use_HeatTransfer = false
  "= true to use the HeatTransfer model"
      annotation (Dialog(tab="Assumptions", group="Heat transfer"));
  
  parameter units.Volume Vol=1.0;
  
  parameter units.Pressure p_start=100*1000;
  parameter units.Temperature T_start= 288.15;
  
  //
  Medium.EnthalpyFlowRate ports_H_flow[nPorts];
  
  units.MassFlowRate mb_flow "Mass flows across boundaries";
  units.EnthalpyFlowRate Hb_flow
  "Enthalpy flow across boundaries or energy source/sink";
  
  Medium.BaseProperties medium"";
  
  units.SpecificHeatCapacity Cp;
  units.Mass mass;
  
  Real Mat[2,2];
  Real detMat;
  Real MatInv[2,2];
  
  //
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b ports[nPorts](redeclare each package Medium = Medium)
  "Fluid inlets and outlets"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},
      origin={0,-100})));
  
  
initial equation
  medium.p= p_start;
  medium.T= T_start;
  
algorithm
  //
  mb_flow := sum(ports.m_flow);
  Hb_flow := sum(ports_H_flow);
  
  mass:= medium.d*Vol;
  Cp:= Medium.specificHeatCapacityCp(medium.state);
  
  Mat[1,1]:= Vol/(medium.R_s*medium.T);
  Mat[1,2]:= -1*Vol*medium.p/(medium.R_s*medium.T^2);
  Mat[2,1]:= Vol*(Cp-medium.R_s)/(medium.R_s);
  Mat[2,2]:= (Cp-medium.R_s)*(-1*Vol*medium.p/(medium.R_s*medium.T)+mass);
  
  detMat:= Mat[1,1]*Mat[2,2]-Mat[1,2]*Mat[2,1];
  
  MatInv[1,1]:= 1/detMat*Mat[2,2];
  MatInv[1,2]:= -1/detMat*Mat[1,2];
  MatInv[2,1]:= -1/detMat*Mat[2,1];
  MatInv[2,2]:= 1/detMat*Mat[1,1];
  
  
  /*
  
  
  for i in 1:nPorts loop
    ports[i].p:= medium.p;
    ports[i].h_outflow:= medium.h;
    ports[i].Xi_outflow:= medium.Xi;
  end for;
  
  */
  
equation
  /*
  mb_flow = sum(ports.m_flow);
  Hb_flow = sum(ports_H_flow);
  
  mass= medium.d*Vol;
  Cp= Medium.specificHeatCapacityCp(medium.state);
  
  Mat[1,1]= Vol/(medium.R_s*medium.T);
  Mat[1,2]= -1*Vol*medium.p/(medium.R_s*medium.T^2);
  Mat[2,1]= Vol*(Cp-medium.R_s)/(medium.R_s);
  Mat[2,2]= (Cp-medium.R_s)*(-1*Vol*medium.p/(medium.R_s*medium.T)+mass);
  
  detMat= Mat[1,1]*Mat[2,2]-Mat[1,2]*Mat[2,1];
  
  MatInv[1,1]= 1/detMat*Mat[2,2];
  MatInv[1,2]= -1/detMat*Mat[1,2];
  MatInv[2,1]= -1/detMat*Mat[2,1];
  MatInv[2,2]= 1/detMat*Mat[1,1];
  
  */
  
  //
  for i in 1:nPorts loop
    ports_H_flow[i]= ports[i].m_flow * actualStream(ports[i].h_outflow);
  end for;
  
  //
  der(medium.p)= MatInv[1,1]*mb_flow + MatInv[1,2]*Hb_flow;
  der(medium.T)= MatInv[2,1]*mb_flow + MatInv[2,2]*Hb_flow;
  
  //
  
  for i in 1:nPorts loop
    ports[i].p= medium.p;
    ports[i].h_outflow= medium.h;
    ports[i].Xi_outflow= medium.Xi;
  end for;  
  
  
end IdealGasVolume_base01;
