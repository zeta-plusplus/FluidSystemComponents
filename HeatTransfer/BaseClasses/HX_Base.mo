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
  String flagHotInlet;
  String flagColdInlet;
  

  //********** Interfaces **********
  Modelica.Fluid.Interfaces.FluidPort_a port_1_med1(redeclare package Medium = Medium1) annotation(
    Placement(visible = true, transformation(origin = {-100, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2_med1(redeclare package Medium = Medium1) annotation(
    Placement(visible = true, transformation(origin = {100, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_1_med2(redeclare package Medium = Medium2) annotation(
    Placement(visible = true, transformation(origin = {-100, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2_med2(redeclare package Medium = Medium2) annotation(
    Placement(visible = true, transformation(origin = {100, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

algorithm
  // distinguish inlet side, medium 1
  if(fluid_1_med1.m_flow>0.0)then
    flagMedium1Inlet:= 1;
  elseif(fluid_2_med1.m_flow>0.0)then
    flagMedium1Inlet:= 2;
  else
    flagMedium1Inlet:= 0;
  end if;
  
  // distinguish inlet side, medium 2
  if(fluid_1_med2.m_flow>0.0)then
    flagMedium2Inlet:= 1;
  elseif(fluid_2_med2.m_flow>0.0)then
    flagMedium2Inlet:= 2;
  else
    flagMedium2Inlet:= 0;
  end if;
  
  
equation  
  
  //********** Connections, interface <-> internal variables **********
  //-- fluidPort_1, medium 1 --
  fluid_1_med1.p = port_1_med1.p;
  port_1_med1.h_outflow= fluid_1_med1.h;
  fluid_1_med1.h= actualStream(port_1_med1.h_outflow);
  fluid_1_med1.Xi= actualStream(port_1_med1.Xi_outflow);
  //-- fluidPort_2, medium 1 --
  fluid_2_med1.p = port_2_med1.p;
  fluid_2_med1.h= actualStream(port_2_med1.h_outflow);
  fluid_2_med1.Xi= actualStream(port_2_med1.Xi_outflow);
  
  //-- fluidPort_1, medium 2 --
  fluid_1_med2.p = port_1_med2.p;
  port_1_med2.h_outflow= fluid_1_med2.h;
  fluid_1_med2.h= actualStream(port_1_med2.h_outflow);
  fluid_1_med2.Xi= actualStream(port_1_med2.Xi_outflow);
  //-- fluidPort_2, medium 2 --
  fluid_2_med2.p = port_2_med2.p;
  fluid_2_med2.h= actualStream(port_2_med2.h_outflow);
  fluid_2_med2.Xi= actualStream(port_2_med2.Xi_outflow);
  
  
  if(flagMedium1Inlet==1)then
    T1in= fluid_1_med1.state.T;
    dmCp1in= port_1_med1.m_flow * Medium1.specificHeatCapacityCp(fluid_1_med1.state);
  elseif(flagMedium1Inlet==2)then
    T1in= fluid_2_med1.state.T;
    dmCp1in= port_2_med1.m_flow * Medium1.specificHeatCapacityCp(fluid_2_med1.state);
  else
    T1in= fluid_1_med1.state.T;
    dmCp1in= port_1_med1.m_flow * Medium1.specificHeatCapacityCp(fluid_1_med1.state);
  end if;
  
  
  if(flagMedium2Inlet==1)then
    T2in= fluid_1_med2.state.T;
    dmCp2in= port_1_med2.m_flow * Medium2.specificHeatCapacityCp(fluid_1_med2.state);
  elseif(flagMedium2Inlet==2)then
    T2in= fluid_2_med2.state.T;
    dmCp2in= port_2_med2.m_flow * Medium2.specificHeatCapacityCp(fluid_2_med2.state);
  else
    T2in= fluid_1_med2.state.T;
    dmCp2in= port_1_med2.m_flow * Medium2.specificHeatCapacityCp(fluid_1_med2.state);
  end if;
  
  
  if(T1in>T2in)then
    flagHotSide=1;
    if(flagMedium1inlet==1)then
      flagHotInlet="port1_medium1";
    elseif(flagMedium1inlet==2)then
      flagHotInlet="port2_medium1";
    end if;
  elseif(T1in<T2in)then
    flagHotSide=2;
    if(flagMedium2inlet==1)then
      flagHotInlet="port1_medium2";
    elseif(flagMedium2inlet==2)then
      flagHotInlet="port2_medium2";
    end if;
  else
    flagHotSide=0;
  end if;
  
  dmCpMin= min(dmCp1in, dmCp2in);
  dmCpMax= max(dmCp1in, dmCp2in);
  
  //********** equations of physics **********
  Q_flow_max= dmCpMin*(THIn - TCIn);
  Q_flow= effHx*Q_flow_max;
  
  if(flagHotSide==1)then
    Q_flow1= -1.0*Q_flow;
    Q_flow2= Q_flow;
  elseif(flagHotSide==2)then
    Q_flow1= Q_flow;
    Q_flow2= -1.0* Q_flow;
  else
    Q_flow1=0.0;
    Q_flow2=0.0;
  end if; 
  
  (port_1_med1.m_flow*fluid_1_med1.h) + (port_2_med1.m_flow*fluid_2_med1.h) + Q_flow1=0.0;
  (port_1_med2.m_flow*fluid_1_med2.h) + (port_2_med2.m_flow*fluid_2_med2.h) + Q_flow2=0.0;
  
  
annotation(
    Diagram(graphics = {Line(origin = {0.0638821, -65.226}, points = {{0, 6}, {0, -14}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}), Text(origin = {18, -67}, extent = {{-14, 5}, {14, -5}}, textString = "Q_flow2"), Line(origin = {0.00245751, 94.1476}, points = {{0, -34}, {0, -14}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}), Text(origin = {18, 69}, extent = {{-14, 5}, {14, -5}}, textString = "Q_flow1")}));end HX_Base;
