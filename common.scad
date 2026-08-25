include <../OpenSCADdesigns/MakeInclude.scad>
include <washerInfo.scad>
include <rimInfo.scad>

chamferZ = 1.5;
chamferLen = 2;

include <bearingInfo.scad>
bearingOuterRaceSurfaceOD = bearingOD - 1;
bearingOuterRaceSurfaceID = bearingOD - 6;

// boltHoleDia = 11.2; // 7/16" bolt
boltHoleDia = 3/8 * 25.4 + 0.2; // 3/8" bolt

bodyOD = rimCenterOD + 2; //1.95 * mm + 2; //bigWasherOD + 2*chamferLen;

bottomChamfer = 1;

toolExteriorWasherODZ = 3;