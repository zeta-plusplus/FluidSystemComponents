within FluidSystemComponents.Utilities;

block StringExpression00 "Set output signal to String expression"

  FluidSystemComponents.Interfaces.StringOutput y="" "Value of String output"
    annotation (Dialog(group="output signal"), Placement(
        transformation(extent={{100,-10},{120,10}})));

  annotation (
    defaultComponentName = "StringExpression",
        Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,40},{100,-40}},
          fillColor={235,235,235},
          fillPattern=FillPattern.Solid,
          borderPattern=BorderPattern.Raised),
        Text(
          extent={{-96,15},{96,-15}},
          textString="%y"),
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          textColor={0,0,255})}), Documentation(info="<html>
</html>"));

end StringExpression00;
