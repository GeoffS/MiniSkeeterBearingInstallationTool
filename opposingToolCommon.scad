include <common.scad>
include <rimInfo.scad>

opposingToolBodyZ = 6 + 16 + 2 + 2 - bigWasherZ - mediumWasherZ;

bodyTopSurfaceOD = rimCenterOD;

bearingCavityOD = bearingOD - 1;
bearingCavityZ = bearingThickness - 3;