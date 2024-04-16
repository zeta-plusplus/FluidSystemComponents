within FluidSystemComponents.Utilities;

model readRowsFromTxt00
import SI=Modelica.Units.SI;
  import Files= Modelica.Utilities.Files;
  import Strings=Modelica.Utilities.Strings;
  import Modelica.Blocks.Tables.Internal;
  import Scripting=OpenModelica.Scripting;
  import Streams=Modelica.Utilities.Streams;
  //
  
  
  parameter String filePath="modelica://FluidSystemComponents/Utilities/Examples/varList_exampleTimeTable01.csv"
    annotation (Dialog(
      group="Table data definition"
      ));
  
  
  //
  discrete Interfaces.StringVectorOutput y_arrRows[nRows] annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-22, -76}, {22, 76}}), iconTransformation(origin = {99, 0}, extent = {{-21, -60}, {21, 60}})));

//*****************************************************************
protected
  /**/
  parameter String fileName=Files.loadResource(filePath) "File where matrix is stored"
    annotation(
    fixed=false, HideResult=true);
  
  parameter Integer nRows=Streams.countLines(fileName) annotation(
    fixed=false, HideResult=false);
  
  parameter String matCSVread[:]=Modelica.Utilities.Streams.readFile(fileName) annotation(
    each HideResult=false, each fixed=false
    );
  
  
//*****************************************************************
initial algorithm
  
  Streams.print("nVars= " + String(nRows));
  Streams.print("size(matCSVread,1)= " + String(size(matCSVread, 1)));
  Streams.print("");
  //-----
  for i in 1:nRows loop
    y_arrRows[i] := matCSVread[i];
  end for;
/**/
//*****************************************************************
equation
  //
  when(time==0)then
    Streams.print("-----");
    for i in 1:nRows loop
      y_arrRows[i]=matCSVread[i];
      Streams.print(y_arrRows[i]);
    end for;
    Streams.print("-----");
  end when;
  
//*****************************************************************
annotation(
  defaultComponentName = "readRowsFromTxt",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, 117}, extent = {{-120, 11}, {120, -11}}, textString = "%name")}));

end readRowsFromTxt00;
