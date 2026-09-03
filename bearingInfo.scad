// // 6003:
// bearingID = 17.0;
// bearingOD = 35;
// bearingThickness = 10;

include <mm.scad>
// 1623:
bearingID = 5/8 * mm;
bearingOD = (1 + 3/8) * mm;
bearingThickness = 7/16 * mm;

plugLen = bearingThickness + 4;

echo("bearingInfo.scad:");
echo(str("   bearingID = ", bearingID, " mm"));
echo(str("   bearingOD = ", bearingOD, " mm"));
echo(str("   bearingThickness = ", bearingThickness, " mm"));