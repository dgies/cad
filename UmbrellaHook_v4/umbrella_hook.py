# import openscad
from solid2 import cube, text, cylinder, set_global_fn, rotate, translate

# set the number of faces for curved shapes
set_global_fn(100)

X=[1,0,0]
Y=[0,1,0]
Z=[0,0,1]
beam_width=16
beam_height=24
beam_length=400
beam_angle=12.5

beam = cube(beam_width, beam_length, beam_height)
beam = beam.translate(-0.5*beam_width, -0.5*beam_length, -beam_height)
beam = beam.rotate(a=beam_angle, v=X)
beam = beam.color("#82643E")
beam = beam.background()

model = beam

model.save_as_scad()