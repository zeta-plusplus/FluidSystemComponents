within FluidSystemComponents.CommonAnyFluid.Components;

model ExpansionToAmbient
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
  parameter Real PR_init=2.5 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Real Cv_init=0.99 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter units.Velocity V_2is_init=480.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter units.Velocity V_2_init=Cv_init*V_2is_init "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter units.SpecificEnthalpy h_2is_init=h1_init-1.0/2.0*V_2is_init^2.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter units.Force Fg_init=m_flow1_init*V_2_init "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  
  //------
  parameter Real CvDes_paramInput = 1.0 "flow velocity coefficient, valid only when use_u_Cv==false, value fixed through simulation" annotation(
    Dialog(group = "Characteristics"));
  
  
  /* ---------------------------------------------
      Internal variables
  --------------------------------------------- */
  units.MassFlowRate m_flow_max(start=m_flow1_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  units.MassFlowRate m_flow_min(start=m_flow2_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  units.Velocity V_2(start=V_2_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  units.Velocity V_2is(start=V_2is_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real Cv(start=Cv_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real PR(
    start=PR_init,
    min=if (allowFlowReversal) then -Constants.inf else (0.0+1.0e-10)
  ) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  units.SpecificEnthalpy h_2is(start=h_2is_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  units.Force Fg(start=Fg_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  
  
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
  Medium.BaseProperties fluid_2Tot(
    p(start = p1_init, min=0.0+1.0e-10), 
    T(start = T1_init, min=0.0+1.0e-10), 
    state.p(start = p1_init, min=0.0+1.0e-10), 
    state.T(start = T1_init, min=0.0+1.0e-10), 
    h(start = h1_init, min=0.0+1.0e-10)
  ) "flow station of outlet, total";
  
  
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
    Placement(visible = true, transformation(origin = {60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_Fg(
    quantity="Force", unit="N",displayUnit="N"
  ) "" annotation(
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_V2(
    quantity="Velocity", unit="m/s",displayUnit="m/s"
  ) annotation(
    Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Types.InfoBus infoBus1 annotation(
    Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
equation
  
  
  /* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
  y_Fg = Fg;
  y_V2 = V_2;
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
  
  /* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
  //-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0;
  fluid_2.Xi = fluid_1.Xi;
  port_1.C_outflow = inStream(port_2.C_outflow);
  port_2.C_outflow = inStream(port_1.C_outflow);
  
  
  fluid_2Tot.Xi= fluid_1.Xi;
  fluid_2Tot.p = fluid_1.p;
  
  //-- energy conservation --
  port_1.m_flow * fluid_1.h + port_2.m_flow * fluid_2Tot.h = 0;
  PR = fluid_1.p / fluid_2.p;
  
  //-- full expansion --
  fluid_1.h = h_2is + sign(V_2is) * abs(V_2is) ^ 2.0 * (1.0 / 2.0);
  h_2is = Medium.isentropicEnthalpy(fluid_2.p, fluid_1.state);
  V_2 = Cv * V_2is;
  fluid_1.h = fluid_2.h + sign(V_2) * abs(V_2) ^ 2.0 / 2.0;
  
  
  Fg = (-1) * port_2.m_flow * V_2;
  
  Cv=CvDes_paramInput;

/********************************************************
  Graphics
********************************************************/
annotation(
    defaultComponentName = "ExpToAmb",
    Icon(graphics = {Text(origin = {59, 83}, extent = {{-21, 11}, {23, -23}}, textString = "Amb"), Line(origin = {-79.27, 0}, points = {{-20, 40}, {8, 40}, {8, -40}, {-20, -40}}, thickness = 3), Line(origin = {10.2, 0.11}, points = {{-58, 0}, {62, 0}}, thickness = 1, arrow = {Arrow.None, Arrow.Open}, arrowSize = 7), Line(origin = {9.91, 29.59}, points = {{-58, 0}, {42, 0}}, thickness = 1, arrow = {Arrow.None, Arrow.Open}, arrowSize = 7), Line(origin = {10.17, -29.69}, points = {{-58, 0}, {42, 0}}, thickness = 1, arrow = {Arrow.None, Arrow.Open}, arrowSize = 7), Text(origin = {-6, 52}, extent = {{-68, 8}, {68, -12}}, textString = "Expand"), Text(origin = {-14, -88}, extent = {{-68, 8}, {94, -12}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
    
end ExpansionToAmbient;
