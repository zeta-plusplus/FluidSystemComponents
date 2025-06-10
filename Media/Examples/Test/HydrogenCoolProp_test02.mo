within FluidSystemComponents.Media.Examples.Test;

model HydrogenCoolProp_test02
  extends Modelica.Icons.Example;
  //--------------------
  import units= Modelica.Units.SI;
  //--------------------
  parameter units.Pressure pContourMin = 100*1000 "";
  parameter units.Pressure pContourMax = 1500*1000 "";
  parameter units.Temperature TcontourMin = 123.15 "";
  parameter units.Temperature TcontourMax = 273.15 "";
  parameter units.MassFlowRate m_flow_Min = 0.0001;
  parameter units.MassFlowRate m_flow_Max = 0.1;
  parameter Real arrowMin = 0.01;
  parameter Real arrowMax = 30;
  //--------------------
  inner Modelica.Fluid.System system(p_ambient = 1e5, T_ambient = 173.15)  annotation(
    Placement(visible = true, transformation(origin = {-72, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = FluidSystemComponents.Media.CoolProp.Hydrogen, diameter = 0.05, length = 1) annotation(
    Placement(transformation(origin = {-24, 22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = FluidSystemComponents.Media.CoolProp.Hydrogen, diameter = 0.05, length = 1) annotation(
    Placement(transformation(origin = {24, 22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_p(duration = 1, height = 0, offset = 1000*1000, startTime = 1) annotation(
    Placement(transformation(origin = {-88, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_T(duration = 1, height = 0, offset = -100 + 273.15, startTime = 4) annotation(
    Placement(transformation(origin = {-88, 0}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP volume(redeclare package Medium = FluidSystemComponents.Media.CoolProp.Hydrogen, V = 0.1, nPorts = 3, valMin = pContourMin, valMax = pContourMax)  annotation(
    Placement(transformation(origin = {0, 32}, extent = {{-10, -10}, {10, 10}})));
  Sources.Boundary_pT_colorP boundary(redeclare package Medium = FluidSystemComponents.Media.CoolProp.Hydrogen, use_p_in = true, use_T_in = true, nPorts = 2, valMin = pContourMin, valMax = pContourMax)  annotation(
    Placement(transformation(origin = {-52, 22}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.CommonAnyFluid.Components.ClosedVolumeColorP volume1(redeclare package Medium = FluidSystemComponents.Media.CoolProp.Hydrogen, V = 0.1, nPorts = 3, valMin = pContourMin, valMax = pContourMax) annotation(
    Placement(transformation(origin = {46, 32}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.Sources.Boundary_pT_colorP boundary1(redeclare package Medium = FluidSystemComponents.Media.CoolProp.Hydrogen, nPorts = 1, use_T_in = false, use_p_in = false, p = 100*1000, T = -30 + 273.15, valMin = pContourMin, valMax = pContourMax) annotation(
    Placement(transformation(origin = {74, 22}, extent = {{10, -10}, {-10, 10}})));
  Sensor.TemperatureDispColor00 Temperature(redeclare package Medium = FluidSystemComponents.Media.CoolProp.Hydrogen, valMin = TcontourMin, valMax = TcontourMax)  annotation(
    Placement(transformation(origin = {0, 6}, extent = {{-10, -4}, {10, 4}})));
  FluidSystemComponents.Sensor.TemperatureDispColor00 Temperature1(redeclare package Medium = FluidSystemComponents.Media.CoolProp.Hydrogen, valMax = TcontourMax, valMin = TcontourMin) annotation(
    Placement(transformation(origin = {48, 6}, extent = {{-10, -4}, {10, 4}})));
  FluidSystemComponents.Sensor.TemperatureDispColor00 TemperatureBoundary(redeclare package Medium = FluidSystemComponents.Media.CoolProp.Hydrogen, valMax = TcontourMax, valMin = TcontourMin) annotation(
    Placement(transformation(origin = {-52, 2}, extent = {{10, -4}, {-10, 4}}, rotation = -0)));
equation
  connect(pipe.port_b, volume.ports[1]) annotation(
    Line(points = {{-14, 22}, {0, 22}}, color = {0, 127, 255}));
  connect(pipe1.port_a, volume.ports[2]) annotation(
    Line(points = {{14, 22}, {0, 22}}, color = {0, 127, 255}));
  connect(ramp_p.y, boundary.p_in) annotation(
    Line(points = {{-77, 30}, {-65, 30}}, color = {0, 0, 127}));
  connect(ramp_T.y, boundary.T_in) annotation(
    Line(points = {{-77, 0}, {-73, 0}, {-73, 26}, {-65, 26}}, color = {0, 0, 127}));
  connect(boundary.ports[1], pipe.port_a) annotation(
    Line(points = {{-42, 22}, {-34, 22}}, color = {0, 127, 255}));
  connect(pipe1.port_b, volume1.ports[1]) annotation(
    Line(points = {{34, 22}, {46, 22}}, color = {0, 127, 255}));
  connect(volume1.ports[2], boundary1.ports[1]) annotation(
    Line(points = {{46, 22}, {64, 22}}, color = {0, 127, 255}));
  connect(Temperature.port, volume.ports[3]) annotation(
    Line(points = {{-10, 6}, {0, 6}, {0, 21.8}}, color = {0, 127, 255}));
  connect(Temperature1.port, volume1.ports[3]) annotation(
    Line(points = {{38, 6}, {46, 6}, {46, 21.8}}, color = {0, 127, 255}));
  connect(boundary.ports[2], TemperatureBoundary.port) annotation(
    Line(points = {{-42, 22}, {-42, 2}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.1));
end HydrogenCoolProp_test02;
