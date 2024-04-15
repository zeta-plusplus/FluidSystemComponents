within FluidSystemComponents.Utilities;

function f_readRowsFromTxt00
  extends Modelica.Icons.Function;
  //
  import Files= Modelica.Utilities.Files;
  import Strings=Modelica.Utilities.Strings;
  import Modelica.Blocks.Tables.Internal;
  import Streams=Modelica.Utilities.Streams;
  //
  input String filePath;
  //
  output String strRows[nRows];
//*******************************************************
protected
  String fileName=Files.loadResource(filePath) "";
  Integer nRows=Streams.countLines(fileName) "";
//*******************************************************
algorithm
  
  
  for i in 1:nRows loop
    strRows[i]:=Modelica.Utilities.Streams.readLine(fileName,i);
  end for;
  
  
end f_readRowsFromTxt00;
