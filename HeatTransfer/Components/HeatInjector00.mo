within FluidSystemComponents.HeatTransfer.Components;

model HeatInjector00
  extends FluidSystemComponents.HeatTransfer.BaseClasses.HeatInjectorBase00;
  
  /********************************************************
        imports   
  ********************************************************/
  import Modelica.Constants;
  import units=Modelica.Units.SI;
  import unitsNonSI=Modelica.Units.NonSI;
  import unitConversions=Modelica.Units.Conversions;
  
  
algorithm
//##### none #####
equation
//##### none #####


/********************************************************
  Graphics
********************************************************/
  
  annotation(
    defaultComponentName="HeatInjector",
  Documentation(info = "<html>
  <a href=modelica://FluidSystemComponents/docs/Elements/BasicElements/HeatInjector00.html> Document html page</a>
  
  <h4>example/demo models</h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.HeatInjector00_ex01\"> PropulsionSystem.Examples.BasicElements.HeatInjector00_ex01 </a> </li>
    </ul>
    
  <h4>classes which this component call (those in MSL are not listed) </h4>
    <p> -> none </p>
    
  <h4>classes from which this component extend </h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.BaseClasses.BasicElements.HeatInjectorBase00\"> PropulsionSystem.BaseClasses.BasicElements.HeatInjectorBase00 </a> </li>
    </ul>
    

</html>"));



end HeatInjector00;
