within FluidSystemComponents.HeatTransfer.BaseClasses;

partial model HX_solid2fluid_Base_effHX
  /********************************************************
              imports
        ********************************************************/
  import Modelica.Constants;
  import units = Modelica.Units.SI;
  import unitsNonSI = Modelica.Units.NonSI;
  import unitConversions = Modelica.Units.Conversions;
  /********************************************************
                  Declaration
        ********************************************************/
  //********** Package **********
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  //********** Parameters **********
  //##### None #####
  //********** Internal variables **********
  Medium.BaseProperties fluid_1 "flow station of port_1, medium 1";
  Medium.BaseProperties fluid_2 "flow station of port_2, medium 1";
  units.Enthalpy deltaMh;
  units.MassFlowRate m_flow_max;
  units.MassFlowRate m_flow_min;
  units.Temperature TfluidIn;
  units.Temperature TH;
  units.Temperature TC;
  units.Temperature Tsolid;
  units.ThermalConductance dmCpIn;
  units.HeatFlowRate Q_flow_max;
  units.HeatFlowRate Q_flow;
  units.HeatFlowRate Q_flow_fluid "into==positive";
  units.HeatFlowRate Q_flow_solid "into==positive";
  Real effHX;
  //Integer flagMediumInlet;
  //Integer flagHotSide;
  /*
        String flagHotInlet;
        String flagColdInlet;
        */
  //********** Interfaces **********
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {-100, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-140, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {100, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {140, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Types.InfoBus signalBus1 annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {90, -92}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_solid annotation(
    Placement(transformation(origin = {0, -70}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {0, -70}, extent = {{-20, -20}, {20, 20}})));

//*************************************************************************************
algorithm
// none

//*************************************************************************************
equation
//********** Connections, interface <-> internal variables **********
//-- fluidPort_1, medium 1 --
  fluid_1.p = port_1.p;
  fluid_1.h = actualStream(port_1.h_outflow);
  fluid_1.Xi = actualStream(port_1.Xi_outflow);
//-- fluidPort_2, medium 1 --
  fluid_2.p = port_2.p;
  fluid_2.h = actualStream(port_2.h_outflow);
  fluid_2.Xi = actualStream(port_2.Xi_outflow);
  
  //--
  Tsolid= port_solid.T;
  Q_flow_solid= port_solid.Q_flow;
  
//********************
  deltaMh = port_1.m_flow*(fluid_1.h - fluid_2.h);
  m_flow_max = max(port_1.m_flow, port_2.m_flow);
  m_flow_min = min(port_1.m_flow, port_2.m_flow);
  
    /*port_1.h_outflow = fluid_1.h;
    TfluidIn = fluid_1.state.T;
    dmCpIn = port_1.m_flow*Medium.specificHeatCapacityCp(fluid_1.state);
  */
  
// distinguish inlet side, medium 1
  if m_flow_max == port_1.m_flow then
    port_1.h_outflow = fluid_1.h;
    TfluidIn = fluid_1.state.T;
    dmCpIn = port_1.m_flow*Medium.specificHeatCapacityCp(fluid_1.state);
  
  elseif m_flow_max == port_2.m_flow then
    port_2.h_outflow = fluid_2.h;
    TfluidIn = fluid_2.state.T;
    dmCpIn = port_2.m_flow*Medium.specificHeatCapacityCp(fluid_2.state);
  
  else
    port_1.h_outflow = fluid_1.h;
    TfluidIn = fluid_1.state.T;
    dmCpIn = port_1.m_flow*Medium.specificHeatCapacityCp(fluid_1.state);
  end if;
    
  //--
  if (TfluidIn > Tsolid) then
    TH = TfluidIn;
    TC = Tsolid;
  elseif (TfluidIn < Tsolid) then
    TH = Tsolid;
    TC = TfluidIn;
  else
    TH = TfluidIn;
    TC = Tsolid;
  end if;
  
  
  //--
  Q_flow_max = dmCpIn*(TH - TC);
//********** equations of physics **********
  Q_flow = effHX*Q_flow_max;
  port_1.m_flow + port_2.m_flow = 0.0;
  (port_1.m_flow*fluid_1.h) + (port_2.m_flow*fluid_2.h) + Q_flow_fluid = 0.0;
  fluid_2.p = fluid_1.p;
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    Diagram(graphics = {Line(origin = {0.0638821, -17.226}, points = {{0, 6}, {0, -14}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}), Text(origin = {18, -19}, extent = {{-14, 5}, {14, -5}}, textString = "Q_flow2"), Line(origin = {0.00245751, 94.1476}, points = {{0, -34}, {0, -14}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}), Text(origin = {18, 69}, extent = {{-14, 5}, {14, -5}}, textString = "Q_flow1")}),
    Icon(coordinateSystem(extent = {{-140, -100}, {140, 100}})),
    __OpenModelica_commandLineOptions = "");
end HX_solid2fluid_Base_effHX;
