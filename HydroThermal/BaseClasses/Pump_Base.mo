within FluidSystemComponents.HydroThermal.BaseClasses;

partial model Pump_Base
  extends FluidSystemComponents.Interfaces.Frame_2FluidPorts_1Shaft;
  //----------
  /********************************************************
    imports
  ********************************************************/
  import units=Modelica.Units.SI;
  import unitConversions=Modelica.Units.Conversions;
  
  
  //********** Parameters **********
  //##### none #####
  
  //********** Initialization Parameters **********
  parameter Real PR_init= 1.0
    "" 
    annotation(
    Dialog(tab = "Initialization", group = "Component characteristics"));
    
  //********** Internal variables ********** 
  units.PressureDifference deltap(start= deltap_init) "";
  Real PR(start = 1.0) "pressure ratio";
  units.SpecificEnthalpy h_2is(start= h2_init) "";
  
  //----- inner-connected variables -----
  
  //----- inner-outer-connected variables -----
  
algorithm
  
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
  trq = flange_1.tau;
  pwr= -1*((port_1.m_flow * fluid_1.h) + (port_2.m_flow * fluid_2.h));
  der(phi)= omega;
  omega*trq= pwr;
  Nmech= unitConversions.to_rpm(omega);
  
  //-- enthalpy & entropy --
  h_2is = Medium.isentropicEnthalpy(fluid_2.p, fluid_1.state);
  
  //--
  deltap= port_2.p - port_1.p;
  PR= port_2.p/port_1.p;
  
/********************************************************
  Graphics
********************************************************/
//##### none #####

    
end Pump_Base;
