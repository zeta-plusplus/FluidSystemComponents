within FluidSystemComponents.CommonAnyFluid.Components;

model TeslaValveConstantZeta00
  /********************************************************
                  imports
        ********************************************************/
  import Modelica.Constants;
  import Modelica.Utilities.Streams;
  import FluidSystemComponents.Types.Switches;
  import units = Modelica.Units.SI;
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
  parameter Real diodicity_par=1.5;
  parameter Real zeta_forward_par=1;
  parameter units.Area Amech_par=0.1;
  
  parameter units.MassFlowRate m_flow_small=1e-3;
  
  
  
  /* ---------------------------------------------
                Internal variables
        --------------------------------------------- */
  Real diodicity;
  Real zeta_forward;
  Real zeta_backward;
  Real zeta;
  units.Area Amech;
  units.MassFlowRate m_flow;
  units.VolumeFlowRate V_flow;
  units.Velocity V;
  units.Velocity V_1to2;
  units.PressureDifference dp "p1 - p2";
  Real PR "p1/p2";
  
  Real signSmth "sign change smoothing";
  
  
  /* ---------------------------------------------
                          Internal objects
                  --------------------------------------------- */
  Medium.BaseProperties fluid_1 "flow station of inlet";
  Medium.BaseProperties fluid_2 "flow station of outlet";
  
  
  
  /* ---------------------------------------------
                          Interface
                  --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium = Medium) annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-200, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(redeclare package Medium = Medium) annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {200, 0}, extent = {{-10, -10}, {10, 10}})));



  //********************************************************************************
equation
  
  /* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
  diodicity = diodicity_par;
  zeta_forward= zeta_forward_par;
  zeta_backward= diodicity*zeta_forward;
  Amech=Amech_par;
  
  
  //-- fluidPort_1 --
  fluid_1.p = port_1.p;
  fluid_1.h = actualStream(port_1.h_outflow);
  fluid_1.Xi = actualStream(port_1.Xi_outflow);
  //-- fluidPort_2 --
  fluid_2.p = port_2.p;
  fluid_2.h = actualStream(port_2.h_outflow);
  fluid_2.Xi = actualStream(port_2.Xi_outflow);
  // distinguish inlet side
  if (0.0<=m_flow)  then
    port_1.h_outflow = fluid_1.h;
    port_1.Xi_outflow = fluid_1.Xi;
  elseif (m_flow < 0.0) then
    port_2.h_outflow = fluid_2.h;
    port_2.Xi_outflow = fluid_2.Xi;
  else
    port_1.h_outflow = fluid_1.h;
    port_1.Xi_outflow = fluid_1.Xi;
  end if;
  
  //-----
  m_flow=port_1.m_flow;
  
  
  /* ---------------------------------------------
    Eqns describing physics
  --------------------------------------------- */
  signSmth=FluidSystemComponents.Utilities.f_signChangeSmoothing(x=m_flow, x_small= m_flow_small);
  
  zeta=0.5*(
    (1+signSmth)*zeta_forward + 
    (1-signSmth)*zeta_backward
    );
  
  m_flow=0.5*(
    (1+signSmth)*fluid_1.d*V_1to2*Amech + 
    (1-signSmth)*fluid_2.d*V_1to2*Amech
    );
  
  V=abs(V_1to2);
  
  V_flow=0.5*(
    (1+signSmth)*m_flow/fluid_1.d +
    (1-signSmth)*m_flow/fluid_2.d
    );
  
  
  
  dp =0.5*(
    (1+signSmth)*zeta * 1.0 / 2.0 * fluid_1.d *V_1to2*abs(V_1to2) + 
    (1-signSmth)*zeta * 1.0 / 2.0 * fluid_2.d *V_1to2*abs(V_1to2) 
    );
  
  dp=fluid_1.p - fluid_2.p;
  PR=fluid_1.p/fluid_2.p;
  
  //-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0;
  fluid_2.Xi= fluid_1.Xi;
  
  //-- energy conservation --
  port_1.m_flow * fluid_1.h + port_2.m_flow * fluid_2.h = 0;
  
  
  
annotation(
    defaultComponentName = "TeslaValve",
    Icon(graphics = {Line(origin = {-99.8, -10.03}, points = {{-100.2, -9.97434}, {-40.2, -9.9743}, {139.8, 40.0257}, {258.8, -9.97434}, {299.8, -9.97434}}, thickness = 5), Line(origin = {-185, 20}, points = {{-15, 0}, {45, 0}}, thickness = 5), Line(origin = {48.88, 60.12}, points = {{151.121, -40.1208}, {111.121, -40.1208}, {-152.879, 69.8792}}, thickness = 5), Text(origin = {0, -50}, extent = {{-200, 10}, {200, -10}}, textString = "%name"), Line(origin = {-145.92, 94.94}, points = {{41.9246, 35.0571}, {21.9246, 41.0571}, {-2.0754, 41.0571}, {-22.0754, 35.0571}, {-40.0754, 25.0571}, {-52.0754, 5.0571}, {-54.0754, -24.9429}, {-46.0754, -46.9429}, {-36.0754, -58.9429}, {-20.0754, -68.9429}, {5.9246, -74.9429}}, thickness = 5), Line(origin = {-79.45, 53.03}, points = {{-6.5534, -19.0258}, {67.4466, -1.02577}, {-36.5534, 42.9742}}, thickness = 5), Line(origin = {-76.92, 74.94}, points = {{-38.0754, 21.0571}, {-54.0754, 27.0571}, {-64.0754, 29.0571}, {-74.0754, 27.0571}, {-84.0754, 21.0571}, {-90.0754, 7.0571}, {-86.0754, -8.9429}, {-74.0754, -18.9429}, {-58.0754, -24.9429}, {-40.0754, -32.9429}, {-8.0754, -40.9429}}, thickness = 5), Line(origin = {-4, -24}, points = {{-84, 0}, {84, 0}}, color = {26, 95, 180}, thickness = 2, arrow = {Arrow.None, Arrow.Open}, arrowSize = 20)}, coordinateSystem(extent = {{-200, -40}, {200, 140}})));



end TeslaValveConstantZeta00;
