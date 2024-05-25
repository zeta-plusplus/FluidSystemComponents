within FluidSystemComponents.HeatTransfer.Components.SubComponents.Examples.Test;

model effHX_NTU_ShellTube_1Shell_test01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Ramp ramp_NTU(height = 6.9, duration = 1, offset = 0.1, startTime = 1)  annotation(
    Placement(transformation(origin = {-64, 32}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_ratioDmCp(k = 1)  annotation(
    Placement(transformation(origin = {-64, -12}, extent = {{-10, -10}, {10, 10}})));
  effHX_NTU_ShellTube_1Shell block_effHX annotation(
    Placement(transformation(origin = {-18, 28}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ramp_NTU.y, block_effHX.u_NTU) annotation(
    Line(points = {{-52, 32}, {-28, 32}}, color = {0, 0, 127}));
  connect(const_ratioDmCp.y, block_effHX.u_ratioDmCp) annotation(
    Line(points = {{-52, -12}, {-48, -12}, {-48, 24}, {-28, 24}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02));
end effHX_NTU_ShellTube_1Shell_test01;
