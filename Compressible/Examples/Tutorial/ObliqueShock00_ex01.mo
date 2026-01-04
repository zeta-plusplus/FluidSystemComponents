within FluidSystemComponents.Compressible.Examples.Tutorial;

model ObliqueShock00_ex01
  extends Modelica.Icons.Example;
  //-----
  package Fluid1 = Modelica.Media.Air.DryAirNasa;
  //-----
  parameter Modelica.Units.SI.Pressure pCntrMin = 100*1000;
  parameter Modelica.Units.SI.Pressure pCntrMax = 5000*1000;
  parameter Modelica.Units.SI.Temperature TcntrMin = 200;
  parameter Modelica.Units.SI.Temperature TcntrMax = 500;
  //-----
  Components.ObliqueShock00 Shock(redeclare package Medium = Fluid1, DELTA_par = 0.15707963267948966, switchDetermine_DELTA = Types.Switches.switchHowToDetVar.viaRealInput, use_sensorPortTotal1 = true, use_sensorPortTotal2 = true) annotation(
    Placement(transformation(origin = {0, -12}, extent = {{-20, -11}, {20, 11}})));
  Interfaces.portMn2FluidWithMach port2FluidStatMn(redeclare package Medium = Fluid1) annotation(
    Placement(transformation(origin = {-42, -8}, extent = {{-2, -10}, {2, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Fluid1, T(displayUnit = "K") = 216.65, nPorts = 1, p(displayUnit = "kPa") = 12100) annotation(
    Placement(transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_Mn(k = 5) annotation(
    Placement(transformation(origin = {-70, -36}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = Fluid1, m_flow = -1, nPorts = 1) annotation(
    Placement(transformation(origin = {78, -19}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_ang(height = 5, duration = 5, offset = 1, startTime = 5) annotation(
    Placement(transformation(origin = {-70, 80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg annotation(
    Placement(transformation(origin = {-30, 80}, extent = {{-10, -10}, {10, 10}})));
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {70, 90}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.StaticMach2Total StatMn2Tot(redeclare package Medium = Fluid1) annotation(
    Placement(transformation(origin = {48, -19}, extent = {{-8, -10}, {8, 10}})));
  Sensor.Ps_FluidWithMach_DispColor00 Pressure_Shock_Static1(redeclare package Medium = Fluid1, valMin = pCntrMin, valMax = pCntrMax) annotation(
    Placement(transformation(origin = {-16, 18}, extent = {{-10, -10}, {10, 10}})));
  Sensor.PressureDispColor00 Pressure_boundary(redeclare package Medium = Fluid1, valMin = pCntrMin, valMax = pCntrMax) annotation(
    Placement(transformation(origin = {-46, 22}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.Sensor.Ps_FluidWithMach_DispColor00 Pressure_Shock_Static2(redeclare package Medium = Fluid1, valMax = pCntrMax, valMin = pCntrMin) annotation(
    Placement(transformation(origin = {18, 18}, extent = {{10, -10}, {-10, 10}})));
  Sensor.Ts_FluidWithMach_DispColor00 Temperature_Shock_Static1(redeclare package Medium = Fluid1, valMin = TcntrMin, valMax = TcntrMax) annotation(
    Placement(transformation(origin = {-13, -34}, extent = {{-10, -4}, {10, 4}})));
  FluidSystemComponents.Sensor.Ts_FluidWithMach_DispColor00 Temperature_Shock_Static2(redeclare package Medium = Fluid1, valMax = TcntrMax, valMin = TcntrMin) annotation(
    Placement(transformation(origin = {16, -34}, extent = {{10, -4}, {-10, 4}})));
  FluidSystemComponents.Sensor.PressureDispColor00 Pressure_Shock_Total1(redeclare package Medium = Fluid1, valMax = pCntrMax, valMin = pCntrMin) annotation(
    Placement(transformation(origin = {-22, -80}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.Sensor.PressureDispColor00 Pressure_Shock_Total2(redeclare package Medium = Fluid1, valMax = pCntrMax, valMin = pCntrMin) annotation(
    Placement(transformation(origin = {23, -80}, extent = {{10, -10}, {-10, 10}})));
  Sensor.TemperatureDispColor00 Temperature_Shock_Total1(redeclare package Medium = Fluid1, valMin = TcntrMin, valMax = TcntrMax)  annotation(
    Placement(transformation(origin = {-18, -60}, extent = {{-10, -4}, {10, 4}})));
  FluidSystemComponents.Sensor.TemperatureDispColor00 Temperature_Shock_Total2(redeclare package Medium = Fluid1, valMax = TcntrMax, valMin = TcntrMin) annotation(
    Placement(transformation(origin = {19, -60}, extent = {{10, -4}, {-10, 4}})));
equation
  connect(port2FluidStatMn.portStatWithMn, Shock.portStatWithMn_1) annotation(
    Line(points = {{-40, -8}, {-20, -8}}, color = {0, 127, 255}, thickness = 3));
  connect(boundary.ports[1], port2FluidStatMn.port) annotation(
    Line(points = {{-60, 0}, {-44, 0}}, color = {0, 127, 255}, thickness = 3));
  connect(const_Mn.y, port2FluidStatMn.u_Mn) annotation(
    Line(points = {{-59, -36}, {-53, -36}, {-53, -16}, {-45, -16}}, color = {0, 0, 127}, thickness = 1));
  connect(ramp_ang.y, from_deg.u) annotation(
    Line(points = {{-59, 80}, {-42, 80}}, color = {0, 0, 127}));
  connect(StatMn2Tot.port, boundary1.ports[1]) annotation(
    Line(points = {{56, -19}, {68, -19}}, color = {0, 127, 255}, thickness = 3));
  connect(Shock.portStatWithMn_2, StatMn2Tot.portStatWithMn) annotation(
    Line(points = {{20, -19}, {40, -19}}, color = {0, 127, 255}, thickness = 3));
  connect(Shock.portStatWithMn_1, Pressure_Shock_Static1.port) annotation(
    Line(points = {{-20, -8}, {-26, -8}, {-26, 17.6665}}, color = {0, 127, 255}));
  connect(port2FluidStatMn.port, Pressure_boundary.port) annotation(
    Line(points = {{-44, 0}, {-56, 0}, {-56, 22}}, color = {0, 127, 255}));
  connect(Pressure_Shock_Static2.port, Shock.portStatWithMn_2) annotation(
    Line(points = {{28, 17.8}, {28, -19}, {20, -19}}, color = {0, 127, 255}));
  connect(Shock.portStatWithMn_1, Temperature_Shock_Static1.port) annotation(
    Line(points = {{-20, -8}, {-23, -8}, {-23, -34}}, color = {0, 127, 255}));
  connect(Shock.portStatWithMn_2, Temperature_Shock_Static2.port) annotation(
    Line(points = {{20, -19}, {26, -19}, {26, -34}}, color = {0, 127, 255}));
  connect(from_deg.y, Shock.u_DELTA) annotation(
    Line(points = {{-19, 80}, {-4, 80}, {-4, 1}}, color = {0, 0, 127}));
  connect(Shock.sensorPortTotal2, Pressure_Shock_Total2.port) annotation(
    Line(points = {{20, -23}, {33, -23}, {33, -80}}, color = {0, 127, 255}));
  connect(Shock.sensorPortTotal1, Temperature_Shock_Total1.port) annotation(
    Line(points = {{-20, -12}, {-28, -12}, {-28, -60}}, color = {0, 127, 255}));
  connect(Shock.sensorPortTotal2, Temperature_Shock_Total2.port) annotation(
    Line(points = {{20, -23}, {29, -23}, {29, -60}}, color = {0, 127, 255}));
  connect(Shock.sensorPortTotal1, Pressure_Shock_Total1.port) annotation(
    Line(points = {{-20, -12}, {-32, -12}, {-32, -80}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT", s = "dassl", variableFilter = ".*"));
end ObliqueShock00_ex01;
