within FluidSystemComponents.HeatTransfer.Components;

model HX_CounterFlow_NTU00
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
  parameter FluidSystemComponents.Types.Switches.switchHowToDetVar swDetermine_eff= FluidSystemComponents.Types.Switches.switchHowToDetVar.asCalculated "switch how to determine effHX" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true); 
  
  parameter FluidSystemComponents.Types.Switches.switchHowToDetVar swDetermine_A= FluidSystemComponents.Types.Switches.switchHowToDetVar.param "switch how to determine A, representative area of heat transfer" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true); 
  
  parameter FluidSystemComponents.Types.Switches.switchHowToDetVar swDetermine_Uoa= FluidSystemComponents.Types.Switches.switchHowToDetVar.param "switch how to determine Uoa, representative overall heat transfer coefficient" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true); 
  
  
  parameter units.Area A_par = 0.1 "representative heat transfer area";
  parameter units.CoefficientOfHeatTransfer Uoa_par = 1000.0 "representative overall heat transfer coefficient";
  parameter units.MacroscopicCrossSection AqVol_par= 1500 "m2/m3";
  parameter units.Density rho_par= 2500 "kg/m3";
  parameter Real effHX_par = 0.8 "heat exchanger effectiveness";
  
  //********** Internal variables/objects **********
  units.Area A;
  units.CoefficientOfHeatTransfer Uoa;
  units.MacroscopicCrossSection AqVol;
  units.Density rho;
  units.Volume Vol;
  units.Mass m;
  
  SubComponents.effHX_NTU_Counter block_effHX annotation(
    Placement(transformation(origin = {14, 18}, extent = {{-10, -10}, {10, 10}})));
  SubComponents.calcNTU calcNTU annotation(
    Placement(transformation(origin = {-28, 22}, extent = {{-10, -10}, {10, 10}})));
equation
  
  //----------
  if(swDetermine_A==FluidSystemComponents.Types.Switches.switchHowToDetVar.param)then
    A=A_par;
  end if;
  
  if(swDetermine_Uoa==FluidSystemComponents.Types.Switches.switchHowToDetVar.param)then
    Uoa=Uoa_par;
  end if;
  
  if(swDetermine_eff==FluidSystemComponents.Types.Switches.switchHowToDetVar.param)then
    effHX=effHX_par;
  end if;
  
  AqVol=AqVol_par;
  rho=rho_par;
  
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
  Vol= A/AqVol;
  m= Vol*rho;
  
  
  annotation(
    defaultComponentName = "HX",
    Documentation(info = "<html>

</html>"),
    Icon(graphics = {Text(origin = {0, -126}, extent = {{-140, 18}, {140, -2}}, textString = "%name"), Polygon(origin = {0, 6}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, points = {{-150, 56}, {-150, -56}, {150, -56}, {150, 56}, {130, 56}, {130, 42}, {-130, 42}, {-130, 56}, {-150, 56}}), Line(origin = {-138.91, 60.94}, points = {{-1, 15}, {-1, -11}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {-0.32, -29.32}, points = {{-140, -49}, {-136, 29}, {138, 29}, {140, -53}}, color = {0, 170, 255}, thickness = 12), Line(origin = {141.409, 80.2805}, points = {{-1, -35}, {-1, -11}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {97.0472, 11.2592}, points = {{15, -11}, {-9, -11}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {-147.186, 10.089}, points = {{59, -11}, {29, -11}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {-96.0157, 32.855}, points = {{13, -11}, {49, -11}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {31.7502, 34.5571}, points = {{13, -11}, {45, -11}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5)}, coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");


end HX_CounterFlow_NTU00;
