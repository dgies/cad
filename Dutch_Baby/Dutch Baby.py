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
from math import sin,cos,tan, asin,acos, atan, radians, floor, degrees, sqrt
from datetime import datetime
from types import SimpleNamespace
from timeit import default_timer as timer

import pprint as pp
import cadquery as cq
from jupyter_cadquery import show, set_defaults, open_viewer, Camera
from jupyter_cadquery.replay import enable_replay, disable_replay, reset_replay, get_context, replay, Replay, _CTX

start = timer()
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

print(f"Initialized jupyter_cadquery with replay {datetime.now()}")


# +
m = SimpleNamespace()
m.width = 90
m.height = 140
m.thickness = 2.5
m.hole_size = 10
m.hole_boss = 5
m.hole_offset = 5
m.radius = 10
m.text = [
    "DUTCH BABY",
    "Skillet in oven",
    "Conv bake 425°F",
    "4 eggs",
    "2/3 C milk",
    "1/4 tsp salt",
    "1/4 tsp vanilla",
    "2/3 C AP flour",
    "1 ounce hard fat",
    "15min"
]
m.fontsize = 10
m.h_padding = m.fontsize/2

m.depth=-1.0
m.font = "Arial.ttf"
m.fontface = 'bold'



print(f"Building from model {m} in {timer() - start}")

# +
s = (
        cq.Workplane("XY")
        .lineTo(m.width/2, 0)
        .lineTo(m.width/2, m.height)
        .lineTo(0, m.height)
        .close()
        .mirrorY()
)
# box1 = cq.Workplane("YZ").placeSketch(s)
body = s.extrude(m.thickness).edges("|Z").fillet(m.radius)

show(body)

# +
holed = (
    body
    .faces(">Z")
    .workplane()
    .center(0,m.height)
    # .cylinder(m.thickness, m.hole_size+2*m.hole_boss, centered=(True, True, False))
    .circle((m.hole_size/2+m.hole_boss))
    .extrude(-m.thickness)
    .faces(">Z")
    .workplane()
    .hole(m.hole_size)
)

replay(holed)

# +
written = (
    holed
        .faces(">Z")
        .workplane()
        .center(0,- 1.5*m.fontsize) # spacing at top
        .text(m.text[0], fontsize=m.fontsize*1.1, distance=m.depth, fontPath=m.font,
         halign="center", valign="center", kind=m.fontface, )
        .center(-m.width/2+m.h_padding, 0) # indent for lines
)

replay(written)

# +
for line in m.text[1:]:
    written = (
        written
        .center(0,- 1.25*m.fontsize) # line feed
        .text(line, fontsize=m.fontsize, distance=m.depth, fontPath=m.font,
         halign="left", valign="center", kind=m.fontface)
    )


replay(written)

# +

written.val().exportStl("Dutch Baby.stl", ascii=False)

print(f"Built from model {pp.pp(m)} in {timer() - start}")
# -




