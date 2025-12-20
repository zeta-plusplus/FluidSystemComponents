within FluidSystemComponents.Interfaces;

connector FluidWithMachInput
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium "Medium model";
  Modelica.Fluid.Interfaces.FluidPort_a portStat(redeclare package Medium = Medium) "Fluid port";
  Modelica.Blocks.Interfaces.RealInput Mn "";
  annotation(
    defaultComponentName = "portStatWithMn",
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Ellipse(fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(origin = {-6, 0}, points = {{-84, 0}, {94, 0}}, thickness = 4), Line(origin = {69.61, 2}, points = {{-17.6053, 25.9952}, {18.3947, -2.00482}, {-17.6053, -26.0048}}, thickness = 4), Text(origin = {1, -24}, extent = {{-33, 16}, {33, -16}}, textString = "Mn")}));
end FluidWithMachInput;
