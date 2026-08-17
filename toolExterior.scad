include <common.scad>
include <../OpenSCADdesigns/chamferedCylinders.scad>

module toolExterior(
  bodyOD,
  bodyZ,
  bodyTopSurfaceOD)
{
  echo("toolExterior():")
  echo(str("   bodyOD = ", bodyOD));
  echo(str("   bodyZ = ", bodyZ));
  echo(str("   bodyTopSurfaceOD = ", bodyTopSurfaceOD));

  bodyTopChamferZ = 10; //(bodyOD-bodyTopSurfaceOD)/2;
  echo(str("   bodyTopChamferZ = ", bodyTopChamferZ));

  cz = 3;
  simpleChamferedCylinderDoubleEnded(d=bodyOD, h=bodyZ-bodyTopChamferZ+cz, cz=cz);
  
  // Top chamfer:
  translate([0,0,bodyZ-bodyTopChamferZ])
    cylinder(d1=bodyOD, d2=bodyTopSurfaceOD, h=bodyTopChamferZ);
}