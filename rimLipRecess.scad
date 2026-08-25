include <../OpenSCADdesigns/MakeInclude.scad>
include <../OpenSCADdesigns/torus.scad>
include <bearingInfo.scad>

module rimLipRecess(bearingSurfaceTopZ)
{
  echo("rimLipRecess():");

  // rimLipRecessOD = 1.64 * mm;
  echo(str("   rimLipRecessOD = ", rimLipRecessOD));

  // rimLipZ = 0.15 * mm;
  echo(str("   rimLipZ = ", rimLipZ));

  translate([0,0,bearingSurfaceTopZ-rimLipZ-0.5])
  {
    translate([0,0,]) torus(ID=bearingOD, OD=rimLipRecessOD);
    difference()
    {
      cylinder(d=rimLipRecessOD, h=rimLipZ+1);
      tcy([0,0,-1], d=bearingOD, h=rimLipZ+2);
    }
  }
}