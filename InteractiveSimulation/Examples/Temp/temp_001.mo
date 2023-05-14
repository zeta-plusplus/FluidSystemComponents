within FluidSystemComponents.InteractiveSimulation.Examples.Temp;

model temp_001
  extends Modelica.Icons.Example;
  Real x;
  temp tempComp annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  x= tempComp.Placement;
end temp_001;
