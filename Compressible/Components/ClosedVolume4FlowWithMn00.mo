within FluidSystemComponents.Compressible.Components;

model ClosedVolume4FlowWithMn00
  
  
  Interfaces.FluidWithMachInput portStatWithMn_1 annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.FluidWithMachOutput portStatWithMn_2 annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}})));

  //**********
equation

annotation(
    Diagram(graphics),
    Icon(graphics = {Ellipse(fillColor = {170, 213, 255}, fillPattern = FillPattern.Sphere, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, 110}, extent = {{-100, 10}, {100, -10}}, textString = "%name")}));
end ClosedVolume4FlowWithMn00;
