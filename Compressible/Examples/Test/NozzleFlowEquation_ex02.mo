within FluidSystemComponents.Compressible.Examples.Test;

model NozzleFlowEquation_ex02
  extends Modelica.Icons.Example;
  //---------------
  package gas1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = gas1
  //---------------
  parameter Real pMinVis = 10;
  parameter Real pMaxVis = 200;
  //---------------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_H_1(redeclare package Medium = gas1, T = 700, p = 2*100*1000, use_p_in = true, nPorts = 1) annotation(
    Placement(transformation(origin = {-62, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT BC_L_1(redeclare package Medium = gas1, T = 600, p = 100*1000, nPorts = 1) annotation(
    Placement(transformation(origin = {62, 10}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_pH_1(duration = 1, height = -0.1*100*1000, offset = 1.1*100*1000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-90, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT BC_L_2(redeclare package Medium = gas1, T = 600, nPorts = 1, p = 100*1000, use_p_in = true) annotation(
    Placement(transformation(origin = {62, -30}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT BC_H_2(redeclare package Medium = gas1, T = 700, nPorts = 1, p = 100*1000, use_p_in = false) annotation(
    Placement(transformation(origin = {-62, -30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_pL_2(duration = 1, height = -0.7*100*1000, offset = 0.9*100*1000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {90, -22}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Compressible.Components.NozzleFlowEquation01 flowPath(redeclare package Medium = gas1, AmechTot_par = 0.001) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Compressible.Components.NozzleFlowEquation01 flowPath1(redeclare package Medium = gas1, AmechTot_par = 0.001) annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Components.ClosedVolumeColorP Vol(redeclare package Medium = gas1, V = 0.01, nPorts = 2, valMax = pMaxVis, valMin = pMinVis) annotation(
    Placement(transformation(origin = {-36, 20}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP Vol1(redeclare package Medium = gas1, V = 0.01, nPorts = 2, valMax = pMaxVis, valMin = pMinVis) annotation(
    Placement(transformation(origin = {36, 20}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP Vol2(redeclare package Medium = gas1, V = 0.01, nPorts = 2, valMax = pMaxVis, valMin = pMinVis) annotation(
    Placement(transformation(origin = {-36, -20}, extent = {{-10, -10}, {10, 10}})));
  CommonAnyFluid.Components.ClosedVolumeColorP Vol3(redeclare package Medium = gas1, V = 0.01, nPorts = 2, valMax = pMaxVis, valMin = pMinVis) annotation(
    Placement(transformation(origin = {36, -20}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ramp_pH_1.y, BC_H_1.p_in) annotation(
    Line(points = {{-79, 18}, {-74, 18}}, color = {0, 0, 127}));
  connect(BC_L_2.p_in, ramp_pL_2.y) annotation(
    Line(points = {{74, -22}, {79, -22}}, color = {0, 0, 127}));
  connect(BC_H_1.ports[1], Vol.ports[1]) annotation(
    Line(points = {{-52, 10}, {-36, 10}}, color = {0, 127, 255}));
  connect(Vol.ports[2], flowPath.port_1) annotation(
    Line(points = {{-36, 10}, {-20, 10}}, color = {0, 127, 255}));
  connect(flowPath.port_2, Vol1.ports[1]) annotation(
    Line(points = {{20, 10}, {36, 10}}, color = {0, 127, 255}));
  connect(BC_L_1.ports[1], Vol1.ports[2]) annotation(
    Line(points = {{52, 10}, {36, 10}}, color = {0, 127, 255}));
  connect(BC_H_2.ports[1], Vol2.ports[1]) annotation(
    Line(points = {{-52, -30}, {-36, -30}}, color = {0, 127, 255}));
  connect(Vol2.ports[2], flowPath1.port_1) annotation(
    Line(points = {{-36, -30}, {-20, -30}}, color = {0, 127, 255}));
  connect(flowPath1.port_2, Vol3.ports[1]) annotation(
    Line(points = {{20, -30}, {36, -30}}, color = {0, 127, 255}));
  connect(Vol3.ports[2], BC_L_2.ports[1]) annotation(
    Line(points = {{36, -30}, {52, -30}}, color = {0, 127, 255}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.01));
end NozzleFlowEquation_ex02;
