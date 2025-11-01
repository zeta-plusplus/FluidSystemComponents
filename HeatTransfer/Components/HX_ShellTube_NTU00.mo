within FluidSystemComponents.HeatTransfer.Components;

model HX_ShellTube_NTU00

  extends FluidSystemComponents.HeatTransfer.BaseClasses.HX_Base_effHX;
  /********************************************************
        imports
  ********************************************************/
  import Modelica.Constants;
  import units=Modelica.Units.SI;
  import unitsNonSI=Modelica.Units.NonSI;
  import unitConversions=Modelica.Units.Conversions;
  
  
  /********************************************************
                Declaration
  ********************************************************/
  //********** Parameters **********
  parameter units.Area A_par=0.1 "representative heat transfer area";
  parameter units.CoefficientOfHeatTransfer Uoa_par=5000.0 "representative overall heat transfer coefficient";
  
  
  //********** Internal variables/objects **********
  SubComponents.effHX_NTU_ShellTube_1Shell block_effHX annotation(
    Placement(transformation(origin = {14, 18}, extent = {{-10, -10}, {10, 10}})));
  SubComponents.calcNTU calcNTU annotation(
    Placement(transformation(origin = {-28, 22}, extent = {{-10, -10}, {10, 10}})));
equation
  
  calcNTU.u_A= A_par;
  calcNTU.u_U= Uoa_par;
  calcNTU.u_dmCpMin= dmCpMin;
  
  block_effHX.u_ratioDmCp= ratioDmCp;
  
  effHX= block_effHX.y_effHX;
  //-------------------------
  if(flagHotSide==1)then
    Q_flow1= -1.0*Q_flow;
    Q_flow2= Q_flow;
  elseif(flagHotSide==2)then
    Q_flow1= Q_flow;
    Q_flow2= -1.0* Q_flow;
  else
    Q_flow1=0.0;
    Q_flow2=0.0;
  end if;
  connect(calcNTU.y_NTU, block_effHX.u_NTU) annotation(
    Line(points = {{-16, 22}, {4, 22}}, color = {0, 0, 127}));  
annotation(
    defaultComponentName="HX",
    Documentation(
    info = "<html>

</html>"
    ),
  Icon(graphics = {Text(origin = {0, -126}, extent = {{-140, 18}, {140, -2}}, textString = "%name"), Polygon(origin = {0, 6}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, points = {{-150, 56}, {-150, -56}, {150, -56}, {150, 56}, {130, 56}, {130, 42}, {-130, 42}, {-130, 56}, {-150, 56}}), Line(origin = {-138.91, 60.94}, points = {{-1, 15}, {-1, -11}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {-0.32, -28.68}, points = {{-140, -49}, {-120, -35}, {118, -35}, {122, 9}, {-116, 9}, {-126, 15}, {-130, 23}, {-130, 29}, {-130, 35}, {-126, 43}, {-116, 49}, {138, 47}, {140, -53}}, color = {0, 170, 255}, thickness = 7), Line(origin = {141.409, 80.2805}, points = {{-1, -35}, {-1, -11}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {93.8558, -17.4642}, points = {{15, -11}, {-1, -11}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {111.963, 36.5783}, points = {{13, -11}, {29, -11}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5)}, coordinateSystem(preserveAspectRatio = false,extent = {{-140, -100}, {140, 100}}, initialScale = 0.1)),
  __OpenModelica_commandLineOptions = "");


end HX_ShellTube_NTU00;
