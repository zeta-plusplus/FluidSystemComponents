within FluidSystemComponents.Media.Examples.Test;

model HydrogenCoolProp_test01
  extends Modelica.Icons.Example;
  inner Modelica.Fluid.System system(T_start (displayUnit = "K")= 20, p_start = 50*100*1000) annotation(
    Placement(visible = true, transformation(origin = {-72, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = FluidSystemComponents.Media.HydrogenCoolProp, V = 0.1, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {0, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.01));
end HydrogenCoolProp_test01;
