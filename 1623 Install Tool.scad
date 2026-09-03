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
makeBearingOpposingTool = false;
makeOpposingToolLoadPathModifier = false;
makeToolTopExterior = false;
makeToolTopInsert = false;

module clip(delta=0)
{
	// tc([-200, -400+delta, -100], 400);

  if(delta != 0)
  {
    tc([-200, -400, -100], 400);
  }
  else
  {
    tc([-200, -400+3, -100], 400);
  }

  // tc([-200, -400, -100], 400);
}

if(developmentRender)
{
  // display() bearingOpposingTool();
  // displayGhost() opposingToolLoadPathModifier();

  translate([-60,0,0]) 
  {
    display() bearingOpposingTool();
    displayGhost() opposingToolLoadPathModifier() noBearingOpposingTool();
  }

  translate([0,0,0]) 
  {
    display() noBearingOpposingTool();
    displayGhost() opposingToolLoadPathModifier() noBearingOpposingTool();
  }

  translate([ 60,0,0])
  {
    display() insetTool();
    displayGhost() insetToolLoadPathModifier();
  }

  translate([ 120,0,0])
  {
    display() toolTopExterior();
  }

  translate([ 120,0,0])
  {
    display() toolTopInsert();
  }

  // translate([0,0,0]) 
  // {
  //   displayGhost() noBearingOpposingTool();
  //   display() opposingToolLoadPathModifier();
  // }
}
else
{
  if(makeInsetTool) insetTool();
  if(makeInsetToolLoadPathModifier) insetToolLoadPathModifier();

  if(makeBearingOpposingTool) bearingOpposingTool();
	if(makeNoBearingOpposingTool) noBearingOpposingTool();
  if(makeOpposingToolLoadPathModifier) opposingToolLoadPathModifier()  noBearingOpposingTool();
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
