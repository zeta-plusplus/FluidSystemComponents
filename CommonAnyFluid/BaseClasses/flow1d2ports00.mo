within FluidSystemComponents.CommonAnyFluid.BaseClasses;

partial model flow1d2ports00
  /********************************************************
          imports
    ********************************************************/
  import Modelica.Constants;
  import Modelica.Utilities.Streams;
  import PropulsionSystem.Types.switches;
  import units=Modelica.Units.SI;
  /********************************************************
                 Declaration
    ********************************************************/
  /* ---------------------------------------------
        switch
    --------------------------------------------- */
  parameter Boolean allowFlowReversal = true "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)";
  parameter Boolean isCircular = true "= true if cross sectional area is circular";
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
  parameter units.MassFlowRate m_flow1_init(displayUnit = "kg/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter units.Pressure p1_init(displayUnit = "Pa") = p1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter units.Temperature T1_init(displayUnit = "K") = 500 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter units.SpecificEnthalpy h1_init(displayUnit = "J/kg") = T1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  //--- fluid_2, port_2 ---
  parameter units.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter units.Pressure p2_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter units.Temperature T2_init(displayUnit = "K") = 300 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter units.SpecificEnthalpy h2_init(displayUnit = "J/kg") = T2_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  //--- others ---
  parameter units.VolumeFlowRate V_flow_init(displayUnit = "m3/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter units.Velocity Vpath_init = 100.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.Velocity Vsound_init = 340 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Real Mn_init = 0.8 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  
  parameter units.SpecificEntropy s_fluid_1_init = 6800.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.SpecificEntropy s_fluid_2_init = 7000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  
  //
  parameter units.Area AeffPath_paramInput = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  /* ---------------------------------------------
        Internal variables
    --------------------------------------------- */
  units.MassFlowRate m_flow_max(start = m_flow1_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.MassFlowRate m_flow_min(start = m_flow2_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.MassFlowRate m_flow(start = m_flow1_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.VolumeFlowRate V_flow(start = V_flow_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Velocity Vpath(start = Vpath_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Area AeffPath(start = AeffPath_paramInput) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.SpecificEntropy s_fluid_1(start = s_fluid_1_init) "specific entropy, fluid_1" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.SpecificEntropy s_fluid_2(start = s_fluid_2_init) "specific entropy, fluid_2" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.SpecificEntropy s_fluid_path(start = s_fluid_1_init) "specific entropy, fluid_path" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Velocity Vsound(start= Vsound_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true)); 
  Real Mn(start= Mn_init) "mach number" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  
  units.Length diamEff "equivalent diameter of Aeff";
  
  /* ---------------------------------------------
        Internal objects
    --------------------------------------------- */
  Medium.BaseProperties fluid_1(p(start = p1_init, min = 0.0 + 1.0e-10), T(start = T1_init, min = 0.0 + 1.0e-10), state.p(start = p1_init, min = 0.0 + 1.0e-10), state.T(start = T1_init, min = 0.0 + 1.0e-10), h(start = h1_init, min = 0.0 + 1.0e-10)) "flow station of inlet";
  Medium.BaseProperties fluid_2(p(start = p2_init, min = 0.0 + 1.0e-10), T(start = T2_init, min = 0.0 + 1.0e-10), state.p(start = p2_init, min = 0.0 + 1.0e-10), state.T(start = T2_init, min = 0.0 + 1.0e-10), h(start = h2_init, min = 0.0 + 1.0e-10)) "flow station of outlet (ambient)";
  Medium.BaseProperties fluid_path(p(start = p1_init, min = 0.0 + 1.0e-10), T(start = T1_init, min = 0.0 + 1.0e-10), state.p(start = p1_init, min = 0.0 + 1.0e-10), state.T(start = T1_init, min = 0.0 + 1.0e-10), h(start = h1_init, min = 0.0 + 1.0e-10)) "flow station of 1D path";
  Medium.BaseProperties fluidStat_path(p(start = p1_init, min = 0.0 + 1.0e-10), T(start = T1_init, min = 0.0 + 1.0e-10), state.p(start = p1_init, min = 0.0 + 1.0e-10), state.T(start = T1_init, min = 0.0 + 1.0e-10), h(start = h1_init, min = 0.0 + 1.0e-10)) "flow station of 1D path, static";
  /* ---------------------------------------------
        Interface
    --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium = Medium, m_flow(start = m_flow1_init, min = if allowFlowReversal then -Constants.inf else 0.0), h_outflow(start = h1_init, min = 0.0 + 1.0e-10), p(start = p1_init, min = 0.0 + 1.0e-10)) "Exit of nozzle, pipe, etc, total state" annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(redeclare package Medium = Medium, m_flow(start = m_flow2_init, max = if allowFlowReversal then +Constants.inf else 0.0), h_outflow(start = h2_init, min = 0.0 + 1.0e-10), p(start = p2_init, min = 0.0 + 1.0e-10)) "ambient, static state" annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
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
  m_flow_min = min(port_1.m_flow, port_2.m_flow);
  if allowFlowReversal == false then
    port_1.h_outflow = fluid_1.h;
    port_1.Xi_outflow = fluid_1.Xi;
  else
    if m_flow_max == port_1.m_flow then
      port_1.h_outflow = fluid_1.h;
      port_1.Xi_outflow = fluid_1.Xi;
    elseif m_flow_max == port_2.m_flow then
      port_2.h_outflow = fluid_2.h;
      port_2.Xi_outflow = fluid_2.Xi;
    else
      port_1.h_outflow = fluid_1.h;
      port_1.Xi_outflow = fluid_1.Xi;
    end if;
  end if;
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
//-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0;
  fluid_2.Xi = fluid_1.Xi;
  port_1.C_outflow = inStream(port_2.C_outflow);
  port_2.C_outflow = inStream(port_1.C_outflow);
//-- energy conservation --
  port_1.m_flow * fluid_1.h + port_2.m_flow * fluid_2.h = 0;
//---
  if m_flow_max == port_2.m_flow then
    m_flow = port_2.m_flow;
    fluid_path.Xi = fluid_2.Xi;
    fluid_path.h = fluid_2.h;
    s_fluid_path= s_fluid_2;
    fluidStat_path.Xi = fluid_2.Xi;
  else
    m_flow = port_1.m_flow;
    fluid_path.Xi = fluid_1.Xi;
    fluid_path.h = fluid_1.h;
    s_fluid_path= s_fluid_1;
    fluidStat_path.Xi = fluid_1.Xi;
  end if;
//-- others --
  s_fluid_1 = Medium.specificEntropy(fluid_1.state);
  s_fluid_2 = Medium.specificEntropy(fluid_2.state);
  s_fluid_path = Medium.specificEntropy(fluid_path.state);
  m_flow = AeffPath * fluid_path.d * Vpath;
  V_flow= AeffPath*Vpath;
  
  Vsound= Medium.velocityOfSound(fluidStat_path.state);
  Mn= Vpath/Vsound;
  
  // -- total <-> static --
  fluidStat_path.h = fluid_path.h - 1.0 / 2.0 * (sign(Vpath) * abs(Vpath) ^ 2.0);
  fluid_path.h = Medium.isentropicEnthalpy(fluid_path.p, fluidStat_path.state);
  
end flow1d2ports00;
