import math
from datetime import datetime

from solid2 import cube, text, cylinder, set_global_fn, translate, intersection, union
from solid2.extensions.bosl2 import top_half, rot, std, UP, cuboid, text3d

# set the number of faces for curved shapes
set_global_fn(120)

def make_beam(v1, v2, h, w, zrot=0):
    dir = [v2[0]-v1[0], v2[1]-v1[1], v2[2]-v1[2]]
    len = math.sqrt(dir[0]*dir[0] + dir[1]*dir[1] + dir[2]*dir[2])
    print(f"Got {v1}, {v2}, h={h}, w={w}, zrot={zrot}, len={len} dir={dir}")
    xc = cube(len,w,h) # make beam of desired dimensions
    xc = translate(0, -w/2, -h/2)(xc) # center start face at origin
    xc = rot(_from=[1,0,0],to=dir, a=zrot)(xc) # rotate
    xc = translate(v1[0], v1[1], v1[2])(xc) # move start face to desired location
    return xc

class Model():

    def __init__(self):
        self._model = cube(0, 0, 0)
        self.thickness = 4
        self.length = 120
        self.width = 90
        self.height = 30
        self.radius = 10
        self.ridge_angle = 30
        self.ridge_thickness = 2.5
        self.build_body()
        self.cut_basin()
        self.clip_ridges()
        self.cut_drain_hole()
        self.add_ridges()
        self.cleanup()
        self.sign_it()

    def build_body(self):
        self.body = cuboid([self.length, self.width, self.height], rounding=self.radius)
        self._model = self.body

    def cleanup(self):
        self._model = intersection()(
            self._model, self.body
        )

    def cut_basin(self):
        basin = cuboid([self.length-2*self.thickness, self.width-2*self.thickness, self.height], rounding = self.radius-self.thickness)
        basin = basin.translate([0,0,self.thickness])
        self._model = self._model - basin

    def clip_ridges(self):
        box = cuboid([self.length, self.width, self.height])
        box = box.translate([0,0,self.height-self.radius+self.thickness])
        self._model = self._model - box

    def cut_drain_hole(self):
        hole = cylinder(d=self.get_drain_hole_radius(), h=self.radius)
        hole = rot(_from=[0,0,1],to=[-1,-1,0], a=0)(hole) # rotate
        hole = hole.translate([-self.length/2+self.radius, -self.width/2+self.radius, self.height/2-self.radius/2])
        self._model = self._model - hole

    def get_ridge_height(self):
        return self.height - 0.5 * self.radius - 2 * self.thickness

    def get_drain_hole_radius(self):
        # return 2*self.radius
        return (self.height - (self.get_ridge_height()))

    def get_ridge_length(self):
        return (self.width - 1.0 * self.thickness) / 3 / math.cos(self.ridge_angle * math.pi / 180)

    def make_lump(self):
        lump = cuboid([self.get_ridge_length(), self.ridge_thickness, self.get_ridge_height()])
        ridge_hole_radius = self.get_ridge_height()/2
        hole_length = 2*ridge_hole_radius
        hole = cube(hole_length,hole_length,hole_length)
        hole = hole.translateX(-self.get_ridge_length()/4)
        hole = hole.translateZ(-self.get_ridge_height()/2+0*ridge_hole_radius)
        hole = hole.rotateY(45)
        hole2 = hole

        hole = hole.rotateX(45)
        hole = hole.translateZ(-self.get_ridge_height()/2 - self.ridge_thickness/2)
        hole = hole.translateY(self.ridge_thickness).color("yellow")

        hole2 = hole2.translateY(-hole_length)
        hole2 = hole2.rotateX(-45)
        hole2 = hole2.translateZ(-self.get_ridge_height() / 2- self.ridge_thickness/2)
        hole2 = hole2.translateY(-self.ridge_thickness).color("red")

        lump = lump - hole - hole2
        lump = lump.translateZ(-self.get_ridge_height()/2+self.thickness)
        lump = lump.rotateZ(90-1*self.ridge_angle)
        return lump

    def add_ridges(self):
        xoffset = self.ridge_thickness * 4
        lump = self.make_lump()
        yoffset = (self.get_ridge_length()-0.5*self.ridge_thickness/2) * math.cos(self.ridge_angle*math.pi/180) - 0.55*(self.ridge_thickness)*math.sin(self.ridge_angle*math.pi/180)
        top_lump = lump.rotateZ(2*self.ridge_angle).translateY(yoffset)
        bottom_lump = top_lump.translateY(-2*yoffset)

        RIDGE = top_lump + lump + bottom_lump
        ridges = None
        # ridges = self.lump2().translateX(-10*xoffset)
        for j in range(0,6):
            i = j+0.5
            if ridges is None:
                ridges = RIDGE.translateX(i*xoffset) + RIDGE.translateX(-i*xoffset)
            else:
                ridges = ridges + RIDGE.translateX(i*xoffset) + RIDGE.translateX(-i*xoffset)
        self._model = self._model + ridges

    def sign_it(self):
        text_height = 1
        text_size = 5
        text = text3d(f"DFG {str(datetime.now().year)}", text_height, text_size, "SF Mono:style=Heavy", language ="en", script ="latin", direction ="ltr")
        text = text.color("#8080ff")
        # text = text.rotateZ(180)
        text = text.rotateX(180)
        text = text.translate([-self.length/2+1.0*self.radius, self.width/2-1.0*self.radius, -self.height/2-0*self.radius+0.5*text_height])
        self._model = self._model - text


    def cut_floor(self):
        size = self.width*2 # oversize for width of feet
        floor = cube(size,size,self.height)
        floor = floor.translate(-size/2,-size/2,-self.height)
        # floor = floor.background()
        self.model = self.model - floor + floor.background()#.color("#40404040")


    def save_as_scad(self):
        self._model.save_as_scad()

def main():
    model = Model()
    # save your model for use in OpenSCAD
    model.save_as_scad()

if __name__ == '__main__':
    main()