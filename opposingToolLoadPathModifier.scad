include <common.scad>
include <opposingToolCommon.scad>
include <rimInfo.scad>

module opposingToolLoadPathModifier()
{
  echo("opposingToolLoadPathModifier()");

  echo(str("   bodyTopSurfaceOD = ", bodyTopSurfaceOD));

  maxWasherOD = 28; // Maximum dia. of the washer is shifted to one side.
  bottomOD = maxWasherOD + 5;

  echo(str("   bodyOD = ", bodyOD));

  intersection()
  {
    difference()
    {
      modiferBodyZ = opposingToolBodyZ + nothing;
      tapperedZ = modiferBodyZ-9;
      union()
      {
        cylinder(d1=bottomOD, d2=bodyOD, h=tapperedZ+nothing);
        tcy([0,0,tapperedZ], d=bodyOD, h=modiferBodyZ-tapperedZ);
      }
      modifierInsideTopOD = (bearingCavityOD+rimLipRecessOD)/2;
      modifierInsideTaperZ = 17.5;
      cylinder(d1=0, d2=modifierInsideTopOD, h=modifierInsideTaperZ+nothing);
      tcy([0,0,modifierInsideTaperZ], d=modifierInsideTopOD, h=30);
    }
    children(); // The tool the modifier is intended to work with.
  }
}