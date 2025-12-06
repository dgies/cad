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
from math import sqrt
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
m.shelf_width = 88 # Shelf width 88mm
m.height = 177 # Height 177mm
# Rail thickness 44.6mm
m.radius = 120 # Rail Internal radius 120mm
m.shelf_radius = m.radius - m.shelf_width # Shelf Internal radius = 32mm
m.base_ext = 30
m.fillet = 3
# Saucer diameter 6"
# Saucer foot diameter 3.25"


print(f"Initialized jupyter_cadquery with replay in {timer() - start}  Model params {m}")

# +
s1 = (
    cq.Sketch()
    .segment((m.shelf_radius,0), (m.shelf_radius, -m.base_ext)) # Move (shelf_radius, 0) # Draw (0, -base_ext)
    .segment( m.shelf_width, 0.0) # Draw (shelf_width, 0)
    .segment(m.base_ext, 90.0)# Draw (0, base_ext)
    .arc( (0,0), m.radius, 0, 90)
    .segment(m.base_ext, 180.0)# Draw (-base_ext, 0)
    .segment(-m.shelf_width, 90.0)# Draw (0, -shelf_width)
    .segment(m.base_ext, 0)# Draw (0, base_ext)
    .arc( (0,0), m.shelf_radius, 0, 90)
    .assemble()
)

replay(s1)

# +

# Sketch Top:
# Fillet corners?
s2 = (    
    cq.Sketch()#, origin=(0,0,m.height))
    .segment( (m.shelf_radius, -m.base_ext), (m.shelf_radius+m.shelf_width, -m.base_ext) ) # Draw (shelf_width, 0)
    .segment(m.base_ext, 90.0) # Draw (0, base_ext)
    .arc( (0,0), m.radius, 0, 90, )  # Arc CCW (radius, 90)
    .segment(m.base_ext, 180.0) # Draw (-base_ext, 0)
    .segment(-m.shelf_width, 90.0) # Draw (0, -shelf_width)
    .arc( (  m.shelf_radius - sqrt(0.5)*(m.shelf_radius+m.base_ext),  m.shelf_radius - sqrt(0.5)*(m.shelf_radius+m.base_ext) ), (m.shelf_radius+0.01*m.shelf_width, -m.base_ext) )
    .close()
    .assemble()# Close
)

replay(s2)


# +
# Loft base to top by height
# Fillet edges

body = cq.Workplane("XY").placeSketch(s1, s2.moved(z=m.height)).loft().fillet(m.fillet)

replay(body)


# +

signed = (
        body
        .faces("<Z")
        .workplane()
        # .center(0.5*m.radius, -0.5*m.radius)
        .transformed(offset=cq.Vector((m.radius-m.base_ext)/2, -1*(m.radius-m.base_ext)/2, 0.0), rotate=cq.Vector(0, 0,225))
        # .cylinder(10,10)
        .text(f"Caffè Macs IL01 Espresso Bar", fontsize=12, distance=-2, 
              # fontPath="Arial.ttf", 
              fontPath="SFPRODISPLAYREGULAR.OTF",
         halign="center", valign="center")
)

replay(signed)
# -

# Select top face
# Import apple logo SVG as path
# Use example https://gist.github.com/dov/8d9b0304ba85e3229aabccac3c6468ef
# Apply logo path to top face, align to corner, center, extrude -Z 2mm
#
# Select bottom face
# Align to flat side
# Draw text "Caffè Macs IL01 Espresso Bar" in font SF Pro Display
#
# For extra credit, find out how to draw it on a curved surface
# +

signed.val().exportStl("Cafe Shelf.stl", ascii=False)

print(f"Built from model {pp.pp(m)} in {timer() - start}")
# -



