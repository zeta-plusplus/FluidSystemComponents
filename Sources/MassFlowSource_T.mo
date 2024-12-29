within FluidSystemComponents.Sources;

model MassFlowSource_T
  "same model as MassFlowSource_T in MSL. Initialization parameters are added."
  extends Modelica.Fluid.Sources.MassFlowSource_T(
    medium.p(start=p_init),
    medium.T(start=T_init),
    medium.h(start=h_init),
    m_flow_in_internal(start=m_flow_init)
  );
  
  import units= Modelica.Units.SI;
  
  /* ---------------------------------------------
                    parameters
  --------------------------------------------- */
  //********** Initialization Parameters **********
  //--- fluid, port ---
  parameter units.MassFlowRate m_flow_init(displayUnit = "kg/s") = -0.01 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter units.Pressure p_init(displayUnit = "Pa") = 20* 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter units.Temperature T_init(displayUnit = "K") = 400.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter units.SpecificEnthalpy h_init(displayUnit = "J/kg") = T_init * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  
  
equation

annotation (defaultComponentName="boundary");

end MassFlowSource_T;
