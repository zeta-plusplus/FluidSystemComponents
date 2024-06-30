within FluidSystemComponents.InteractiveSimulation.System;

block getCPUclock
  "CPU time since commence of simulation"
  parameter Integer sigDigits=4;
  
  import units= Modelica.Units.SI;
  
  discrete units.Time tCPUsimBegin;
  units.Time tCPUnow;
  
  
  Modelica.Blocks.Interfaces.RealOutput y_CPUtime(quantity = "Time", unit = "s", displayUnit = "s") "[s]" annotation(
    Placement(transformation(origin = {110, -2}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));

//***************************************************************************
initial algorithm
  
  tCPUsimBegin:= Modelica_DeviceDrivers.OperatingSystem.clock(dummy=0.0) /1000.0;
  
algorithm
  tCPUnow:= Modelica_DeviceDrivers.OperatingSystem.clock(dummy=0.0) /1000.0;
  
  //-----------------------------------
  when (time==0.0)then
    tCPUsimBegin:= tCPUnow;
  end when;
  //-----------------------------------
  
  y_CPUtime:= tCPUnow-tCPUsimBegin;
  
  annotation(
    defaultComponentName = "CPUtime",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-1, 34}, extent = {{-95, 22}, {95, -22}}, textString = "CPU time"), Text(origin = {0, -27}, extent = {{-80, 13}, {80, -13}}, textString = DynamicSelect("0.0", String(y_CPUtime, sigDigits, 0, true))), Text(origin = {65, -46}, extent = {{-19, 10}, {19, -10}}, textString = "[s]")}));


end getCPUclock;
