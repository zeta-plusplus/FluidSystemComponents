within FluidSystemComponents.Utilities;

model CombiTimeTable1VarByName00
  import SI=Modelica.Units.SI;
  import Files= Modelica.Utilities.Files;
  import Strings=Modelica.Utilities.Strings;
  import Modelica.Blocks.Tables.Internal;
  import Scripting=OpenModelica.Scripting;
  import Streams=Modelica.Utilities.Streams;
  //
  extends Modelica.Blocks.Interfaces.MO(final nout=1);
  //
  
  parameter Boolean tableOnFile=true
    "= true, if table is defined on file or in function usertab"
    annotation (Dialog(enable = false, group="Table data definition"));
  
  
  parameter String filePath="modelica://FluidSystemComponents/Utilities/Examples/exampleTimeTable01.csv"
    annotation (Dialog(
      group="Table data definition",
      enable=tableOnFile,
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  
  
  parameter String tableName="table01"
    "Table name on file or in function usertab (see docu)"
    annotation (Dialog(group="Table data definition",enable=tableOnFile));
  
  parameter String strVar="volume.medium.p" 
    "variable name to be extracted"
    annotation (Dialog(
      group="Table data definition",
      enable=tableOnFile
      ));
  
  parameter Boolean verboseRead=true
    "= true, if info message that file is loading is to be printed"
    annotation (Dialog(group="Table data definition",enable=tableOnFile));
  
  
  //
  parameter String strDelim="," 
    ""
    annotation (Dialog(group="Table data interpretation"));
  
  //
  parameter Modelica.Blocks.Types.Smoothness smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments
    "Smoothness of table interpolation"
    annotation (Dialog(group="Table data interpretation"));
  parameter Modelica.Blocks.Types.Extrapolation extrapolation=Modelica.Blocks.Types.Extrapolation.LastTwoPoints
    "Extrapolation of data outside the definition range"
    annotation (Dialog(group="Table data interpretation"));
  parameter SI.Time timeScale(
    min=Modelica.Constants.eps)=1 "Time scale of first table column"
    annotation (Dialog(group="Table data interpretation"), Evaluate=true);
  parameter Real offset[:]={0} "Offsets of output signals"
    annotation (Dialog(group="Table data interpretation"));
  parameter SI.Time startTime=0
    "Output = offset for time < startTime"
    annotation (Dialog(group="Table data interpretation"));
  parameter SI.Time shiftTime=startTime
    "Shift time of first table column"
    annotation (Dialog(group="Table data interpretation"));
  parameter Modelica.Blocks.Types.TimeEvents timeEvents=Modelica.Blocks.Types.TimeEvents.Always
    "Time event handling of table interpolation"
    annotation (Dialog(group="Table data interpretation", enable=smoothness == Modelica.Blocks.Types.Smoothness.LinearSegments));
  parameter Boolean verboseExtrapolation=false
    "= true, if warning messages are to be printed if time is outside the table definition range"
    annotation (Dialog(group="Table data interpretation", enable=extrapolation == Modelica.Blocks.Types.Extrapolation.LastTwoPoints or extrapolation == Modelica.Blocks.Types.Extrapolation.HoldLastPoint));
  final parameter SI.Time t_min=t_minScaled*timeScale
    "Minimum abscissa value defined in table";
  final parameter SI.Time t_max=t_maxScaled*timeScale
    "Maximum abscissa value defined in table";
  final parameter Real t_minScaled=Internal.getTimeTableTmin(tableID)
    "Minimum (scaled) abscissa value defined in table";
  final parameter Real t_maxScaled=Internal.getTimeTableTmax(tableID)
    "Maximum (scaled) abscissa value defined in table";
  
  //
  discrete Integer iDelim;
  discrete String strTemp;
  discrete String arrColumns[nColumns];
  //
  discrete Interfaces.StringOutput y_column annotation(
    Placement(transformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}})));
  //*****************************************************************

