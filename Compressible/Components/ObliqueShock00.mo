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
  parameter FluidSystemComponents.Types.Switches.switchHowToDetVar switchDetermine_DELTA= FluidSystemComponents.Types.Switches.switchHowToDetVar.param "switch how to DELTA" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true); 
  
  parameter FluidSystemComponents.Types.Switches.switchHowToDetVar switchDetermine_angCtrLine4plot= FluidSystemComponents.Types.Switches.switchHowToDetVar.param "switch how to angCtrLine4plot" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true); 
  
  /*
  parameter Boolean use_sensorPortTotal1 = false
    "Get the pressure from the input connector"
    annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
  parameter Boolean use_sensorPortTotal2 = false
    "Get the pressure from the input connector"
    annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
  */
  
  /* ---------------------------------------------
              Package
      --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  
  
  
  /* ---------------------------------------------
              parameters
          --------------------------------------------- */
  parameter units.Angle DELTA_par "deflection angle";
  
  parameter units.Length x0_4plot_par=0;
  parameter units.Length y0_4plot_par=0;
  
  parameter units.Angle angCtrLine4plot_par=0;
  parameter units.Length lenWall4plot_par=2;
  parameter units.Length lenShock4plot_par=2;
  
  
  /* ---------------------------------------------
              Internal variables
      --------------------------------------------- */
  units.Angle DELTA(start=DELTA_par) "deflection angle";
  units.Angle delta(start=DELTA_par) "";
  units.Angle theta(min=0, max= 90*Modelica.Constants.pi/180, start=10*Modelica.Constants.pi/180) "";
  
  /*
  */
  
  units.SpecificEntropy s_fluidStat_1 "specific entropy, fluidStat_1" ;
  units.SpecificEntropy s_fluidStat_2 "specific entropy, fluidStat_2" ;
  units.SpecificEntropy s_fluid_1 "specific entropy, fluid_1" ;
  units.SpecificEntropy s_fluid_2 "specific entropy, fluid_2" ;
  
  units.Velocity Vsound_1(min=340) "upstream, static temperature refered";
  units.Velocity Vsound_2(min=340) "downstream, static temperature refered";
  
  units.Velocity V_1(min=340*2) "absolute, upstream";
  units.Velocity V_2(min=340*1.5) "absolute, downstream";
  
  units.Velocity Vt_1(min=0) "tangential to shock, upstream";
  units.Velocity Vt_2(min=0) "tangential to shock, downstream";
  units.Velocity Vn_1(min=0) "normal to shock, upstream";
  units.Velocity Vn_2(min=0) "normal to shock, downstream";
  /**/
  
  Real Mn_1 "absolute, upstream";
  Real Mn_2 "absolute, downstream";
  
  Real Mnt_1 "tangential to shock, upstream";
  Real Mnt_2 "tangential to shock, downstream";
  Real Mnn_1 "normal to shock, upstream";
  Real Mnn_2 "normal to shock, downstream";
  
  Real PR "PR total";
  Real PRs "PR static";
  Real TR "TR total";
  Real TRs "TR static";
  
  Real dptqpt "delta pt / pt";
  
  /**/
  
  //-----
  
  units.Length arr4plot_wall_x[2];
  units.Length arr4plot_wall_y[2];
  units.Length arr4plot_shock_x[2];
  units.Length arr4plot_shock_y[2];
  
  units.Angle angCtrLine4plot;
  units.Length lenWall4plot;
  units.Length lenShock4plot;
  /**/
  
  
  /* ---------------------------------------------
              Internal objects
          --------------------------------------------- */
  Medium.BaseProperties fluid_1(T(min=0, start=288.15, nominal=288.15), p(min=0, start=1e5)) "fluid obj, total, upstream of shock";
  Medium.BaseProperties fluid_2(T(min=0, start=288.15, nominal=288.15), p(min=0, start=1e5)) "fluid obj, total, downstream of shock";
  Medium.BaseProperties fluidStat_1(T(min=0, start=288.15, nominal=288.15), p(min=0, start=1e5)) "fluid station obj, static, upstream of shock";
  Medium.BaseProperties fluidStat_2(T(min=0, start=288.15, nominal=288.15), p(min=0, start=1e5)) "fluid station obj, static, downstream of shock";
  
  
  
  /* ---------------------------------------------
                    Interface
                --------------------------------------------- */
  
  FluidSystemComponents.Interfaces.FluidWithMach_a portStatWithMn_1(redeclare package Medium = Medium) annotation(
    Placement(transformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.Interfaces.FluidWithMach_b portStatWithMn_2(redeclare package Medium = Medium) annotation(
    Placement(transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}})));
  
  Modelica.Blocks.Interfaces.RealInput u_DELTA if switchDetermine_DELTA == FluidSystemComponents.Types.Switches.switchHowToDetVar.viaRealInput annotation(
    Placement(transformation(origin = {-20, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-20, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput u_angCtrLine4plot if switchDetermine_angCtrLine4plot == FluidSystemComponents.Types.Switches.switchHowToDetVar.viaRealInput annotation(
    Placement(transformation(origin = {-60, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-60, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput y_DELTA_pls_angCtrLine annotation(
    Placement(transformation(origin = {105, 45}, extent = {{-5, -5}, {5, 5}}), iconTransformation(origin = {105, 45}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interfaces.RealOutput y_theta_pls_angCtrLine annotation(
    Placement(transformation(origin = {105, 25}, extent = {{-5, -5}, {5, 5}}), iconTransformation(origin = {105, 25}, extent = {{-5, -5}, {5, 5}})));
  
  /*
  Modelica.Fluid.Interfaces.FluidPort_a sensorPortTotal1(redeclare package Medium = Medium) if use_sensorPortTotal1 annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Interfaces.FluidPort_b sensorPortTotal2(redeclare package Medium = Medium) if use_sensorPortTotal2 annotation(
    Placement(transformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}})));
  */
  
  //******************************************************************************************

equation
  
  //-----
  if switchDetermine_DELTA == FluidSystemComponents.Types.Switches.switchHowToDetVar.param then
    DELTA=DELTA_par;
  elseif switchDetermine_DELTA == FluidSystemComponents.Types.Switches.switchHowToDetVar.viaRealInput then
    DELTA=u_DELTA;
  end if;
  
  //-----
  y_DELTA_pls_angCtrLine=DELTA+angCtrLine4plot;
  y_theta_pls_angCtrLine=theta+angCtrLine4plot;
  
  
  //-----
  delta=DELTA; //flow angle deflection = angle of corner
  /**/
  
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
  
  //-----
  /*
  if use_sensorPortTotal1==true then
    fluid_1.p = sensorPortTotal1.p;
    fluid_1.h = sensorPortTotal1.h_outflow;
    fluid_1.Xi = sensorPortTotal1.Xi_outflow;
  end if;
  
  if use_sensorPortTotal2==true then
    fluid_2.p = sensorPortTotal2.p;
    fluid_2.h = sensorPortTotal2.h_outflow;
    fluid_2.Xi = sensorPortTotal2.Xi_outflow;
  end if;
  */
  
  /* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
  s_fluid_1 = Medium.specificEntropy(fluid_1.state);
  s_fluid_2 = Medium.specificEntropy(fluid_2.state);
  s_fluidStat_1 = Medium.specificEntropy(fluidStat_1.state);
  s_fluidStat_2 = Medium.specificEntropy(fluidStat_2.state);
  
  Vsound_1= Medium.velocityOfSound(fluidStat_1.state);
  Vsound_2= Medium.velocityOfSound(fluidStat_2.state);
  
  /**/
  
  // isentropic between static and total
  s_fluid_1=s_fluidStat_1;
  s_fluid_2=s_fluidStat_2;
  
  
  
  // adiabatic, conservation of total enthalpy
  fluid_1.h= fluid_2.h;
  fluid_1.h= fluidStat_1.h + 1/2*V_1^2;
  fluid_2.h= fluidStat_2.h + 1/2*V_2^2;
  
  // conservation of momentum in direction normal to shock
  fluidStat_1.p + fluidStat_1.d*Vn_1^2 = fluidStat_2.p + fluidStat_2.d*Vn_2^2 ;
  
  
  // velocity triangles
  Vt_1=V_1*cos(theta);
  Vn_1=V_1*sin(theta);
  
  Vt_2=V_2*cos(theta-delta);
  Vn_2=V_2*sin(theta-delta);
  
  fluidStat_1.d/fluidStat_2.d=tan(theta-delta)/tan(theta);
  
  
  // Mach triangles
  Mn_1= V_1/Vsound_1;
  
  Mnt_1=Mn_1*cos(theta);
  Mnn_1=Mn_1*sin(theta);
  
  Mnt_2= Mn_2*cos(theta-delta);
  Mnn_2= Mn_2*sin(theta-delta);
  
  Mn_2= V_2/Vsound_2;
  
  /**/
  
  // mass conservation
  fluidStat_1.d*Vn_1 = fluidStat_2.d*Vn_2;
  portStatWithMn_1.portStat.m_flow + portStatWithMn_2.portStat.m_flow=0;
  fluidStat_2.Xi = fluidStat_1.Xi;
  
  
  //
  PR= fluid_2.p/fluid_1.p;
  PRs= fluidStat_2.p/fluidStat_1.p;
  TR= fluid_2.T/fluid_1.T;
  TRs= fluidStat_2.T/fluidStat_1.T;
  
  dptqpt= (fluid_1.p-fluid_2.p)/fluid_1.p;
  
  /* ---------------------------------------------
  for plot visualization
  --------------------------------------------- */
  //-----
  if switchDetermine_angCtrLine4plot == FluidSystemComponents.Types.Switches.switchHowToDetVar.param then
    angCtrLine4plot= angCtrLine4plot_par;
  elseif switchDetermine_angCtrLine4plot == FluidSystemComponents.Types.Switches.switchHowToDetVar.viaRealInput then
    angCtrLine4plot= u_angCtrLine4plot;
  end if;
  
  //-----
  arr4plot_wall_x[1]=x0_4plot_par;
  arr4plot_wall_y[1]=y0_4plot_par;
  arr4plot_shock_x[1]=x0_4plot_par;
  arr4plot_shock_y[1]=y0_4plot_par;
  
  lenWall4plot= lenWall4plot_par;
  lenShock4plot= lenShock4plot_par;
  
  arr4plot_wall_x[2]=arr4plot_wall_x[1] + lenWall4plot*cos(angCtrLine4plot+DELTA);
  arr4plot_wall_y[2]=arr4plot_wall_y[1] - lenWall4plot*sin(angCtrLine4plot+DELTA);
  arr4plot_shock_x[2]=arr4plot_shock_x[1] + lenShock4plot*cos(angCtrLine4plot+theta);
  arr4plot_shock_y[2]=arr4plot_shock_y[1] - lenShock4plot*sin(angCtrLine4plot+theta);
  
  
  /**/
  
  
  
annotation(
    defaultComponentName = "Shock",
  Icon(graphics = {Text(origin = {0, -70}, extent = {{-100, 10}, {100, -10}}, textString = "%name"), Line(origin = {0.17, 29.83}, points = {{-100.171, 30.1708}, {-40.1708, 30.1708}, {101.829, -29.8292}}, thickness = 6), Line(origin = {-4, 16}, points = {{-36, 44}, {36, -68}}, pattern = LinePattern.Dash, thickness = 3), Line(origin = {-70, 20}, points = {{-14, 0}, {38, 0}}, thickness = 4, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Line(origin = {30, 2}, points = {{-14, 0}, {38, -22}}, thickness = 4, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Text(origin = {9, 53}, extent = {{-7, 3}, {7, -3}}, textString = "DELTA"), Text(origin = {24, 18}, extent = {{-12, 4}, {12, -4}}, textString = "theta"), Line(origin = {-3.21, 53.96}, points = {{-0.792893, 6.03629}, {3.20711, 4.03629}, {3.20711, -1.96371}, {1.20711, -3.96371}, {-0.792893, -5.96371}}, arrow = {Arrow.None, Arrow.Open}, smooth = Smooth.Bezier), Line(origin = {6.79, 39.96}, points = {{17.2071, 20.0363}, {17.2071, 0.03629}, {13.2071, -15.9637}, {3.20711, -25.9637}, {-8.7929, -31.9637}}, arrow = {Arrow.None, Arrow.Open}, smooth = Smooth.Bezier), Line(origin = {30, 60}, points = {{-70, 0}, {70, 0}}, pattern = LinePattern.DashDot)}, coordinateSystem(preserveAspectRatio = false, extent = {{-100, -60}, {100, 60}})),
  Diagram(graphics));
  
  
  
end ObliqueShock00;
