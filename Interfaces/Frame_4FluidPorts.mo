within FluidSystemComponents.Interfaces;

model Frame_4FluidPorts
  /********************************************************
        imports
  ********************************************************/
  import Modelica.Constants;
  import units=Modelica.Units.SI;
  
  
  /********************************************************
            Declaration
  ********************************************************/
  //********** Package **********
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  //********** Parameters **********
  parameter Boolean allowFlowReversal = true "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)" annotation(
    Dialog(tab = "Assumptions"),
    Evaluate = true);
    //********** Initialization Parameters **********
  //--- fluid_1, port_1 ---
  parameter units.MassFlowRate m_flow1_init(displayUnit = "kg/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "Fluid states"));
  parameter units.Pressure p1_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "Fluid states"));
  parameter units.Temperature T1_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "Fluid states"));
  parameter units.SpecificEnthalpy h1_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "Fluid states"));
  //--- fluid_2, port_2 ---
  parameter units.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "Fluid states"));
  parameter units.Pressure p2_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "Fluid states"));
  parameter units.Temperature T2_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "Fluid states"));
  parameter units.SpecificEnthalpy h2_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "Fluid states"));
  //--- fluid_3, port_3 ---
  parameter units.MassFlowRate m_flow3_init(displayUnit = "kg/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "Fluid states"));
  parameter units.Pressure p3_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "Fluid states"));
  parameter units.Temperature T3_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "Fluid states"));
  parameter units.SpecificEnthalpy h3_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "Fluid states"));
  //--- fluid_4, port_4 ---
  parameter units.MassFlowRate m_flow4_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "Fluid states"));
  parameter units.Pressure p4_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "Fluid states"));
  parameter units.Temperature T4_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "Fluid states"));
  parameter units.SpecificEnthalpy h4_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "Fluid states"));
  //********** Internal variables **********
  Medium.BaseProperties fluid_1(p.start = p1_init, T.start = T1_init, state.p.start = p1_init, state.T.start = T1_init, h.start = h1_init) "flow station 1";
  Medium.BaseProperties fluid_2(p.start = p2_init, T.start = T2_init, state.p.start = p2_init, state.T.start = T2_init, h.start = h2_init) "flow station 2";
  Medium.BaseProperties fluid_3(p.start = p3_init, T.start = T3_init, state.p.start = p3_init, state.T.start = T3_init, h.start = h3_init) "flow station 3";
  Medium.BaseProperties fluid_4(p.start = p4_init, T.start = T4_init, state.p.start = p4_init, state.T.start = T4_init, h.start = h4_init) "flow station 4";
  //----- inner-outer-connected variables -----
  //##### none #####
  //********** Interfaces **********
  Modelica.Fluid.Interfaces.FluidPort_a port_1
  (
    redeclare package Medium = Medium, 
    m_flow(min = if allowFlowReversal then -Constants.inf else 0.0, start = m_flow1_init), 
    h_outflow.start = h1_init
  )
    ""
    annotation(
    Placement(visible = true, transformation(origin = {-80, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2 
  (
    redeclare package Medium = Medium, 
    m_flow(min = if allowFlowReversal then -Constants.inf else 0.0, start = m_flow2_init), 
    h_outflow.start = h2_init
  )
    ""
    annotation(
    Placement(visible = true, transformation(origin = {80, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_4
  (
    redeclare package Medium = Medium, 
    m_flow(min = if allowFlowReversal then -Constants.inf else 0.0, start = m_flow4_init), 
    h_outflow.start = h4_init
  )
    ""
    annotation(
    Placement(visible = true, transformation(origin = {80, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_3
  (
    redeclare package Medium = Medium, 
    m_flow(min = if allowFlowReversal then -Constants.inf else 0.0, start = m_flow3_init), 
    h_outflow.start = h3_init
  )
    ""
    annotation(
    Placement(visible = true, transformation(origin = {-80, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Types.InfoBus infoBus1 annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
//********** Connections, interface <-> internal variables **********
//-- fluidPort_1 --
  fluid_1.p = port_1.p;
//port_1.h_outflow = fluid_1.h;
  fluid_1.h = actualStream(port_1.h_outflow);
  fluid_1.Xi = actualStream(port_1.Xi_outflow);
//-- fluidPort_2 --
  fluid_2.p = port_2.p;
  fluid_2.h = actualStream(port_2.h_outflow);
  fluid_2.Xi = actualStream(port_2.Xi_outflow);
//-- fluidPort_3 --
  fluid_3.p = port_3.p;
  fluid_3.h = actualStream(port_3.h_outflow);
  fluid_3.Xi = actualStream(port_3.Xi_outflow);
//-- fluidPort_4 --
  fluid_4.p = port_4.p;
  fluid_4.h = actualStream(port_4.h_outflow);
  fluid_4.Xi = actualStream(port_4.Xi_outflow);
//********** Eqns describing physics **********
//##### none #####
/********************************************************
  Graphics
********************************************************/
//##### none #####
end Frame_4FluidPorts;
