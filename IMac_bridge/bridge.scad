include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/version.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/constants.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/transforms.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/distributors.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/miscellaneous.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/color.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/attachments.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/beziers.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/shapes3d.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/shapes2d.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/drawing.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/masks3d.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/masks2d.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/math.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/paths.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/lists.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/comparisons.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/linalg.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/trigonometry.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/vectors.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/affine.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/coords.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/geometry.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/regions.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/strings.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/vnf.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/structs.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/rounding.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/skin.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/utility.scad>;
include </Users/dgies/Documents/cad/.venv/lib/python3.11/site-packages/solid2/extensions/bosl2/BOSL2/partitions.scad>;

$fn = 100;

union() {
	difference() {
		union() {
			difference() {
				union() {
					difference() {
						union() {
							difference() {
								union() {
									difference() {
										union() {
											difference() {
												union() {
													cube(size = [0, 0, 0]);
													translate(v = [-120.0, 0, 95.0]) {
														rot(from = [1, 0, 0], a = 0, to = [60.0, 0, -95.0]) {
															translate(v = [0, -1.5, -2.5]) {
																cube(size = [112.36102527122117, 3, 5]);
															}
														}
													}
													translate(v = [-120.0, 0, 95.0]) {
														rot(from = [1, 0, 0], a = 0, to = [180.0, 0, -95.0]) {
															translate(v = [0, -1.5, -2.5]) {
																cube(size = [203.5313243704762, 3, 5]);
															}
														}
													}
													translate(v = [-60.0, 0, 95.0]) {
														rot(from = [1, 0, 0], a = 0, to = [0.0, 0, -95.0]) {
															translate(v = [0, -1.5, -2.5]) {
																cube(size = [95.0, 3, 5]);
															}
														}
													}
													translate(v = [0.0, 0, 95.0]) {
														rot(from = [1, 0, 0], a = 0, to = [-60.0, 0, -95.0]) {
															translate(v = [0, -1.5, -2.5]) {
																cube(size = [112.36102527122117, 3, 5]);
															}
														}
													}
													translate(v = [0.0, 0, 95.0]) {
														rot(from = [1, 0, 0], a = 0, to = [60.0, 0, -95.0]) {
															translate(v = [0, -1.5, -2.5]) {
																cube(size = [112.36102527122117, 3, 5]);
															}
														}
													}
													translate(v = [60.0, 0, 95.0]) {
														rot(from = [1, 0, 0], a = 0, to = [0.0, 0, -95.0]) {
															translate(v = [0, -1.5, -2.5]) {
																cube(size = [95.0, 3, 5]);
															}
														}
													}
													translate(v = [120.0, 0, 95.0]) {
														rot(from = [1, 0, 0], a = 0, to = [-180.0, 0, -95.0]) {
															translate(v = [0, -1.5, -2.5]) {
																cube(size = [203.5313243704762, 3, 5]);
															}
														}
													}
													translate(v = [120.0, 0, 95.0]) {
														rot(from = [1, 0, 0], a = 0, to = [-60.0, 0, -95.0]) {
															translate(v = [0, -1.5, -2.5]) {
																cube(size = [112.36102527122117, 3, 5]);
															}
														}
													}
													translate(v = [-120.0, 0, 0]) {
														translate(v = [0, 0, 100]) {
															translate(v = [0, 1.5, 0]) {
																rotate(a = [90, 0, 0]) {
																	cylinder(d = 20, h = 3);
																}
															}
														}
													}
												}
												translate(v = [-120.0, 0, 0]) {
													translate(v = [0, 0, 100]) {
														translate(v = [-10.0, 0, 0]) {
															translate(v = [0, -3, 0]) {
																cube(size = [20, 6, 10.0]);
															}
														}
													}
												}
											}
											translate(v = [-60.0, 0, 0]) {
												translate(v = [0, 0, 100]) {
													translate(v = [0, 1.5, 0]) {
														rotate(a = [90, 0, 0]) {
															cylinder(d = 20, h = 3);
														}
													}
												}
											}
										}
										translate(v = [-60.0, 0, 0]) {
											translate(v = [0, 0, 100]) {
												translate(v = [-10.0, 0, 0]) {
													translate(v = [0, -3, 0]) {
														cube(size = [20, 6, 10.0]);
													}
												}
											}
										}
									}
									translate(v = [0.0, 0, 0]) {
										translate(v = [0, 0, 100]) {
											translate(v = [0, 1.5, 0]) {
												rotate(a = [90, 0, 0]) {
													cylinder(d = 20, h = 3);
												}
											}
										}
									}
								}
								translate(v = [0.0, 0, 0]) {
									translate(v = [0, 0, 100]) {
										translate(v = [-10.0, 0, 0]) {
											translate(v = [0, -3, 0]) {
												cube(size = [20, 6, 10.0]);
											}
										}
									}
								}
							}
							translate(v = [60.0, 0, 0]) {
								translate(v = [0, 0, 100]) {
									translate(v = [0, 1.5, 0]) {
										rotate(a = [90, 0, 0]) {
											cylinder(d = 20, h = 3);
										}
									}
								}
							}
						}
						translate(v = [60.0, 0, 0]) {
							translate(v = [0, 0, 100]) {
								translate(v = [-10.0, 0, 0]) {
									translate(v = [0, -3, 0]) {
										cube(size = [20, 6, 10.0]);
									}
								}
							}
						}
					}
					translate(v = [120.0, 0, 0]) {
						translate(v = [0, 0, 100]) {
							translate(v = [0, 1.5, 0]) {
								rotate(a = [90, 0, 0]) {
									cylinder(d = 20, h = 3);
								}
							}
						}
					}
				}
				translate(v = [120.0, 0, 0]) {
					translate(v = [0, 0, 100]) {
						translate(v = [-10.0, 0, 0]) {
							translate(v = [0, -3, 0]) {
								cube(size = [20, 6, 10.0]);
							}
						}
					}
				}
				translate(v = [-120.0, 0, 0]) {
					translate(v = [0, 0, 100]) {
						translate(v = [0, 3, 0]) {
							rotate(a = [90, 0, 0]) {
								cylinder(d = 10, h = 6);
							}
						}
					}
				}
				translate(v = [-60.0, 0, 0]) {
					translate(v = [0, 0, 100]) {
						translate(v = [0, 3, 0]) {
							rotate(a = [90, 0, 0]) {
								cylinder(d = 10, h = 6);
							}
						}
					}
				}
				translate(v = [0.0, 0, 0]) {
					translate(v = [0, 0, 100]) {
						translate(v = [0, 3, 0]) {
							rotate(a = [90, 0, 0]) {
								cylinder(d = 10, h = 6);
							}
						}
					}
				}
				translate(v = [60.0, 0, 0]) {
					translate(v = [0, 0, 100]) {
						translate(v = [0, 3, 0]) {
							rotate(a = [90, 0, 0]) {
								cylinder(d = 10, h = 6);
							}
						}
					}
				}
				translate(v = [120.0, 0, 0]) {
					translate(v = [0, 0, 100]) {
						translate(v = [0, 3, 0]) {
							rotate(a = [90, 0, 0]) {
								cylinder(d = 10, h = 6);
							}
						}
					}
				}
			}
			translate(v = [60.0, 0, 0]) {
				translate(v = [-10.0, -25.0, 0]) {
					cube(size = [20, 50.0, 3]);
				}
			}
			translate(v = [-60.0, 0, 0]) {
				translate(v = [-10.0, -25.0, 0]) {
					cube(size = [20, 50.0, 3]);
				}
			}
		}
		translate(v = [-255.0, -255.0, -100]) {
			cube(size = [510, 510, 100]);
		}
	}
	%translate(v = [-255.0, -255.0, -100]) {
		cube(size = [510, 510, 100]);
	}
}