protected
  /**/
  parameter String fileName=Files.loadResource(filePath) "File where matrix is stored"
    annotation (Dialog(
      group="Table data definition",
      enable=tableOnFile,
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  
  parameter String matCSVread[:]=Modelica.Utilities.Streams.readFile(fileName);
  parameter Integer nLines=Streams.countLines(fileName)
    ""
    annotation(HideResult = false)
    ;
  parameter Integer nColumns=Strings.count(matCSVread[1],",")+1
    annotation(
      HideResult = false
    );
  
  parameter Integer columns[1]={3}
    "Columns of table to be interpolated"
    annotation(HideResult = false,fixed=false);
  
  //y_index=FluidSystemComponents.Utilities.f_indexByName00(stringVector, u_keyString);
  
  //-----
  parameter Real table[:, :] = fill(0.0, 0, 2)
    "Table matrix (time = first column; e.g., table=[0, 0; 1, 1; 2, 4])"
    annotation (Dialog(group="Table data definition",enable=not tableOnFile));
  
  
  final parameter Real p_offset[nout]=(if size(offset, 1) == 1 then ones(nout)*offset[1] else offset)
    "Offsets of output signals";
  parameter Modelica.Blocks.Types.ExternalCombiTimeTable tableID=
      Modelica.Blocks.Types.ExternalCombiTimeTable(
        if tableOnFile then tableName else "NoName",
        if tableOnFile and fileName <> "NoName" and not Modelica.Utilities.Strings.isEmpty(fileName) then fileName else "NoName",
        table,
        startTime/timeScale,
        columns,
        smoothness,
        extrapolation,
        shiftTime/timeScale,
        if smoothness == Modelica.Blocks.Types.Smoothness.LinearSegments then timeEvents elseif smoothness == Modelica.Blocks.Types.Smoothness.ConstantSegments then Modelica.Blocks.Types.TimeEvents.Always else Modelica.Blocks.Types.TimeEvents.NoTimeEvents,
        if tableOnFile then verboseRead else false) "External table object";
  discrete SI.Time nextTimeEvent(start=0, fixed=true)
    "Next time event instant";
  discrete Real nextTimeEventScaled(start=0, fixed=true)
    "Next scaled time event instant";
  Real timeScaled "Scaled time";


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
      y_column:=strTemp;
      //columns[1]:=i;
    else
      iDelim:=Strings.find(strTemp, strDelim);
      //y_column:=Strings.substring(strTemp,1,iDelim-1);
      arrColumns[i]:=Strings.substring(strTemp,1,iDelim-1);
      strTemp:=Strings.substring(strTemp,iDelim+1,Strings.length(strTemp));
      /*if(y_column==nmVar)then
        columns[1]:=i;
      else
        columns[1]:=columns[1];
      end if;
      */
      //Streams.print(String(iDelim));
      //Streams.print(strTemp);
    end if;
    Streams.print(arrColumns[i]);
    //Streams.print("");
  end for;
  y_column:=strVar;
  //columns[1]:=4;
  //columns[1]:=FluidSystemComponents.Utilities.f_indexByName00(arrColumns, strVar);
  Streams.print("-----");
  Streams.print(y_column);
  Streams.print("-----");
  
//*****************************************************************
algorithm
  when(time==0)then
    iDelim:=iDelim;
    strTemp:=strTemp;
    y_column:=y_column;
    
    for i in 1:nColumns loop
      arrColumns[i]:=arrColumns[i];
    end for;
    
  end when;
  

//*****************************************************************
equation
  /*when(time>0)then
    Streams.print("when clause, time>0");
    Streams.print(y_column);
  end when;
  */
  //--------------------
  if tableOnFile then
    assert(tableName <> "NoName",
      "tableOnFile = true and no table name given");
  else
    assert(size(table, 1) > 0 and size(table, 2) > 0,
      "tableOnFile = false and parameter table is an empty matrix");
  end if;

  if verboseExtrapolation and (
    extrapolation == Modelica.Blocks.Types.Extrapolation.LastTwoPoints or
    extrapolation == Modelica.Blocks.Types.Extrapolation.HoldLastPoint) then
    assert(noEvent(time >= t_min), "
Extrapolation warning: Time (=" + String(time) + ") must be greater or equal
than the minimum abscissa value t_min (=" + String(t_min) + ") defined in the table.
", level=AssertionLevel.warning);
    assert(noEvent(time <= t_max), "
Extrapolation warning: Time (=" + String(time) + ") must be less or equal
than the maximum abscissa value t_max (=" + String(t_max) + ") defined in the table.
", level=AssertionLevel.warning);
  end if;

  timeScaled = time/timeScale;
  when {time >= pre(nextTimeEvent), initial()} then
    nextTimeEventScaled = Internal.getNextTimeEvent(tableID, timeScaled);
    nextTimeEvent = if nextTimeEventScaled < Modelica.Constants.inf then nextTimeEventScaled*timeScale else Modelica.Constants.inf;
  end when;
  if smoothness == Modelica.Blocks.Types.Smoothness.ConstantSegments then
    for i in 1:nout loop
      y[i] = p_offset[i] + Internal.getTimeTableValueNoDer(tableID, i, timeScaled, nextTimeEventScaled, pre(nextTimeEventScaled));
    end for;
  elseif smoothness == Modelica.Blocks.Types.Smoothness.LinearSegments then
    for i in 1:nout loop
      y[i] = p_offset[i] + Internal.getTimeTableValueNoDer2(tableID, i, timeScaled, nextTimeEventScaled, pre(nextTimeEventScaled));
    end for;
  else
    for i in 1:nout loop
      y[i] = p_offset[i] + Internal.getTimeTableValue(tableID, i, timeScaled, nextTimeEventScaled, pre(nextTimeEventScaled));
    end for;
  end if;
  
  //*****************************************************************
  annotation(
    defaultComponentName = "combiTimeTable",
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Polygon(lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}), Line(points = {{-80, 68}, {-80, -80}}, color = {192, 192, 192}), Line(points = {{-90, -70}, {82, -70}}, color = {192, 192, 192}), Polygon(lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{90, -70}, {68, -62}, {68, -78}, {90, -70}}), Rectangle(lineColor = {255, 255, 255}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-48, -50}, {2, 70}}), Line(points = {{-48, -50}, {-48, 70}, {52, 70}, {52, -50}, {-48, -50}, {-48, -20}, {52, -20}, {52, 10}, {-48, 10}, {-48, 40}, {52, 40}, {52, 70}, {2, 70}, {2, -51}})}));

end CombiTimeTable1VarByName00;
