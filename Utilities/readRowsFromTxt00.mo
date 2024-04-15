within FluidSystemComponents.Utilities;

model readRowsFromTxt00
  //
  import Files= Modelica.Utilities.Files;
  import Strings=Modelica.Utilities.Strings;
  import Modelica.Blocks.Tables.Internal;
  import Streams=Modelica.Utilities.Streams;
  //
  parameter String filePath="modelica://FluidSystemComponents/Utilities/Examples/varList_exampleTimeTable01.csv";
  parameter String fileName=Files.loadResource(filePath);
  parameter Integer nRows=Streams.countLines(fileName);
  
  //
  discrete Integer y_nRows;
  discrete String y_strRows[nRows];
//*******************************************************
protected
  parameter String strRows[nRows];
  parameter Boolean flagEoF[nRows];
  parameter String matCSVread[:]=Streams.readFile(fileName);
  
//*******************************************************
initial algorithm
  
  Streams.print(fileName);
  Streams.print(matCSVread[:]);
  
  for i in 1:nRows loop
    (strRows[i],flagEoF[i]):=Modelica.Utilities.Streams.readLine(fileName,i);
    Streams.print(strRows[i]);
  end for;
  
  
algorithm
  when(time==0)then
    for i in 1:nRows loop
      y_strRows[i]:= strRows[i];
      
    end for;
    y_nRows:=nRows;
    
    
  end when;

annotation
  (defaultComponentName = "readRowsFromTxt");

end readRowsFromTxt00;
