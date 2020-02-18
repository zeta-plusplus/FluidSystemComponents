within FluidSystemComponents.HeatTransfer.BaseClasses;

partial model HX_Base
  /********************************************************
        imports
  ********************************************************/
  import Modelica.Constants;
  import Modelica.SIunits;
  
  
  /********************************************************
            Declaration
  ********************************************************/
  //********** Package **********
  replaceable package Medium1 = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  replaceable package Medium2 = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  
  
  //********** Parameters **********
  
  
  //********** Internal variables **********
  Medium1.BaseProperties fluid1_1 "flow station of port_1";
  Medium1.BaseProperties fluid1_2 "flow station of port_2";
  Medium2.BaseProperties fluid2_1 "flow station of port_1";
  Medium2.BaseProperties fluid2_2 "flow station of port_2";
  

  //********** Interfaces **********
  Modelica.Fluid.Interfaces.FluidPort_a port_1_fl1(redeclare package Medium = Medium1) annotation(
    Placement(visible = true, transformation(origin = {-100, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2_fl1(redeclare package Medium = Medium1) annotation(
    Placement(visible = true, transformation(origin = {100, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_1_fl2(redeclare package Medium = Medium2) annotation(
    Placement(visible = true, transformation(origin = {-100, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2_fl2(redeclare package Medium = Medium2) annotation(
    Placement(visible = true, transformation(origin = {100, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation  
  
  
end HX_Base;
