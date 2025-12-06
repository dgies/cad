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
import svgpathtools
from svgpathtools import svg2paths
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

# make tiny to debug position
m.logo_size = 2#m.radius / 2
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
# For extra credit, find out how to draw it on a curved surface

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
        .center(0,- 1.25*12) # line feed
            .text(f"Beverage Shelf", fontsize=12, distance=-2, 
              fontPath="SFPRODISPLAYREGULAR.OTF",
         halign="center", valign="center")
)

replay(signed)


# +
# Sample code shamelessly stolen from Dov Grobgeld 
# https://gist.github.com/dov/8d9b0304ba85e3229aabccac3c6468ef
# Added bug fix for FP truncation causing unclosed paths

def tpl(cplx):
  '''Convert a complex number to a tuple'''
  return (cplx.real,cplx.imag)

def angle_between(u,v):
  '''Find the angle between the vectors u an v'''
  ux,uy = u
  vx,vy = v
  sign = 1 if ux*vy-uy*vx > 0 else -1
  arg = (ux*vx+uy*vy)/(sqrt(ux*ux+uy*uy)*sqrt(vx*vx+vy*vy))
  return sign*acos(arg)

# Implementation of https://www.w3.org/TR/SVG/implnote.html#ArcConversionCenterToEndpoint
def arc_endpoint_to_center(
  start,
  end,
  flag_a,
  flag_s,
  radius,
  phi):
  '''Convert a endpoint elliptical arc description to a center description'''
  rx,ry = radius.real,radius.imag
  x1,y1 = start.real,start.imag
  x2,y2 = end.real,end.imag
  
  cosphi = cos(phi)
  sinphi = sin(phi)
  rx2 = rx*rx
  ry2 = ry*ry

  # Step 1. Compute x1p,y1p
  x1p,y1p = (np.array([[cosphi,sinphi],
                       [-sinphi,cosphi]])
             @ np.array([x1-x2, y1-y2])*0.5).flatten()
  x1p2 = x1p*x1p
  y1p2 = y1p*y1p

  # Step 2: Compute (cx', cy')
  cxyp = sqrt((rx2*ry2 - rx2*y1p2 - ry2*x1p2)
              / (rx2*y1p2 + ry2*x1p2)) * np.array([rx*y1p/ry,-ry*x1p/rx])

  if flag_a == flag_s:
    cxyp = -cxyp

  cxp,cyp = cxyp.flatten()

  # Step 3: compute (cx,cy) from (cx',cy')
  cx,cy = (cosphi*cxp - sinphi * cyp + 0.5*(x1+x2),
           sinphi*cxp + cosphi * cyp + 0.5*(y1+y2))

  # Step 4: compute theta1 and deltatheta
  theta1 = angle_between((1,0), ((x1p-cxp)/rx, (y1p-cyp)/ry))
  delta_theta = fmod(angle_between(((x1p-cxp)/rx,(y1p-cyp)/ry),
                                   ((-x1p-cxp)/rx, (-y1p-cyp)/ry)),2*pi)

  # Choose the right edge according to the flags
  if not flag_s and delta_theta > 0:
    delta_theta -= 2*pi
  elif flag_s and delta_theta < 0:
    delta_theta += 2*pi
    
  return (cx,cy), theta1, delta_theta
    
def addSvgPath(self, path):
  '''Add the svg path object to the current workspace'''
  print(f"addSvgPath {self} {path.length()}")
  res = self
  path_start = None
  arc_id = 0
  for p in path:
    if path_start is None:
        path_start = p.start
    res = res.moveTo(*tpl(p.start))

    # Transforms of path cause floating point truncation error
    # Detect almost closed paths and force to align
    if path_start and abs(path_start-p.end) < 1e-6: 
        p.end = path_start

    # Support the four svgpathtools different objects
    if isinstance(p, svgpathtools.CubicBezier):
      coords = (tpl(p.start), tpl(p.control1), tpl(p.control2), tpl(p.end))
      res = res.bezier(coords)
    elif isinstance(p, svgpathtools.QuadraticBezier):
      coords = (tpl(p.start), tpl(p.control), tpl(p.end))
      res = res.bezier(coords)
      pass
    elif isinstance(p, svgpathtools.Arc):
      arc_id += 1
      center,theta1,delta_theta = arc_endpoint_to_center(
        p.start,
        p.end,
        p.large_arc,
        p.sweep,
        p.radius,
        p.rotation)
      res = res.ellipseArc(
        x_radius = p.radius.real,
        y_radius = p.radius.imag,
        rotation_angle=degrees(p.rotation),
        angle1= degrees(theta1),
        angle2=degrees(theta1+delta_theta)
        )
    elif isinstance(p, svgpathtools.Line):
      res = res.lineTo(p.end.real, p.end.imag)

    if path_start == p.end:
      path_start = None
      res = res.close()
  return res

cq.Workplane.addSvgPath = addSvgPath
paths, attributes, svg_attributes = svg2paths('logo.svg', return_svg_attributes=True)

xmin, xmax, ymin, ymax = paths[0].bbox()
xsize = xmax - xmin
ysize = ymax - ymin
rescale = m.logo_size / max(xsize, ysize)
print(f"box={paths[0].bbox()} rescale={rescale}")


path = paths[0]
# print(f"{dir(path)}")
# print(f"path {path.iscontinuous()} {path.length()}")
scaled = path.scaled(rescale)
xmin, xmax, ymin, ymax = scaled.bbox()
xsize = xmax - xmin
ysize = ymax - ymin
print(f"scaled box={scaled.bbox()} {xsize} {ysize}")

logod = (    
    signed
    .faces(">Z")
    .workplane(invert=True)
    .transformed(offset=cq.Vector(-m.shelf_radius-ysize*0.5, m.shelf_radius-xsize*0.5  , 0.0), rotate=cq.Vector(0, 0, 0))
    .transformed(offset=cq.Vector(0, 0, 0), rotate=cq.Vector(0, 0, 0))
    .addSvgPath(scaled) 
    .extrude(1.5, combine='cut')
)

replay(logod)

# +

logod.val().exportStl("Cafe Shelf.stl", ascii=False)
pp.pp(m)
print(f"Built in {timer() - start}")
# -



