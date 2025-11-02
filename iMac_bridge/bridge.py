# import openscad
import math
from solid2 import cube, text, cylinder, set_global_fn, translate
from solid2.extensions.bosl2 import top_half, rot, std, UP


# set the number of faces for curved shapes
set_global_fn(100)

def make_beam(v1, v2, h, w, zrot=0):
    dir = [v2[0]-v1[0], v2[1]-v1[1], v2[2]-v1[2]]
    len = math.sqrt(dir[0]*dir[0] + dir[1]*dir[1] + dir[2]*dir[2])
    # length = norm(dir)
    print(f"Got {v1}, {v2}, h={h}, w={w}, zrot={zrot}, len={len} dir={dir}")
    # n = norm(length)
    # print(f"Got n={n}")
    xc = cube(len,w,h) # make beam of desired dimensions
    xc = translate(0, -w/2, -h/2)(xc) # center start face at origin
    xc = rot(_from=[1,0,0],to=dir, a=zrot)(xc) # rotate
    xc = translate(v1[0], v1[1], v1[2])(xc) # move start face to desired location
    return xc

class Model():

    supports = {
        1: {
            'supports': [[0,0]],
            'crossbars': None
        },
        2: {
            'supports': [
                [1],
                [0]
            ],
            'crossbars': None
        },
        3: {
            'supports': [
                [2],
                [0,2],
                [0]
            ],
            'crossbars': None
        },
        # 4: { # original
        #     'supports': [
        #         [3],
        #         [0,3],
        #         [0,3],
        #         [0],
        #     ],
        #     'crossbars': None
        # },
        4: {
            'supports': [
                [0],
                [0, 3],
                [0, 3],
                [3],
            ],
            'crossbars': None
        },
        5: {
            'supports': [
                [1,3],
                [1],
                [1,3],
                [3],
                [1,3]
            ],
            'crossbars': None
        },
        # 6: { # original
        #     'supports': [
        #         [1,4],
        #         [1],
        #         [1],
        #         [4],
        #         [4],
        #         [1,4],
        #     ],
        #     'crossbars': [
        #         (2, 3)
        #     ]
        # },
        6: {
            'supports': [
                [1],
                [1],
                [4],
                [1],
                [4],
                [4],
            ],
            'crossbars': [
                (0, 1),
                (1, 2),
                (2, 3),
                (3, 4),
                (4, 5)
            ]
        },
    }
    def __init__(self):
        self.thickness = 3
        self.height = 100
        self.spacing = 60
        self.dowel = 10
        self.beam_width = 5
        self.bearing_thickness = 5
        self.num_holes = 5
        self.width = self.spacing*max([2, self.num_holes-1])+ self.dowel+self.bearing_thickness
        self.model = Model.build_base()

    @staticmethod
    def build_base():
        return cube(0,0,0)

    def get_supports(self):
        return self.supports[self.num_holes]['supports']

    def get_crossbars(self):
        return self.supports[self.num_holes]['crossbars']

    def build_beams(self):
        mappings = self.get_supports()
        for src, destinations in enumerate(mappings):
            for dst in destinations:
                print(f"Want a beam from {src} to {dst}")
                src_offset = (src - (self.num_holes - 1) / 2) * self.spacing
                dst_offset = (dst - (self.num_holes - 1) / 2) * self.spacing
                # beam = make_beam([dst_offset, 0, 0], [src_offset, 0, self.height - 0.5*self.dowel])

                beam = make_beam([src_offset, 0, self.height - 0.5 * self.dowel], [dst_offset, 0, 0], self.beam_width, self.thickness)
                self.model = self.model + beam
        crossbars = self.get_crossbars() or []
        for src,dst in crossbars:
            src_offset = (src - (self.num_holes - 1) / 2) * self.spacing
            dst_offset = (dst - (self.num_holes - 1) / 2) * self.spacing

            print(f"Want a crossbar from {src} to {dst}")
            beam = make_beam([src_offset, 0, 1 * (self.height - 0.5 * self.dowel)], [dst_offset, 0, 1 * (self.height - 0.5 * self.dowel)], self.beam_width, self.thickness)
            self.model = self.model + beam

    def build_bearings(self):
        bearing_diameter = self.dowel + 2 * self.bearing_thickness
        bearing = cylinder(d=bearing_diameter, h=self.thickness)
        bearing = bearing.rotateX(90)
        bearing = bearing.translateY(self.thickness / 2.0)
        BEARING = bearing.translateZ(self.height)
        top_bearing = cube(bearing_diameter, 2 * self.thickness, bearing_diameter / 2)
        top_bearing = top_bearing.translateY(-self.thickness)
        top_bearing = top_bearing.translateX(-0.5 * bearing_diameter)
        TOP_BEARING = top_bearing.translateZ(self.height)

        # bearing = bearing - self.bearing_hole
        # BEARING = bearing - top_bearing # make a reference bearing
        for i in range(self.num_holes):
            # print(f"Want a bearing at  {i} ")
            src_offset = (i - (self.num_holes - 1) / 2) * self.spacing
            one_bearing = BEARING.translateX(src_offset) # make bearing at correct location
            one_top_bearing = TOP_BEARING.translateX(src_offset)
            self.model = self.model + one_bearing - one_top_bearing # add to model

    def cut_dowel_holes(self):
        bearing_hole = cylinder(d=self.dowel, h=self.thickness * 2)
        bearing_hole = bearing_hole.rotateX(90)
        bearing_hole = bearing_hole.translateY(self.thickness)
        bearing_hole = bearing_hole.translateZ(self.height)
        BEARING_HOLE = bearing_hole#hole()(bearing_hole)
        for i in range(self.num_holes):
            # print(f"Want a hole at  {i} ")
            src_offset = self.offset_for_hole(i)
            one_hole = BEARING_HOLE.translateX(src_offset) # make bearing at correct location
            self.model = self.model - one_hole # cut from model

    def build_feet(self):
        if self.num_holes == 1: # special case, needs to be wider
            foot_width = self.height / 2
        else:
            foot_width = 2*self.dowel
        print(f"Using {1*foot_width}, {self.height/2} , {self.thickness}")
        foot = cube(foot_width, self.height/2, self.thickness)
        FOOT = foot.translate(-foot_width/2, -self.height/4, 0)
        # print(f"Made a foot")

        # foot = cube(2*self.dowel, self.height/2, self.thickness)
        # FOOT = foot.translate(-self.dowel, -self.height/4, 0)
        feet = set()
        for src, destinations in enumerate(self.get_supports()):
            for dst in destinations:
                feet.add(dst)
        for dst in feet:
            self.model = self.model + FOOT.translateX(-self.offset_for_hole(dst))

    def cut_floor(self):
        size = self.width*2 # oversize for width of feet
        floor = cube(size,size,self.height)
        floor = floor.translate(-size/2,-size/2,-self.height)
        # floor = floor.background()
        self.model = self.model - floor + floor.background()#.color("#40404040")

    def offset_for_hole(self, n):
        return (n - (self.num_holes - 1) / 2) * self.spacing

    def save_as_scad(self):
        self.model.save_as_scad()


def main():
    model = Model()
    model.build_beams()
    model.build_bearings()
    model.cut_dowel_holes()
    model.build_feet()
    model.cut_floor()
    # save your model for use in OpenSCAD
    model.save_as_scad()


if __name__ == '__main__':
    main()