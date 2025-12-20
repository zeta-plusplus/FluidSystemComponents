within FluidSystemComponents.Sources;

model Boundary_StatpTMn
  
  
  replaceable package Medium =
      Modelica.Media.Interfaces.PartialMedium
      "Medium model within the source"
     annotation (choicesAllMatching=true);
  
  
  
  parameter Boolean use_p_in = false
    "Get the pressure from the input connector"
    annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
  parameter Boolean use_T_in= false
    "Get the temperature from the input connector"
    annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
  parameter Boolean use_X_in = false
    "Get the composition from the input connector"
    annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
  parameter Boolean use_C_in = false
    "Get the trace substances from the input connector"
    annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
  parameter Boolean use_Mn_in = false
    "Get Mach number from the input connector"
    annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
  
  
  
  parameter Medium.AbsolutePressure p = Medium.p_default
    "Fixed value of pressure"
    annotation (Dialog(enable = not use_p_in));
  parameter Medium.Temperature T = Medium.T_default
    "Fixed value of temperature"
    annotation (Dialog(enable = not use_T_in));
  parameter Medium.MassFraction X[Medium.nX] = Medium.X_default
    "Fixed value of composition"
    annotation (Dialog(enable = (not use_X_in) and Medium.nXi > 0));
  parameter Medium.ExtraProperty C[Medium.nC](
       quantity=Medium.extraPropertiesNames) = Medium.C_default
    "Fixed values of trace substances"
    annotation (Dialog(enable = (not use_C_in) and Medium.nC > 0));
  parameter Real Mn = 2
    "Fixed value of Mach number"
    annotation (Dialog(enable = not use_Mn_in));
  
  
  
  Modelica.Blocks.Interfaces.RealInput p_in(unit="Pa") if use_p_in
    "Prescribed boundary pressure"
    annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Interfaces.RealInput T_in(unit="K") if use_T_in
    "Prescribed boundary temperature"
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput X_in[Medium.nX](each unit="1") if use_X_in
    "Prescribed boundary composition"
    annotation (Placement(transformation(origin = {0, 40}, extent = {{-140, -60}, {-100, -20}}), iconTransformation(origin = {0, 40}, extent = {{-140, -60}, {-100, -20}})));
  Modelica.Blocks.Interfaces.RealInput C_in[Medium.nC] if use_C_in
    "Prescribed boundary trace substances"
    annotation (Placement(transformation(origin = {0, 40}, extent = {{-140, -100}, {-100, -60}}), iconTransformation(origin = {0, 40}, extent = {{-140, -100}, {-100, -60}})));
  Modelica.Blocks.Interfaces.RealInput Mn_in if use_Mn_in "Prescribed boundary trace substances" annotation(
    Placement(transformation(extent = {{-140, -100}, {-100, -60}}), iconTransformation(extent = {{-140, -100}, {-100, -60}})));
  
  
  
  Interfaces.FluidWithMachOutput portStatWithMn(redeclare package Medium = Medium) annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(nPorts=1, use_p_in=use_p_in, use_T_in=use_T_in, use_X_in=use_X_in, use_C_in=use_C_in,  p = p, T = T, X = X, C = C, redeclare package Medium = Medium)  annotation(
    Placement(transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}})));
  
  
  //***************************************************************************
equation
  
  //---
  if use_p_in==true then
    connect(boundary.p_in,p_in);
  end if;
  //---
  if use_T_in==true then
    connect(boundary.T_in,T_in);
  end if;
  //---
  if use_X_in==true then
    connect(boundary.X_in,X_in);
  end if;
  //---
  if use_C_in==true then
    connect(boundary.C_in,C_in);
  end if;
  //---
  if use_Mn_in==true then
    portStatWithMn.Mn= Mn_in;
  else
    portStatWithMn.Mn= Mn;
  end if;
  //---
  connect(boundary.ports[1], portStatWithMn);
  
  
  
  annotation(
    defaultComponentName = "boundary",
  Diagram(graphics),
  Icon(graphics = {Ellipse(fillColor = {0, 127, 255}, fillPattern = FillPattern.Sphere, extent = {{-100, 100}, {100, -100}})}));
  
  
  
end Boundary_StatpTMn;
