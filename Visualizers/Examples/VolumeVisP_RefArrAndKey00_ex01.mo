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
    Placement(transformation(origin = {-38, -10}, extent = {{-10, -10}, {10, 10}})));
  Utilities.CombiTimeTableAll00 combiTimeTable(nColMax = 179, strFileName = "modelica://FluidSystemComponents/Visualizers/Examples/exampleTimeTable02.csv", timeEvents = Modelica.Blocks.Types.TimeEvents.NoTimeEvents) annotation(
    Placement(transformation(origin = {-32, 86}, extent = {{-10, -10}, {10, 10}})));
  Utilities.CombiTimeTableAll00 combiTimeTable1(nColMax = 849, strFileName = "modelica://FluidSystemComponents/Visualizers/Examples/ex_FluidNW_ex01_v001_res.csv", timeEvents = Modelica.Blocks.Types.TimeEvents.NoTimeEvents) annotation(
    Placement(transformation(origin = {-62, 76}, extent = {{-10, -10}, {10, 10}})));
  VolumeVisP_RefArrAndKey00 Vol_pVis_1_2(redeclare package Medium = fluid1, keyString = "vol_1_2.medium.p", nPorts = 1, pContourMax = pContourMax, pContourMin = pContourMin, stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y) annotation(
    Placement(transformation(origin = {4, -10}, extent = {{-10, -10}, {10, 10}})));
  VolumeVisP_RefArrAndKey00 Vol_pVis_1_3(redeclare package Medium = fluid1, keyString = "vol_1_3.medium.p", nPorts = 1, pContourMax = pContourMax, pContourMin = pContourMin, stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y) annotation(
    Placement(transformation(origin = {46, -10}, extent = {{-10, -10}, {10, 10}})));
  VolumeVisP_RefArrAndKey00 Vol_pVis_1_0(redeclare package Medium = fluid1, keyString = "boundary_1_0.medium.p", nPorts = 1, pContourMax = pContourMax, pContourMin = pContourMin, stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y) annotation(
    Placement(transformation(origin = {-80, -10}, extent = {{-10, -10}, {10, 10}})));
  VolumeVisP_RefArrAndKey00 Vol_pVis_1_4(redeclare package Medium = fluid1, keyString = "boundary_1_4.medium.p", nPorts = 1, pContourMax = pContourMax, pContourMin = pContourMin, stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y) annotation(
    Placement(transformation(origin = {88, -10}, extent = {{-10, -10}, {10, 10}})));
  VolumeVisP_RefArrAndKey00 Vol_pVis_0_1(redeclare package Medium = fluid1, keyString = "boundary_0_1.medium.p", nPorts = 1, pContourMax = pContourMax, pContourMin = pContourMin, stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y) annotation(
    Placement(transformation(origin = {-38, 30}, extent = {{-10, -10}, {10, 10}})));
  VolumeVisP_RefArrAndKey00 Vol_pVis_0_2(redeclare package Medium = fluid1, keyString = "boundary_0_2.medium.p", nPorts = 1, pContourMax = pContourMax, pContourMin = pContourMin, stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y) annotation(
    Placement(transformation(origin = {4, 30}, extent = {{-10, -10}, {10, 10}})));
  VolumeVisP_RefArrAndKey00 Vol_pVis_0_3(redeclare package Medium = fluid1, keyString = "boundary_0_3.medium.p", nPorts = 1, pContourMax = pContourMax, pContourMin = pContourMin, stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y) annotation(
    Placement(transformation(origin = {46, 30}, extent = {{-10, -10}, {10, 10}})));
equation
  m_flow = 0.1*time;
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.05));
end VolumeVisP_RefArrAndKey00_ex01;
