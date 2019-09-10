within FluidSystemComponents.HydroThermal.Components;

model DirValve_4ports3positions
  extends FluidSystemComponents.Interfaces.Frame_4FluidPorts;
  //----------
  /********************************************************
    imports
  ********************************************************/
  import Modelica.Constants;
  import Modelica.SIunits;
  //********** Parameters **********
  parameter Modelica.SIunits.Pressure dp_nominal(displayUnit="Pa")=10*1000 
    ""
    annotation(
    Dialog(group = "Characteristics"));
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal(displayUnit="kg/s")=0.01 
    ""
    annotation(
    Dialog(group = "Characteristics"));
  parameter Real opening_min=0
    ""
    annotation(
    Dialog(group = "Characteristics"));
  //********** internal objects **********
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete1(redeclare package Medium = Medium, dp_nominal(displayUnit = "Pa") = dp_nominal,m_flow_nominal = m_flow_nominal, opening_min = opening_min)  annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete2(redeclare package Medium = Medium, dp_nominal(displayUnit = "Pa") = dp_nominal,m_flow_nominal = m_flow_nominal, opening_min = opening_min)  annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete3(redeclare package Medium = Medium, dp_nominal(displayUnit = "Pa") = dp_nominal,m_flow_nominal = m_flow_nominal, opening_min = opening_min)  annotation(
    Placement(visible = true, transformation(origin = {10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete4(redeclare package Medium = Medium, dp_nominal(displayUnit = "Pa") = dp_nominal,m_flow_nominal = m_flow_nominal, opening_min = opening_min)  annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.IntegerInput u_ctrl(start=0) annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.LessEqualThreshold lessEqualThreshold1(threshold = -0.99)  annotation(
    Placement(visible = true, transformation(origin = {-61, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.IntegerToReal integerToReal1 annotation(
    Placement(visible = true, transformation(origin = {-85, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.IntegerToReal integerToReal2 annotation(
    Placement(visible = true, transformation(origin = {75, 0}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Logical.LessEqualThreshold lessEqualThreshold2(threshold = -0.99) annotation(
    Placement(visible = true, transformation(origin = {55, 0}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold1(threshold = 0.99)  annotation(
    Placement(visible = true, transformation(origin = {20, 72}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold2(threshold = 0.99) annotation(
    Placement(visible = true, transformation(origin = {20, -40}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.IntegerToReal integerToReal3 annotation(
    Placement(visible = true, transformation(origin = {45, -40}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.IntegerToReal integerToReal4 annotation(
    Placement(visible = true, transformation(origin = {45, 72}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
equation
  connect(port_3, valveDiscrete3.port_a) annotation(
    Line(points = {{-100, 100}, {-100, 72}, {-8, 72}, {-8, -60}, {0, -60}}, color = {0, 127, 255}));
  connect(port_1, valveDiscrete4.port_a) annotation(
    Line(points = {{-100, -100}, {-100, -72}, {-14, -72}, {-14, 50}, {0, 50}}, color = {0, 127, 255}));
  connect(valveDiscrete4.port_b, port_4) annotation(
    Line(points = {{20, 50}, {84, 50}, {84, 90}, {100, 90}, {100, 100}}, color = {0, 127, 255}));
  connect(port_4, valveDiscrete2.port_a) annotation(
    Line(points = {{100, 100}, {100, 90}, {30, 90}, {30, 10}}, color = {0, 127, 255}));
  connect(valveDiscrete1.port_b, port_3) annotation(
    Line(points = {{-40, 10}, {-40, 80}, {-100, 80}, {-100, 100}}, color = {0, 127, 255}));
  connect(port_1, valveDiscrete1.port_a) annotation(
    Line(points = {{-100, -100}, {-100, -80}, {-40, -80}, {-40, -10}}, color = {0, 127, 255}));
  connect(integerToReal3.u, u_ctrl) annotation(
    Line(points = {{52, -40}, {90, -40}, {90, 0}, {120, 0}}, color = {255, 127, 0}));
  connect(u_ctrl, integerToReal1.u) annotation(
    Line(points = {{120, 0}, {86, 0}, {86, -28}, {-96, -28}, {-96, 0}, {-92, 0}}, color = {255, 127, 0}));
  connect(integerToReal4.u, u_ctrl) annotation(
    Line(points = {{52, 72}, {96, 72}, {96, 0}, {120, 0}, {120, 0}}, color = {255, 127, 0}));
  connect(greaterEqualThreshold1.u, integerToReal4.y) annotation(
    Line(points = {{26, 72}, {38, 72}, {38, 72}, {40, 72}}, color = {0, 0, 127}));
  connect(greaterEqualThreshold2.u, integerToReal3.y) annotation(
    Line(points = {{26, -40}, {40, -40}, {40, -40}, {40, -40}, {40, -40}}, color = {0, 0, 127}));
  connect(valveDiscrete3.open, greaterEqualThreshold2.y) annotation(
    Line(points = {{10, -52}, {10, -52}, {10, -40}, {14, -40}, {14, -40}}, color = {255, 0, 255}));
  connect(valveDiscrete4.open, greaterEqualThreshold1.y) annotation(
    Line(points = {{10, 58}, {10, 58}, {10, 72}, {14, 72}, {14, 72}}, color = {255, 0, 255}));
  connect(integerToReal2.u, u_ctrl) annotation(
    Line(points = {{82, 0}, {106, 0}, {106, 0}, {120, 0}}, color = {255, 127, 0}));
  connect(lessEqualThreshold2.u, integerToReal2.y) annotation(
    Line(points = {{62, 0}, {70, 0}, {70, 0}, {70, 0}}, color = {0, 0, 127}));
  connect(valveDiscrete2.open, lessEqualThreshold2.y) annotation(
    Line(points = {{38, 0}, {48, 0}, {48, 0}, {50, 0}}, color = {255, 0, 255}));
  connect(valveDiscrete2.port_b, port_2) annotation(
    Line(points = {{30, -10}, {30, -80}, {100, -80}, {100, -100}}, color = {0, 127, 255}));
  connect(valveDiscrete3.port_b, port_2) annotation(
    Line(points = {{20, -60}, {100, -60}, {100, -100}}, color = {0, 127, 255}));
  connect(integerToReal1.y, lessEqualThreshold1.u) annotation(
    Line(points = {{-80, 0}, {-68, 0}, {-68, 0}, {-68, 0}}, color = {0, 0, 127}));
  connect(lessEqualThreshold1.y, valveDiscrete1.open) annotation(
    Line(points = {{-55, 0}, {-48, 0}}, color = {255, 0, 255}));
  
  
  
  
annotation(
    Icon(graphics = {Rectangle(origin = {-70, 20}, lineThickness = 0.5, extent = {{-20, 20}, {40, -40}}), Rectangle(origin = {-11, 22}, lineThickness = 0.5, extent = {{-19, 18}, {41, -42}}), Rectangle(origin = {50, 20}, lineThickness = 0.5, extent = {{-20, 20}, {40, -40}}), Line(origin = {-70.0251, -0.273036}, points = {{0, -20}, {0, 40}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6), Line(origin = {-48.6951, 59.2627}, points = {{0, -20}, {0, -80}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6), Line(origin = {58.7955, 16.3016}, points = {{-8, -36}, {12, 24}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6), Line(origin = {68.532, 26.3016}, points = {{2, -46}, {-20, 14}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6), Line(origin = {-14.7302, -15.2635}, points = {{0, 15}, {0, -5}}), Line(origin = {14.5045, -15.5395}, points = {{0, 15}, {0, -5}}), Line(origin = {-14.4793, 24.5106}, points = {{0, 15}, {0, -5}}), Line(origin = {15.2822, 24.7616}, points = {{0, 15}, {0, -5}}), Line(origin = {-13.6763, 19.5432}, points = {{-6, 0}, {4, 0}}), Line(origin = {16.0853, 19.7942}, points = {{-6, 0}, {4, 0}}), Line(origin = {-14.2159, -0.230926}, points = {{-6, 0}, {4, 0}}), Line(origin = {15.7013, -0.2435}, points = {{-6, 0}, {4, 0}}), Text(origin = {3, -73}, extent = {{-101, 13}, {95, -7}}, textString = "%name"), Line(origin = {-60, 67.6286}, points = {{-20, 32}, {-20, 12}, {46, 12}, {46, -28}}), Line(origin = {-20.7529, 69.9874}, points = {{100, 30}, {100, 10}, {36, 10}, {36, -30}}), Line(origin = {-139.336, -68.6199}, points = {{124, 48}, {124, 18}, {60, 18}, {60, -32}}), Line(origin = {60.138, -50.1631}, points = {{-46, 30}, {-46, 0}, {20, 0}, {20, -50}}), Text(origin = {-61, 56}, extent = {{-19, 6}, {21, -14}}, textString = "-1"), Text(origin = {-1, 56}, extent = {{-19, 6}, {21, -14}}, textString = "0"), Text(origin = {59, 56}, extent = {{-19, 6}, {21, -14}}, textString = "1")}, coordinateSystem(initialScale = 0.1)));
  
end DirValve_4ports3positions;
