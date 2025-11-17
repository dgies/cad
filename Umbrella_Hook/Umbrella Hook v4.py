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

# # Umbrella Hook v4
#
# ## Key Facts
#
# * Beam is 16mm w x 24mm tall at 12.5º angle
# * Wing overhang 18mm-> 32mm
#
# | Dimension   | value |
# | ----------- | ----- |
# | hook_length = 48
# | beam_width  = 16
# | beam_height = 24
# | beam_angle  = 12.5
#

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
m = SimpleNamespace()
m.hook_length = 48	
m.beam_width = 16	
m.beam_height = 24	
m.beam_angle = 12.500	
m.drop = m.hook_length*sin(radians(m.beam_angle)) # positive
m.reach = m.hook_length*cos(radians(m.beam_angle))
m.body_thickness_far = 8
m.body_thickness_near = m.body_thickness_far + 0.5*m.drop
m.wing_thickness = 8
m.wing_drop_near = m.beam_height * 1.333
m.wing_drop_far = m.beam_height * 0.6667
m.wing_height_near = m.body_thickness_near + m.wing_drop_near
m.wing_height_far  = m.body_thickness_far + m.wing_drop_far
m.edge_fillet = 0.5
m.wing_drop = m.wing_drop_near - m.wing_drop_far
m.wing_hyp = sqrt(m.wing_drop**2 + m.reach**2)

m.h_ext = 12
m.scale_jaw = (m.reach - m.h_ext) / m.reach


m.jaw_drop = (m.wing_drop_near + m.drop - m.wing_drop_far)
m.stylish_angle = degrees(atan(m.jaw_drop / m.reach))


print(f"Building from model {m} in {timer() - start}")

# +
# Make the top body
s = (
        cq.Workplane("YZ")
        .moveTo(0,m.body_thickness_near)
        # New
        .polarLine(m.body_thickness_near, -90)
        .polarLine(m.hook_length, m.beam_angle)
        .polarLine(m.body_thickness_far, 90)
        .close()

)
# box1 = cq.Workplane("YZ").placeSketch(s)
right_body = s.extrude(m.beam_width/2)

replay(right_body)


# +
# make bumps under body
bump = SimpleNamespace()
bump.height = 1.5
bump.width = 3
bump.gap = 4
bump.pitch = bump.width + bump.gap
bump.count = floor(m.hook_length / bump.pitch)
m.bump = bump

pp.pp(m)
right_body = (
    right_body.faces("<Z").workplane(centerOption="CenterOfMass")
        .rarray(0, m.bump.pitch, 1, m.bump.count, True)
        .box(m.beam_width/2,m.bump.width,m.bump.height)
)
replay(right_body)

# +
# Make a wing
right_wing = (
    right_body.faces(">X").vertices("<YZ").workplane(centerOption="CenterOfMass")
    .moveTo(0,m.body_thickness_near)
    .polarLine(m.wing_height_near, -90) # down
    .line(m.reach, m.wing_drop_near + m.drop - m.wing_drop_far) # diag to far
    .polarLine(m.wing_height_far, 90) # up
    .close()

)

right_wing = (
    right_wing
    .extrude(m.wing_thickness)
    .edges(">(0, -1, 1)").fillet(m.edge_fillet) # top near
    .edges(">(0, 1, 1)").fillet(m.edge_fillet) # top far
    # .edges(">(1, 0, 1)").fillet(m.edge_fillet)
)
    
replay(right_wing)
# Mirror in YZ plane before finishing on right wing
left_wing = right_wing.mirror(mirrorPlane="YZ", basePointVector=(0, 0, -30))

# +

h_padding = 2
v_padding = -0.5
fontsize = 7
depth=-1.5
signed_right_wing = (
    right_wing
        .faces(">X[-2]")
        .workplane()
        .center(-h_padding ,-v_padding)
        .transformed(offset=cq.Vector(0, -0, 0.0), rotate=cq.Vector(0, 0, -m.beam_angle))
        .text(f"DFG {str(datetime.now().year)}", fontsize=fontsize, distance=depth, fontPath="Arial.ttf",
         halign="right", valign="top", kind="bold")
)
signed_right_wing = (
    signed_right_wing
    .edges(">(0, -1, -1)").fillet(m.edge_fillet) # bottom near
    .edges(">(0, 1, -1)").fillet(m.edge_fillet) # bottom far
    .edges(">(1, -1, 0)").fillet(m.edge_fillet) # right face
)

replay(signed_right_wing)

# +
# make left wing from right+jaw


left_wing = (
    right_wing
    .mirror(mirrorPlane="YZ", basePointVector=(0, 0, -30))
    # select left face bottom corner
    .faces("<X").vertices("<Z").workplane(centerOption="CenterOfMass")
    # draw the jaw with line segments
    .line(-m.scale_jaw*m.reach, -m.scale_jaw*(m.wing_drop_near + m.drop - m.wing_drop_far)) # diag to far
    .polarLine(m.h_ext, -180) # jaw out
    .polarLine(m.wing_thickness, 90) # up    
    .polarLine(m.h_ext, 0) # jaw back
    .polarLine(0.35*m.scale_jaw*m.reach, m.stylish_angle)
    .polarLine(0.35*m.scale_jaw*m.reach, 55)
    .polarLine(0.05*m.scale_jaw*m.reach, 90)
    .polarLine(0.35*m.scale_jaw*m.reach, 125)
    .close()
).extrude(-m.wing_thickness)

# fillet completed faces
left_wing = (
    left_wing
    .edges(">( -1, -0.2, 1)").fillet(m.edge_fillet) # left non-bottom edges
    .faces(">(0,-1, -1)").fillet(m.edge_fillet) # main jaw bottom
    .faces(">(0, 0, -1)").fillet(m.edge_fillet) # jaw ext bottom
    # .edges(">( 0, -1, -1)").fillet(m.edge_fillet) # near  bottom
    # .edges(">( 0,  1, -1)").fillet(m.edge_fillet) # far bottom
    # .edges(">(-1, -0, -1)").fillet(m.edge_fillet) # bottom-far-left (interfere tooth)
)

# build the tooth
left_wing = (
    left_wing
    .faces("+Z").workplane(centerOption="CenterOfMass")
    .center(0,2)
    .rect(8,8)
    .workplane(offset=12)
    .center(0,-2)
    .rect(4,2)
    .loft(combine=True)
)

replay(left_wing)

# +

body = signed_right_wing.union(left_wing)
replay(body)


# +

body.val().exportStl("Umbrella Hook v4.stl", ascii=True)

print(f"Total time: {timer()-start}")
# -




