within FluidSystemComponents.Media.Examples.Test;

model HydrogenCoolProp_test02
  extends Modelica.Icons.Example;
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-72, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = FluidSystemComponents.Media.HydrogenCoolProp, T_start = -30 + 273.15, V = 0.1, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {0, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = FluidSystemComponents.Media.HydrogenCoolProp, diameter = 0.05, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-24, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe staticPipe(redeclare package Medium = FluidSystemComponents.Media.HydrogenCoolProp, diameter = 0.05, length = 1) annotation(
    Placement(visible = true, transformation(origin = {24, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = FluidSystemComponents.Media.HydrogenCoolProp, nPorts = 1, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-52, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = FluidSystemComponents.Media.HydrogenCoolProp, T = -30 + 273.15, nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {70, 16}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = FluidSystemComponents.Media.HydrogenCoolProp, T_start = -30 + 273.15, V = 0.1, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {46, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p(duration = 1, height = 1000*1000, offset = 100*1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-88, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T(duration = 1, height = 0, offset = -30 + 273.15, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-88, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(boundary.ports[1], pipe.port_a) annotation(
    Line(points = {{-42, 16}, {-34, 16}}, color = {0, 127, 255}));
  connect(pipe.port_b, volume.ports[1]) annotation(
    Line(points = {{-14, 16}, {0, 16}}, color = {0, 127, 255}));
  connect(volume.ports[2], staticPipe.port_a) annotation(
    Line(points = {{0, 16}, {14, 16}}, color = {0, 127, 255}));
  connect(staticPipe.port_b, volume1.ports[1]) annotation(
    Line(points = {{34, 16}, {46, 16}}, color = {0, 127, 255}));
  connect(volume1.ports[2], boundary1.ports[1]) annotation(
    Line(points = {{46, 16}, {60, 16}}, color = {0, 127, 255}));
  connect(ramp_p.y, boundary.p_in) annotation(
    Line(points = {{-76, 24}, {-64, 24}}, color = {0, 0, 127}));
  connect(ramp_T.y, boundary.T_in) annotation(
    Line(points = {{-76, -6}, {-70, -6}, {-70, 20}, {-64, 20}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-6, Interval = 0.01));
end HydrogenCoolProp_test02;
