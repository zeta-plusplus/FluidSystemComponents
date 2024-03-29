within FluidSystemComponents.HydroThermal.Components;

model PumpConstQflow_ideal
  extends FluidSystemComponents.HydroThermal.BaseClasses.Pump_Base;
  //----------
  import units=Modelica.Units.SI;
  
  //********** Parameters **********
  parameter units.VolumeFlowRate qFlowDes= 100
    ""
    annotation(
    Dialog(group = "Characteristics"));
  //********** Internal variables **********
  units.VolumeFlowRate qFlow(start=qFlowDes) "";
  //----- inner-connected variables -----
  //##### none #####
  //----- inner-outer-connected variables -----
  //##### none #####
algorithm
//##### none #####
equation
//********** Geometries **********
//##### none #####
//********** Connections, interface <-> internal variables **********
//##### none #####
//********** Eqns describing physics **********
  if(omega<0)then
    qFlow=0;
    port_2.m_flow=0.0;
    fluid_2.h=fluid_1.h;
  else
    qFlow= NqNdes*qFlowDes;
    port_2.m_flow= -1.0*fluid_2.d*qFlow;
    fluid_2.h= h_2is; 
  end if;
  
/******************************
  Graphics
******************************/
  annotation(
    Icon(graphics = {Ellipse(origin = {28, -22}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-88, 82}, {32, -38}}), Polygon(origin = {46, 4}, fillPattern = FillPattern.Solid, points = {{-16, 16}, {-16, -24}, {14, -4}, {-16, 16}}), Rectangle(origin = {0, -75}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-8, 15}, {8, -23}}), Line(origin = {51.74, -0.52}, points = {{9, 0}, {47, 0}}, thickness = 2), Line(origin = {-90.38, -0.1}, points = {{-11, 0}, {29, 0}}, thickness = 2), Text(origin = {-44, 90}, extent = {{-56, 10}, {144, -10}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));

end PumpConstQflow_ideal;
