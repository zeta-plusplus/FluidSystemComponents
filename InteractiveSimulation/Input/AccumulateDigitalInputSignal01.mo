within FluidSystemComponents.InteractiveSimulation.Input;

block AccumulateDigitalInputSignal01
  /********************************************************
                Declaration   
    ********************************************************/
  /* ---------------------------------------------
                parameter   
      --------------------------------------------- */
  parameter Real varInit = 0.0 "inital value of y";
  parameter Real scl = 1.0 "scale onto u";
  parameter Real dt=0.01 "sampling time to accumulate";
  parameter Real kTimeInterval=1.0 "factor multiplied onto time interval";
  /* ---------------------------------------------
                internal variable   
      --------------------------------------------- */
  Real uReal(fixed=true, start=0) annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = true, showStartAttribute = true));
  discrete Real varAcmltd(fixed = true, start = varInit) annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = true, showStartAttribute = true));
  /* ---------------------------------------------
                  Interface   
  --------------------------------------------- */
  output Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.BooleanInput u(fixed=true, start=false) annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)),
    Dialog(tab = "Variables", group = "start attribute", enable = true, showStartAttribute = true));
  
  
//********************************************************************************
initial algorithm
  varAcmltd := varInit;
  
  
//********************************************************************************
algorithm
  uReal := if u then 1.0 else 0.0;
  
  when(time<>0)and(sample(0, dt)==true) then
    varAcmltd := varAcmltd + (uReal * scl) * (kTimeInterval*dt);
  end when;
  
  y := varAcmltd;
  
  
  annotation(
    defaultComponentName = "Accumulate",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}), Text(origin = {2, -72}, extent = {{-100, 0}, {96, -20}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
  
  
end AccumulateDigitalInputSignal01;
