include <../OpenSCADdesigns/MakeInclude.scad>
include <common.scad>
include <../OpenSCADdesigns/chamferedCylinders.scad>

perimeterWidth = 0.40;

boltHoleDia1 = boltHoleDia; //+0.4;

toolTopExteriorZ = bigWasherZ + mediumWasherZ + toolExteriorWasherODZ + bottomChamfer; // - 0.1; //-0.2;

module toolTopExterior()
{
    difference()
    {
        simpleChamferedCylinder(d = bodyOD, h = toolTopExteriorZ, cz = 1.3);

        chamferLowerDia = 40;
        translate([0,0,-0.65]) cylinder(d2=chamferLowerDia, d1=chamferLowerDia+10, h=5);

        tcy([0,0,-bigWasherZ], d=bigWasherOD+0.1, h=10);
        tcy([0,0,-30], d=mediumWasherOD+0.1, h=50);

        // Trim a bit off the top to eliminate the sharp (unprintable) point:
        tcy([0,0,-100+0.45], d=100, h=100);
    }
    
}

module toolTopInsert()
{
    difference()
    {
        union()
        {
            bigWasherOffestZ = bigWasherZ-0.1;
            cylinder(d=bigWasherID, h=bigWasherOffestZ);
            tcy([0,0,bigWasherOffestZ], d=mediumWasherID, h=mediumWasherZ);
        }

        echo(str("smallWasherID-boltHoleDia1 = ", mediumWasherID-boltHoleDia1));
        tcy([0,0,-1], d=boltHoleDia1, h=10);
    }
}