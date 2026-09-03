include <../OpenSCADdesigns/MakeInclude.scad>
include <washerInfo.scad>

chamferZ = 1.5;
chamferLen = 2;

include <bearingInfo.scad>
bearingOuterRaceSurfaceOD = bearingOD - 1;
bearingOuterRaceSurfaceID = bearingOD - 6;

// boltHoleDia = 11.2; // 7/16" bolt
boltHoleDia = 9.6; // 3/8" bolt

bodyOD = bigWasherOD + 2*chamferLen;

bottomChamfer = 1;

toolExteriorWasherODZ = 3;