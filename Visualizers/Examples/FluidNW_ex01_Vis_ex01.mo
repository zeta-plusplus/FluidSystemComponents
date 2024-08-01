within FluidSystemComponents.Visualizers.Examples;

model FluidNW_ex01_Vis_ex01
  extends Modelica.Icons.Example;
  //--------------------
  import units = Modelica.Units.SI;
  //--------------------
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //--------------------
  parameter units.Pressure pContourMin = 100*1000 "";
  parameter units.Pressure pContourMax = 1000*1000 "";
  parameter units.Pressure p_par = 100*1000;
  parameter units.Temperature T_par = 288.15;
  parameter units.MassFlowRate m_flow_Min = 0.0001;
  parameter units.MassFlowRate m_flow_Max = 0.1;
  parameter Real arrowMin = 0.01;
  parameter Real arrowMax = 30;
  //--------------------
  //Modelica.Units.SI.MassFlowRate m_flow;
  VolumeVisP_RefArrAndKey00 Vol_pVis_1_1(nPorts = 3, redeclare package Medium = fluid1, varVector = combiTimeTable1.y, stringVector = combiTimeTable1.y_column, keyString = "vol_1_1.medium.p", pContourMin = pContourMin, pContourMax = pContourMax) annotation(
    Placement(transformation(origin = {-38, -10}, extent = {{-10, -10}, {10, 10}})));
  Utilities.CombiTimeTableAll00 combiTimeTable1(nColMax = 849, strFileName = "modelica://FluidSystemComponents/Visualizers/Examples/ex_FluidNW_ex01_v001_res.csv", timeEvents = Modelica.Blocks.Types.TimeEvents.NoTimeEvents) annotation(
    Placement(transformation(origin = {-62, 80}, extent = {{-10, -10}, {10, 10}})));
  VolumeVisP_RefArrAndKey00 Vol_pVis_1_2(redeclare package Medium = fluid1, keyString = "vol_1_2.medium.p", nPorts = 3, pContourMax = pContourMax, pContourMin = pContourMin, stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y) annotation(
    Placement(transformation(origin = {4, -10}, extent = {{-10, -10}, {10, 10}})));
  VolumeVisP_RefArrAndKey00 Vol_pVis_1_3(redeclare package Medium = fluid1, keyString = "vol_1_3.medium.p", nPorts = 3, pContourMax = pContourMax, pContourMin = pContourMin, stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y) annotation(
    Placement(transformation(origin = {46, -10}, extent = {{-10, -10}, {10, 10}})));
  VolumeVisP_RefArrAndKey00 Vol_pVis_1_0(redeclare package Medium = fluid1, keyString = "boundary_1_0.medium.p", nPorts = 1, pContourMax = pContourMax, pContourMin = pContourMin, stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y) annotation(
    Placement(transformation(origin = {-82, -10}, extent = {{-10, -10}, {10, 10}})));
  VolumeVisP_RefArrAndKey00 Vol_pVis_1_4(redeclare package Medium = fluid1, keyString = "boundary_1_4.medium.p", nPorts = 1, pContourMax = pContourMax, pContourMin = pContourMin, stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y) annotation(
    Placement(transformation(origin = {88, -10}, extent = {{-10, -10}, {10, 10}})));
  VolumeVisP_RefArrAndKey00 Vol_pVis_0_1(redeclare package Medium = fluid1, keyString = "boundary_0_1.medium.p", nPorts = 1, pContourMax = pContourMax, pContourMin = pContourMin, stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y) annotation(
    Placement(transformation(origin = {-38, 44}, extent = {{-10, -10}, {10, 10}})));
  VolumeVisP_RefArrAndKey00 Vol_pVis_0_2(redeclare package Medium = fluid1, keyString = "boundary_0_2.medium.p", nPorts = 1, pContourMax = pContourMax, pContourMin = pContourMin, stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y) annotation(
    Placement(transformation(origin = {4, 44}, extent = {{-10, -10}, {10, 10}})));
  VolumeVisP_RefArrAndKey00 Vol_pVis_0_3(redeclare package Medium = fluid1, keyString = "boundary_0_3.medium.p", nPorts = 1, pContourMax = pContourMax, pContourMin = pContourMin, stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y) annotation(
    Placement(transformation(origin = {46, 44}, extent = {{-10, -10}, {10, 10}})));
  MassFlowDisp_RefArrAndKey00 visMflow_1_0_to_1_1(keyString = "rst_1_0_to_1_1.m_flow", redeclare package Medium = fluid1, stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max, thickArrowMin = arrowMin, thickArrowMax = arrowMax) annotation(
    Placement(transformation(origin = {-60.3333, -14}, extent = {{-8.33333, -5}, {8.33333, 5}})));
  MassFlowDisp_RefArrAndKey00 visMflow_1_1_to_1_2(redeclare package Medium = fluid1, keyString = "rst_1_1_to_1_2.m_flow", stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max, thickArrowMin = arrowMin, thickArrowMax = arrowMax) annotation(
    Placement(transformation(origin = {-17, -14.4}, extent = {{-9, -5.4}, {9, 5.4}})));
  MassFlowDisp_RefArrAndKey00 VisMflow_1_2_to_1_3(redeclare package Medium = fluid1, keyString = "rst_1_2_to_1_3.m_flow", stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max, thickArrowMin = arrowMin, thickArrowMax = arrowMax) annotation(
    Placement(transformation(origin = {25, -14.4}, extent = {{-9, -5.4}, {9, 5.4}})));
  MassFlowDisp_RefArrAndKey00 VisMflow_1_3_to_1_4(redeclare package Medium = fluid1, keyString = "rst_1_3_to_1_4.m_flow", stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max, thickArrowMin = arrowMin, thickArrowMax = arrowMax) annotation(
    Placement(transformation(origin = {67, -14.4}, extent = {{-9, -5.4}, {9, 5.4}})));
  MassFlowDisp_RefArrAndKey00 VisMflow_0_1_to_1_1(redeclare package Medium = fluid1, keyString = "rst_0_1_to_1_1.m_flow", stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max, thickArrowMin = arrowMin, thickArrowMax = arrowMax) annotation(
    Placement(transformation(origin = {-38.3333, 20}, extent = {{-8.33333, -5}, {8.33333, 5}}, rotation = -90)));
  MassFlowDisp_RefArrAndKey00 VisMflow_0_2_to_1_2(redeclare package Medium = fluid1, keyString = "rst_0_2_to_1_2.m_flow", stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max, thickArrowMin = arrowMin, thickArrowMax = arrowMax) annotation(
    Placement(transformation(origin = {3.6667, 20}, extent = {{-8.33333, -5}, {8.33333, 5}}, rotation = -90)));
  MassFlowDisp_RefArrAndKey00 VisMflow_0_3_to_1_3(redeclare package Medium = fluid1, keyString = "rst_0_3_to_1_3.m_flow", stringVector = combiTimeTable1.y_column, varVector = combiTimeTable1.y, m_flow_Min = m_flow_Min, m_flow_Max = m_flow_Max, thickArrowMin = arrowMin, thickArrowMax = arrowMax) annotation(
    Placement(transformation(origin = {45.6667, 20}, extent = {{-8.33333, -5}, {8.33333, 5}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue dispTime(significantDigits = 3) annotation(
    Placement(transformation(origin = {-79, 52}, extent = {{-9, -6}, {9, 6}})));
equation
  dispTime.numberPort = time;
  connect(visMflow_1_0_to_1_1.port_b, Vol_pVis_1_1.ports[1]) annotation(
    Line(points = {{-52, -14}, {-38, -14}, {-38, -20}}, color = {0, 127, 255}));
  connect(visMflow_1_0_to_1_1.port_a, Vol_pVis_1_0.ports[1]) annotation(
    Line(points = {{-69, -14}, {-82, -14}, {-82, -20}}, color = {0, 127, 255}));
  connect(visMflow_1_1_to_1_2.port_a, Vol_pVis_1_1.ports[2]) annotation(
    Line(points = {{-26, -14}, {-38, -14}, {-38, -20}}, color = {0, 127, 255}));
  connect(visMflow_1_1_to_1_2.port_b, Vol_pVis_1_2.ports[1]) annotation(
    Line(points = {{-8, -14}, {4, -14}, {4, -20}}, color = {0, 127, 255}));
  connect(VisMflow_1_2_to_1_3.port_a, Vol_pVis_1_2.ports[2]) annotation(
    Line(points = {{16, -14}, {4, -14}, {4, -20}}, color = {0, 127, 255}));
  connect(VisMflow_1_2_to_1_3.port_b, Vol_pVis_1_3.ports[1]) annotation(
    Line(points = {{34, -14}, {46, -14}, {46, -20}}, color = {0, 127, 255}));
  connect(VisMflow_1_3_to_1_4.port_a, Vol_pVis_1_3.ports[2]) annotation(
    Line(points = {{58, -14}, {46, -14}, {46, -20}}, color = {0, 127, 255}));
  connect(VisMflow_1_3_to_1_4.port_b, Vol_pVis_1_4.ports[1]) annotation(
    Line(points = {{76, -14}, {88, -14}, {88, -20}}, color = {0, 127, 255}));
  connect(Vol_pVis_0_1.ports[1], VisMflow_0_1_to_1_1.port_a) annotation(
    Line(points = {{-38, 34.2}, {-38, 28.2}}, color = {0, 127, 255}));
  connect(VisMflow_0_1_to_1_1.port_b, Vol_pVis_1_1.ports[3]) annotation(
    Line(points = {{-38, 12}, {-38, -20}}, color = {0, 127, 255}));
  connect(VisMflow_0_2_to_1_2.port_a, Vol_pVis_0_2.ports[1]) annotation(
    Line(points = {{3.6667, 28.3333}, {3.6667, 34.3333}}, color = {0, 127, 255}));
  connect(VisMflow_0_2_to_1_2.port_b, Vol_pVis_1_2.ports[3]) annotation(
    Line(points = {{4, 12}, {4, -20}}, color = {0, 127, 255}));
  connect(Vol_pVis_0_3.ports[1], VisMflow_0_3_to_1_3.port_a) annotation(
    Line(points = {{46, 34}, {46, 28}}, color = {0, 127, 255}));
  connect(VisMflow_0_3_to_1_3.port_b, Vol_pVis_1_3.ports[3]) annotation(
    Line(points = {{46, 12}, {46, -20}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.1),
    Diagram(graphics = {Text(origin = {-90, 59}, extent = {{-8, 3}, {8, -3}}, textString = "time="), Text(origin = {-66, 52}, extent = {{-3, 3}, {3, -3}}, textString = "[s]"), Text(origin = {-65, 100}, extent = {{-31, 5}, {31, -5}}, textString = "Component 
to read CSV time data", horizontalAlignment = TextAlignment.Left)}, coordinateSystem(extent = {{-100, -60}, {100, 120}})));
end FluidNW_ex01_Vis_ex01;
