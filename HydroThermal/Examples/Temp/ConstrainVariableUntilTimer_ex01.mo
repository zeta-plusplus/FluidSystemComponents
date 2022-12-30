within FluidSystemComponents.HydroThermal.Examples.Temp;

model ConstrainVariableUntilTimer_ex01
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  // redeclare package Medium = liquid1
  //----------
  
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, use_p_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = liquid1, diameter = 0.05, zeta = 1)  annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 288.15, nPorts = 1, p = 101.325 * 1000, use_p_in = false) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {20, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariableUntilTimer Constraint annotation(
    Placement(visible = true, transformation(origin = {20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.ConstrainVariableAfterTimer Constraint1 annotation(
    Placement(visible = true, transformation(origin = {50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {20, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant const1(k = 2)  annotation(
    Placement(visible = true, transformation(origin = {50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(const1.y, Constraint1.u_targetValue) annotation(
    Line(points = {{50, -38}, {50, -38}, {50, -32}, {50, -32}}, color = {0, 0, 127}));
  connect(const.y, Constraint.u_targetValue) annotation(
    Line(points = {{20, -38}, {20, -38}, {20, -32}, {20, -32}}, color = {0, 0, 127}));
  connect(massFlowRate1.m_flow, Constraint.u_variable) annotation(
    Line(points = {{20, 0}, {20, 0}, {20, -8}, {20, -8}}, color = {0, 0, 127}));
  connect(massFlowRate2.m_flow, Constraint1.u_variable) annotation(
    Line(points = {{50, 0}, {50, 0}, {50, -8}, {50, -8}}, color = {0, 0, 127}));
  connect(massFlowRate2.port_b, boundary1.ports[1]) annotation(
    Line(points = {{60, 10}, {80, 10}, {80, 10}, {80, 10}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, massFlowRate2.port_a) annotation(
    Line(points = {{30, 10}, {40, 10}, {40, 10}, {40, 10}}, color = {0, 127, 255}));
  connect(orifice.port_b, massFlowRate1.port_a) annotation(
    Line(points = {{0, 10}, {10, 10}, {10, 10}, {10, 10}}, color = {0, 127, 255}));
  connect(VarBySolver.y_independent, boundary.p_in) annotation(
    Line(points = {{-79, 30}, {-75, 30}, {-75, 18}, {-63, 18}, {-63, 18}}, color = {0, 0, 127}));
  connect(boundary.ports[1], orifice.port_a) annotation(
    Line(points = {{-40, 10}, {-20, 10}, {-20, 10}, {-20, 10}}, color = {0, 127, 255}));
end ConstrainVariableUntilTimer_ex01;
