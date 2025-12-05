within FluidSystemComponents.Interfaces;

connector FluidStaticStateInput
  import units = Modelica.Units.SI;
  
  input Real Mn;
  input units.Area Aeff;
  input units.Pressure Ps;
  input units.Temperature Ts;
  input units.Velocity Vsound;
  input units.Velocity V;
  input units.SpecificEnthalpy hs;
  
  annotation(
    defaultComponentName = "portStatIn",
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(fillColor = {145, 65, 172}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Text(extent = {{-150, 110}, {150, 50}}, textString = "%name")}),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Ellipse(fillColor = {145, 65, 172}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Polygon(origin = {70, 2}, fillPattern = FillPattern.Solid, points = {{-8, 40}, {-10, -42}, {30, -2}, {-8, 40}}), Rectangle(origin = {-18, 1}, fillPattern = FillPattern.Solid, extent = {{-80, 9}, {80, -9}})}));
  
  
end FluidStaticStateInput;