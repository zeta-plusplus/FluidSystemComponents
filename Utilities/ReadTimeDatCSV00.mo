within FluidSystemComponents.Utilities;

model ReadTimeDatCSV00
  import Streams=Modelica.Utilities.Streams;
  import Strings=Modelica.Utilities.Strings;
  import Files= Modelica.Utilities.Files;
  import Scripting=OpenModelica.Scripting;
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter String fileName="modelica://FluidSystemComponents/Utilities/Examples/exampleTimeTable01.csv";
  parameter String fileHandle=Files.loadResource(fileName);
  parameter Integer nLines=Streams.countLines(fileHandle);
  parameter String matCSVread[:]=Modelica.Utilities.Streams.readFile(fileHandle);
  parameter Integer nCols=Strings.count(matCSVread[1],",")+1;
  
  //----------------------------------------
  // variable
  //----------------------------------------
  
protected  
  /*parameter String matCSV[nLines, nCols] "" annotation(
    HideResult=false);
*/

initial algorithm
  Streams.print(matCSV[1]);
  
  /*
  for i in 1:nLines loop
    matCSV[i,:]:=Scripting.stringSplit(matCSVread[i],",");
  end for; 
  */
  
equation
  
annotation(
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end ReadTimeDatCSV00;
