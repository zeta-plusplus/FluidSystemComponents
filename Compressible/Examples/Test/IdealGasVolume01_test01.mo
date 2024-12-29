within FluidSystemComponents.Compressible.Examples.Test;

model IdealGasVolume01_test01
  extends Modelica.Icons.Example;
  //-------------------------
  import units = Modelica.Units.SI;
  //-------------------------
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium= fluid1,
  //-------------------------
  Components.IdealGasVolume01 Vol(redeclare package Medium = fluid1)  annotation(
    Placement(transformation(origin = {-12, 16}, extent = {{-10, -10}, {10, 10}})));
equation

  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01));
end IdealGasVolume01_test01;
