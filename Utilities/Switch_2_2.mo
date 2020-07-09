within FluidSystemComponents.Utilities;

block Switch_2_2
  extends Modelica.Blocks.Icons.PartialBooleanBlock;
  
  import Modelica.Blocks;
  
  Blocks.Interfaces.RealInput u1 "Connector of first Real input signal"
    annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
  Blocks.Interfaces.BooleanInput u2 "Connector of Boolean input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Blocks.Interfaces.RealInput u3 "Connector of second Real input signal"
    annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
  Modelica.Blocks.Interfaces.RealOutput y1 "Connector of Real output signal"
    annotation (Placement(visible = true, transformation(extent = {{100, 70}, {120, 90}}, rotation = 0), iconTransformation(extent = {{100, 70}, {120, 90}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y3 annotation(
    Placement(visible = true, transformation(extent = {{100, -90}, {120, -70}}, rotation = 0), iconTransformation(extent = {{100, -90}, {120, -70}}, rotation = 0)));
equation
  
  if(u2==true)then
    y1=u3;
    y3=u1;
  else
    y1=u1;
    y3=u3;
  end if;
  
  annotation (
    defaultComponentName="switch",
    Documentation(info="<html>
</html>"),
    Icon(coordinateSystem(
        initialScale = 0.1), graphics={Line(points = {{-100, 0}, {-40, 0}}, color = {255, 0, 255}), Line(points = {{-100, -80}, {-40, -80}, {-40, -80}}, color = {0, 0, 127}, thickness = 0.5), Line(points = {{-40, 12}, {-40, -12}}, color = {255, 0, 255}), Line(points = {{-100, 80}, {-38, 80}}, color = {0, 0, 127}, thickness = 0.5), Line(origin = {-2.97681, 5.95361},points = {{-38, 80}, {104, -86}}, color = {0, 0, 127}, thickness = 1), Ellipse(origin = {-50, 80},lineColor = {0, 0, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{2, -8}, {18, 8}}, endAngle = 360),   Line(origin = {1.24588, 160.02}, points = {{100, -80}, {-40, -80}, {-40, -80}}, color = {0, 0, 127}, pattern = LinePattern.Dash, thickness = 0.5), Line(origin = {0.962375, 0.0715507}, points = {{100, -80}, {-40, -80}, {-40, -80}}, color = {0, 0, 127}, pattern = LinePattern.Dash, thickness = 0.5),  Line(origin = {6.75257, 16.2242}, points = {{-48, -96}, {94, 64}}, color = {0, 0, 127}, thickness = 1), Ellipse(origin = {-52, -80}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{2, -8}, {18, 8}}, endAngle = 360)}));
end Switch_2_2;
