within FluidSystemComponents.Interfaces;

connector FluidStaticStateOutput
  
  import units = Modelica.Units.SI;
  
  output Real Mn;
  output units.Area Aeff;
  output units.Pressure Ps;
  output units.Temperature Ts;
  output units.Velocity Vsound;
  output units.Velocity V;
  output units.SpecificEnthalpy hs;
  
  
  annotation(defaultComponentName = "PortStatOut",
    Diagram(graphics= {Ellipse(lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, lineThickness = 10, extent = {{-40, 40}, {40, -40}}), Text(origin = {-2, -10}, extent = {{-150, 110}, {150, 50}}, textString = "%name")}),
    Icon(graphics = {Ellipse(lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, lineThickness = 20, extent = {{-90, 90}, {90, -90}}), Polygon(origin = {54, 2}, fillPattern = FillPattern.Solid, points = {{-8, 40}, {-8, -42}, {30, -2}, {-8, 40}}), Rectangle(origin = {-18, 1}, fillPattern = FillPattern.Solid, extent = {{-80, 9}, {80, -9}})}));
  
  
end FluidStaticStateOutput;