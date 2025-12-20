within FluidSystemComponents.Compressible.Components;

model ObliqueShock00
  /********************************************************
                imports
      ********************************************************/
  import Modelica.Constants;
  import Modelica.Utilities.Streams;
  import PropulsionSystem.Types.switches;
  import units = Modelica.Units.SI;
  /********************************************************
                       Declaration
      ********************************************************/
  /* ---------------------------------------------
              switch
      --------------------------------------------- */
  //---
  /* ---------------------------------------------
              Package
      --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  /* ---------------------------------------------
              parameters
          --------------------------------------------- */
  parameter units.Angle DELTA_par=10*Modelica.Constants.pi/180 "deflection angle";
  
  parameter units.Length x0_4plot_par=0;
  parameter units.Length y0_4plot_par=0;
  
  parameter units.Angle angCtrLine4plot_par=0;
  parameter units.Length lenWall4plot_par=2;
  parameter units.Length lenShock4plot_par=2;
  
  
  /* ---------------------------------------------
              Internal variables
      --------------------------------------------- */
  units.Angle DELTA "deflection angle";
  units.Angle delta "";
  units.Angle theta "";
  
  
  units.SpecificEntropy s_fluidStat_1 "specific entropy, fluid_1" ;
  units.SpecificEntropy s_fluidStat_2 "specific entropy, fluid_1" ;
  units.SpecificEntropy s_fluid_1 "specific entropy, fluid_1" ;
  units.SpecificEntropy s_fluid_2 "specific entropy, fluid_1" ;
  
  units.Velocity V_1 "absolute, upstream";
  units.Velocity V_2 "absolute, downstream";
  units.Velocity Vt_1 "tangential to shock, upstream";
  units.Velocity Vt_2 "tangential to shock, downstream";
  units.Velocity Vn_1 "normal to shock, upstream";
  units.Velocity Vn_2 "normal to shock, downstream";
  
  units.Velocity Vsound_1 "upstream, static temperature refered";
  units.Velocity Vsound_2 "downstream, static temperature refered";
  
  Real Mn_1 "absolute, upstream";
  Real Mn_2 "absolute, downstream";
  Real Mnt_1 "tangential to shock, upstream";
  Real Mnt_2 "tangential to shock, downstream";
  Real Mnn_1 "normal to shock, upstream";
  Real Mnn_2 "normal to shock, downstream";
  
  
  //-----
  units.Length x4plot[2];
  units.Length y4plot[2];
  
  units.Angle angCtrLine4plot;
  units.Length lenWall4plot;
  units.Length lenShock4plot;
  
  
  /* ---------------------------------------------
              Internal objects
          --------------------------------------------- */
  Medium.BaseProperties fluid_1 "fluid obj, total, upstream of shock";
  Medium.BaseProperties fluid_2 "fluid obj, total, downstream of shock";
  Medium.BaseProperties fluidStat_1 "fluid station obj, static, upstream of shock";
  Medium.BaseProperties fluidStat_2 "fluid station obj, static, downstream of shock";
  /* ---------------------------------------------
                    Interface
                --------------------------------------------- */
  
  Interfaces.FluidWithMachInput portStatWithMn_1 annotation(
    Placement(transformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.FluidWithMachOutput portStatWithMn_2 annotation(
    Placement(transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}})));
  //******************************************************************************************
  
  
equation
  
  
  DELTA=DELTA_par;
  
  delta=DELTA;
  
  
  /* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
  //-- fluidPort_1 --
  fluidStat_1.p = portStatWithMn_1.portStat.p;
  fluidStat_1.h = actualStream(portStatWithMn_1.portStat.h_outflow);
  fluidStat_1.Xi = actualStream(portStatWithMn_1.portStat.Xi_outflow);
  //-- fluidPort_2 --
  fluidStat_2.p = portStatWithMn_2.portStat.p;
  fluidStat_2.h = actualStream(portStatWithMn_2.portStat.h_outflow);
  fluidStat_2.Xi = actualStream(portStatWithMn_1.portStat.Xi_outflow);
  //-----
  portStatWithMn_1.portStat.h_outflow = fluidStat_1.h;
  portStatWithMn_1.portStat.Xi_outflow = fluidStat_1.Xi;
  
  //-----
  Mn_1= portStatWithMn_1.Mn;
  Mn_2= portStatWithMn_2.Mn;
  
  
  
  /* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
  s_fluid_1 = Medium.specificEntropy(fluid_1.state);
  s_fluid_2 = Medium.specificEntropy(fluid_2.state);
  s_fluidStat_1 = Medium.specificEntropy(fluidStat_1.state);
  s_fluidStat_2 = Medium.specificEntropy(fluidStat_2.state);
  
  Vsound_1= Medium.velocityOfSound(fluidStat_1.state);
  Vsound_2= Medium.velocityOfSound(fluidStat_2.state);
  
  Mn_1= V_1/Vsound_1;
  Mn_2= V_2/Vsound_2;
  Mnt_1= Vt_1/Vsound_1;
  Mnt_2= Vt_2/Vsound_2;
  Mnn_1= Vn_1/Vsound_1;
  Mnn_2= Vn_2/Vsound_2;
  
  
  // isentropic between static and total
  s_fluid_1=s_fluidStat_1;
  s_fluid_2=s_fluidStat_2;
  
  
  // adiabatic, conservation of total enthalpy
  fluidStat_1.h+1/2*V_1^2 = fluidStat_2.h+1/2*V_2^2;
  
  
  V_1^2= Vt_1^2 + Vn_1^2;
  V_2^2= Vt_2^2 + Vn_2^2;
  
  //
  Vt_1=V_1*cos(theta);
  Vn_1=V_1*sin(theta);
  
  Vt_1=Vt_2;
  
  Vt_2=V_2*cos(theta-delta);
  Vn_2=V_2*sin(theta-delta);
  
  
  
  /* ---------------------------------------------
  for plot visualization
  --------------------------------------------- */
  x4plot[1]=x0_4plot_par;
  y4plot[1]=y0_4plot_par;
  
  angCtrLine4plot= angCtrLine4plot_par;
  lenWall4plot= lenWall4plot_par;
  lenShock4plot= lenShock4plot_par;
  
  
  
annotation(
    defaultComponentName = "Shock",
    Icon(graphics = {Text(origin = {0, -70}, extent = {{-100, 10}, {100, -10}}, textString = "%name"), Line(origin = {0.17, 29.83}, points = {{-100.171, 30.1708}, {-40.1708, 30.1708}, {101.829, -29.8292}}, thickness = 4), Line(origin = {-4, 16}, points = {{-36, 44}, {32, -54}}, pattern = LinePattern.Dash, thickness = 2)}, coordinateSystem(preserveAspectRatio=false, extent = {{-100, -60}, {100, 60}}))
    
    );
  
  
  
end ObliqueShock00;
