within FluidSystemComponents.HydroThermal.BaseClasses;

partial model PumpMotorFixedDispBase00
  /********************************************************
        imports   
  ********************************************************/
  import Modelica.Constants;
  
  
  /********************************************************
        Declaration   
  ********************************************************/
  /* ---------------------------------------------
        Package   
  --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  
  
  
  /* ---------------------------------------------
        parameters    
  --------------------------------------------- */
  //********** Initialization Parameters **********
  //--- fluid_1, port_1 ---
  parameter Modelica.SIunits.MassFlowRate m_flow1_init(displayUnit = "kg/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Pressure p1_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Temperature T1_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.SpecificEnthalpy h1_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  //--- fluid_2, port_2 ---
  parameter Modelica.SIunits.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Pressure p2_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Temperature T2_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h2_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  
  
  
  /* ---------------------------------------------
        Internal variables    
  --------------------------------------------- */
  Medium.BaseProperties fluid_1(p.start = p1_init, T.start = T1_init, state.p.start = p1_init, state.T.start = T1_init, h.start = h1_init) "flow station of inlet";
  Medium.BaseProperties fluid_2(p.start = p2_init, T.start = T2_init, state.p.start = p2_init, state.T.start = T2_init, h.start = h2_init) "flow station of outlet";
  Modelica.SIunits.SpecificEntropy s_fluid_1 "specific entropy, fluid_1";
  Modelica.SIunits.SpecificEntropy s_fluid_2 "specific entropy, fluid_2";
  
  Modelica.SIunits.Power pwr "power via shaft, positive if fluid generates power";
  Modelica.SIunits.Torque trq "trq via shaft";
  Modelica.SIunits.Power pwr_inv "power via shaft";
  Modelica.SIunits.Torque trq_inv "trq via shaft";
  
  Modelica.SIunits.AngularVelocity omega "mechanical rotation speed, rad/sec";
  Modelica.SIunits.Angle phi "mechanical rotation displacement, rad";
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech "mechanical rotation speed, rpm";
  
  Real PR "pressure ratio";
  Modelica.SIunits.PressureDifference deltap "";
  Real eff "adiabatic efficiency";
  Modelica.SIunits.SpecificEnthalpy dht_is "specific enthalpy change in isentropic compression";
  Modelica.SIunits.SpecificEnthalpy dht "specific enthalpy change in non-isentropic compression";
  Modelica.SIunits.SpecificEnthalpy h_2is "";
  
  Modelica.SIunits.MassFlowRate m_flow_max;
  Modelica.SIunits.MassFlowRate m_flow_min;
  
  Modelica.SIunits.VolumeFlowRate V_flow_des "volume flow rate, design point";
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm NmechDes "mechanical rotation speed, design point";
  Modelica.SIunits.Volume disp;
  
  
  Real NqNdes "ratio of mech. rotational speed with respect to design pt. speed";
  
  
  
  /* ---------------------------------------------
      Interface   
  --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(
    redeclare package Medium = Medium, m_flow(start = m_flow1_init), h_outflow.start = h1_init
  )
  ""
  annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Interfaces.FluidPort_b port_2(
    redeclare package Medium = Medium, m_flow(start = m_flow2_init), h_outflow.start = h2_init
  )
  ""
  annotation(
    Placement(visible = true, transformation(origin = {102, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_1 annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Types.InfoBus infoBus1 annotation(
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
algorithm

equation
    
    
  /* ---------------------------------------------
  Connections, interface <-> internal variables   
  --------------------------------------------- */  
  //-- fluidPort_1 --
  fluid_1.p = port_1.p;
  fluid_1.h = actualStream(port_1.h_outflow);
  fluid_1.Xi = actualStream(port_1.Xi_outflow); 
  //-- fluidPort_2 --
  fluid_2.p = port_2.p;
  fluid_2.h = actualStream(port_2.h_outflow);
  fluid_2.Xi = actualStream(port_2.Xi_outflow); 
  // distinguish inlet side
  m_flow_max = max(port_1.m_flow, port_2.m_flow);
  m_flow_min= min(port_1.m_flow, port_2.m_flow);
  
  if(m_flow_max == port_1.m_flow)then
    port_1.h_outflow= fluid_1.h;
  elseif(m_flow_max == port_2.m_flow)then
    port_2.h_outflow= fluid_2.h;
  else
    port_1.h_outflow= fluid_1.h;
  end if;
  
    
  //-- shaft --
  flange_1.phi = phi;
  
  
  
  /* ---------------------------------------------
  Eqns describing physics   
  --------------------------------------------- */  
  if(fluid_2.p>=fluid_1.p)then
    PR = fluid_2.p / fluid_1.p;
    deltap= port_2.p - port_1.p;
    dht_is = h_2is - fluid_1.h;
    eff = dht_is / dht;
    dht = fluid_2.h - fluid_1.h;
  else
    PR = fluid_1.p / fluid_2.p;
    deltap= port_1.p - port_2.p;
    dht_is = fluid_1.h - h_2is;
    eff = dht / dht_is;
    dht = fluid_1.h - fluid_2.h;
  end if;
  
  h_2is= Medium.isentropicEnthalpy(fluid_2.p, fluid_1.state);
  
  
  port_1.m_flow + port_2.m_flow = 0.0;
  fluid_2.Xi = fluid_1.Xi;
  
  trq = flange_1.tau;
  pwr = -1.0 * (port_1.m_flow * fluid_1.h + port_2.m_flow * fluid_2.h);
  der(phi) = omega;
  omega * trq = pwr;
  Nmech = Modelica.SIunits.Conversions.NonSIunits.to_rpm(omega);
  
  pwr_inv= -1*pwr;
  trq_inv= -1*trq;
  
  s_fluid_1= Medium.specificEntropy(fluid_1.state);
  s_fluid_2= Medium.specificEntropy(fluid_2.state);
  
  
  NqNdes = Nmech / NmechDes;
  disp= V_flow_des/(NmechDes/60.0);
  
  
  
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    Icon(graphics = {Ellipse(origin = {28, -22}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-88, 82}, {32, -38}}, endAngle = 360), Polygon(origin = {46, 4}, fillPattern = FillPattern.Solid, points = {{-16, 16}, {-16, -24}, {14, -4}, {-16, 16}}), Rectangle(origin = {0, -75}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-8, 15}, {8, -23}}), Line(origin = {51.74, -0.52}, points = {{9, 0}, {47, 0}}, thickness = 2), Line(origin = {-90.38, -0.1}, points = {{-11, 0}, {29, 0}}, thickness = 2), Polygon(origin = {-46, -4}, rotation = 180, fillPattern = FillPattern.Solid, points = {{-16, 16}, {-16, -24}, {14, -4}, {-16, 16}})}, coordinateSystem(initialScale = 0.1)));
end PumpMotorFixedDispBase00;
