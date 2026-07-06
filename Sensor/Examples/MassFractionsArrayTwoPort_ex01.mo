within FluidSystemComponents.Sensor.Examples;

model MassFractionsArrayTwoPort_ex01
  extends Modelica.Icons.Example;
  
  //-----
  //package fluid1 = Modelica.Media.Air.DryAirNasa;
  package fluid1 = FluidSystemComponents.Media.Mixture_N2O2;
  //-----
  
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {-78, 78}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = FluidSystemComponents.Media.MixtureGas.Mixture_N2O2, p(displayUnit = "Pa") = 1.2, nPorts = 1)  annotation(
    Placement(transformation(origin = {-58, 30}, extent = {{-10, -10}, {10, 10}})));
  MassFractionsArrayTwoPort arrXi(redeclare package Medium = FluidSystemComponents.Media.MixtureGas.Mixture_N2O2)  annotation(
    Placement(transformation(origin = {-2, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = FluidSystemComponents.Media.MixtureGas.Mixture_N2O2, diameter = 0.05, zeta = 1)  annotation(
    Placement(transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = FluidSystemComponents.Media.MixtureGas.Mixture_N2O2, nPorts = 1)  annotation(
    Placement(transformation(origin = {34, 30}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
equation
  connect(boundary.ports[1], orifice.port_a) annotation(
    Line(points = {{-48, 30}, {-40, 30}}, color = {0, 127, 255}));
  connect(orifice.port_b, arrXi.port_a) annotation(
    Line(points = {{-20, 30}, {-12, 30}}, color = {0, 127, 255}));
  connect(arrXi.port_b, boundary1.ports[1]) annotation(
    Line(points = {{8, 30}, {24, 30}}, color = {0, 127, 255}));
end MassFractionsArrayTwoPort_ex01;