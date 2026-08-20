# MiniSkeeterBearingInstallationTool

## Important TBD:
This design depends on the 'OpenSCADdesigns' library that is proprietary to _Performance Sailing Products_.
It needs to be refactored to the use the FOSS replacement 'OpenSCAD_Lib' library (https://github.com/GeoffS/OpenSCAD_Lib).

See Issue: https://github.com/GeoffS/Bearing-Installation-Tool/issues/2

## Introdction:
The top-level project file to open with the OpenSCAD compiler/renderer is: `1623 Install Tool.scad`.

It has only been tested with the OpenSCAD 2026-08-13 nightly build.

## Build:
`python ..\OpenSCADdesigns\makeStls.py -osc "C:\tools\OpenSCAD-2026.08.13-x86-64\openscad.exe" '.\1623 Install Tool.scad'`