include <../OpenSCADdesigns/MakeInclude.scad>
include <opposingToolCommon.scad>
include <tool.scad>
use <toolExterior.scad>
use <bearingPlug.scad>
include <washerRecess.scad>
include <insetTool.scad>

module noBearingOpposingTool()
{
  echo("noBearingOpposingTool()");

  tool()
  {
    difference()
    {
      toolExterior(
        bodyOD=bodyOD,
        bodyZ=opposingToolBodyZ,
        bodyTopSurfaceOD=bodyTopSurfaceOD
      );

      bearingOuterRaceInsideRecess(
        bearingSurfaceTopZ=opposingToolBodyZ
      );
    }
    
    bearingPlug(opposingToolBodyZ-1, opposingToolBodyZ);
  }
}

module bearingOuterRaceInsideRecess(bearingSurfaceTopZ)
{
  chamferZ = 1;
  translate([0,0,bearingSurfaceTopZ-chamferZ+nothing])
    cylinder(
      d2=bearingOuterRaceSurfaceID,
      d1=bearingOuterRaceSurfaceID-2*chamferZ,
      h=chamferZ);
}