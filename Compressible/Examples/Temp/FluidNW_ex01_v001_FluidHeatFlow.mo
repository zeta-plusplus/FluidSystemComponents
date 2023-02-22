within FluidSystemComponents.Compressible.Examples.Temp;

model FluidNW_ex01_v001_FluidHeatFlow
  extends Modelica.Icons.Example;
  //-------------------------
  import units = Modelica.Units.SI;
  //-------------------------
  //parameter units.Volume volStd = 0.1;
  //package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium= fluid1,
  parameter Modelica.Thermal.FluidHeatFlow.Media.Medium medium1 = Modelica.Thermal.FluidHeatFlow.Media.Medium() "Cooling medium" annotation(
    choicesAllMatching = true);
  //-------------------------
  Modelica.Blocks.Sources.Ramp ramp_p0(duration = 1, height = 100*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-156, 170}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p0(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-156, 140}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p1(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-36, 140}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 1, height = 120*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-36, 170}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p2(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {74, 140}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p2(duration = 1, height = -50*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {74, 170}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient boundary0(constantAmbientTemperature(displayUnit = "K") = 700, medium = medium1, usePressureInput = true) annotation(
    Placement(visible = true, transformation(origin = {-136, 108}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Modelica.Blocks.Sources.Constant open_b0_1000(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-148, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant open_b1_1001(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-28, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant open_b2_1002(k = 1) annotation(
    Placement(visible = true, transformation(origin = {82, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient boundary1(constantAmbientTemperature(displayUnit = "K") = 750, medium = medium1, usePressureInput = true) annotation(
    Placement(visible = true, transformation(origin = {-16, 110}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient boundary2(medium = medium1, constantAmbientTemperature(displayUnit = "K") = 700, usePressureInput = true) annotation(
    Placement(visible = true, transformation(origin = {94, 110}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Modelica.Blocks.Sources.Constant open_1000_1001(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-76, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant open_1001_1002(k = 1) annotation(
    Placement(visible = true, transformation(origin = {44, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve rst_b0_1000(Kv1 = 1, LinearCharacteristic = false, T0 = 15 + 273.15, dp0(displayUnit = "Pa") = 1, frictionLoss = 0, kv0 = 0.01, m = 0, medium = medium1, rho0 = 10, y1 = 1) annotation(
    Placement(visible = true, transformation(origin = {-116, 98}, extent = {{-30, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve rst_b1_1001(Kv1 = 1, LinearCharacteristic = false, T0 = 15 + 273.15, dp0(displayUnit = "Pa") = 1, frictionLoss = 0, kv0 = 0.01, m = 0, medium = medium1, rho0 = 10, y1 = 1) annotation(
    Placement(visible = true, transformation(origin = {4, 98}, extent = {{-30, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve rst_b2_1002(Kv1 = 1, LinearCharacteristic = false, T0 = 15 + 273.15, dp0(displayUnit = "Pa") = 1, frictionLoss = 0, kv0 = 0.01, m = 0, medium = medium1, rho0 = 10, y1 = 1) annotation(
    Placement(visible = true, transformation(origin = {114, 98}, extent = {{-30, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve rst_1000_1001(Kv1 = 1, LinearCharacteristic = false, T0 = 15 + 273.15, dp0(displayUnit = "Pa") = 1, frictionLoss = 0, kv0 = 0.01, m = 0, medium = medium1, rho0 = 10, y1 = 1) annotation(
    Placement(visible = true, transformation(origin = {-96, 38}, extent = {{-30, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve rst_1001_1002(Kv1 = 1, LinearCharacteristic = false, T0 = 15 + 273.15, dp0(displayUnit = "Pa") = 1, frictionLoss = 0, kv0 = 0.01, m = 0, medium = medium1, rho0 = 10, y1 = 1) annotation(
    Placement(visible = true, transformation(origin = {24, 38}, extent = {{-30, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p1000(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-248, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p1000(duration = 1, height = 100*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-248, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient boundary1000(constantAmbientTemperature(displayUnit = "K") = 700, medium = medium1, usePressureInput = true) annotation(
    Placement(visible = true, transformation(origin = {-228, 38}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Modelica.Blocks.Sources.Constant open_b1000_1000(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-170, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve rst_b1000_1000(Kv1 = 1, LinearCharacteristic = false, T0 = 15 + 273.15, dp0(displayUnit = "Pa") = 1, frictionLoss = 0, kv0 = 0.01, m = 0, medium = medium1, rho0 = 10, y1 = 1) annotation(
    Placement(visible = true, transformation(origin = {-190, 38}, extent = {{-30, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_p1001(duration = 1, height = 50*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {210, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p1001(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {210, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient boundary1001(constantAmbientTemperature(displayUnit = "K") = 700, medium = medium1, usePressureInput = true) annotation(
    Placement(visible = true, transformation(origin = {190, 38}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve rst_1002_b1001(Kv1 = 1, LinearCharacteristic = false, T0 = 15 + 273.15, dp0(displayUnit = "Pa") = 1, frictionLoss = 0, kv0 = 0.01, m = 0, medium = medium1, rho0 = 10, y1 = 1) annotation(
    Placement(visible = true, transformation(origin = {130, 38}, extent = {{-30, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant open_1002_b1001(k = 1) annotation(
    Placement(visible = true, transformation(origin = {150, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_p2000(duration = 1, height = 200*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-248, -22}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p2000(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-248, -52}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient boundary2000(constantAmbientTemperature(displayUnit = "K") = 700, medium = medium1, usePressureInput = true) annotation(
    Placement(visible = true, transformation(origin = {-228, -84}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve rst_b2000_2000(Kv1 = 1, LinearCharacteristic = false, T0 = 15 + 273.15, dp0(displayUnit = "Pa") = 1, frictionLoss = 0, kv0 = 0.01, m = 0, medium = medium1, rho0 = 10, y1 = 1) annotation(
    Placement(visible = true, transformation(origin = {-190, -84}, extent = {{-30, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve rst_b2000_2001(Kv1 = 0.1, LinearCharacteristic = false, T0 = 15 + 273.15, dp0(displayUnit = "Pa") = 1, frictionLoss = 0, kv0 = 0.01, m = 0, medium = medium1, rho0 = 10, y1 = 1) annotation(
    Placement(visible = true, transformation(origin = {-98, -84}, extent = {{-30, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve rst_b2001_2002(Kv1 = 1, LinearCharacteristic = false, T0 = 15 + 273.15, dp0(displayUnit = "Pa") = 1, frictionLoss = 0, kv0 = 0.01, m = 0, medium = medium1, rho0 = 10, y1 = 1) annotation(
    Placement(visible = true, transformation(origin = {22, -84}, extent = {{-30, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve rst_2002_b2001(Kv1 = 1, LinearCharacteristic = false, T0 = 15 + 273.15, dp0(displayUnit = "Pa") = 1, frictionLoss = 0, kv0 = 0.01, m = 0, medium = medium1, rho0 = 10, y1 = 1) annotation(
    Placement(visible = true, transformation(origin = {130, -84}, extent = {{-30, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p2001(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {210, -52}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p2001(duration = 1, height = 150*1000, offset = 100*1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {210, -22}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient boundary2001(constantAmbientTemperature(displayUnit = "K") = 700, medium = medium1, usePressureInput = true) annotation(
    Placement(visible = true, transformation(origin = {190, -84}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant open_b2000_2000(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-170, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant open_2000_2001(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-78, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant open_2001_2002(k = 1) annotation(
    Placement(visible = true, transformation(origin = {42, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant open_2002_b2001(k = 1) annotation(
    Placement(visible = true, transformation(origin = {150, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve rst_b1000_2000(Kv1 = 1, LinearCharacteristic = false, T0 = 15 + 273.15, dp0(displayUnit = "Pa") = 1, frictionLoss = 0, kv0 = 0.01, m = 0, medium = medium1, rho0 = 10, y1 = 1) annotation(
    Placement(visible = true, transformation(origin = {-116, -20}, extent = {{-30, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant open_1000_2000(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-148, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant open_1001_2001(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-28, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve rst_1001_2001(Kv1 = 2, LinearCharacteristic = false, T0 = 15 + 273.15, dp0(displayUnit = "Pa") = 1, frictionLoss = 0, kv0 = 0.01, m = 0, medium = medium1, rho0 = 10, y1 = 1) annotation(
    Placement(visible = true, transformation(origin = {4, -20}, extent = {{-30, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant open_1002_2002(k = 1) annotation(
    Placement(visible = true, transformation(origin = {82, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Components.Valve rst_1002_2002(Kv1 = 0.5, LinearCharacteristic = false, T0 = 15 + 273.15, dp0(displayUnit = "Pa") = 1, frictionLoss = 0, kv0 = 0.01, m = 0, medium = medium1, rho0 = 10, y1 = 1) annotation(
    Placement(visible = true, transformation(origin = {114, -20}, extent = {{-30, -10}, {-10, 10}}, rotation = 90)));
equation
  connect(ramp_p0.y, firstOrder_p0.u) annotation(
    Line(points = {{-156, 159}, {-156, 151}}, color = {0, 0, 127}));
  connect(ramp_p1.y, firstOrder_p1.u) annotation(
    Line(points = {{-36, 159}, {-36, 151}}, color = {0, 0, 127}));
  connect(ramp_p2.y, firstOrder_p2.u) annotation(
    Line(points = {{74, 159}, {74, 151}}, color = {0, 0, 127}));
  connect(firstOrder_p0.y, boundary0.ambientPressure) annotation(
    Line(points = {{-156, 129}, {-156, 113}, {-146, 113}}, color = {0, 0, 127}));
  connect(firstOrder_p1.y, boundary1.ambientPressure) annotation(
    Line(points = {{-36, 129}, {-36, 115}, {-26, 115}}, color = {0, 0, 127}));
  connect(firstOrder_p2.y, boundary2.ambientPressure) annotation(
    Line(points = {{74, 129}, {74, 116}, {84, 116}}, color = {0, 0, 127}));
  connect(open_b0_1000.y, rst_b0_1000.y) annotation(
    Line(points = {{-137, 78}, {-127, 78}}, color = {0, 0, 127}));
  connect(open_b1_1001.y, rst_b1_1001.y) annotation(
    Line(points = {{-17, 78}, {-7, 78}}, color = {0, 0, 127}));
  connect(boundary0.flowPort, rst_b0_1000.flowPort_b) annotation(
    Line(points = {{-126, 108}, {-116, 108}, {-116, 88}}, color = {255, 0, 0}));
  connect(boundary1.flowPort, rst_b1_1001.flowPort_b) annotation(
    Line(points = {{-6, 110}, {4, 110}, {4, 88}}, color = {255, 0, 0}));
  connect(boundary2.flowPort, rst_b2_1002.flowPort_b) annotation(
    Line(points = {{104, 110}, {114, 110}, {114, 88}}, color = {255, 0, 0}));
  connect(open_b2_1002.y, rst_b2_1002.y) annotation(
    Line(points = {{93, 78}, {103, 78}}, color = {0, 0, 127}));
  connect(open_1000_1001.y, rst_1000_1001.y) annotation(
    Line(points = {{-76, 15}, {-76, 27}}, color = {0, 0, 127}));
  connect(open_1001_1002.y, rst_1001_1002.y) annotation(
    Line(points = {{44, 15}, {44, 27}}, color = {0, 0, 127}));
  connect(rst_b0_1000.flowPort_a, rst_1000_1001.flowPort_b) annotation(
    Line(points = {{-116, 68}, {-116, 38}, {-86, 38}}, color = {255, 0, 0}));
  connect(rst_1000_1001.flowPort_a, rst_b1_1001.flowPort_a) annotation(
    Line(points = {{-66, 38}, {4, 38}, {4, 68}}, color = {255, 0, 0}));
  connect(rst_1000_1001.flowPort_a, rst_1001_1002.flowPort_b) annotation(
    Line(points = {{-66, 38}, {34, 38}}, color = {255, 0, 0}));
  connect(rst_1001_1002.flowPort_a, rst_b2_1002.flowPort_a) annotation(
    Line(points = {{54, 38}, {114, 38}, {114, 68}}, color = {255, 0, 0}));
  connect(ramp_p1000.y, firstOrder_p1000.u) annotation(
    Line(points = {{-248, 89}, {-248, 81}}, color = {0, 0, 127}));
  connect(firstOrder_p1000.y, boundary1000.ambientPressure) annotation(
    Line(points = {{-248, 59}, {-248, 44}, {-238, 44}}, color = {0, 0, 127}));
  connect(open_b1000_1000.y, rst_b1000_1000.y) annotation(
    Line(points = {{-170, 15}, {-170, 27}}, color = {0, 0, 127}));
  connect(rst_b1000_1000.flowPort_a, rst_1000_1001.flowPort_b) annotation(
    Line(points = {{-160, 38}, {-86, 38}}, color = {255, 0, 0}));
  connect(boundary1000.flowPort, rst_b1000_1000.flowPort_b) annotation(
    Line(points = {{-218, 38}, {-180, 38}}, color = {255, 0, 0}));
  connect(ramp_p1001.y, firstOrder_p1001.u) annotation(
    Line(points = {{210, 89}, {210, 81}}, color = {0, 0, 127}));
  connect(boundary1001.ambientPressure, firstOrder_p1001.y) annotation(
    Line(points = {{200, 44}, {210, 44}, {210, 60}}, color = {0, 0, 127}));
  connect(open_1002_b1001.y, rst_1002_b1001.y) annotation(
    Line(points = {{150, 16}, {150, 28}}, color = {0, 0, 127}));
  connect(rst_1001_1002.flowPort_a, rst_1002_b1001.flowPort_b) annotation(
    Line(points = {{54, 38}, {140, 38}}, color = {255, 0, 0}));
  connect(rst_1002_b1001.flowPort_a, boundary1001.flowPort) annotation(
    Line(points = {{160, 38}, {180, 38}}, color = {255, 0, 0}));
  connect(ramp_p2000.y, firstOrder_p2000.u) annotation(
    Line(points = {{-248, -32}, {-248, -40}}, color = {0, 0, 127}));
  connect(firstOrder_p2000.y, boundary2000.ambientPressure) annotation(
    Line(points = {{-248, -62}, {-248, -78}, {-238, -78}}, color = {0, 0, 127}));
  connect(boundary2000.flowPort, rst_b2000_2000.flowPort_b) annotation(
    Line(points = {{-218, -84}, {-180, -84}}, color = {255, 0, 0}));
  connect(rst_b2000_2000.flowPort_a, rst_b2000_2001.flowPort_b) annotation(
    Line(points = {{-160, -84}, {-88, -84}}, color = {255, 0, 0}));
  connect(rst_b2000_2001.flowPort_a, rst_b2001_2002.flowPort_b) annotation(
    Line(points = {{-68, -84}, {32, -84}}, color = {255, 0, 0}));
  connect(rst_b2001_2002.flowPort_a, rst_2002_b2001.flowPort_b) annotation(
    Line(points = {{52, -84}, {140, -84}}, color = {255, 0, 0}));
  connect(ramp_p2001.y, firstOrder_p2001.u) annotation(
    Line(points = {{210, -32}, {210, -40}}, color = {0, 0, 127}));
  connect(boundary2001.ambientPressure, firstOrder_p2001.y) annotation(
    Line(points = {{200, -78}, {210, -78}, {210, -62}}, color = {0, 0, 127}));
  connect(rst_2002_b2001.flowPort_a, boundary2001.flowPort) annotation(
    Line(points = {{160, -84}, {180, -84}}, color = {255, 0, 0}));
  connect(open_b2000_2000.y, rst_b2000_2000.y) annotation(
    Line(points = {{-170, -104}, {-170, -94}}, color = {0, 0, 127}));
  connect(open_2000_2001.y, rst_b2000_2001.y) annotation(
    Line(points = {{-78, -104}, {-78, -94}}, color = {0, 0, 127}));
  connect(open_2001_2002.y, rst_b2001_2002.y) annotation(
    Line(points = {{42, -104}, {42, -94}}, color = {0, 0, 127}));
  connect(open_2002_b2001.y, rst_2002_b2001.y) annotation(
    Line(points = {{150, -105}, {150, -94}}, color = {0, 0, 127}));
  connect(open_1000_2000.y, rst_b1000_2000.y) annotation(
    Line(points = {{-136, -40}, {-126, -40}}, color = {0, 0, 127}));
  connect(rst_b0_1000.flowPort_a, rst_b1000_2000.flowPort_b) annotation(
    Line(points = {{-116, 68}, {-116, -30}}, color = {255, 0, 0}));
  connect(rst_b1000_2000.flowPort_a, rst_b2000_2001.flowPort_b) annotation(
    Line(points = {{-116, -50}, {-116, -84}, {-88, -84}}, color = {255, 0, 0}));
  connect(open_1001_2001.y, rst_1001_2001.y) annotation(
    Line(points = {{-16, -40}, {-6, -40}}, color = {0, 0, 127}));
  connect(rst_b1_1001.flowPort_a, rst_1001_2001.flowPort_b) annotation(
    Line(points = {{4, 68}, {4, -30}}, color = {255, 0, 0}));
  connect(rst_1001_2001.flowPort_a, rst_b2001_2002.flowPort_b) annotation(
    Line(points = {{4, -50}, {4, -84}, {32, -84}}, color = {255, 0, 0}));
  connect(rst_b2_1002.flowPort_a, rst_1002_2002.flowPort_b) annotation(
    Line(points = {{114, 68}, {114, -30}}, color = {255, 0, 0}));
  connect(open_1002_2002.y, rst_1002_2002.y) annotation(
    Line(points = {{94, -40}, {104, -40}}, color = {0, 0, 127}));
  connect(rst_1002_2002.flowPort_a, rst_2002_b2001.flowPort_b) annotation(
    Line(points = {{114, -50}, {114, -84}, {140, -84}}, color = {255, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-300, -260}, {300, 260}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.1),
  Icon(coordinateSystem(extent = {{-300, -260}, {300, 260}})));
end FluidNW_ex01_v001_FluidHeatFlow;
