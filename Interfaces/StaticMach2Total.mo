within FluidSystemComponents.Interfaces;

model StaticMach2Total
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
                  Package
          --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  
  
  
  /* ---------------------------------------------
                Internal variables
        --------------------------------------------- */
  units.SpecificEntropy s_fluidStat "specific entropy, fluidStat";
  units.SpecificEntropy s_fluid "specific entropy, fluid";
  units.Velocity Vsound(min = 340) "static temperature refered";
  units.Velocity V(min = 340*2);
  Real Mn;
  
  
  
  /* ---------------------------------------------
                Internal objects
            --------------------------------------------- */
  Medium.BaseProperties fluid(T(min = 0, start = 288.15, nominal = 288.15), p(min = 0, start = 1e5)) "fluid obj, total";
  Medium.BaseProperties fluidStat(T(min = 0, start = 288.15, nominal = 288.15), p(min = 0, start = 1e5)) "fluid station obj, static";
  
  
  
  /* ---------------------------------------------
                      Interface
                  --------------------------------------------- */
  FluidWithMach_a portStatWithMn(redeclare package Medium = Medium) annotation(
    Placement(transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port(redeclare package Medium = Medium) annotation(
    Placement(transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}})));
  
  
  //******************************************************************************************
equation
  
  
  
  /* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
//-- static --
  fluidStat.p = portStatWithMn.portStat.p;
  fluidStat.h = actualStream(portStatWithMn.portStat.h_outflow);
  fluidStat.Xi = actualStream(portStatWithMn.portStat.Xi_outflow);
//-- total --
  fluid.p = port.p;
  fluid.h = actualStream(port.h_outflow);
  fluid.Xi = actualStream(port.Xi_outflow);
//-----
  portStatWithMn.portStat.h_outflow = fluidStat.h;
  portStatWithMn.portStat.Xi_outflow = fluidStat.Xi;
  //-----
  Mn= portStatWithMn.Mn;
  
  
  
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
//
  s_fluid = Medium.specificEntropy(fluid.state);
  s_fluidStat = Medium.specificEntropy(fluidStat.state);
//
  Vsound = Medium.velocityOfSound(fluidStat.state);
  Mn = V/Vsound;
//
  fluid.h = fluidStat.h + 1/2*V^2;
// isentropic between static and total
  s_fluidStat = s_fluid;
// mass conservation
  portStatWithMn.portStat.m_flow + port.m_flow = 0;
  fluidStat.Xi = fluid.Xi;
  
  
  
  annotation(
    defaultComponentName = "StatMn2Tot",
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-80, -100}, {80, 100}}), graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80, 100}, {80, -100}}), Text(origin = {0, 120}, extent = {{-100, 10}, {100, -10}}, textString = "%name"), Text(origin = {50, 0}, extent = {{-18, 20}, {18, -20}}, textString = "Pt
ht"), Text(origin = {-49, 1}, extent = {{-19, 28}, {19, -28}}, textString = "Ps
hs
Mn")}),
    Diagram(graphics));
  
  
  
end StaticMach2Total;
