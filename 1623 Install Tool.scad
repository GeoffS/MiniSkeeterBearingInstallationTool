include <../OpenSCADdesigns/MakeInclude.scad>
include <../OpenSCADdesigns/Hardware.scad>

include <insetToolCommon.scad> // for boltHeadRecessZ

use <insetTool.scad>
use <noBearingOpposingTool.scad>
use <bearingOpposingTool.scad>
use <opposingToolLoadPathModifier.scad>

makeNoBearingOpposingTool = false;
makeInsetTool = false;
makeInsetToolLoadPathModifier = false;
makeBearingOpposingTool = false;
makeOpposingToolLoadPathModifier = false;

module clip(delta=0)
{
	tc([-200, -400-delta, -100], 400);
}

if(developmentRender)
{
  // display() bearingOpposingTool();
  // displayGhost() opposingToolLoadPathModifier();

  translate([-60,0,0]) 
  {
    display() bearingOpposingTool();
    // displayGhost() opposingToolLoadPathModifier();
  }

  translate([0,0,0]) 
  {
    display() noBearingOpposingTool();
    // displayGhost() opposingToolLoadPathModifier();
  }

  translate([ 60,0,0])
  {
    display() insetTool();
    displayGhost() insetToolLoadPathModifier();
  }
}
else
{
  if(makeInsetTool) insetTool();
  if(makeInsetToolLoadPathModifier) insetToolLoadPathModifier();

  if(makeBearingOpposingTool) bearingOpposingTool();
	if(makeNoBearingOpposingTool) noBearingOpposingTool();
  if(makeOpposingToolLoadPathModifier) opposingToolLoadPathModifier();
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
