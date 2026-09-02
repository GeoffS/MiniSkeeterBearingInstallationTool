include <printParams.scad>
include <insetToolCommon.scad>

washerRecessCenterOffsetZ = mediumWasherZ + 0.2;

module washerRecess()
{
    difference()
    {
      translate([0,0,-1]) cylinder(d=bigWasherOD+0.1, h=insertRecessZ+1);
      tcy([0,0,washerRecessCenterOffsetZ], d=bigWasherID-0.1, h=100);
    }
}

module washerRecessSacrificialLayer()
{
    tcy([0,0,washerRecessCenterOffsetZ], d=14, h=sacrificialLayerZ);
}