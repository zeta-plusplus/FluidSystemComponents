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
  parameter Integer nVarMax=10;
  
  parameter Boolean tableOnFile=true
    "= true, if table is defined on file or in function usertab"
    annotation (Dialog(group="Table data definition"));
  
  
  parameter String filePath="modelica://FluidSystemComponents/Utilities/Examples/ReadTimeDatCSV00_ex01.mo"
    annotation (Dialog(
      group="Table data definition",
      enable=tableOnFile,
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  parameter String filePath_varList="modelica://FluidSystemComponents/Utilities/Examples/varList_exampleTimeTable01.csv"
    annotation (Dialog(
      group="list of variables in single column",
      enable=tableOnFile,
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  
  
  parameter String tableName="table01"
    "Table name on file or in function usertab (see docu)"
    annotation (Dialog(group="Table data definition",enable=tableOnFile));
  
  parameter String varNames[:]={"var1", "var2", "var3"};
  
  parameter String fileName=Files.loadResource(filePath) "File where matrix is stored"
    annotation (Dialog(
      group="Table data definition",
      enable=tableOnFile,
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  
  parameter String fileName_varList=Files.loadResource(filePath_varList) ""
    annotation (Dialog(
      group="Table data definition",
      enable=tableOnFile,
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  
  
  

//*****************************************************************
protected
  /**/
  parameter Integer nVars=Streams.countLines(fileName_varList) annotation(
    HideResult=false);
  
  parameter String matCSVread[:]=Modelica.Utilities.Streams.readFile(fileName) annotation(
    each HideResult=false, each fixed=false
    );
  
  /*parameter String arrRows[nVars]=fill("", nVars)  annotation(
    each HideResult=false, each fixed=false
    );
  */
  
  parameter Integer nLines=Streams.countLines(fileName);
  parameter Integer nColumns=Strings.count(matCSVread[1],",")+1;
  
  /*parameter String varNames[:]=fill("",nVarMax) "" annotation(
    HideResult=false);
  */
  
  discrete String arrRows[nVars];
  
//*****************************************************************
initial algorithm
  
  Streams.print("nVars= "+String(nVars));
  Streams.print("size(matCSVread,1)= "+String(size(matCSVread,1)));
  Streams.print("");
  
  for i in 1:nVars loop
    arrRows[i]:=matCSVread[i];
    //Streams.print(matCSVread[i]);  
  end for;
  /**/
  //Streams.print("");
    
//*****************************************************************
equation
  //
  when(time==0)then
    Streams.print("");
    for i in 1:nVars loop
      arrRows[i]=matCSVread[i];
      Streams.print(arrRows[i]);
    end for;
  end when;
  
//*****************************************************************
annotation(
  defaultComponentName = "readRowsFromTxt",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, 117}, extent = {{-120, 11}, {120, -11}}, textString = "%name")}));

end readRowsFromTxt00;
