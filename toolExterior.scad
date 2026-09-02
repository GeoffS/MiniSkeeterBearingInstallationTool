include <common.scad>

module toolExterior(
  bodyOD,
  bodyZ,
  bodyTopSurfaceOD)
{
  echo(str("toolExterior: bodyOD = ", bodyOD));
  echo(str("toolExterior: bodyZ = ", bodyZ));
  echo(str("toolExterior: bodyTopSurfaceOD = ", bodyTopSurfaceOD));

  bodyTopChamferZ = 10; //(bodyOD-bodyTopSurfaceOD)/2;
  echo(str("bodyTopChamferZ = ", bodyTopChamferZ));

  // Bottom extension to big washer:
  translate([0,0,-0]) cylinder(d=bigWasherOD, h=toolExteriorWasherODZ+1);
  // Bottom chamfer:
  // #translate([0,0,+toolExteriorWasherODZ]) cylinder(d1=bodyOD-2*bottomChamfer, d2=bodyOD, h=bottomChamfer);
  cz = 3;
  translate([0,0,1]) cylinder(d1=bodyOD-2*cz, d2=bodyOD, h=cz);
  // Main body cylinder:
  translate([0,0,bottomChamfer+toolExteriorWasherODZ]) cylinder(d=bodyOD, h=bodyZ-bodyTopChamferZ-bottomChamfer-toolExteriorWasherODZ);
  // Top chamfer:
  translate([0,0,bodyZ-bodyTopChamferZ])
    cylinder(d1=bodyOD, d2=bodyTopSurfaceOD, h=bodyTopChamferZ);
}