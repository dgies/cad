# ---
# jupyter:
#   jupytext:
#     formats: ipynb,py:light
#     text_representation:
#       extension: .py
#       format_name: light
#       format_version: '1.5'
#       jupytext_version: 1.18.1
#   kernelspec:
#     display_name: Python 3 (ipykernel)
#     language: python
#     name: python3
# ---

# +
from datetime import datetime
from types import SimpleNamespace
from timeit import default_timer as timer
start = timer()

import pprint as pp
import cadquery as cq
from jupyter_cadquery import show, set_defaults, open_viewer, Camera
from jupyter_cadquery.replay import enable_replay, disable_replay, reset_replay, get_context, replay, Replay, _CTX


cv = open_viewer("Box", cad_width=780, height=525)
set_defaults(reset_camera=Camera.RESET, show_parent=False, axes=True, axes0=True)

use_replay = True
if use_replay:
    enable_replay(show_bbox=False, warning=False)
    reset_replay()
    show_object = replay
else:
    disable_replay()
    show_object = show

m = SimpleNamespace()
# Measurements:
m.shelf_width=88# Shelf width 88mm
# Height 177mm
# Rail thickness 44.6mm
m.radius = 120 # Rail Internal radius 120mm
m.shelf_radius = m.radius - m.shelf_width # Shelf Internal radius = 32mm
m.base_ext = 60
# Saucer diameter 6"
# Saucer foot diameter 3.25"


print(f"Initialized jupyter_cadquery with replay in {timer() - start}")

# +
# Sketch Base:

# Close
# Fillet corners?

base = (
        cq.Workplane("YZ")
        .moveTo(0,m.shelf_radius) # Move (shelf_radius, 0)
        .line(0, -m.base_ext)# Draw (0, -base_ext)
        .line(m.shelf_width, 0) # Draw (shelf_width, 0)
        .line(0, m.base_ext)# Draw (0, base_ext)
        .tangentArcPoint((-m.radius, m.radius))# Arc CCW (radius, 90)
        .line(-m.base_ext, 0)# Draw (-base_ext, 0)
        .line(0, -m.shelf_width)# Draw (0, -shelf_width)
        .line(m.base_ext, 0)# Draw (0, base_ext)
        .tangentArcPoint((m.shelf_radius, -m.shelf_radius))# Arc CW (shelf_radius, 90)
        .close()
)

replay(base)

# +

# Sketch Top:
# Move (shelf_radius, 0)
# Move (0, -base_ext)
# Draw (shelf_width, 0)
# Draw (0, base_ext)
# Arc CCW (radius, 90)
# Draw (-base_ext, 0)
# Draw (0, -shelf_width)
# Arc CCW (base_ext+shelf_radius, 90)
# Close
# Fillet corners?



# +
Loft base to top by height
Fillet edges

Select top face
Import apple logo SVG as path
Apply logo path to top face, align to corner, center, extrude -Z 2mm

Select bottom face
Align to flat side
Draw text "Caffè Macs IL01 Espresso Bar" in font SF Pro Display

For extra credit, find out how to draw it on a curved surface
# -


