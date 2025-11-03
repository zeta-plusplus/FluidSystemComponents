within FluidSystemComponents.HeatTransfer.Components;

model HX_CrossFlow_BothUnmixed_NTU00
  extends HeatTransfer.BaseClasses.HX_Base_effHX;
  /********************************************************
                        imports
                  ********************************************************/
  import Modelica.Constants;
  import units = Modelica.Units.SI;
  import unitsNonSI = Modelica.Units.NonSI;
  import unitConversions = Modelica.Units.Conversions;
  /********************************************************
                                Declaration
    ********************************************************/
  //********** Parameters **********
  parameter Types.Switches.switchHowToDetVar swDetermine_eff = Types.Switches.switchHowToDetVar.asCalculated "switch how to determine effHX" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter Types.Switches.switchHowToDetVar swDetermine_A = Types.Switches.switchHowToDetVar.param "switch how to determine A, representative area of heat transfer" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter Types.Switches.switchHowToDetVar swDetermine_Uoa = Types.Switches.switchHowToDetVar.param "switch how to determine Uoa, representative overall heat transfer coefficient" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter units.Area A_par = 0.1 "representative heat transfer area";
  parameter units.CoefficientOfHeatTransfer Uoa_par = 200.0 "representative overall heat transfer coefficient";
  parameter units.MacroscopicCrossSection AqVol_par = 1500 "m2/m3";
  parameter units.Density rho_par = 2500 "kg/m3";
  parameter Real effHX_par = 0.8 "heat exchanger effectiveness";
  //********** Internal variables/objects **********
  units.Area A;
  units.CoefficientOfHeatTransfer Uoa;
  units.MacroscopicCrossSection AqVol;
  units.Density rho;
  units.Volume Vol;
  units.Mass m;
  SubComponents.effHX_NTU_Cross_BothUnmixed block_effHX annotation(
    Placement(transformation(origin = {14, 18}, extent = {{-10, -10}, {10, 10}})));
  SubComponents.calcNTU calcNTU annotation(
    Placement(transformation(origin = {-28, 22}, extent = {{-10, -10}, {10, 10}})));
equation
//----------
  if (swDetermine_A == Types.Switches.switchHowToDetVar.param) then
    A = A_par;
  end if;
  if (swDetermine_Uoa == Types.Switches.switchHowToDetVar.param) then
    Uoa = Uoa_par;
  end if;
  if (swDetermine_eff == Types.Switches.switchHowToDetVar.param) then
    effHX = effHX_par;
  end if;
  AqVol = AqVol_par;
  rho = rho_par;
//----------
  calcNTU.u_A = A;
  calcNTU.u_U = Uoa;
  calcNTU.u_dmCpMin = dmCpMin;
  block_effHX.u_ratioDmCp = ratioDmCp;
  effHX = block_effHX.y_effHX;
//-------------------------
  if (flagHotSide == 1) then
    Q_flow1 = -1.0*Q_flow;
    Q_flow2 = Q_flow;
  elseif (flagHotSide == 2) then
    Q_flow1 = Q_flow;
    Q_flow2 = -1.0*Q_flow;
  else
    Q_flow1 = 0.0;
    Q_flow2 = 0.0;
  end if;
  connect(calcNTU.y_NTU, block_effHX.u_NTU) annotation(
    Line(points = {{-16, 22}, {4, 22}}, color = {0, 0, 127}));
