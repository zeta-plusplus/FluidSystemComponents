within FluidSystemComponents.HydroThermal.BaseClasses;

partial model Valve_Base
  extends FluidSystemComponents.Interfaces.Frame_2FluidPorts;
  //----------
  /********************************************************
    imports
  ********************************************************/
  import Modelica.Constants;
  import units=Modelica.Units.SI;
  
  
  //********** Parameters **********
  parameter units.Pressure deltapCrack(displayUnit="Pa")=500.0*1000.0
    ""
    annotation(
    Dialog(group = "Characteristics"));
  
  //********** Initialization Parameters **********
  parameter Real PR_init= 1.0
    "" 
    annotation(
    Dialog(tab = "Initialization", group = "Component characteristics"));
  parameter units.Pressure deltap_init(displayUnit="Pa")= 0.0
  "" 
    annotation(
    Dialog(tab = "Initialization", group = "Component characteristics"));
  
  //********** Internal variables ********** 
  units.Pressure deltap(start= deltap_init) "";
  Real PR(start = 1.0) "pressure ratio";
  units.VolumeFlowRate qFlow_1(start=0) "";
  
  //----- inner-connected variables -----
  //##### none #####
  //----- inner-outer-connected variables -----
  //##### none #####
  
algorithm
  //##### none #####
  
equation  
  //********** Geometries **********
  //##### none #####
  
  //********** Connections, interface <-> internal variables **********
  //##### none #####
  
  //********** Eqns describing physics **********
  //-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0.0;
  fluid_2.Xi= fluid_1.Xi;
  
  //-- energy conservation --
  port_2.h_outflow = inStream(port_1.h_outflow);
  
  /*
  if(0<qFlow_1)then
  end if;
  */
  
  //-- volume and mass flow
  port_1.m_flow= fluid_1.d*qFlow_1;
  
  //-- pressure --
  deltap= port_1.p - port_2.p;
  PR= port_1.p/port_2.p;
  
end Valve_Base;
