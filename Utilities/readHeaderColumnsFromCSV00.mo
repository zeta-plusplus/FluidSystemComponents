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
  Streams.print("initialization");
  Streams.print("nColumns= " + String(nColumns));
  Streams.print("---");
  //-----
  strTemp:=matCSVread[1];
  Streams.print(strTemp);
  Streams.print("---");
  for i in 1:nColumns loop
    if(i==nColumns)then
      y_arrColumns[i]:=strTemp;
    else
      iDelim:=Strings.find(strTemp, strDelim);
      y_arrColumns[i]:=Strings.substring(strTemp,1,iDelim-1);
      strTemp:=Strings.substring(strTemp,iDelim+1,Strings.length(strTemp));
      //Streams.print(String(iDelim));
      //Streams.print(strTemp);
    end if;
    Streams.print(y_arrColumns[i]);
    //Streams.print("");
  end for;
  Streams.print("-----");
/**/
//*****************************************************************
algorithm
  when(time==0)then
    iDelim:=iDelim;
    strTemp:=strTemp;
    for i in 1:nColumns loop
      y_arrColumns[i]:=y_arrColumns[i];
    end for;
  end when;

//*****************************************************************
equation
  when(time>0)then
    Streams.print("when clause, time>0");
    for i in 1:nColumns loop
      Streams.print(y_arrColumns[i]);
    end for;
  end when;

//*****************************************************************
annotation(
  defaultComponentName = "readColumns",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, 117}, extent = {{-120, 11}, {120, -11}}, textString = "%name")}));

end readHeaderColumnsFromCSV00;
