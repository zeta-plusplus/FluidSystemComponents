within FluidSystemComponents.Compressible.Examples.Tutorial;

model NozzleFlowEquation_varArea01_ex01
  extends Modelica.Icons.Example;
  //---------------
  package gas1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = gas1
  //---------------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_H_1(redeclare package Medium = gas1, T = 700, p = 2*100*1000, use_p_in = true, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_L_1(redeclare package Medium = gas1, T = 600, p = 100*1000, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pH_1(duration = 1, height = -0.7*100*1000, offset = 1.5*100*1000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-90, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Compressible.Components.NozzleFlowEquation_varArea01 restriction(redeclare package Medium = gas1) annotation(
    Placement(visible = true, transformation(origin = {-5, 10}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Amech(duration = 1, height = 1*10e-6, offset = 5*10e-6, startTime = 3) annotation(
    Placement(visible = true, transformation(origin = {-40, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_pH_1.y, BC_H_1.p_in) annotation(
    Line(points = {{-79, 18}, {-63, 18}}, color = {0, 0, 127}));
  connect(restriction.port_a, BC_H_1.ports[1]) annotation(
    Line(points = {{-20, 10}, {-40, 10}}, color = {0, 127, 255}));
  connect(restriction.port_b, BC_L_1.ports[1]) annotation(
    Line(points = {{10, 10}, {40, 10}}, color = {0, 127, 255}));
  connect(ramp_Amech.y, restriction.u_Amech) annotation(
    Line(points = {{-28, 46}, {-11, 46}, {-11, 26.5}}, color = {0, 0, 127}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.01),
  Diagram(coordinateSystem(extent = {{-100, -40}, {80, 100}})));
end NozzleFlowEquation_varArea01_ex01;
