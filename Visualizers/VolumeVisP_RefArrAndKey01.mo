within FluidSystemComponents.Visualizers;

model VolumeVisP_RefArrAndKey01
  extends FluidSystemComponents.MSLfluidWithVisualization.CommonBaseClasses.Volume_Vis_Base;
  
  //----------------------------------------
  // Import
  //----------------------------------------
  import units = Modelica.Units.SI;
  import Colors = Modelica.Mechanics.MultiBody.Visualizers.Colors;
  //----------------------------------------
  // replaceable
  //----------------------------------------
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium "Medium in the component" annotation(
    choicesAllMatching = true);
  replaceable String stringVector[:] "";
  replaceable Real varVector[:] "";
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Visualizers.Types.SwitchUnitVisPressure switchUnitP = Visualizers.Types.SwitchUnitVisPressure.kPa;
  parameter String keyString = "" "";
  parameter Boolean use_HeatTransfer = false "= true to use the HeatTransfer model" annotation(
    Dialog(tab = "Assumptions", group = "Heat transfer"));
  parameter Integer sigDigits(min = 1) = 6 "";
  parameter Modelica.Units.SI.Pressure pContourMin = 100000 "";
  parameter Modelica.Units.SI.Pressure pContourMax = 500000 "";
  parameter Real colorMap[:, 3] = Colors.ColorMaps.jet() annotation(HideResult = true);
  parameter Integer nPorts = 0 "Number of ports" annotation(
    Evaluate = true,
    Dialog(connectorSizing = true, tab = "General", group = "Ports"));
  parameter units.Volume fluidVolume = 0.001;
  //----------------------------------------
  // variables
  //----------------------------------------
  //Real vecRGB[3];
  //Real pVis;
  Integer indexP;
  Medium.BaseProperties medium;
  Medium.EnthalpyFlowRate ports_H_flow[nPorts];
  units.EnergyFlowRate[nPorts] ports_E_flow "Flow of kinetic and potential energy at device boundary";
  units.MassFlowRate mb_flow "Mass flows across boundaries";
  units.EnthalpyFlowRate Hb_flow "Enthalpy flow across boundaries or energy source/sink";
  units.HeatFlowRate Qb_flow "Heat flow across boundaries or energy source/sink";
  //----------------------------------------
  // interface
  //----------------------------------------
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b ports[nPorts](redeclare each package Medium = Medium) "Fluid inlets and outlets" annotation(
    Placement(transformation(origin = {0, -100}, extent = {{-40, -10}, {40, 10}}), iconTransformation(origin = {0, -98}, extent = {{-40, -10}, {40, 10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort if use_HeatTransfer annotation(
    Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
  //************************************************************
equation
//-------------------------
  indexP = FluidSystemComponents.Utilities.f_indexByName00(stringVector, keyString);
//-------------------------
  vecRGB = Colors.scalarToColor(medium.p, pContourMin, pContourMax, colorMap);
  if (switchUnitP == Visualizers.Types.SwitchUnitVisPressure.kPa) then
    pVis = medium.p/1000.0;
  else
    pVis = medium.p;
  end if;
//-------------------------
  medium.p = varVector[indexP];
  medium.T = 288.15;
  mb_flow = sum(ports.m_flow);
  Hb_flow = sum(ports_H_flow) + sum(ports_E_flow);
  
  
  if (use_HeatTransfer) then
    Qb_flow = heatPort.Q_flow;
  else
    Qb_flow = 0.0;
  end if;
  for i in 1:nPorts loop
    ports_H_flow[i] = ports[i].m_flow*actualStream(ports[i].h_outflow) "Enthalpy flow";
    ports_E_flow[i] = 0.0 "Flow of kinetic and potential energy";
    ports[i].p = medium.p;
    ports[i].h_outflow = medium.h;
    ports[i].Xi_outflow = medium.Xi;
  end for;
  
  
  
  annotation(
    defaultComponentName = "Vol_pVis",
    Icon(coordinateSystem(preserveAspectRatio = false), 
    graphics = {
    
    Ellipse(fillColor = {0, 85, 255}, fillPattern = FillPattern.Sphere, extent = {{-100, 100}, {100, -100}}), 
    
    Text(origin = {0, 121}, extent = {{-100, 15}, {100, -15}}, textString = DynamicSelect("0.0", String(pVis, sigDigits, 0, true))),
    Text(origin = {0, 154}, extent = {{-100, 10}, {100, -10}}, textString = "%keyString")}
    ));

end VolumeVisP_RefArrAndKey01;
