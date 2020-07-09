within FluidSystemComponents.Utilities;

model ConstrainVariableBeforeTimer
  import Modelica.SIunits;
  /* ---------------------------------------------
            parameters    
      --------------------------------------------- */
  parameter SIunits.Time timeToEndConstraint = 1.0 "Variable is constrained before and including this time" annotation(
    Dialog(group = "Characteristics"));
  /* ---------------------------------------------
            switches    
      --------------------------------------------- */
  /* ---------------------------------------------
            internal objects    
      --------------------------------------------- */
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver1 annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable constraint(use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch1 annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /* ---------------------------------------------
            interface    
      --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_variable annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_targetValue "" annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
protected
initial equation

algorithm
  
  if(time<=timeToEndConstraint)then
    switch1.u2:=true;
  else
    switch1.u2:=false;
  end if;
  
  
equation
  connect(constraint.u_targetValue, u_targetValue) annotation(
    Line(points = {{61, 0}, {120, 0}}, color = {0, 0, 127}));
  connect(switch1.y, constraint.u_variable) annotation(
    Line(points = {{21, 0}, {40, 0}}, color = {0, 0, 127}));
  connect(u_variable, switch1.u1) annotation(
    Line(points = {{-120, 0}, {-30, 0}, {-30, 8}, {-2, 8}}, color = {0, 0, 127}));
  connect(VarBySolver1.y_independent, switch1.u3) annotation(
    Line(points = {{-18, -30}, {-10, -30}, {-10, -8}, {-2, -8}}, color = {0, 0, 127}));
  
  
  annotation(
    defaultComponentName = "Constraint",
    Diagram,
    Icon(graphics = {Rectangle(fillColor = {85, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-3, -83}, lineColor = {255, 255, 255}, extent = {{-97, 3}, {103, -17}}, textString = "%name"), Text(origin = {-3, 37}, lineColor = {255, 255, 255}, extent = {{-97, 3}, {103, -37}}, textString = "Constraint", fontSize = 34), Text(origin = {-3, -3}, lineColor = {255, 255, 255}, extent = {{-97, 3}, {103, -37}}, textString = "At Initial", fontSize = 34)}, coordinateSystem(initialScale = 0.1)));
end ConstrainVariableBeforeTimer;
