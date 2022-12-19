within FluidSystemComponents.HydroThermal.Components;

model pistonCylinder
  //----------
  /********************************************************
    imports
  ********************************************************/
  import Modelica.Constants;
  import units=Modelica.Units.SI;
  //********** Package **********
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  //********** Parameters **********
  parameter units.Length lengthCylinder=0.5
    ""
    annotation(
      Dialog(group = "Geometry"));
  parameter units.Length lengthHead=0.1
    ""
    annotation(
      Dialog(group = "Geometry"));
  
  parameter units.Length lengthRod=lengthCylinder+0.1
    ""
    annotation(
      Dialog(group = "Geometry"));
  parameter units.Area areaHeadSide=Modelica.Constants.pi / 4 * 0.1 ^ 2
    ""
    annotation(
      Dialog(group = "Geometry"));
  parameter units.Area areaRodSide=Modelica.Constants.pi / 4 * 0.1 ^ 2
    ""
    annotation(
      Dialog(group = "Geometry"));
  parameter units.Volume volDeadHeadSide=1.0e-6
    ""
    annotation(
      Dialog(group = "Geometry"));
  parameter units.Volume volDeadRodSide=1.0e-6
    ""
    annotation(
      Dialog(group = "Geometry"));
    
  parameter units.Mass massHead=1.0
    "" 
    annotation(
      Dialog(group = "Characteristics"));
  parameter units.Mass massRod=2.0
    "" 
    annotation(
      Dialog(group = "Characteristics"));
  parameter units.TranslationalDampingConstant kDump=0.001
    ""
    annotation(
      Dialog(group = "Characteristics"));
  
  //*********** initialization parameters **********
  parameter units.Length sInit_head= 0.1+lengthHead/2
    ""
    annotation(
      Dialog(group = "Initialization"));
  //********** internal components **********
  Modelica.Fluid.Machines.SweptVolume volume_headSide(redeclare package Medium = Medium, clearance = volDeadHeadSide, nPorts = 1, pistonCrossArea = areaHeadSide, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {-114, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Machines.SweptVolume volume_rodSide(redeclare package Medium = Medium, clearance = volDeadRodSide, nPorts = 1, pistonCrossArea = areaRodSide, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Components.Mass head(L = lengthHead, m = massHead + massRod, s(fixed = true, start = sInit_head))  annotation(
    Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force force1 annotation(
    Placement(visible = true, transformation(origin = {-20, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor1 annotation(
    Placement(visible = true, transformation(origin = {30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position position1 annotation(
    Placement(visible = true, transformation(origin = {0, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Translational.Components.Rod cylinder(L = lengthCylinder)  annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.RelPositionSensor relPositionSensor1 annotation(
    Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Rod rod1(L = lengthRod)  annotation(
    Placement(visible = true, transformation(origin = {26, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Damper damper(d = kDump)  annotation(
    Placement(visible = true, transformation(origin = {-82, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  //********** Interfaces **********
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {-80, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {80, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation(
    Placement(visible = true, transformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
equation
  connect(rod1.flange_b, flange_b) annotation(
    Line(points = {{36, 80}, {86, 80}, {86, 60}, {100, 60}, {100, 60}}, color = {0, 127, 0}));
  connect(volume_rodSide.ports[1], port_2) annotation(
    Line(points = {{70, 60}, {80, 60}, {80, -100}}, color = {0, 127, 255}));
  connect(forceSensor1.flange_b, volume_rodSide.flange) annotation(
    Line(points = {{40, 60}, {50, 60}}, color = {0, 127, 0}));
  connect(force1.f, forceSensor1.f) annotation(
    Line(points = {{-8, 20}, {22, 20}, {22, 49}}, color = {0, 0, 127}));
  connect(position1.flange, forceSensor1.flange_a) annotation(
    Line(points = {{10, 60}, {20, 60}}, color = {0, 127, 0}));
  connect(relPositionSensor1.s_rel, position1.s_ref) annotation(
    Line(points = {{-20, 51}, {-20, 60}, {-12, 60}}, color = {0, 0, 127}));
  connect(cylinder.flange_b, relPositionSensor1.flange_b) annotation(
    Line(points = {{10, -10}, {10, 40}, {-10, 40}}, color = {0, 127, 0}));
  connect(head.flange_b, relPositionSensor1.flange_a) annotation(
    Line(points = {{-40, 60}, {-36, 60}, {-36, 40}, {-30, 40}}, color = {0, 127, 0}));
  connect(fixed1.flange, cylinder.flange_a) annotation(
    Line(points = {{-70, -10}, {-10, -10}}, color = {0, 127, 0}));
  connect(volume_headSide.ports[1], port_1) annotation(
    Line(points = {{-124, 60}, {-124, -82}, {-80, -82}, {-80, -100}}, color = {0, 127, 255}));
  connect(force1.flange, head.flange_b) annotation(
    Line(points = {{-30, 20}, {-34, 20}, {-34, 60}, {-40, 60}, {-40, 60}}, color = {0, 127, 0}));
  connect(head.flange_b, rod1.flange_a) annotation(
    Line(points = {{-40, 60}, {-38, 60}, {-38, 80}, {16, 80}}, color = {0, 127, 0}));
  connect(damper.flange_a, head.flange_a) annotation(
    Line(points = {{-92, 60}, {-60, 60}}, color = {0, 127, 0}));
  connect(damper.flange_a, volume_headSide.flange) annotation(
    Line(points = {{-92, 60}, {-104, 60}}, color = {0, 127, 0}));
  annotation(
    Icon(graphics = {Rectangle(origin = {-5, 5}, lineThickness = 0.75, extent = {{-95, 35}, {85, -45}}), Rectangle(origin = {-27, 0}, fillPattern = FillPattern.Solid, extent = {{-13, 38}, {7, -38}}), Rectangle(origin = {35, 0}, fillPattern = FillPattern.Solid, extent = {{-57, 11}, {55, -11}}), Polygon(origin = {-69, -44}, fillPattern = FillPattern.Solid, points = {{-1, 4}, {-11, -6}, {9, -6}, {-1, 4}}), Polygon(origin = {67, -44}, fillPattern = FillPattern.Solid, points = {{-1, 4}, {-11, -6}, {9, -6}, {-1, 4}}), Line(origin = {-75, -61.78}, points = {{-5, -38}, {-5, -18}, {5, -18}, {5, 20}}, thickness = 0.5), Line(origin = {65.15, -61.76}, points = {{15, -38}, {15, -18}, {1, -18}, {1, 22}}, thickness = 0.5)}, coordinateSystem(initialScale = 0.1)),
    Diagram(graphics = {Text(origin = {0, -23}, extent = {{-20, 3}, {20, -3}}, textString = "cylinder body"), Text(origin = {26, 91}, extent = {{-6, 3}, {20, -3}}, textString = "rod"), Text(origin = {-58, 75}, extent = {{-6, 3}, {40, -11}}, textString = "replesent mass of head and rod"), Text(origin = {-127, 81}, extent = {{-9, 3}, {31, -3}}, textString = "head side")}, coordinateSystem(initialScale = 0.1, extent = {{-140, -100}, {140, 100}})));
    
end pistonCylinder;
