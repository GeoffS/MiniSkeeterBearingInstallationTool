// // 6003:
// bearingID = 17.0;
// bearingOD = 35;
// bearingThickness = 10;

// 1623:
mm = 25.4;
bearingID = 5/8 * mm;
bearingOD = (1 + 3/8) * mm;
bearingThickness = 7/16 * mm;

echo("bearingInfo.scad:");
echo(str("   bearingID = ", bearingID, " mm"));
echo(str("   bearingOD = ", bearingOD, " mm"));
echo(str("   bearingThickness = ", bearingThickness, " mm"));