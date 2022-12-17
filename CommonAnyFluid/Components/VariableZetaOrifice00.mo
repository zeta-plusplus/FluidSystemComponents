within FluidSystemComponents.CommonAnyFluid.Components;

model VariableZetaOrifice00 "orifice with external zeta input, incompressible equation"
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
  parameter Boolean allowFlowReversal= false
    "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)"
    annotation(
      Dialog(tab="Assumptions"), Evaluate=true);
  parameter Boolean isCircular=true
    "= true if cross sectional area is circular"
    annotation (Evaluate, Dialog(tab="General", group="Geometry"));
  
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
  parameter units.Pressure p1_init(displayUnit = "Pa") = PR_init*p2_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter units.Temperature T1_init(displayUnit = "K") = 500 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter units.SpecificEnthalpy h1_init(displayUnit = "J/kg") = T1_init*1.004 * 1000  "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  //--- fluid_2, port_2 ---
  parameter units.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter units.Pressure p2_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter units.Temperature T2_init(displayUnit = "K") = 300 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter units.SpecificEnthalpy h2_init(displayUnit = "J/kg") = T2_init* 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  //--- others ---
  parameter Real zeta_init=1.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Real PR_init=1.5 "" annotation(
    Dialog(tab = "Initialization", group = "others")); 
  parameter units.Pressure dp_init(displayUnit = "Pa") = 100.0 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.Velocity Vth_init=100.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter units.SpecificEntropy s_fluid_1_init=6800.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter units.SpecificEntropy s_fluid_2_init=7000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter units.VolumeFlowRate V_flow_init(displayUnit = "m3/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  
  //********** Design Parameters **********
  parameter units.Length diam_paramInput=0.01 "diameter, valid if isCircular==true" annotation(
    Dialog(group = "Geometory"));
  parameter units.Area AmechTh_paramInput = Modelica.Constants.pi/4.0*diam_paramInput^2 "mechanical area of 'throat', valid if isCircular==false" annotation(
    Dialog(group = "Geometory"));
  
  
  /* ---------------------------------------------
      Internal variables
  --------------------------------------------- */
  units.MassFlowRate m_flow_max(start=m_flow1_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  units.MassFlowRate m_flow_min(start=m_flow2_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real zeta(start=zeta_init) "pressure drop coefficient" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real PR(
    start=PR_init
  ) "pressure ratio" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  units.Pressure dp(
    start=dp_init
  )
     "pressure difference" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  units.Velocity Vth(start=Vth_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  units.Area AmechTh(start= AmechTh_paramInput) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  units.SpecificEntropy s_fluid_1(start=s_fluid_1_init) "specific entropy, fluid_1" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  units.SpecificEntropy s_fluid_2(start=s_fluid_2_init) "specific entropy, fluid_2" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  units.SpecificEntropy s_fluid_th(start = s_fluid_1_init) "specific entropy, fluid_path" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.MassFlowRate m_flow(start = m_flow1_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.VolumeFlowRate V_flow(start = V_flow_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  
  
  /* ---------------------------------------------
      Internal objects
  --------------------------------------------- */
  Medium.BaseProperties fluid_1(
    p(start = p1_init, min=0.0+1.0e-10), 
    T(start = T1_init, min=0.0+1.0e-10), 
    state.p(start = p1_init, min=0.0+1.0e-10), 
    state.T(start = T1_init, min=0.0+1.0e-10), 
    h(start = h1_init, min=0.0+1.0e-10)
  ) "flow station of inlet";
  Medium.BaseProperties fluid_2(
    p(start = p2_init, min=0.0+1.0e-10), 
    T(start = T2_init, min=0.0+1.0e-10), 
    state.p(start = p2_init, min=0.0+1.0e-10), 
    state.T(start = T2_init, min=0.0+1.0e-10), 
    h(start = h2_init, min=0.0+1.0e-10)
  ) "flow station of outlet (ambient)";
  
  Medium.BaseProperties fluid_th(p(start = p1_init, min = 0.0 + 1.0e-10), T(start = T1_init, min = 0.0 + 1.0e-10), state.p(start = p1_init, min = 0.0 + 1.0e-10), state.T(start = T1_init, min = 0.0 + 1.0e-10), h(start = h1_init, min = 0.0 + 1.0e-10)) "flow station of 1D path";
  Medium.BaseProperties fluidStat_th(p(start = p1_init, min = 0.0 + 1.0e-10), T(start = T1_init, min = 0.0 + 1.0e-10), state.p(start = p1_init, min = 0.0 + 1.0e-10), state.T(start = T1_init, min = 0.0 + 1.0e-10), h(start = h1_init, min = 0.0 + 1.0e-10)) "flow station of 1D path, static";
  
  
  /* ---------------------------------------------
      Interface
  --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(
    redeclare package Medium = Medium, 
    m_flow(start = m_flow1_init, min=if (allowFlowReversal) then -Constants.inf else 0.0), 
    h_outflow(start = h1_init, min=0.0+1.0e-10), 
    p(start=p1_init, min=0.0+1.0e-10)
  ) "Exit of nozzle, pipe, etc, total state" annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(
    redeclare package Medium = Medium, 
    m_flow(start = m_flow2_init, max=if allowFlowReversal then +Constants.inf else 0.0), 
    h_outflow(start = h2_init, min=0.0+1.0e-10), 
    p(start=p2_init, min=0.0+1.0e-10)
  ) "ambient, static state" annotation(
    Placement(visible = true, transformation(origin = { 100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = { 100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  FluidSystemComponents.Types.InfoBus infoBus1 annotation(
    Placement(visible = true, transformation(origin = {100, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_zeta annotation(
    Placement(visible = true, transformation(origin = {-50, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
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
  m_flow_min= min(port_1.m_flow, port_2.m_flow);
  
  if(allowFlowReversal==false)then
    port_1.h_outflow= fluid_1.h;
    port_1.Xi_outflow= fluid_1.Xi;  
  else
    if(m_flow_max == port_1.m_flow)then
      port_1.h_outflow= fluid_1.h;
      port_1.Xi_outflow= fluid_1.Xi;
    elseif(m_flow_max == port_2.m_flow)then
      port_2.h_outflow= fluid_2.h;
      port_2.Xi_outflow= fluid_2.Xi;
    else
      port_1.h_outflow= fluid_1.h;
      port_1.Xi_outflow= fluid_1.Xi;
    end if;
  end if;
  
  zeta= u_zeta;
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
//-- flow at throat --
  if(isCircular==true)then
    AmechTh= Modelica.Constants.pi/4.0*diam_paramInput^2.0;
  else
    AmechTh = AmechTh_paramInput;
  end if;
  
  if(m_flow_max==port_2.m_flow)then
    port_2.m_flow=fluid_2.d*Vth*AmechTh;
    //-- pressure loss --
    PR = fluid_2.p / fluid_1.p;
    dp= fluid_2.p - fluid_1.p;
    dp= zeta*1.0/2.0*fluid_2.d*(Vth)^2.0;
  else
    port_1.m_flow=fluid_1.d*Vth*AmechTh;
    //-- pressure loss --
    PR = fluid_1.p / fluid_2.p;
    dp= fluid_1.p - fluid_2.p;
    dp= zeta*1.0/2.0*fluid_1.d*(Vth)^2.0;
  end if;  
  
//-- others --
  s_fluid_1 = Medium.specificEntropy(fluid_1.state);
  s_fluid_2= Medium.specificEntropy(fluid_2.state);
  
  //---
  if m_flow_max == port_2.m_flow then
    m_flow = port_2.m_flow;
    fluid_th.Xi = fluid_2.Xi;
    fluid_th.h = fluid_2.h;
    s_fluid_th= s_fluid_2;
    fluidStat_th.Xi = fluid_2.Xi;
  else
    m_flow = port_1.m_flow;
    fluid_th.Xi = fluid_1.Xi;
    fluid_th.h = fluid_1.h;
    s_fluid_th= s_fluid_1;
    fluidStat_th.Xi = fluid_1.Xi;
  end if;
  
  s_fluid_th = Medium.specificEntropy(fluid_th.state);
  V_flow= AmechTh*Vth;
  
  // -- total <-> static --
  fluidStat_th.h = fluid_th.h - 1.0 / 2.0 * (sign(Vth) * abs(Vth) ^ 2.0);
  fluid_th.h = Medium.isentropicEnthalpy(fluid_th.p, fluidStat_th.state);
  
/********************************************************
  Graphics
********************************************************/
annotation(
    defaultComponentName = "Orifice",
    Icon(graphics = {Line(origin = {0.28, 0.34}, points = {{-98, 0}, {98, 0}}, thickness = 2.5), Line(origin = {-2.45, 32.76}, points = {{-77.2818, 18.4933}, {-69.2818, 4.49327}, {-57.2818, -7.50673}, {-47.2818, -13.5067}, {-27.2818, -17.5067}, {-9.2818, -19.5067}, {2.7182, -19.5067}, {16.7182, -19.5067}, {26.7182, -17.5067}, {36.7182, -15.5067}, {48.7182, -9.50673}, {58.7182, -3.50673}, {66.7182, 2.4933}, {72.7182, 8.4933}, {76.7182, 16.4933}}, thickness = 2), Line(origin = {-3.59, -32.35}, rotation = 180, points = {{-77.2818, 18.4933}, {-69.2818, 4.49327}, {-57.2818, -7.50673}, {-47.2818, -13.5067}, {-27.2818, -17.5067}, {-9.2818, -19.5067}, {2.7182, -19.5067}, {16.7182, -19.5067}, {26.7182, -17.5067}, {38.7182, -13.5067}, {48.7182, -9.50673}, {58.7182, -3.50673}, {66.7182, 2.4933}, {72.7182, 8.4933}, {76.7182, 16.4933}}, thickness = 2), Line(origin = {2.67, -20.6}, points = {{26.7936, 59.7936}, {-43.2064, -20.2064}, {-43.2064, -80.2064}}, thickness = 1.5, arrow = {Arrow.Filled, Arrow.None}, arrowSize = 6), Text(origin = {-7, -48}, extent = {{-23, 8}, {47, -22}}, textString = "zeta"), Text(origin = {0, 90}, extent = {{-100, 10}, {100, -10}}, textString = "%name"), Line(origin = {4.83, 72.54}, points = {{-41, 0}, {41, 0}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Half}, arrowSize = 5)}, coordinateSystem(initialScale = 0.1)));
  
end VariableZetaOrifice00;
