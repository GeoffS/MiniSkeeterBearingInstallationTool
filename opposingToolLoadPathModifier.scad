include <common.scad>
include <opposingToolCommon.scad>

module opposingToolLoadPathModifier()
{
  echo(str("opposingToolLoadPathModifier: bodyTopSurfaceOD = ", bodyTopSurfaceOD));

  extraDia = 1;
  difference()
  {
    cylinder(d=bodyTopSurfaceOD + extraDia, h=opposingToolBodyZ);
    tcy([0,0,-1], d=bearingOuterRaceSurfaceID - extraDia, h=200);
  }
}