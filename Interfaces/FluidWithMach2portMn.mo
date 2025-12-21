within FluidSystemComponents.Interfaces;

model FluidWithMach2portMn
  /* ---------------------------------------------
                Package
        --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  Modelica.Fluid.Interfaces.FluidPort_a port(redeclare package Medium = Medium) annotation(
    Placement(transformation(origin = {20, 80}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {20, 80}, extent = {{-10, -10}, {10, 10}})));
  FluidWithMach_a portStatWithMn(redeclare package Medium = Medium) annotation(
    Placement(transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput y_Mn annotation(
    Placement(transformation(origin = {30, -80}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {30, -80}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(port, portStatWithMn.portStat);
  y_Mn = portStatWithMn.Mn;
  annotation(
    defaultComponentName = "FluidStatMn2port",
    Icon(graphics = {Rectangle(fillPattern = FillPattern.Solid, extent = {{-20, 100}, {20, -100}}), Text(origin = {0, 110}, extent = {{-100, 10}, {100, -10}}, textString = "%name")}, coordinateSystem(preserveAspectRatio = false, extent = {{-20, -100}, {20, 100}})));
end FluidWithMach2portMn;
