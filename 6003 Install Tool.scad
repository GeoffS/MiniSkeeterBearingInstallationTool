include <../OpenSCADdesigns/MakeInclude.scad>
include <../OpenSCADdesigns/Hardware.scad>

include <insetToolCommon.scad> // for boltHeadRecessZ

use <insetTool.scad>
use <noBearingOpposingTool.scad>
use <bearingOpposingTool.scad>
use <opposingToolLoadPathModifier.scad>
include <toolTop.scad>

makeNoBearingOpposingTool = false;
makeInsetTool = false;
makeInsetToolLoadPathModifier = false;
makeInsetToolTopInsert = false;
makeOpposingTool = false;
makeOpposingToolLoadPathModifier = false;
makeToolTopExterior = false;
makeToolTopInsert = false;

module clip(delta=0)
{
	tc([-200, -400-delta, -100], 400);
}

if(developmentRender)
{
  // display() translate([  0,0,0]) noBearingOpposingTool();
  // display() translate([ 60,0,0]) insetTool();
  // display() translate([-60,0,0]) bearingOpposingTool();

  display() insetTool();
  displayGhost() insetToolLoadPathModifier();

  // offsetX = 0;
  // displayGhost() translate([offsetX,0,4]) mirror([0,0,1]) toolTopExterior();
  // displayGhost() translate([offsetX,0,0]) mirror([0,0,1]) toolTopInsert();
  // displayGhost() translate([offsetX,0,-mediumWasherZ-bigWasherZ]) mediumWasher();
  // displayGhost() translate([offsetX,0,-mediumWasherZ-bigWasherZ]) bigWasher();
}
else
{
  if(makeInsetTool) insetTool();
  if(makeInsetToolLoadPathModifier) insetToolLoadPathModifier();
  if(makeOpposingTool) bearingOpposingTool();
  if(makeOpposingToolLoadPathModifier) opposingToolLoadPathModifier();
	if(makeNoBearingOpposingTool) noBearingOpposingTool();
	if(makeToolTopInsert) toolTopInsert();
	if(makeToolTopExterior) mirror([0,0,1]) toolTopExterior();
}

module mediumWasher()
{
  difference()
  {
    cylinder(d=mediumWasherOD, h=mediumWasherZ);
    tcy([0,0,-2], d=mediumWasherID, h=10);
  }
}

module bigWasher()
{
  difference()
  {
    tcy([0,0,mediumWasherZ], d=bigWasherOD, h=bigWasherZ);
    tcy([0,0,-2], d=bigWasherID, h=10);
  }
}
