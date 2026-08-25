include <../OpenSCADdesigns/MakeInclude.scad>
include <opposingToolCommon.scad>
include <tool.scad>
use <toolExterior.scad>
use <bearingPlug.scad>
include <washerRecess.scad>
include <insetTool.scad>
include <rimLipRecess.scad>

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

      rimLipRecess(
        bearingSurfaceTopZ=opposingToolBodyZ
      );
    }
    
    plugLen = bearingThickness + 4;
    bearingPlug(opposingToolBodyZ-1, opposingToolBodyZ, plugLen);
  }
}

module bearingOuterRaceInsideRecess(bearingSurfaceTopZ)
{
  recessZ = 1;
  recessOD = bearingOD + 2;

  translate([0,0,bearingSurfaceTopZ-recessZ+nothing])    
      cylinder(
        d=recessOD,
        h=recessZ);
}