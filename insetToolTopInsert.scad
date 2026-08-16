include <common.scad>
include <washerInfo.scad>

module insetToolTopInsert()
{
    difference()
    {
        cylinder(d=bigWasherOD+0.3, h=mediumWasherZ-0.1);
        tcy([0,0,-1], d=mediumWasherOD+0.1, h=100);
    }
}