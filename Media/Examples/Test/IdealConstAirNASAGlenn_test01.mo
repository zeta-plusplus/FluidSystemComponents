within FluidSystemComponents.Media.Examples.Test;

model IdealConstAirNASAGlenn_test01
  extends Modelica.Icons.Example;
  //-----
  replaceable package gas = FluidSystemComponents.Media.SingleGas.IdealConstAirNASAGlennModel;
  //-----
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = gas, use_p_in = true, use_T_in = true, nPorts = 1) annotation(
    Placement(transformation(origin = {-30, -20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = gas, use_portsData = false, V = 1, nPorts = 6, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState) annotation(
    Placement(transformation(origin = {12, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(nPorts = 1, m_flow = -1, redeclare package Medium = gas) annotation(
    Placement(transformation(origin = {76, -20}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_T(height = 600, duration = 5, offset = 288.15, startTime = 5) annotation(
    Placement(transformation(origin = {-70, -36}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_p(duration = 5, height = 900*1000, offset = 100*1000, startTime = 15) annotation(
    Placement(transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}})));
  Sensor.SpecificHeatCapacity specificHeatCapacity(redeclare package Medium = gas) annotation(
    Placement(transformation(origin = {21, 17}, extent = {{-7, -7}, {7, 7}})));
  inner Modelica.Fluid.System system(p_start = 100*1000, T_start = 288.15) annotation(
    Placement(transformation(origin = {-84, 84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = gas) annotation(
    Placement(transformation(origin = {15, 35}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Fluid.Sensors.SpecificEntropy specificEntropy(redeclare package Medium = gas) annotation(
    Placement(transformation(origin = {6, 45}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Fluid.Sensors.Density density(redeclare package Medium = gas)  annotation(
    Placement(transformation(origin = {1, 25}, extent = {{-7, -7}, {7, 7}})));
equation
  connect(boundary.ports[1], volume.ports[1]) annotation(
    Line(points = {{-20, -20}, {12, -20}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], volume.ports[2]) annotation(
    Line(points = {{66, -20}, {12, -20}}, color = {0, 127, 255}));
  connect(ramp_T.y, boundary.T_in) annotation(
    Line(points = {{-59, -36}, {-49, -36}, {-49, -16}, {-42, -16}}, color = {0, 0, 127}));
  connect(ramp_p.y, boundary.p_in) annotation(
    Line(points = {{-59, 10}, {-55, 10}, {-55, -12}, {-42, -12}}, color = {0, 0, 127}));
  connect(volume.ports[3], specificHeatCapacity.port) annotation(
    Line(points = {{12, -20}, {21, -20}, {21, 10}}, color = {0, 127, 255}));
  connect(volume.ports[4], specificEnthalpy.port) annotation(
    Line(points = {{12, -20}, {15, -20}, {15, 28}}, color = {0, 127, 255}));
  connect(specificEntropy.port, volume.ports[5]) annotation(
    Line(points = {{6, 38}, {6, -20}, {12, -20}}, color = {0, 127, 255}));
  connect(density.port, volume.ports[6]) annotation(
    Line(points = {{1, 18}, {1, -20}, {12, -20}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    Diagram);
end IdealConstAirNASAGlenn_test01;
