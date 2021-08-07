within FluidSystemComponents.Sources;

model VolumeFlowSource_T
  "Ideal flow source that produces a prescribed flow flow with prescribed temperature, mass fraction and trace substances"
  import Modelica.Media.Interfaces.Choices.IndependentVariables;
  import Modelica.Fluid;
  import Modelica.Fluid.Sources;
  import Modelica.Fluid.Utilities;
  import Modelica.SIunits;
  extends Sources.BaseClasses.PartialFlowSource;
  
  parameter Boolean use_V_flow_in = false
    "Get the mass flow rate from the input connector"
    annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
  parameter Boolean use_T_in= false
    "Get the temperature from the input connector"
    annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
  parameter Boolean use_X_in = false
    "Get the composition from the input connector"
    annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
  parameter Boolean use_C_in = false
    "Get the trace substances from the input connector"
    annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
  
  parameter SIunits.VolumeFlowRate V_flow = 0
    "Fixed mass flow rate going out of the fluid port"
    annotation (Evaluate = true,
                Dialog(enable = not use_m_flow_in));
  parameter Medium.Temperature T = Medium.T_default
    "Fixed value of temperature"
    annotation (Evaluate = true,
                Dialog(enable = not use_T_in));
  parameter Medium.MassFraction X[Medium.nX] = Medium.X_default
    "Fixed value of composition"
    annotation (Evaluate = true,
                Dialog(enable = (not use_X_in) and Medium.nXi > 0));
  parameter Medium.ExtraProperty C[Medium.nC](
       quantity=Medium.extraPropertiesNames)=fill(0, Medium.nC)
    "Fixed values of trace substances"
    annotation (Evaluate=true,
                Dialog(enable = (not use_C_in) and Medium.nC > 0));
  
  
  Modelica.Blocks.Interfaces.RealInput V_flow_in if     use_V_flow_in
    "Prescribed mass flow rate"
    annotation (Placement(transformation(extent={{-120,60},{-80,100}}), iconTransformation(extent={{-120,60},{-80,100}})));
  Modelica.Blocks.Interfaces.RealInput T_in if         use_T_in
    "Prescribed fluid temperature"
    annotation (Placement(transformation(extent={{-140,20},{-100,60}}), iconTransformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput X_in[Medium.nX] if
                                                        use_X_in
    "Prescribed fluid composition"
    annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
  Modelica.Blocks.Interfaces.RealInput C_in[Medium.nC] if
                                                        use_C_in
    "Prescribed boundary trace substances"
    annotation (Placement(transformation(extent={{-120,-100},{-80,-60}})));
protected
  SIunits.VolumeFlowRate V_flow_in_internal "";
  Modelica.Blocks.Interfaces.RealInput m_flow_in_internal
    "Needed to connect to conditional connector";
  Modelica.Blocks.Interfaces.RealInput T_in_internal
    "Needed to connect to conditional connector";
  Modelica.Blocks.Interfaces.RealInput X_in_internal[Medium.nX]
    "Needed to connect to conditional connector";
  Modelica.Blocks.Interfaces.RealInput C_in_internal[Medium.nC]
    "Needed to connect to conditional connector";
equation
  Utilities.checkBoundary(Medium.mediumName, Medium.substanceNames,
    Medium.singleState, true, X_in_internal, "MassFlowSource_T");
  connect(V_flow_in, V_flow_in_internal);
  connect(T_in, T_in_internal);
  connect(X_in, X_in_internal);
  connect(C_in, C_in_internal);
  if not use_V_flow_in then
    V_flow_in_internal = V_flow;
  end if;
  if not use_T_in then
    T_in_internal = T;
  end if;
  if not use_X_in then
    X_in_internal = X;
  end if;
  if not use_C_in then
    C_in_internal = C;
  end if;
  if Medium.ThermoStates == IndependentVariables.ph or
     Medium.ThermoStates == IndependentVariables.phX then
     medium.h = Medium.specificEnthalpy(Medium.setState_pTX(medium.p, T_in_internal, X_in_internal));
  else
     medium.T = T_in_internal;
  end if;
  m_flow_in_internal= medium.d*V_flow_in_internal;
  sum(ports.m_flow) = -m_flow_in_internal;
  medium.Xi = X_in_internal[1:Medium.nXi];
  ports.C_outflow = fill(C_in_internal, nPorts);
  annotation (defaultComponentName="boundary",
    Icon(coordinateSystem(
        initialScale = 0.1), graphics={Rectangle(fillColor = {0, 127, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{35, 45}, {100, -45}}), Ellipse(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 80}, {60, -80}}, endAngle = 360), Polygon(lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, points = {{-60, 70}, {60, 0}, {-60, -68}, {-60, 70}}), Text(lineColor = {255, 0, 0}, extent = {{-54, 32}, {16, -30}}, textString = "V"), Text(lineColor = {0, 0, 255}, extent = {{-150, 130}, {150, 170}}, textString = "%name"), Ellipse(origin = {2, 4},lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-26, 30}, {-18, 22}}, endAngle = 360), Text(visible = false, extent = {{-185, 132}, {-45, 100}}, textString = "m_flow"), Text(visible = false, extent = {{-111, 71}, {-71, 37}}, textString = "T"), Text(visible = false, extent = {{-153, -44}, {-33, -72}}, textString = "X"), Text(visible = false, extent = {{-155, -98}, {-35, -126}}, textString = "C")}),
    Documentation(info="<html>
</html>"));
end VolumeFlowSource_T;
