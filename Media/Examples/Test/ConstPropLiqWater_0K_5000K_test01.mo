within FluidSystemComponents.Media.Examples.Test;

model ConstPropLiqWater_0K_5000K_test01
  extends Modelica.Icons.Example;
  //-----
  replaceable package liquid1 = FluidSystemComponents.Media.Liquid.ConstantPropertyLiquidWater_0K_5000K;
  //-----
  Modelica.Blocks.Sources.Ramp ramp_T(duration = 5, height = 4000, offset = 10, startTime = 5) annotation(
    Placement(transformation(origin = {-76, -16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_p(duration = 5, height = 0, offset = 100*1000, startTime = 15) annotation(
    Placement(transformation(origin = {-76, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, use_p_in = true, use_T_in = true, nPorts = 1)  annotation(
    Placement(transformation(origin = {-30, 2}, extent = {{-10, -10}, {10, 10}})));

  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = liquid1, use_portsData = false, V = 1, nPorts = 6, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState) annotation(
    Placement(transformation(origin = {14, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(nPorts = 1, m_flow = -1, redeclare package Medium = liquid1) annotation(
    Placement(transformation(origin = {64, 2}, extent = {{10, -10}, {-10, 10}})));
  
  FluidSystemComponents.Sensor.SpecificHeatCapacity specificHeatCapacity(redeclare package Medium = liquid1) annotation(
    Placement(transformation(origin = {36, 37}, extent = {{-7, -7}, {7, 7}})));
  
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = liquid1) annotation(
    Placement(transformation(origin = {26, 55}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Fluid.Sensors.SpecificEntropy specificEntropy(redeclare package Medium = liquid1) annotation(
    Placement(transformation(origin = {2, 69}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Fluid.Sensors.Density density(redeclare package Medium = liquid1)  annotation(
    Placement(transformation(origin = {-8, 45}, extent = {{-7, -7}, {7, 7}})));
  inner Modelica.Fluid.System system(T_start = 288.15, p_start = 100*1000) annotation(
    Placement(transformation(origin = {-80, 84}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ramp_p.y, boundary.p_in) annotation(
    Line(points = {{-64, 30}, {-58, 30}, {-58, 10}, {-42, 10}}, color = {0, 0, 127}));
  connect(ramp_T.y, boundary.T_in) annotation(
    Line(points = {{-64, -16}, {-60, -16}, {-60, 6}, {-42, 6}}, color = {0, 0, 127}));
  connect(boundary.ports[1], volume.ports[1]) annotation(
    Line(points = {{-20, 2}, {14, 2}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], volume.ports[2]) annotation(
    Line(points = {{54, 2}, {14, 2}}, color = {0, 127, 255}));
  connect(density.port, volume.ports[3]) annotation(
    Line(points = {{-8, 38}, {-8, 2}, {14, 2}}, color = {0, 127, 255}));
  connect(specificEntropy.port, volume.ports[4]) annotation(
    Line(points = {{2, 62}, {2, 2}, {14, 2}}, color = {0, 127, 255}));
  connect(specificEnthalpy.port, volume.ports[5]) annotation(
    Line(points = {{26, 48}, {26, 2}, {14, 2}}, color = {0, 127, 255}));
  connect(specificHeatCapacity.port, volume.ports[6]) annotation(
    Line(points = {{36, 30}, {36, 2}, {14, 2}}, color = {0, 127, 255}));
annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1));
end ConstPropLiqWater_0K_5000K_test01;