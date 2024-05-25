within FluidSystemComponents.Visualizers;

model VolumeVisPressure00
  
  import units=Modelica.Units.SI;
  
  replaceable package Medium =
    Modelica.Media.Interfaces.PartialMedium "Medium in the component"
      annotation (choicesAllMatching = true);
  
  parameter Integer nPorts=0 "Number of ports"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  
  
  units.MassFlowRate mb_flow "Mass flows across boundaries";
  units.MassFlowRate[Medium.nXi] mbXi_flow
  "Substance mass flows across boundaries";
  Medium.ExtraPropertyFlowRate[Medium.nC] mbC_flow
  "Trace substance mass flows across boundaries";
  units.EnthalpyFlowRate Hb_flow
  "Enthalpy flow across boundaries or energy source/sink";
  units.HeatFlowRate Qb_flow
  "Heat flow across boundaries or energy source/sink";
  units.Power Wb_flow "Work flow across boundaries or source term";
  
  
  
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b ports[nPorts](redeclare each package Medium = Medium)
  "Fluid inlets and outlets"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},
      origin={0,-100})));
  
  
//************************************************************  
equation
  
  
  mb_flow = sum(ports.m_flow);
  mbXi_flow = sum_ports_mXi_flow;
  mbC_flow  = sum_ports_mC_flow;
  Hb_flow = sum(ports_H_flow) + sum(ports_E_flow);
  Qb_flow = heatTransfer.Q_flows[1];
  
  
    
end VolumeVisPressure00;
