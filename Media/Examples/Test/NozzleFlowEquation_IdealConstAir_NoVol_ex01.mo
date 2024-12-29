within FluidSystemComponents.Media.Examples.Test;

model NozzleFlowEquation_IdealConstAir_NoVol_ex01
  extends Modelica.Icons.Example;
  //---------------
  package gas1 = Media.SingleGas.IdealConstAirNASAGlennModel;
  //redeclare package Medium = gas1
  //---------------
  parameter Real pMinVis = 10;
  parameter Real pMaxVis = 200;
  //---------------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_H_1(redeclare package Medium = gas1, T = 700, p = 2*100*1000, use_p_in = true, nPorts = 1) annotation(
    Placement(transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT BC_L_1(redeclare package Medium = gas1, T = 600, p = 100*1000, nPorts = 1) annotation(
    Placement(transformation(origin = {70, 10}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_pH_1(duration = 1, height = -0.1*100*1000, offset = 1.1*100*1000, startTime = 10) annotation(
    Placement(transformation(origin = {-95, 18}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Fluid.Sources.Boundary_pT BC_L_2(redeclare package Medium = gas1, T = 600, nPorts = 1, p = 100*1000, use_p_in = true) annotation(
    Placement(transformation(origin = {70, -44}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT BC_H_2(redeclare package Medium = gas1, T = 700, nPorts = 1, p = 100*1000, use_p_in = false) annotation(
    Placement(transformation(origin = {-70, -44}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_pL_2(duration = 1, height = -0.7*100*1000, offset = 0.9*100*1000, startTime = 10) annotation(
    Placement(transformation(origin = {95, -36}, extent = {{5, -5}, {-5, 5}})));
  Compressible.Components.NozzleFlowEquation03 flowPath(redeclare package Medium = gas1, AmechTot_par = 0.001) annotation(
    Placement(transformation(origin = {0, 10}, extent = {{-20, -20}, {20, 20}})));
  Compressible.Components.NozzleFlowEquation03 flowPath1(redeclare package Medium = gas1, AmechTot_par = 0.001) annotation(
    Placement(transformation(origin = {0, -44}, extent = {{-20, -20}, {20, 20}})));
equation
  connect(ramp_pH_1.y, BC_H_1.p_in) annotation(
    Line(points = {{-89.5, 18}, {-82, 18}}, color = {0, 0, 127}));
  connect(BC_L_2.p_in, ramp_pL_2.y) annotation(
    Line(points = {{82, -36}, {89.5, -36}}, color = {0, 0, 127}));
  connect(BC_H_1.ports[1], flowPath.port_a) annotation(
    Line(points = {{-60, 10}, {-20, 10}}, color = {0, 127, 255}));
  connect(BC_H_2.ports[1], flowPath1.port_a) annotation(
    Line(points = {{-60, -44}, {-20, -44}}, color = {0, 127, 255}));
  connect(flowPath1.port_b, BC_L_2.ports[1]) annotation(
    Line(points = {{20, -44}, {60, -44}}, color = {0, 127, 255}));
  connect(flowPath.port_b, BC_L_1.ports[1]) annotation(
    Line(points = {{20, 10}, {60, 10}}, color = {0, 127, 255}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.01));
end NozzleFlowEquation_IdealConstAir_NoVol_ex01;
