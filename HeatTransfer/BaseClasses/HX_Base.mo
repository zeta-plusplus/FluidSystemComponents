within FluidSystemComponents.HeatTransfer.BaseClasses;

partial model HX_Base
  /********************************************************
        imports
  ********************************************************/
  import Modelica.Constants;
  import Modelica.SIunits;
  
  
  /********************************************************
            Declaration
  ********************************************************/
  //********** Package **********
  replaceable package Medium1 = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  replaceable package Medium2 = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  //********** Parameters **********
  //##### None #####
  //********** Internal variables **********
  Medium1.BaseProperties fluid_1_med1 "flow station of port_1, medium 1";
  Medium1.BaseProperties fluid_2_med1 "flow station of port_2, medium 1";
  Medium2.BaseProperties fluid_1_med2 "flow station of port_1, medium 2";
  Medium2.BaseProperties fluid_2_med2 "flow station of port_2, medium 2";
  
  
  Modelica.SIunits.Enthalpy deltaMh1;
  Modelica.SIunits.Enthalpy deltaMh2;
  Modelica.SIunits.Enthalpy deltaMhMax;
  Modelica.SIunits.Enthalpy deltaMhMin;
  
  
  Modelica.SIunits.MassFlowRate m_flow1_max;
  Modelica.SIunits.MassFlowRate m_flow1_min;
  Modelica.SIunits.MassFlowRate m_flow2_max;
  Modelica.SIunits.MassFlowRate m_flow2_min;
  
  Modelica.SIunits.Temperature T1in;
  Modelica.SIunits.Temperature T2in;
  Modelica.SIunits.Temperature THIn;
  Modelica.SIunits.Temperature TCIn;
  
  Modelica.SIunits.ThermalConductance dmCp1in;
  Modelica.SIunits.ThermalConductance dmCp2in;
  Modelica.SIunits.ThermalConductance dmCpMax;
  Modelica.SIunits.ThermalConductance dmCpMin;
  
  Modelica.SIunits.HeatFlowRate Q_flow_max;
  Modelica.SIunits.HeatFlowRate Q_flow;
  Modelica.SIunits.HeatFlowRate Q_flow1;
  Modelica.SIunits.HeatFlowRate Q_flow2;
  
  Real effHX;
  
  Integer flagHotSide;
  Integer flagMedium1Inlet;
  Integer flagMedium2Inlet;
  /*
  String flagHotInlet;
  String flagColdInlet;
  */
  //********** Interfaces **********
  Modelica.Fluid.Interfaces.FluidPort_a port_1_med1(redeclare package Medium = Medium1) annotation(
    Placement(visible = true, transformation(origin = {-100, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-140, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2_med1(redeclare package Medium = Medium1) annotation(
    Placement(visible = true, transformation(origin = {100, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {140, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_1_med2(redeclare package Medium = Medium2) annotation(
    Placement(visible = true, transformation(origin = {-100, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-140, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2_med2(redeclare package Medium = Medium2) annotation(
    Placement(visible = true, transformation(origin = {100, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {140, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

algorithm

  /*
  m_flow1_max:= max(port_1_med1.m_flow, port_2_med1.m_flow);
  m_flow1_min:= min(port_1_med1.m_flow, port_2_med1.m_flow);
  m_flow2_max:= max(port_1_med2.m_flow, port_2_med2.m_flow);
  m_flow2_min:= min(port_1_med2.m_flow, port_2_med2.m_flow);
  
// distinguish inlet side, medium 1
  if (m_flow1_max == port_1_med1.m_flow) then
    flagMedium1Inlet := 1;
    T1in:= fluid_1_med1.state.T;
    dmCp1in:= port_1_med1.m_flow * Medium1.specificHeatCapacityCp(fluid_1_med1.state);
  elseif (m_flow1_max == port_2_med1.m_flow) then
    flagMedium1Inlet := 2;
    T1in:= fluid_2_med1.state.T;
    dmCp1in:= port_2_med1.m_flow * Medium1.specificHeatCapacityCp(fluid_2_med1.state);
  else
    flagMedium1Inlet:= 0;
    T1in:= fluid_1_med1.state.T;
    dmCp1in:= port_1_med1.m_flow * Medium1.specificHeatCapacityCp(fluid_1_med1.state);
  end if;

// distinguish inlet side, medium 2
  if (m_flow2_max == port_1_med2.m_flow) then
    flagMedium2Inlet := 1;
    T2in:= fluid_1_med2.state.T;
    dmCp2in:= port_1_med2.m_flow * Medium2.specificHeatCapacityCp(fluid_1_med2.state);
  elseif (m_flow2_max == port_2_med2.m_flow) then
    flagMedium2Inlet := 2;
    T2in:= fluid_2_med2.state.T;
    dmCp2in:= port_2_med2.m_flow * Medium2.specificHeatCapacityCp(fluid_2_med2.state);
  else
    flagMedium2Inlet:= 0;
    T2in:= fluid_1_med2.state.T;
    dmCp2in:= port_1_med2.m_flow * Medium2.specificHeatCapacityCp(fluid_1_med2.state);
  end if;
  
  if(T1in > T2in)then
    flagHotSide:=1;
    THIn:= T1in;
    TCIn:= T2in;
  elseif(T1in < T2in)then
    flagHotSide:=2;
    THIn:= T2in;
    TCIn:= T1in;
  else
    flagHotSide:=0;
    THIn:= T1in;
    TCIn:= T1in;
  end if;
  
  
  
  dmCpMin:= min(dmCp1in, dmCp2in);
  dmCpMax:= max(dmCp1in, dmCp2in);
  Q_flow_max:= dmCpMin * (THIn - TCIn);
  */
  
equation
//********** Connections, interface <-> internal variables **********
//-- fluidPort_1, medium 1 --
  fluid_1_med1.p = port_1_med1.p;
  fluid_1_med1.h= actualStream(port_1_med1.h_outflow);
  fluid_1_med1.Xi= actualStream(port_1_med1.Xi_outflow);
//-- fluidPort_2, medium 1 --
  fluid_2_med1.p = port_2_med1.p;
  fluid_2_med1.h= actualStream(port_2_med1.h_outflow);
  fluid_2_med1.Xi= actualStream(port_2_med1.Xi_outflow);
//-- fluidPort_1, medium 2 --
  fluid_1_med2.p = port_1_med2.p;
  fluid_1_med2.h= actualStream(port_1_med2.h_outflow);
  fluid_1_med2.Xi= actualStream(port_1_med2.Xi_outflow);
//-- fluidPort_2, medium 2 --
  fluid_2_med2.p = port_2_med2.p;
  fluid_2_med2.h= actualStream(port_2_med2.h_outflow);
  fluid_2_med2.Xi= actualStream(port_2_med2.Xi_outflow);
  
  //port_1_med1.h_outflow= fluid_1_med1.h;
  //port_1_med2.h_outflow= fluid_1_med2.h;
  
  //port_2_med1.h_outflow= fluid_2_med1.h;
  //port_2_med2.h_outflow= fluid_2_med2.h;
  
//********************
  
  deltaMh1= port_1_med1.m_flow*(fluid_1_med1.h - fluid_2_med1.h);
  deltaMh2= port_1_med2.m_flow*(fluid_1_med2.h - fluid_2_med2.h);
  
  deltaMhMin= min(abs(deltaMh1), abs(deltaMh2));
  deltaMhMax= max(abs(deltaMh1), abs(deltaMh2));
  
  
  m_flow1_max= max(port_1_med1.m_flow, port_2_med1.m_flow);
  m_flow1_min= min(port_1_med1.m_flow, port_2_med1.m_flow);
  m_flow2_max= max(port_1_med2.m_flow, port_2_med2.m_flow);
  m_flow2_min= min(port_1_med2.m_flow, port_2_med2.m_flow);
  
  
// distinguish inlet side, medium 1
  if (m_flow1_max == port_1_med1.m_flow) then
    flagMedium1Inlet = 1;
    port_1_med1.h_outflow= fluid_1_med1.h;
    T1in= fluid_1_med1.state.T;
    dmCp1in= port_1_med1.m_flow * Medium1.specificHeatCapacityCp(fluid_1_med1.state);
  elseif (m_flow1_max == port_2_med1.m_flow) then
    flagMedium1Inlet = 2;
    port_2_med1.h_outflow= fluid_2_med1.h;
    T1in= fluid_2_med1.state.T;
    dmCp1in= port_2_med1.m_flow * Medium1.specificHeatCapacityCp(fluid_2_med1.state);
  else
    flagMedium1Inlet= 0;
    port_1_med1.h_outflow= fluid_1_med1.h;
    T1in= fluid_1_med1.state.T;
    dmCp1in= port_1_med1.m_flow * Medium1.specificHeatCapacityCp(fluid_1_med1.state);
  end if;

// distinguish inlet side, medium 2
  if (m_flow2_max == port_1_med2.m_flow) then
    flagMedium2Inlet = 1;
    port_1_med2.h_outflow= fluid_1_med2.h;
    T2in= fluid_1_med2.state.T;
    dmCp2in= port_1_med2.m_flow * Medium2.specificHeatCapacityCp(fluid_1_med2.state);
  elseif (m_flow2_max == port_2_med2.m_flow) then
    flagMedium2Inlet = 2;
    port_2_med2.h_outflow= fluid_2_med2.h;
    T2in= fluid_2_med2.state.T;
    dmCp2in= port_2_med2.m_flow * Medium2.specificHeatCapacityCp(fluid_2_med2.state);
  else
    flagMedium2Inlet= 0;
    port_1_med2.h_outflow= fluid_1_med2.h;
    T2in= fluid_1_med2.state.T;
    dmCp2in= port_1_med2.m_flow * Medium2.specificHeatCapacityCp(fluid_1_med2.state);
  end if;
  
  if(T1in > T2in)then
    flagHotSide=1;
    THIn= T1in;
    TCIn= T2in;
  elseif(T1in < T2in)then
    flagHotSide=2;
    THIn= T2in;
    TCIn= T1in;
  else
    flagHotSide=0;
    THIn= T1in;
    TCIn= T1in;
  end if;
  
  dmCpMin= min(dmCp1in, dmCp2in);
  dmCpMax= max(dmCp1in, dmCp2in);
  Q_flow_max= dmCpMin * (THIn - TCIn);
  
//********** equations of physics **********
  Q_flow= effHX*Q_flow_max;
  
  port_1_med1.m_flow + port_2_med1.m_flow = 0.0;
  port_1_med2.m_flow + port_2_med2.m_flow = 0.0;
  
  (port_1_med1.m_flow*fluid_1_med1.h) + (port_2_med1.m_flow*fluid_2_med1.h) + Q_flow1=0.0;
  (port_1_med2.m_flow*fluid_1_med2.h) + (port_2_med2.m_flow*fluid_2_med2.h) + Q_flow2=0.0;
  
  fluid_2_med1.p= fluid_1_med1.p;
  fluid_2_med2.p= fluid_1_med2.p;
  
  
annotation(
    Diagram(graphics = {Line(origin = {0.0638821, -65.226}, points = {{0, 6}, {0, -14}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}), Text(origin = {18, -67}, extent = {{-14, 5}, {14, -5}}, textString = "Q_flow2"), Line(origin = {0.00245751, 94.1476}, points = {{0, -34}, {0, -14}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}), Text(origin = {18, 69}, extent = {{-14, 5}, {14, -5}}, textString = "Q_flow1")}),
    Icon(coordinateSystem(extent = {{-140, -100}, {140, 100}})),
    __OpenModelica_commandLineOptions = "");end HX_Base;
