within FluidSystemComponents.Utilities;

model readRowsFromTxt00
import SI=Modelica.Units.SI;
  import Files= Modelica.Utilities.Files;
  import Strings=Modelica.Utilities.Strings;
  import Modelica.Blocks.Tables.Internal;
  import Scripting=OpenModelica.Scripting;
  import Streams=Modelica.Utilities.Streams;
  //
  //extends Modelica.Blocks.Interfaces.MO(nout=nVarMax);
  //extends Modelica.Blocks.Interfaces.MO(nout=max([size(columns, 1); size(offset, 1)]));
  //extends Modelica.Blocks.Interfaces.MO(nout=size(varNames,1));
  //extends Modelica.Blocks.Interfaces.MO(nout=Strings.count(matCSVread[1],",")+1);
  //
  
  
  parameter String filePath="modelica://FluidSystemComponents/Utilities/Examples/varList_exampleTimeTable01.csv"
    annotation (Dialog(
      group="Table data definition"
      ));
  
  //
  discrete String arrRows[nVars];
  
  //
  discrete Interfaces.StringVectorOutput y_arrRows[nVars] annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-22, -76}, {22, 76}}), iconTransformation(origin = {99, 0}, extent = {{-21, -60}, {21, 60}})));

//*****************************************************************
protected
  /**/
  parameter String fileName=Files.loadResource(filePath) "File where matrix is stored"
    annotation(
    HideResult=true);
  
  parameter Integer nVars=Streams.countLines(fileName) annotation(
    HideResult=false);
  
  parameter String matCSVread[:]=Modelica.Utilities.Streams.readFile(fileName) annotation(
    each HideResult=false, each fixed=false
    );
  
  
  parameter Integer nLines=Streams.countLines(fileName) 
    annotation(
      HideResult=false);
  parameter Integer nColumns=Strings.count(matCSVread[1],",")+1 
    annotation(
    HideResult=false);
  
  
//*****************************************************************
initial algorithm
  Streams.print("nVars= " + String(nVars));
  Streams.print("size(matCSVread,1)= " + String(size(matCSVread, 1)));
  Streams.print("");
  //-----
  for i in 1:nVars loop
    arrRows[i] := matCSVread[i];
    y_arrRows[i] := matCSVread[i];
  end for;
/**/
//*****************************************************************
equation
  //
  when(time==0)then
    Streams.print("");
    for i in 1:nVars loop
      arrRows[i]=matCSVread[i];
      y_arrRows[i]=matCSVread[i];
      Streams.print(y_arrRows[i]);
    end for;
  end when;
  
//*****************************************************************
annotation(
  defaultComponentName = "readRowsFromTxt",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, 117}, extent = {{-120, 11}, {120, -11}}, textString = "%name")}));

end readRowsFromTxt00;
