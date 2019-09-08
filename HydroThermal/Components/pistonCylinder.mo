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
    Modelica.Fluid.Machines.SweptVolume sweptVolume1(nPorts = 1, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Machines.SweptVolume sweptVolume2(nPorts = 1, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume annotation(
    Placement(visible = true, transformation(origin = {-90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume1 annotation(
    Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice annotation(
    Placement(visible = true, transformation(origin = {0, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass mass1 annotation(
    Placement(visible = true, transformation(origin = {60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force force1 annotation(
    Placement(visible = true, transformation(origin = {-40, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = -1)  annotation(
    Placement(visible = true, transformation(origin = {-10, 80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor1 annotation(
    Placement(visible = true, transformation(origin = {50, 60}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position position1 annotation(
    Placement(visible = true, transformation(origin = {20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor1 annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = -1) annotation(
    Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(add1.u2, const.y) annotation(
    Line(points = {{6, 28}, {6, 22}, {10, 22}, {10, 11}}, color = {0, 0, 127}));
  connect(forceSensor1.flange_a, sweptVolume2.flange) annotation(
    Line(points = {{60, 60}, {70, 60}, {70, 60}, {70, 60}}, color = {0, 127, 0}));
  connect(volume1.ports[2], sweptVolume2.ports[1]) annotation(
    Line(points = {{80, -70}, {80, -50}, {90, -50}, {90, 60}}, color = {0, 127, 255}, thickness = 0.5));
  connect(position1.flange, forceSensor1.flange_b) annotation(
    Line(points = {{30, 60}, {40, 60}, {40, 60}, {40, 60}}, color = {0, 127, 0}));
  connect(gain1.u, forceSensor1.f) annotation(
    Line(points = {{2, 80}, {58, 80}, {58, 72}, {58, 72}}, color = {0, 0, 127}));
  connect(sweptVolume1.flange, positionSensor1.flange) annotation(
    Line(points = {{-70, 60}, {-64, 60}, {-64, 20}, {-60, 20}}, color = {0, 127, 0}));
  connect(positionSensor1.s, gain2.u) annotation(
    Line(points = {{-39, 20}, {-33, 20}, {-33, 20}, {-33, 20}}, color = {0, 0, 127}));
  connect(gain2.y, add1.u1) annotation(
    Line(points = {{-9, 20}, {-6, 20}, {-6, 28}}, color = {0, 0, 127}));
  connect(add1.y, position1.s_ref) annotation(
    Line(points = {{0, 51}, {0, 60}, {8, 60}}, color = {0, 0, 127}));
  connect(force1.f, gain1.y) annotation(
    Line(points = {{-28, 60}, {-25, 60}, {-25, 80}, {-21, 80}}, color = {0, 0, 127}));
  connect(sweptVolume1.flange, mass1.flange_a) annotation(
    Line(points = {{-70, 60}, {-66, 60}, {-66, -30}, {50, -30}}, color = {0, 127, 0}));
  connect(sweptVolume1.flange, force1.flange) annotation(
    Line(points = {{-70, 60}, {-50, 60}, {-50, 60}, {-50, 60}}, color = {0, 127, 0}));
  connect(volume.ports[2], sweptVolume1.ports[1]) annotation(
    Line(points = {{-80, -70}, {-80, -50}, {-90, -50}, {-90, 60}}, color = {0, 127, 255}, thickness = 0.5));
  connect(mass1.flange_b, flange_1) annotation(
    Line(points = {{70, -30}, {84, -30}, {84, 0}, {100, 0}}, color = {0, 127, 0}));
  connect(orifice.port_b, volume1.ports[3]) annotation(
    Line(points = {{10, -70}, {80, -70}, {80, -70}, {80, -70}}, color = {0, 127, 255}));
  connect(volume.ports[3], orifice.port_a) annotation(
    Line(points = {{-80, -70}, {-10, -70}, {-10, -70}, {-10, -70}}, color = {0, 127, 255}));
  connect(port_2, volume1.ports[1]) annotation(
    Line(points = {{80, -100}, {80, -100}, {80, -70}, {80, -70}}, color = {0, 127, 255}));
  connect(port_1, volume.ports[1]) annotation(
    Line(points = {{-80, -100}, {-80, -100}, {-80, -70}, {-80, -70}}, color = {0, 127, 255}));
annotation(
    Icon(graphics = {Rectangle(origin = {-5, 5}, lineThickness = 1.5, extent = {{-95, 35}, {95, -45}}), Rectangle(origin = {-27, 0}, fillPattern = FillPattern.Solid, extent = {{-5, 38}, {7, -38}}), Rectangle(origin = {35, 0}, fillPattern = FillPattern.Solid, extent = {{-57, 5}, {55, -5}}), Polygon(origin = {-69, -44}, fillPattern = FillPattern.Solid, points = {{-1, 4}, {-11, -6}, {9, -6}, {-1, 4}}), Polygon(origin = {71, -44}, fillPattern = FillPattern.Solid, points = {{-1, 4}, {-11, -6}, {9, -6}, {-1, 4}}), Line(origin = {-75, -61.7758}, points = {{-5, -38}, {-5, -18}, {5, -18}, {5, 20}}, thickness = 0.75), Line(origin = {64.9, -61.51}, points = {{15, -38}, {15, -18}, {5, -18}, {5, 20}}, thickness = 0.75)}, coordinateSystem(initialScale = 0.1)));end pistonCylinder;
