include <../OpenSCADdesigns/MakeInclude.scad>
include <../OpenSCADdesigns/torus.scad>
include <bearingInfo.scad>

module rimLipRecess(bearingSurfaceTopZ)
{
  echo("rimLipRecess():");

  echo(str("   rimLipRecessOD = ", rimLipRecessOD));
  echo(str("   rimLipZ = ", rimLipZ));

  translate([0,0,bearingSurfaceTopZ-rimLipZ-0.5])
  {
    translate([0,0,]) torus(ID=bearingCavityOD, OD=rimLipRecessOD);
    difference()
    {
      cylinder(d=rimLipRecessOD, h=rimLipZ+1);
      tcy([0,0,-1], d=bearingCavityOD, h=rimLipZ+2);
    }
  }
}