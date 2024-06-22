within FluidSystemComponents.Visualizers.Examples;

model VolumeVisP_RefArrAndKey00_ex01
  extends Modelica.Icons.Example;
  //--------------------
  import units=Modelica.Units.SI;
  //--------------------
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //--------------------
  parameter Modelica.Units.SI.Pressure pContourMin = 100*1000 "";
  parameter Modelica.Units.SI.Pressure pContourMax = 1000*1000 "";
  parameter Modelica.Units.SI.Pressure p_par=100*1000;
  parameter Modelica.Units.SI.Temperature T_par= 288.15;
  //--------------------
  Modelica.Units.SI.MassFlowRate m_flow;
  VolumeVisP_RefArrAndKey00 Vol_pVis_1_1(nPorts = 1, redeclare package Medium = fluid1, varVector = combiTimeTable1.y, stringVector = combiTimeTable1.y_column, keyString = "vol_1_1.medium.p", pContourMin = pContourMin, pContourMax = pContourMax)  annotation(
    Placement(transformation(origin = {-20, -10}, extent = {{-10, -10}, {10, 10}})));
  Utilities.CombiTimeTableAll00 combiTimeTable(nColMax = 179, strFileName = "modelica://FluidSystemComponents/Visualizers/Examples/exampleTimeTable02.csv", timeEvents = Modelica.Blocks.Types.TimeEvents.NoTimeEvents) annotation(
    Placement(transformation(origin = {-70, 16}, extent = {{-10, -10}, {10, 10}})));
  Utilities.CombiTimeTableAll00 combiTimeTable1(nColMax = 179, strFileName = "modelica://FluidSystemComponents/Visualizers/Examples/ex_FluidNW_ex01_v001_res.csv", timeEvents = Modelica.Blocks.Types.TimeEvents.NoTimeEvents) annotation(
    Placement(transformation(origin = {-60, 48}, extent = {{-10, -10}, {10, 10}})));
  VolumeVisP_RefArrAndKey00 Vol_pVis_1_2(redeclare package Medium = fluid1, keyString = "vol_1_2.medium.p", nPorts = 1, pContourMax = pContourMax, pContourMin = pContourMin, stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y) annotation(
    Placement(transformation(origin = {14, -10}, extent = {{-10, -10}, {10, 10}})));
equation
  m_flow = 0.1*time;
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01));
end VolumeVisP_RefArrAndKey00_ex01;
