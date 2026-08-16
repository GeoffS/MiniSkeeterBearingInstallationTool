include <MakeInclude.scad>

bearingOD = 35.5;
bearingPocketZ = 10;

boltHoleDia = 27;

jigZ = 81;

module itemModule()
{
    difference()
    {
        cylinder(d=44, h=jigZ);
        tcy([0,0,-1], d=boltHoleDia, h=100);

        tcy([0,0,-1], d=bearingOD, h=bearingPocketZ+1);
        tcy([0,0,jigZ-bearingPocketZ], d=bearingOD, h=bearingPocketZ+1);
    }
    tcy([0,0,bearingPocketZ], d=bearingOD-2, h=0.25);
}

module clip()
{
	tc([-200, -400, -10], 400);
}

if(developmentRender)
{
	difference()
	{
		itemModule();
		clip();
	}
}
else
{
	itemModule();
}
