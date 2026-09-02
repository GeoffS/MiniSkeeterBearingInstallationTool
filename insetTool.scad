include <../OpenSCADdesigns/chamferedCylinders.scad>
include <boltInfo.scad>
include <printParams.scad>
use <toolExterior.scad>
include <bearingPlug.scad>
include <insetToolCommon.scad>
include <common.scad>
include <washerRecess.scad>
use <tool.scad>

bodyTopZ = 25 - insertRecessZ;
bearingSurfaceTopZ = bodyTopZ+2;

module insetTool()
{
  echo("insetTool()");
  echo(str("insetTool(): bodyOD = ", bodyOD));
  echo(str("insetTool(): bodyTopZ = ", bodyTopZ));

  tool()
  {
    toolExterior(
        bodyOD=bodyOD,
        bodyZ=bodyTopZ,
        bodyTopSurfaceOD=bearingOuterRaceSurfaceOD
    );

    bearingSurface(
      bearingSurfaceTopZ=bearingSurfaceTopZ,
      bearingOuterRaceSurfaceOD=bearingOuterRaceSurfaceOD,
      bearingOuterRaceSurfaceID=bearingOuterRaceSurfaceID
    );

    plugLen = 2*bearingThickness + 4;
    bearingPlug(bodyTopZ, bearingSurfaceTopZ, plugLen);
  }
}

module bearingSurface(
    bearingSurfaceTopZ,
    bearingOuterRaceSurfaceOD,
    bearingOuterRaceSurfaceID
  )
{
  echo(str("bearingSurface: bearingSurfaceTopZ = ", bearingSurfaceTopZ));
  difference()
  {
    // Bearing contact:
    translate([0,0,10]) cylinder(d=bearingOuterRaceSurfaceOD, h=bearingSurfaceTopZ-10);

    // Remove inside bearing rim:
    chamferZ = bearingOuterRaceSurfaceID/2;
    translate([0,0,bearingSurfaceTopZ-chamferZ+nothing])
      cylinder(d2=bearingOuterRaceSurfaceID, d1=0, h=chamferZ);
  }
}

module insetToolLoadPathModifier()
{
  extraDiaOutside = 1.5;
  extraDiaInside = 4;

  // The section that supports the inset contact ring:
  difference()
  {
    cylinder(d=bearingOuterRaceSurfaceOD, h=bearingSurfaceTopZ);
    tcy([0,0,-1], d=bearingOuterRaceSurfaceID, h=200);
  }

  // Keep the larger OD section just below where it would intersect with the conical 
  // exterior to avoid a slicer issue where the taper meets the inset section:
  magicTrimZ = 1.05;
  difference()
  {
    cylinder(d=bearingOuterRaceSurfaceOD + extraDiaOutside, h=bodyTopZ-magicTrimZ);
    tcy([0,0,-1], d=bearingOuterRaceSurfaceID, h=200);
  }

  // The smaller ID section can extend up to the inside flat surface:
  difference()
  {
    cylinder(d=bearingOuterRaceSurfaceOD, h=bodyTopZ);
    tcy([0,0,-1], d=bearingOuterRaceSurfaceID - extraDiaInside, h=200);
  }
}