//-------------------------
  Vol = A/AqVol;
  m = Vol*rho;
  annotation(
    defaultComponentName = "HX",
    Documentation(info = "<html>

</html>"),
  Icon(graphics = {Text(origin = {0, -126}, extent = {{-140, 18}, {140, -2}}, textString = "%name"), Rectangle( fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, extent = {{-80, 60}, {80, -60}}), Line(origin = {0, 20.79}, points = {{-100, -20.7929}, {-80.0002, 19.2071}, {79.9998, 19.2071}, {100, -20.7929}}, color = {170, 0, 0}, thickness = 2), Line(origin = {0, 40.79}, points = {{-100, -40.7929}, {-80.0002, 19.2071}, {79.9998, 19.2071}, {100, -40.7929}}, color = {170, 0, 0}, thickness = 2), Line(origin = {0, 0.79}, points = {{-100, -0.7929}, {-80.0002, 19.2071}, {79.9998, 19.2071}, {100, -0.7929}}, color = {170, 0, 0}, thickness = 2), Line(origin = {0, -19.21}, points = {{-100, 19.2071}, {-80.0002, 19.2071}, {79.9998, 19.2071}, {100, 19.2071}}, color = {170, 0, 0}, thickness = 2), Line(origin = {0, -39.21}, points = {{-100, 39.2071}, {-80.0002, 19.2071}, {79.9998, 19.2071}, {100, 39.2071}}, color = {170, 0, 0}, thickness = 2), Line(origin = {0, -59.21}, points = {{-100, 59.2071}, {-80.0002, 19.2071}, {79.9998, 19.2071}, {100, 59.2071}}, color = {170, 0, 0}, thickness = 2), Line(origin = {0, -79.21}, points = {{-100, 79.2071}, {-80.0002, 19.2071}, {79.9998, 19.2071}, {100, 79.2071}}, color = {170, 0, 0}, thickness = 2), Line(origin = {-120, 40}, points = {{-20, 40}, {-20, -40}, {22, -40}}, color = {255, 170, 127}, thickness = 10), Line(origin = {-138.91, 50.94}, points = {{-1, 15}, {-1, -7}}, thickness = 2, arrow = {Arrow.Filled, Arrow.Filled}, arrowSize = 5), Line(origin = {136, 48}, points = {{-36, -48}, {4, -48}, {4, 32}}, color = {255, 170, 127}, thickness = 10), Line(origin = {141.09, 30.94}, points = {{-1, 15}, {-1, 35}}, thickness = 2, arrow = {Arrow.Filled, Arrow.Filled}, arrowSize = 5), Line(origin = {-39.89, 0}, points = {{39.8937, -80}, {-40.1063, -60}, {-40.1063, 60}, {39.8937, 80}}, color = {85, 0, 255}, thickness = 3), Line(origin = {-19.89, 0}, points = {{19.8937, -80}, {-40.1063, -60}, {-40.1063, 60}, {19.8937, 80}}, color = {85, 0, 255}, thickness = 3), Line(origin = {0.11, 0}, points = {{-0.1063, -80}, {-40.1063, -60}, {-40.1063, 60}, {-0.1063, 80}}, color = {85, 0, 255}, thickness = 3), Line(origin = {20.11, 0}, points = {{-20.1063, -80}, {-40.1063, -60}, {-40.1063, 60}, {-20.1063, 80}}, color = {85, 0, 255}, thickness = 3), Line(origin = {40.11, 0}, points = {{-40.1063, -80}, {-40.1063, -60}, {-40.1063, 60}, {-40.1063, 80}}, color = {85, 0, 255}, thickness = 3), Line(origin = {60.11, 0}, points = {{-60.1063, -80}, {-40.1063, -60}, {-40.1063, 60}, {-60.1063, 80}}, color = {85, 0, 255}, thickness = 3), Line(origin = {-72, -14}, points = {{-68, -66}, {72, -66}}, color = {0, 170, 255}, thickness = 10), Line(origin = {-126.91, -95.06}, points = {{-1, 15}, {21, 15}}, thickness = 2, arrow = {Arrow.Filled, Arrow.Filled}, arrowSize = 5), Line(origin = {80.11, 0}, points = {{-80.1063, -80}, {-40.1063, -60}, {-40.1063, 60}, {-80.1063, 80}}, color = {85, 0, 255}, thickness = 3), Line(origin = {120.11, 0}, points = {{-120.106, -80}, {-40.1063, -60}, {-40.1063, 60}, {-120.106, 80}}, color = {85, 0, 255}, thickness = 3), Line(origin = {100.11, 0}, points = {{-100.106, -80}, {-40.1063, -60}, {-40.1063, 60}, {-100.106, 80}}, color = {85, 0, 255}, thickness = 3), Line(origin = {106, 132}, points = {{-106, -52}, {10, -52}, {10, -200}, {34, -214}}, color = {0, 170, 255}, thickness = 10), Line(origin = {12, 72}, points = {{-12, -8}, {-12, 8}, {12, 8}}, thickness = 3, arrow = {Arrow.Filled, Arrow.Filled}, arrowSize = 6), Line(origin = {109.09, -89.06}, points = {{5, 23}, {21, 15}}, thickness = 2, arrow = {Arrow.Filled, Arrow.Filled}, arrowSize = 5), Line(origin = {-9, -72}, points = {{-9, -8}, {9, -8}, {9, 8}}, thickness = 3, arrow = {Arrow.Filled, Arrow.Filled}, arrowSize = 6)}, coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "",
  Diagram(graphics));


end HX_CrossFlow_BothUnmixed_NTU00;