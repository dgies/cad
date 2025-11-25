# dgies' CAD Projects 
A collection of code-as-cad personal projects.

## Dutch Baby
Recipe placard with hanger hook, modeled in CadQuery

## iMac Bridge
Uses SolidPython to generate a 'bridge' for holding a variable number of circular beams at a regular horizontal spacing.
The `make_beam` method could be reused in other projects for parametric beams.
Run with `python3 bridge.py` to generate a SCAD file, then load that into OpenSCAD to generate STL

_Named because it was designed to hold dowels to hang little toy iMacs for painting with primer._

## Soap Dish
Closed-type soap dish with drain hole implemented in SolidPython

## Triangle Soap Dish
Open-type soap dish shaped as isosceles right triangle for use on triangular shower shelves.  
Implemented in CadQuery and stored in a Jupyter notebook for interactive debugging. 

## Umbrella Hook
Iterative project to design the perfect lamp hook for Treasure Garden patio umbrellas.
Versions 1-3 are modeled in traditional CAD.
* V1 FreeCAD: Unusable because jaw is too small
* V2 FreeCAD: Stress concentration at jaw attachment
* V3 TinkerCAD: Jaw is ugly, closed tool
* V4 CadQuery: Redesign of V2 with stress relief and angled tooth