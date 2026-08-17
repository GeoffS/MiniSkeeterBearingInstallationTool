include <common.scad>
include <bearingInfo.scad>

nub = 0.4;
nubDia = 2;
nubAngles = [0, 120, 240];

plugOD = bearingID - 2*nub;
plugChamferZ = 2;
plugEndChamferZ = 1;

module bearingPlug(baseZ, bearingSurfaceZ, plugLen)
{
  echo("bearingPlug():")
  echo(str("   baseZ = ", baseZ));
  echo(str("   bearingSurfaceZ = ", bearingSurfaceZ));
  echo(str("   plugLen = ", plugLen));

  // Top chamfer:
  translate([0,0,bearingSurfaceZ+plugLen]) cylinder(d1=plugOD, d2=plugOD-2*plugEndChamferZ, h=plugEndChamferZ);

  // Main cylinder:
  cylinder(d=plugOD, h=bearingSurfaceZ+plugLen);

  nubZ = 0.47;
  nubAdj = 0.2;
  nubDia1 = nubDia+nubAdj;
  for(a = nubAngles)
  {
    rotate(a, [0,0,1]) translate([bearingID/2-nubDia/2, 0, 0])
    {
      cylinder(d=nubDia1, h=bearingSurfaceZ+plugLen-nubZ);
      translate([0,0,bearingSurfaceZ+plugLen-nubZ]) cylinder(d1=nubDia1, d2=0, h=nubDia/2);
    }
  }
  
  // Chamfer between plg and the base:
  translate([0,0,baseZ-nothing])
  {
    h = chamferZ+2*nothing;
    cylinder(d2=plugOD, d1=plugOD+2*h, h=h);
  }
}