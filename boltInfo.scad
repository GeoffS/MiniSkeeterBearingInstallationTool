// 7/16" bolt:
bigBoltHoleDia = 11/2;
bigBoltHeadDia_inch = (5/8)/cos(30);
bigBoltHeadZ = 7.6;

echo(str("bigBoltHeadDia_inch = ", bigBoltHeadDia_inch));
bigBoltHeadDia = bigBoltHeadDia_inch * 25.4;
echo(str("bigBoltHeadDia = ", bigBoltHeadDia));