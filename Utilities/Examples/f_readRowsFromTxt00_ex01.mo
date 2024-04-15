within FluidSystemComponents.Utilities.Examples;

model f_readRowsFromTxt00_ex01
  extends Modelica.Icons.Example;
  //
  import Streams=Modelica.Utilities.Streams;
  //
  parameter String filePath="modelica://FluidSystemComponents/Utilities/Examples/varList_exampleTimeTable01.csv";
  //
  //String str[:];
equation
  
  Streams.print(FluidSystemComponents.Utilities.f_readRowsFromTxt00(filePath=filePath));
 
end f_readRowsFromTxt00_ex01;
