within FluidSystemComponents.Interfaces;

connector StringOutput = output String "'output String' as connector" 
  annotation (
  defaultComponentName="y",
  Icon(graphics={Polygon(lineColor = {0, 170, 0}, fillColor = {227, 255, 215}, fillPattern = FillPattern.Solid, lineThickness = 3, points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}})},
    coordinateSystem(extent={{-100,-100},{100,100}},
      preserveAspectRatio=true,
      initialScale=0.2)),
  Diagram(
    coordinateSystem(preserveAspectRatio=true,
      initialScale=0.2,
      extent={{-100,-100},{100,100}}),
      graphics={
    Polygon(
      lineColor={0,170,0}, fillColor = {255, 255, 255},
      fillPattern=FillPattern.Solid, lineThickness = 1,
      points={{0,50},{100,0},{0,-50},{0,50}}),
    Text(
      textColor={0,0,127},
      extent={{-10,60},{-10,85}},
      textString="%name")}),
  Documentation(info="<html>
<p>
Connector with one input signal of type String.
</p>
</html>"));
