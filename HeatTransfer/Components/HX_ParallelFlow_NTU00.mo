within FluidSystemComponents.HeatTransfer.Components;

model HX_ParallelFlow_NTU00
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
  parameter units.Area A_par = 0.1 "representative heat transfer area";
  parameter units.CoefficientOfHeatTransfer Uoa_par = 5000.0 "representative overall heat transfer coefficient";
  //********** Internal variables/objects **********
  SubComponents.effHX_NTU_Parallel block_effHX annotation(
    Placement(transformation(origin = {14, 18}, extent = {{-10, -10}, {10, 10}})));
  SubComponents.calcNTU calcNTU annotation(
    Placement(transformation(origin = {-28, 22}, extent = {{-10, -10}, {10, 10}})));
equation
  calcNTU.u_A = A_par;
  calcNTU.u_U = Uoa_par;
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
  annotation(
    defaultComponentName = "HX",
    Documentation(info = "<html>

</html>"),
    Icon(graphics = {Text(origin = {0, -126}, extent = {{-140, 18}, {140, -2}}, textString = "%name"), Polygon(origin = {0, 6}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, points = {{-150, 56}, {-150, -56}, {150, -56}, {150, 56}, {130, 56}, {130, 42}, {-130, 42}, {-130, 56}, {-150, 56}}), Line(origin = {-138.91, 60.94}, points = {{-1, 15}, {-1, -11}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {-0.32, -29.32}, points = {{-140, -49}, {-136, 29}, {138, 29}, {140, -53}}, color = {0, 170, 255}, thickness = 12), Line(origin = {141.409, 80.2805}, points = {{-1, -35}, {-1, -11}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {97.0472, 11.2592}, points = {{-15, -11}, {29, -11}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {-147.186, 10.089}, points = {{13, -11}, {57, -11}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {-95.6966, 33.1741}, points = {{13, -11}, {57, -11}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {31.7502, 34.238}, points = {{13, -11}, {53, -11}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5)}, coordinateSystem(preserveAspectRatio = false,extent = {{-140, -100}, {140, 100}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");


end HX_ParallelFlow_NTU00;
