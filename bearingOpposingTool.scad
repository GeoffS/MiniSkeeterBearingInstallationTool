include <opposingToolCommon.scad>
use <toolExterior.scad>
use <tool.scad>
include <washerRecess.scad>

module bearingOpposingTool()
{
  echo("opposingTool()");

  tool()
  {
    toolExterior(
      bodyOD=bodyOD,
      bodyZ=opposingToolBodyZ,
      bodyTopSurfaceOD=bodyOD - 2
    );

    bearingCavityPlug(opposingToolBodyZ);
  }
}

cavityPlugChamferZ = 1;
module bearingCavityPlug(bodyLen)
{
  echo(str("bearingCavityPlug(bodyLen) = ", bodyLen));
  bearingCavityOD = bearingOD - 1;
  bearingCavityZ = bearingThickness - 3;

  cavityCylZ = bodyLen+bearingCavityZ-cavityPlugChamferZ;

  difference()
  {
    union()
    {
      // Top chamfer:
      translate([0,0,cavityCylZ])
        cylinder(d1=bearingCavityOD, d2=bearingCavityOD-2*cavityPlugChamferZ, h=cavityPlugChamferZ);
      // Main body:
      cylinder(d=bearingCavityOD, h=cavityCylZ);
    }
    translate([0,0,bodyLen+bearingCavityZ-boltHoleDia/2-cavityPlugChamferZ])
      cylinder(d1=0, d2=20, h=10);

    
  }
  washerRecessSacrificialLayer();
}