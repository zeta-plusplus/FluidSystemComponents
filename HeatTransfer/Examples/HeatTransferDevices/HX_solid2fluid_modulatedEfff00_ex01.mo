within FluidSystemComponents.HeatTransfer.Examples.HeatTransferDevices;

model HX_solid2fluid_modulatedEfff00_ex01
  extends Modelica.Icons.Example;
  //--------------------
  import units= Modelica.Units.SI;
  //----------
  replaceable package fluid = Modelica.Media.Air.DryAirNasa;
  //----------
  parameter units.Temperature TcontourMin = 200 "";
  parameter units.Temperature TcontourMax = 1000 "";
  //--------------------
  
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = fluid, T = 15 + 273.15, m_flow = 10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid, T = 288.15, nPorts = 1, p = 100*1000) annotation(
    Placement(transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 5, height = -0.0, offset = 0.6, startTime = 5) annotation(
    Placement(transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = fluid, diameter = 0.05, length = 0.2) annotation(
    Placement(transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}})));
  Components.HX_solid2fluid_modulatedEff00 HX(redeclare package Medium = fluid)  annotation(
    Placement(transformation(origin = {-13, 10}, extent = {{-13, -10}, {13, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 773.15)  annotation(
    Placement(transformation(origin = {-13, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Sensor.DispColorGrad00 dispColorGrad00(valMin = TcontourMin, valMax = TcontourMax)  annotation(
    Placement(transformation(origin = {-13, -8}, extent = {{7, -4}, {-7, 4}})));
  Sensor.TemperatureDispColor00 T_HX_1(redeclare package Medium = fluid, valMin = TcontourMin, valMax = TcontourMax)  annotation(
    Placement(transformation(origin = {-29, 28}, extent = {{-7, -4}, {7, 4}})));
  FluidSystemComponents.Sensor.TemperatureDispColor00 T_HX_11(redeclare package Medium = fluid, valMin = TcontourMin, valMax = TcontourMax)  annotation(
    Placement(transformation(origin = {15, 28}, extent = {{-7, -4}, {7, 4}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(
    Placement(transformation(origin = {-7, -21}, extent = {{-3, -3}, {3, 3}})));
equation
  connect(boundary.ports[1], HX.port_1) annotation(
    Line(points = {{-60, 50}, {-48, 50}, {-48, 18}, {-26, 18}}, color = {0, 127, 255}));
  connect(HX.port_2, pipe.port_a) annotation(
    Line(points = {{0, 18}, {4, 18}, {4, 50}, {40, 50}}, color = {0, 127, 255}));
  connect(pipe.port_b, boundary1.ports[1]) annotation(
    Line(points = {{60, 50}, {80, 50}}, color = {0, 127, 255}));
  connect(ramp1.y, HX.u_eff) annotation(
    Line(points = {{-58, 10}, {-27, 10}}, color = {0, 0, 127}));
  connect(T_HX_11.port, HX.port_2) annotation(
    Line(points = {{8, 28}, {4, 28}, {4, 18}, {0, 18}}, color = {0, 127, 255}));
  connect(T_HX_1.port, HX.port_1) annotation(
    Line(points = {{-36, 28}, {-36, 18}, {-26, 18}}, color = {0, 127, 255}));
  connect(HX.port_solid, fixedTemperature.port) annotation(
    Line(points = {{-13, 3}, {-13, -30}}, color = {191, 0, 0}));
  connect(temperatureSensor.port, HX.port_solid) annotation(
    Line(points = {{-10, -21}, {-13, -21}, {-13, 3}}, color = {191, 0, 0}));
  connect(temperatureSensor.T, dispColorGrad00.u) annotation(
    Line(points = {{-4, -21}, {-4, -8}, {-5, -8}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
    
end HX_solid2fluid_modulatedEfff00_ex01;
