within FluidSystemComponents.Visualizers;

model VolumeVisPressure00
  
  //----------------------------------------
  // Import
  //----------------------------------------
  import units=Modelica.Units.SI;
  import Colors = Modelica.Mechanics.MultiBody.Visualizers.Colors;
  
  //----------------------------------------
  // replaceable
  //----------------------------------------
  replaceable package Medium =
    Modelica.Media.Interfaces.PartialMedium "Medium in the component"
      annotation (choicesAllMatching = true);
  
  
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Boolean use_HeatTransfer = false
  "= true to use the HeatTransfer model"
      annotation (Dialog(tab="Assumptions", group="Heat transfer"));
  
  parameter Integer sigDigits(min=1) = 6 "";
  parameter Modelica.Units.SI.AbsolutePressure pContourMin = 100000 "" annotation(displayUnit="kPa");
  parameter Modelica.Units.SI.AbsolutePressure pContourMax = 5000000 "";
  parameter Real colorMap[:, 3] = Colors.ColorMaps.jet();
  
  parameter Integer nPorts=0 "Number of ports"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  
  parameter units.Volume fluidVolume = 0.001;
  
  //----------------------------------------
  // variables
  //----------------------------------------
  Real vecRGB[3];
  
  //units.Energy U "Internal energy of fluid";
  //units.Mass m "Mass of fluid";
  
  Medium.BaseProperties medium;
  Medium.EnthalpyFlowRate ports_H_flow[nPorts];
  units.EnergyFlowRate[nPorts] ports_E_flow "Flow of kinetic and potential energy at device boundary";
  
  units.MassFlowRate mb_flow "Mass flows across boundaries";
  units.EnthalpyFlowRate Hb_flow "Enthalpy flow across boundaries or energy source/sink";
  units.HeatFlowRate Qb_flow "Heat flow across boundaries or energy source/sink";
  
  //units.MassFlowRate[Medium.nXi] mbXi_flow "Substance mass flows across boundaries";
  //Medium.ExtraPropertyFlowRate[Medium.nC] mbC_flow "Trace substance mass flows across boundaries";
  //units.EnthalpyFlowRate Hb_flow "Enthalpy flow across boundaries or energy source/sink";
  //units.HeatFlowRate Qb_flow "Heat flow across boundaries or energy source/sink";
  //units.Power Wb_flow "Work flow across boundaries or source term";
  
  
  /*
  Medium.MassFlowRate[Medium.nXi] sum_ports_mXi_flow;
  Medium.ExtraPropertyFlowRate[Medium.nC] sum_ports_mC_flow;
  
  Medium.EnthalpyFlowRate ports_H_flow[nPorts];
  units.EnergyFlowRate[nPorts] ports_E_flow;
  */
  
  //----------------------------------------
  // interface
  //----------------------------------------
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b ports[nPorts](redeclare each package Medium = Medium)
  "Fluid inlets and outlets"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},
      origin={0,-100})));
  
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort if use_HeatTransfer
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  
  
//************************************************************
equation
  
  vecRGB = Colors.scalarToColor(medium.p, pContourMin, pContourMax, colorMap);
  
  //-------------------------
  medium.T= 288.15;
  
  mb_flow = sum(ports.m_flow);
  Hb_flow = sum(ports_H_flow) + sum(ports_E_flow);
  
  if(use_HeatTransfer)then
    Qb_flow = heatPort.Q_flow;
  else
    Qb_flow=0.0;
  end if;
  
  //m = fluidVolume*medium.d;
  //U = m*medium.u;
  
  //der(U)= Hb_flow + Qb_flow;
  
  //medium.h= (Hb_flow + Qb_flow)/mb_flow;
  
  for i in 1:nPorts loop
    ports_H_flow[i] = ports[i].m_flow * actualStream(ports[i].h_outflow) "Enthalpy flow";
    ports_E_flow[i] = 0.0 "Flow of kinetic and potential energy";
    ports[i].p = medium.p;
    ports[i].h_outflow  = medium.h;
    ports[i].Xi_outflow = medium.Xi;
  end for;
  
    
annotation(
    defaultComponentName = "Vol_pVis",
    Icon(graphics = {Ellipse(fillColor = DynamicSelect({192, 192, 192}, {vecRGB[1], vecRGB[2], vecRGB[3]}), fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, 112}, extent = {{-100, 8}, {100, -8}}, textString = "%name")}));
end VolumeVisPressure00;
