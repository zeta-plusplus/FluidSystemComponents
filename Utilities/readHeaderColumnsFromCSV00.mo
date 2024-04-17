within FluidSystemComponents.Utilities;

model readHeaderColumnsFromCSV00
import SI=Modelica.Units.SI;
  import Files= Modelica.Utilities.Files;
  import Strings=Modelica.Utilities.Strings;
  import Modelica.Blocks.Tables.Internal;
  import Scripting=OpenModelica.Scripting;
  import Streams=Modelica.Utilities.Streams;
  //
  
  
  parameter String filePath="modelica://FluidSystemComponents/Utilities/Examples/exampleTimeTable01.csv"
    annotation (Dialog(
      group="Table data definition"
      ));
  
  
  parameter String strDelim=",";
  
  //
  discrete Integer iDelim;
  discrete String strTemp;
  
  //
  discrete Interfaces.StringVectorOutput y_arrColumns[nColumns] annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-22, -76}, {22, 76}}), iconTransformation(origin = {99, 0}, extent = {{-21, -60}, {21, 60}})));

//*****************************************************************
protected
  /**/
  parameter String fileName=Files.loadResource(filePath) "File where matrix is stored"
    annotation(
    fixed=false, HideResult=true);
  
  
  parameter String matCSVread[:]=Modelica.Utilities.Streams.readFile(fileName);
  parameter Integer nColumns=Strings.count(matCSVread[1],strDelim)+1;
  
  
  
  
//*****************************************************************
initial algorithm
  //nColumns:=Strings.count(matCSVread[1],",")+1;
  
  Streams.print("nVars= " + String(nColumns));
  //Streams.print("size(matCSVread,1)= " + String(size(matCSVread, 1)));
  Streams.print("");
  //-----
  /*for i in 1:nColumns loop
    y_arrColumns[i] := matCSVread[i];
  end for;*/
  strTemp:=matCSVread[1];
  for i in 1:nColumns loop
    iDelim:=Strings.find(strTemp, strDelim);
    y_arrColumns[i]:=Strings.substring(strTemp,1,iDelim-1);
    strTemp:=Strings.substring(matCSVread[1],iDelim,Strings.length(strTemp));
  end for;
/**/
//*****************************************************************
algorithm
  when(time==0)then
  strTemp:=matCSVread[1];
    for i in 1:nColumns loop
      iDelim:=Strings.find(strTemp, strDelim);
      y_arrColumns[i]:=Strings.substring(strTemp,1,iDelim);
      strTemp:=Strings.substring(matCSVread[1],iDelim+1,Strings.length(strTemp));
    end for;
  end when;

//*****************************************************************
equation
  when(time==0)then
    for i in 1:nColumns loop
      Streams.print(y_arrColumns[i]);
    end for;
  end when;

//*****************************************************************
annotation(
  defaultComponentName = "readColumns",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, 117}, extent = {{-120, 11}, {120, -11}}, textString = "%name")}));

end readHeaderColumnsFromCSV00;
