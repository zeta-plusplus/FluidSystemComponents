within FluidSystemComponents.InteractiveSimulation.Output;

block PrintCSV_overwriting00
  import Modelica.Utilities.Streams;
  import Modelica.Utilities.Files;
  import Modelica.Utilities.System;
  import Modelica.SIunits;
  parameter String nameFile = "pyConsole00_data.csv";
  parameter String namePath = "modelica://FluidSystemComponents/InteractiveSimulation/Output";
  parameter Modelica.SIunits.Time tInterval = 0.05 "in [s]";
  discrete Modelica.SIunits.Time tPrevPrint(fixed = true, start = 0.0);
  Modelica.SIunits.Time dtSincePrevPrint(fixed = true, start = 0.0);
  
protected
  parameter String nameFilePath = namePath + "/" + nameFile;
  parameter String nameFullFilePath = Files.loadResource(nameFilePath);
algorithm
  if initial() == true then
    print("writing csv: "+nameFullFilePath);
  end if;
  
  dtSincePrevPrint := time - tPrevPrint;
  
  
  if (tInterval <= dtSincePrevPrint) then
    dtSincePrevPrint := 0.0;
    tPrevPrint := time;
    if(Files.exist(nameFullFilePath)==true)then
      Files.remove(nameFullFilePath);
    end if;
    Streams.print("time[s]," + String(time), nameFullFilePath);
  end if;
  
  annotation(
    defaultComponentName = "PrintOnCSV",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
  
end PrintCSV_overwriting00;
