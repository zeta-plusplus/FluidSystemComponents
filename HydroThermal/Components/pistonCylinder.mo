within FluidSystemComponents.HydroThermal.Components;

model pistonCylinder
  extends FluidSystemComponents.Interfaces.Frame_2FluidPorts_1MechLin;
  //----------
  /********************************************************
    imports
  ********************************************************/
  import Modelica.Constants;
  import Modelica.SIunits;
  //********** Parameters **********
  parameter Modelica.SIunits.Length lengthCylinder=0.3
    ""
    annotation(
      Dialog(group = "Characteristics"));
  
  parameter Modelica.SIunits.Mass massHead=1.0
    "" 
    annotation(
      Dialog(group = "Characteristics"));
  parameter Modelica.SIunits.Length lengthHead=0.05
    ""
    annotation(
      Dialog(group = "Characteristics"));
  
  parameter Modelica.SIunits.Length lengthRod=lengthCylinder+0.1
    ""
    annotation(
      Dialog(group = "Characteristics"));
  
  
  parameter Modelica.SIunits.Length sInit_head= 0.1+lengthHead/2
    ""
    annotation(
      Dialog(group = "Initialization"));
  
  //********** internal components **********
  Modelica.Fluid.Machines.SweptVolume volume_headSide(redeclare package Medium = Medium, nPorts = 1, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Machines.SweptVolume volume_rodSide(redeclare package Medium = Medium, nPorts = 1, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Components.Mass head(L = lengthHead, m = massHead, s(fixed = true, start = sInit_head))  annotation(
    Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force force1 annotation(
    Placement(visible = true, transformation(origin = {-20, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor1 annotation(
    Placement(visible = true, transformation(origin = {50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position position1 annotation(
    Placement(visible = true, transformation(origin = {20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {-80, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Translational.Components.Rod cylinder(L = lengthCylinder)  annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.RelPositionSensor relPositionSensor1 annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Rod rod1(L = lengthRod)  annotation(
    Placement(visible = true, transformation(origin = {26, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(force1.flange, head.flange_b) annotation(
    Line(points = {{-30, 20}, {-34, 20}, {-34, 60}, {-40, 60}, {-40, 60}}, color = {0, 127, 0}));
  connect(head.flange_b, relPositionSensor1.flange_a) annotation(
    Line(points = {{-40, 60}, {-36, 60}, {-36, 40}, {-20, 40}}, color = {0, 127, 0}));
  connect(head.flange_b, rod1.flange_a) annotation(
    Line(points = {{-40, 60}, {-38, 60}, {-38, 80}, {16, 80}}, color = {0, 127, 0}));
  connect(volume_headSide.flange, head.flange_a) annotation(
    Line(points = {{-70, 60}, {-60, 60}}, color = {0, 127, 0}));
  connect(relPositionSensor1.s_rel, position1.s_ref) annotation(
    Line(points = {{-10, 51}, {-10, 60}, {8, 60}}, color = {0, 0, 127}));
  connect(cylinder.flange_b, relPositionSensor1.flange_b) annotation(
    Line(points = {{10, -10}, {10, 40}, {0, 40}}, color = {0, 127, 0}));
  connect(fixed1.flange, cylinder.flange_a) annotation(
    Line(points = {{-80, -10}, {-10, -10}}, color = {0, 127, 0}));
  connect(force1.f, forceSensor1.f) annotation(
    Line(points = {{-8, 20}, {42, 20}, {42, 50}, {42, 50}}, color = {0, 0, 127}));
  connect(port_2, volume_rodSide.ports[1]) annotation(
    Line(points = {{80, -100}, {80, -74}, {94, -74}, {94, 60}, {90, 60}}, color = {0, 127, 255}));
  connect(rod1.flange_b, flange_1) annotation(
    Line(points = {{36, 80}, {98, 80}, {98, 2}, {100, 2}, {100, 0}}, color = {0, 127, 0}));
  connect(forceSensor1.flange_b, volume_rodSide.flange) annotation(
    Line(points = {{60, 60}, {70, 60}}, color = {0, 127, 0}));
  connect(position1.flange, forceSensor1.flange_a) annotation(
    Line(points = {{30, 60}, {40, 60}}, color = {0, 127, 0}));
  connect(port_1, volume_headSide.ports[1]) annotation(
    Line(points = {{-80, -100}, {-80, -100}, {-80, -62}, {-94, -62}, {-94, 60}, {-90, 60}, {-90, 60}}, color = {0, 127, 255}));
  annotation(
    Icon(graphics = {Rectangle(origin = {-5, 5}, lineThickness = 1.5, extent = {{-95, 35}, {95, -45}}), Rectangle(origin = {-27, 0}, fillPattern = FillPattern.Solid, extent = {{-5, 38}, {7, -38}}), Rectangle(origin = {35, 0}, fillPattern = FillPattern.Solid, extent = {{-57, 5}, {55, -5}}), Polygon(origin = {-69, -44}, fillPattern = FillPattern.Solid, points = {{-1, 4}, {-11, -6}, {9, -6}, {-1, 4}}), Polygon(origin = {71, -44}, fillPattern = FillPattern.Solid, points = {{-1, 4}, {-11, -6}, {9, -6}, {-1, 4}}), Line(origin = {-75, -61.7758}, points = {{-5, -38}, {-5, -18}, {5, -18}, {5, 20}}, thickness = 0.75), Line(origin = {64.9, -61.51}, points = {{15, -38}, {15, -18}, {5, -18}, {5, 20}}, thickness = 0.75)}, coordinateSystem(initialScale = 0.1)),
    Diagram(graphics = {Text(origin = {0, -23}, extent = {{-20, 3}, {20, -3}}, textString = "cylinder body"), Text(origin = {26, 91}, extent = {{-6, 3}, {20, -3}}, textString = "rod"), Text(origin = {-56, 45}, extent = {{-6, 3}, {20, -3}}, textString = "head"), Text(origin = {-90, 77}, extent = {{-6, 3}, {20, -3}}, textString = "head side")}));
    
end pistonCylinder;
