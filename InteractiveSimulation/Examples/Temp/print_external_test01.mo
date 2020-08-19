within FluidSystemComponents.InteractiveSimulation.Examples.Temp;

model print_external_test01
  extends Modelica.Icons.Example;
  
  import Modelica.Utilities.Streams;
  import Modelica.Utilities.Files;
  import Modelica.Utilities.System;
  import Modelica.SIunits;
  
  parameter String nameFilePath="modelica://FluidSystemComponents/InteractiveSimulation/Output/data_test.csv";
  parameter String fileName="data_test.csv";
  parameter Modelica.SIunits.Time tInterval=1.00;
  
  discrete Modelica.SIunits.Time tPrevPrint(fixed=true, start=0.0);
  Modelica.SIunits.Time dtSincePrevPrint(fixed=true, start=0.0);
  
  discrete String nameFullFilePath;
  
    
algorithm
  if(initial()==true)then
    nameFullFilePath:= Files.loadResource(nameFilePath);
  end if;
  
  
  dtSincePrevPrint:= time - tPrevPrint;
  
  if(tInterval<=dtSincePrevPrint)then
    dtSincePrevPrint:= 0.0;
    tPrevPrint:= time;
    
    Streams.print(String(time), nameFullFilePath);
    Streams.close(nameFullFilePath);
  end if;
  
  
annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));

end print_external_test01;
