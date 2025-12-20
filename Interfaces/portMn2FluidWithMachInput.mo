within FluidSystemComponents.Interfaces;

model portMn2FluidWithMachInput
  
  /* ---------------------------------------------
              Package
      --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  
  
  Modelica.Fluid.Interfaces.FluidPort_a port(redeclare package Medium = Medium) annotation(
    Placement(transformation(origin = {-20, 80}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-20, 80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u_Mn annotation(
    Placement(transformation(origin = {-30, -80}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-30, -80}, extent = {{-10, -10}, {10, 10}})));
  FluidWithMachOutput portStatWithMn(redeclare package Medium = Medium) annotation(
    Placement(transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}})));
equation
  
  connect(port, portStatWithMn.portStat);
  u_Mn=portStatWithMn.Mn;
  
annotation(
    defaultComponentName = "port2FluidStatMn",
    Icon(graphics = {Rectangle(fillPattern = FillPattern.Solid, extent = {{-20, 100}, {20, -100}}), Text(origin = {0, 110}, extent = {{-100, 10}, {100, -10}}, textString = "%name")}, coordinateSystem(preserveAspectRatio=false,extent = {{-20, -100}, {20, 100}})));



end portMn2FluidWithMachInput;
