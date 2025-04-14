within FluidSystemComponents.Visualizers;

model ShowValueRefArrAndKey
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter String keyString = "" "";
  replaceable String stringVector[:] "";
  replaceable Real varVector[:] "";
  
  parameter Integer sigDigits = 4;
  
  //----------------------------------------
  // variables
  //----------------------------------------
  Real value;
  Integer indexValue;
  
equation
  //-------------------------
  indexValue = FluidSystemComponents.Utilities.f_indexByName00(stringVector, keyString);
  //-------------------------
  value = varVector[indexValue];
  
  annotation(
    defaultComponentName = "ShowVariableFromArr",
    Diagram,
    Icon(graphics = {Rectangle(fillColor = {235, 235, 235}, fillPattern = FillPattern.Solid, borderPattern = BorderPattern.Raised, extent = {{-100, 40}, {100, -40}}), Text(origin = {0, 2}, extent = {{-160, 20}, {160, -20}}, textString = DynamicSelect("0.0", String(value, sigDigits, 0, true))), Text(origin = {0, 60}, extent = {{-100, 10}, {100, -10}}, textString = "%name"), Text(origin = {0, -60}, extent = {{-100, 10}, {100, -10}}, textString = "%keyString")}, coordinateSystem(extent = {{-100, -80}, {100, 80}})));
end ShowValueRefArrAndKey;
