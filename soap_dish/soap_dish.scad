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

$fn = 120;

difference() {
	intersection() {
		union() {
			difference() {
				cuboid(rounding = 10, size = [120, 90, 30]);
				translate(v = [0, 0, 4]) {
					cuboid(rounding = 6, size = [112, 82, 30]);
				}
				translate(v = [0, 0, 24]) {
					cuboid(size = [120, 90, 30]);
				}
				translate(v = [-50.0, -35.0, 10.0]) {
					rot(from = [0, 0, 1], a = 0, to = [-1, -1, 0]) {
						cylinder(d = 13.0, h = 10);
					}
				}
			}
			union() {
				translate(v = [5.0, 0, 0]) {
					union() {
						translate(v = [0, 27.43790078930139, 0]) {
							rotate(a = [0, 0, 60]) {
								rotate(a = [0, 0, 60]) {
									translate(v = [0, 0, -4.5]) {
										difference() {
											cuboid(size = [33.10141543353854, 2.5, 17.0]);
											color(alpha = 1.0, c = "yellow") {
												translate(v = [0, 2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [45, 0, 0]) {
															rotate(a = [0, 45, 0]) {
																translate(v = [0, 0, -8.5]) {
																	translate(v = [-8.275353858384635, 0, 0]) {
																		cube(size = [17.0, 17.0, 17.0]);
																	}
																}
															}
														}
													}
												}
											}
											color(alpha = 1.0, c = "red") {
												translate(v = [0, -2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [-45, 0, 0]) {
															translate(v = [0, -17.0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						rotate(a = [0, 0, 60]) {
							translate(v = [0, 0, -4.5]) {
								difference() {
									cuboid(size = [33.10141543353854, 2.5, 17.0]);
									color(alpha = 1.0, c = "yellow") {
										translate(v = [0, 2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [45, 0, 0]) {
													rotate(a = [0, 45, 0]) {
														translate(v = [0, 0, -8.5]) {
															translate(v = [-8.275353858384635, 0, 0]) {
																cube(size = [17.0, 17.0, 17.0]);
															}
														}
													}
												}
											}
										}
									}
									color(alpha = 1.0, c = "red") {
										translate(v = [0, -2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [-45, 0, 0]) {
													translate(v = [0, -17.0, 0]) {
														rotate(a = [0, 45, 0]) {
															translate(v = [0, 0, -8.5]) {
																translate(v = [-8.275353858384635, 0, 0]) {
																	cube(size = [17.0, 17.0, 17.0]);
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						translate(v = [0, -54.87580157860278, 0]) {
							translate(v = [0, 27.43790078930139, 0]) {
								rotate(a = [0, 0, 60]) {
									rotate(a = [0, 0, 60]) {
										translate(v = [0, 0, -4.5]) {
											difference() {
												cuboid(size = [33.10141543353854, 2.5, 17.0]);
												color(alpha = 1.0, c = "yellow") {
													translate(v = [0, 2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [45, 0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
												color(alpha = 1.0, c = "red") {
													translate(v = [0, -2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [-45, 0, 0]) {
																translate(v = [0, -17.0, 0]) {
																	rotate(a = [0, 45, 0]) {
																		translate(v = [0, 0, -8.5]) {
																			translate(v = [-8.275353858384635, 0, 0]) {
																				cube(size = [17.0, 17.0, 17.0]);
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
				translate(v = [-5.0, 0, 0]) {
					union() {
						translate(v = [0, 27.43790078930139, 0]) {
							rotate(a = [0, 0, 60]) {
								rotate(a = [0, 0, 60]) {
									translate(v = [0, 0, -4.5]) {
										difference() {
											cuboid(size = [33.10141543353854, 2.5, 17.0]);
											color(alpha = 1.0, c = "yellow") {
												translate(v = [0, 2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [45, 0, 0]) {
															rotate(a = [0, 45, 0]) {
																translate(v = [0, 0, -8.5]) {
																	translate(v = [-8.275353858384635, 0, 0]) {
																		cube(size = [17.0, 17.0, 17.0]);
																	}
																}
															}
														}
													}
												}
											}
											color(alpha = 1.0, c = "red") {
												translate(v = [0, -2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [-45, 0, 0]) {
															translate(v = [0, -17.0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						rotate(a = [0, 0, 60]) {
							translate(v = [0, 0, -4.5]) {
								difference() {
									cuboid(size = [33.10141543353854, 2.5, 17.0]);
									color(alpha = 1.0, c = "yellow") {
										translate(v = [0, 2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [45, 0, 0]) {
													rotate(a = [0, 45, 0]) {
														translate(v = [0, 0, -8.5]) {
															translate(v = [-8.275353858384635, 0, 0]) {
																cube(size = [17.0, 17.0, 17.0]);
															}
														}
													}
												}
											}
										}
									}
									color(alpha = 1.0, c = "red") {
										translate(v = [0, -2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [-45, 0, 0]) {
													translate(v = [0, -17.0, 0]) {
														rotate(a = [0, 45, 0]) {
															translate(v = [0, 0, -8.5]) {
																translate(v = [-8.275353858384635, 0, 0]) {
																	cube(size = [17.0, 17.0, 17.0]);
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						translate(v = [0, -54.87580157860278, 0]) {
							translate(v = [0, 27.43790078930139, 0]) {
								rotate(a = [0, 0, 60]) {
									rotate(a = [0, 0, 60]) {
										translate(v = [0, 0, -4.5]) {
											difference() {
												cuboid(size = [33.10141543353854, 2.5, 17.0]);
												color(alpha = 1.0, c = "yellow") {
													translate(v = [0, 2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [45, 0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
												color(alpha = 1.0, c = "red") {
													translate(v = [0, -2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [-45, 0, 0]) {
																translate(v = [0, -17.0, 0]) {
																	rotate(a = [0, 45, 0]) {
																		translate(v = [0, 0, -8.5]) {
																			translate(v = [-8.275353858384635, 0, 0]) {
																				cube(size = [17.0, 17.0, 17.0]);
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
				translate(v = [15.0, 0, 0]) {
					union() {
						translate(v = [0, 27.43790078930139, 0]) {
							rotate(a = [0, 0, 60]) {
								rotate(a = [0, 0, 60]) {
									translate(v = [0, 0, -4.5]) {
										difference() {
											cuboid(size = [33.10141543353854, 2.5, 17.0]);
											color(alpha = 1.0, c = "yellow") {
												translate(v = [0, 2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [45, 0, 0]) {
															rotate(a = [0, 45, 0]) {
																translate(v = [0, 0, -8.5]) {
																	translate(v = [-8.275353858384635, 0, 0]) {
																		cube(size = [17.0, 17.0, 17.0]);
																	}
																}
															}
														}
													}
												}
											}
											color(alpha = 1.0, c = "red") {
												translate(v = [0, -2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [-45, 0, 0]) {
															translate(v = [0, -17.0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						rotate(a = [0, 0, 60]) {
							translate(v = [0, 0, -4.5]) {
								difference() {
									cuboid(size = [33.10141543353854, 2.5, 17.0]);
									color(alpha = 1.0, c = "yellow") {
										translate(v = [0, 2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [45, 0, 0]) {
													rotate(a = [0, 45, 0]) {
														translate(v = [0, 0, -8.5]) {
															translate(v = [-8.275353858384635, 0, 0]) {
																cube(size = [17.0, 17.0, 17.0]);
															}
														}
													}
												}
											}
										}
									}
									color(alpha = 1.0, c = "red") {
										translate(v = [0, -2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [-45, 0, 0]) {
													translate(v = [0, -17.0, 0]) {
														rotate(a = [0, 45, 0]) {
															translate(v = [0, 0, -8.5]) {
																translate(v = [-8.275353858384635, 0, 0]) {
																	cube(size = [17.0, 17.0, 17.0]);
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						translate(v = [0, -54.87580157860278, 0]) {
							translate(v = [0, 27.43790078930139, 0]) {
								rotate(a = [0, 0, 60]) {
									rotate(a = [0, 0, 60]) {
										translate(v = [0, 0, -4.5]) {
											difference() {
												cuboid(size = [33.10141543353854, 2.5, 17.0]);
												color(alpha = 1.0, c = "yellow") {
													translate(v = [0, 2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [45, 0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
												color(alpha = 1.0, c = "red") {
													translate(v = [0, -2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [-45, 0, 0]) {
																translate(v = [0, -17.0, 0]) {
																	rotate(a = [0, 45, 0]) {
																		translate(v = [0, 0, -8.5]) {
																			translate(v = [-8.275353858384635, 0, 0]) {
																				cube(size = [17.0, 17.0, 17.0]);
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
				translate(v = [-15.0, 0, 0]) {
					union() {
						translate(v = [0, 27.43790078930139, 0]) {
							rotate(a = [0, 0, 60]) {
								rotate(a = [0, 0, 60]) {
									translate(v = [0, 0, -4.5]) {
										difference() {
											cuboid(size = [33.10141543353854, 2.5, 17.0]);
											color(alpha = 1.0, c = "yellow") {
												translate(v = [0, 2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [45, 0, 0]) {
															rotate(a = [0, 45, 0]) {
																translate(v = [0, 0, -8.5]) {
																	translate(v = [-8.275353858384635, 0, 0]) {
																		cube(size = [17.0, 17.0, 17.0]);
																	}
																}
															}
														}
													}
												}
											}
											color(alpha = 1.0, c = "red") {
												translate(v = [0, -2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [-45, 0, 0]) {
															translate(v = [0, -17.0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						rotate(a = [0, 0, 60]) {
							translate(v = [0, 0, -4.5]) {
								difference() {
									cuboid(size = [33.10141543353854, 2.5, 17.0]);
									color(alpha = 1.0, c = "yellow") {
										translate(v = [0, 2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [45, 0, 0]) {
													rotate(a = [0, 45, 0]) {
														translate(v = [0, 0, -8.5]) {
															translate(v = [-8.275353858384635, 0, 0]) {
																cube(size = [17.0, 17.0, 17.0]);
															}
														}
													}
												}
											}
										}
									}
									color(alpha = 1.0, c = "red") {
										translate(v = [0, -2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [-45, 0, 0]) {
													translate(v = [0, -17.0, 0]) {
														rotate(a = [0, 45, 0]) {
															translate(v = [0, 0, -8.5]) {
																translate(v = [-8.275353858384635, 0, 0]) {
																	cube(size = [17.0, 17.0, 17.0]);
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						translate(v = [0, -54.87580157860278, 0]) {
							translate(v = [0, 27.43790078930139, 0]) {
								rotate(a = [0, 0, 60]) {
									rotate(a = [0, 0, 60]) {
										translate(v = [0, 0, -4.5]) {
											difference() {
												cuboid(size = [33.10141543353854, 2.5, 17.0]);
												color(alpha = 1.0, c = "yellow") {
													translate(v = [0, 2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [45, 0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
												color(alpha = 1.0, c = "red") {
													translate(v = [0, -2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [-45, 0, 0]) {
																translate(v = [0, -17.0, 0]) {
																	rotate(a = [0, 45, 0]) {
																		translate(v = [0, 0, -8.5]) {
																			translate(v = [-8.275353858384635, 0, 0]) {
																				cube(size = [17.0, 17.0, 17.0]);
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
				translate(v = [25.0, 0, 0]) {
					union() {
						translate(v = [0, 27.43790078930139, 0]) {
							rotate(a = [0, 0, 60]) {
								rotate(a = [0, 0, 60]) {
									translate(v = [0, 0, -4.5]) {
										difference() {
											cuboid(size = [33.10141543353854, 2.5, 17.0]);
											color(alpha = 1.0, c = "yellow") {
												translate(v = [0, 2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [45, 0, 0]) {
															rotate(a = [0, 45, 0]) {
																translate(v = [0, 0, -8.5]) {
																	translate(v = [-8.275353858384635, 0, 0]) {
																		cube(size = [17.0, 17.0, 17.0]);
																	}
																}
															}
														}
													}
												}
											}
											color(alpha = 1.0, c = "red") {
												translate(v = [0, -2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [-45, 0, 0]) {
															translate(v = [0, -17.0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						rotate(a = [0, 0, 60]) {
							translate(v = [0, 0, -4.5]) {
								difference() {
									cuboid(size = [33.10141543353854, 2.5, 17.0]);
									color(alpha = 1.0, c = "yellow") {
										translate(v = [0, 2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [45, 0, 0]) {
													rotate(a = [0, 45, 0]) {
														translate(v = [0, 0, -8.5]) {
															translate(v = [-8.275353858384635, 0, 0]) {
																cube(size = [17.0, 17.0, 17.0]);
															}
														}
													}
												}
											}
										}
									}
									color(alpha = 1.0, c = "red") {
										translate(v = [0, -2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [-45, 0, 0]) {
													translate(v = [0, -17.0, 0]) {
														rotate(a = [0, 45, 0]) {
															translate(v = [0, 0, -8.5]) {
																translate(v = [-8.275353858384635, 0, 0]) {
																	cube(size = [17.0, 17.0, 17.0]);
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						translate(v = [0, -54.87580157860278, 0]) {
							translate(v = [0, 27.43790078930139, 0]) {
								rotate(a = [0, 0, 60]) {
									rotate(a = [0, 0, 60]) {
										translate(v = [0, 0, -4.5]) {
											difference() {
												cuboid(size = [33.10141543353854, 2.5, 17.0]);
												color(alpha = 1.0, c = "yellow") {
													translate(v = [0, 2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [45, 0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
												color(alpha = 1.0, c = "red") {
													translate(v = [0, -2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [-45, 0, 0]) {
																translate(v = [0, -17.0, 0]) {
																	rotate(a = [0, 45, 0]) {
																		translate(v = [0, 0, -8.5]) {
																			translate(v = [-8.275353858384635, 0, 0]) {
																				cube(size = [17.0, 17.0, 17.0]);
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
				translate(v = [-25.0, 0, 0]) {
					union() {
						translate(v = [0, 27.43790078930139, 0]) {
							rotate(a = [0, 0, 60]) {
								rotate(a = [0, 0, 60]) {
									translate(v = [0, 0, -4.5]) {
										difference() {
											cuboid(size = [33.10141543353854, 2.5, 17.0]);
											color(alpha = 1.0, c = "yellow") {
												translate(v = [0, 2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [45, 0, 0]) {
															rotate(a = [0, 45, 0]) {
																translate(v = [0, 0, -8.5]) {
																	translate(v = [-8.275353858384635, 0, 0]) {
																		cube(size = [17.0, 17.0, 17.0]);
																	}
																}
															}
														}
													}
												}
											}
											color(alpha = 1.0, c = "red") {
												translate(v = [0, -2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [-45, 0, 0]) {
															translate(v = [0, -17.0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						rotate(a = [0, 0, 60]) {
							translate(v = [0, 0, -4.5]) {
								difference() {
									cuboid(size = [33.10141543353854, 2.5, 17.0]);
									color(alpha = 1.0, c = "yellow") {
										translate(v = [0, 2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [45, 0, 0]) {
													rotate(a = [0, 45, 0]) {
														translate(v = [0, 0, -8.5]) {
															translate(v = [-8.275353858384635, 0, 0]) {
																cube(size = [17.0, 17.0, 17.0]);
															}
														}
													}
												}
											}
										}
									}
									color(alpha = 1.0, c = "red") {
										translate(v = [0, -2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [-45, 0, 0]) {
													translate(v = [0, -17.0, 0]) {
														rotate(a = [0, 45, 0]) {
															translate(v = [0, 0, -8.5]) {
																translate(v = [-8.275353858384635, 0, 0]) {
																	cube(size = [17.0, 17.0, 17.0]);
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						translate(v = [0, -54.87580157860278, 0]) {
							translate(v = [0, 27.43790078930139, 0]) {
								rotate(a = [0, 0, 60]) {
									rotate(a = [0, 0, 60]) {
										translate(v = [0, 0, -4.5]) {
											difference() {
												cuboid(size = [33.10141543353854, 2.5, 17.0]);
												color(alpha = 1.0, c = "yellow") {
													translate(v = [0, 2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [45, 0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
												color(alpha = 1.0, c = "red") {
													translate(v = [0, -2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [-45, 0, 0]) {
																translate(v = [0, -17.0, 0]) {
																	rotate(a = [0, 45, 0]) {
																		translate(v = [0, 0, -8.5]) {
																			translate(v = [-8.275353858384635, 0, 0]) {
																				cube(size = [17.0, 17.0, 17.0]);
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
				translate(v = [35.0, 0, 0]) {
					union() {
						translate(v = [0, 27.43790078930139, 0]) {
							rotate(a = [0, 0, 60]) {
								rotate(a = [0, 0, 60]) {
									translate(v = [0, 0, -4.5]) {
										difference() {
											cuboid(size = [33.10141543353854, 2.5, 17.0]);
											color(alpha = 1.0, c = "yellow") {
												translate(v = [0, 2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [45, 0, 0]) {
															rotate(a = [0, 45, 0]) {
																translate(v = [0, 0, -8.5]) {
																	translate(v = [-8.275353858384635, 0, 0]) {
																		cube(size = [17.0, 17.0, 17.0]);
																	}
																}
															}
														}
													}
												}
											}
											color(alpha = 1.0, c = "red") {
												translate(v = [0, -2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [-45, 0, 0]) {
															translate(v = [0, -17.0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						rotate(a = [0, 0, 60]) {
							translate(v = [0, 0, -4.5]) {
								difference() {
									cuboid(size = [33.10141543353854, 2.5, 17.0]);
									color(alpha = 1.0, c = "yellow") {
										translate(v = [0, 2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [45, 0, 0]) {
													rotate(a = [0, 45, 0]) {
														translate(v = [0, 0, -8.5]) {
															translate(v = [-8.275353858384635, 0, 0]) {
																cube(size = [17.0, 17.0, 17.0]);
															}
														}
													}
												}
											}
										}
									}
									color(alpha = 1.0, c = "red") {
										translate(v = [0, -2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [-45, 0, 0]) {
													translate(v = [0, -17.0, 0]) {
														rotate(a = [0, 45, 0]) {
															translate(v = [0, 0, -8.5]) {
																translate(v = [-8.275353858384635, 0, 0]) {
																	cube(size = [17.0, 17.0, 17.0]);
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						translate(v = [0, -54.87580157860278, 0]) {
							translate(v = [0, 27.43790078930139, 0]) {
								rotate(a = [0, 0, 60]) {
									rotate(a = [0, 0, 60]) {
										translate(v = [0, 0, -4.5]) {
											difference() {
												cuboid(size = [33.10141543353854, 2.5, 17.0]);
												color(alpha = 1.0, c = "yellow") {
													translate(v = [0, 2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [45, 0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
												color(alpha = 1.0, c = "red") {
													translate(v = [0, -2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [-45, 0, 0]) {
																translate(v = [0, -17.0, 0]) {
																	rotate(a = [0, 45, 0]) {
																		translate(v = [0, 0, -8.5]) {
																			translate(v = [-8.275353858384635, 0, 0]) {
																				cube(size = [17.0, 17.0, 17.0]);
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
				translate(v = [-35.0, 0, 0]) {
					union() {
						translate(v = [0, 27.43790078930139, 0]) {
							rotate(a = [0, 0, 60]) {
								rotate(a = [0, 0, 60]) {
									translate(v = [0, 0, -4.5]) {
										difference() {
											cuboid(size = [33.10141543353854, 2.5, 17.0]);
											color(alpha = 1.0, c = "yellow") {
												translate(v = [0, 2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [45, 0, 0]) {
															rotate(a = [0, 45, 0]) {
																translate(v = [0, 0, -8.5]) {
																	translate(v = [-8.275353858384635, 0, 0]) {
																		cube(size = [17.0, 17.0, 17.0]);
																	}
																}
															}
														}
													}
												}
											}
											color(alpha = 1.0, c = "red") {
												translate(v = [0, -2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [-45, 0, 0]) {
															translate(v = [0, -17.0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						rotate(a = [0, 0, 60]) {
							translate(v = [0, 0, -4.5]) {
								difference() {
									cuboid(size = [33.10141543353854, 2.5, 17.0]);
									color(alpha = 1.0, c = "yellow") {
										translate(v = [0, 2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [45, 0, 0]) {
													rotate(a = [0, 45, 0]) {
														translate(v = [0, 0, -8.5]) {
															translate(v = [-8.275353858384635, 0, 0]) {
																cube(size = [17.0, 17.0, 17.0]);
															}
														}
													}
												}
											}
										}
									}
									color(alpha = 1.0, c = "red") {
										translate(v = [0, -2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [-45, 0, 0]) {
													translate(v = [0, -17.0, 0]) {
														rotate(a = [0, 45, 0]) {
															translate(v = [0, 0, -8.5]) {
																translate(v = [-8.275353858384635, 0, 0]) {
																	cube(size = [17.0, 17.0, 17.0]);
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						translate(v = [0, -54.87580157860278, 0]) {
							translate(v = [0, 27.43790078930139, 0]) {
								rotate(a = [0, 0, 60]) {
									rotate(a = [0, 0, 60]) {
										translate(v = [0, 0, -4.5]) {
											difference() {
												cuboid(size = [33.10141543353854, 2.5, 17.0]);
												color(alpha = 1.0, c = "yellow") {
													translate(v = [0, 2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [45, 0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
												color(alpha = 1.0, c = "red") {
													translate(v = [0, -2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [-45, 0, 0]) {
																translate(v = [0, -17.0, 0]) {
																	rotate(a = [0, 45, 0]) {
																		translate(v = [0, 0, -8.5]) {
																			translate(v = [-8.275353858384635, 0, 0]) {
																				cube(size = [17.0, 17.0, 17.0]);
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
				translate(v = [45.0, 0, 0]) {
					union() {
						translate(v = [0, 27.43790078930139, 0]) {
							rotate(a = [0, 0, 60]) {
								rotate(a = [0, 0, 60]) {
									translate(v = [0, 0, -4.5]) {
										difference() {
											cuboid(size = [33.10141543353854, 2.5, 17.0]);
											color(alpha = 1.0, c = "yellow") {
												translate(v = [0, 2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [45, 0, 0]) {
															rotate(a = [0, 45, 0]) {
																translate(v = [0, 0, -8.5]) {
																	translate(v = [-8.275353858384635, 0, 0]) {
																		cube(size = [17.0, 17.0, 17.0]);
																	}
																}
															}
														}
													}
												}
											}
											color(alpha = 1.0, c = "red") {
												translate(v = [0, -2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [-45, 0, 0]) {
															translate(v = [0, -17.0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						rotate(a = [0, 0, 60]) {
							translate(v = [0, 0, -4.5]) {
								difference() {
									cuboid(size = [33.10141543353854, 2.5, 17.0]);
									color(alpha = 1.0, c = "yellow") {
										translate(v = [0, 2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [45, 0, 0]) {
													rotate(a = [0, 45, 0]) {
														translate(v = [0, 0, -8.5]) {
															translate(v = [-8.275353858384635, 0, 0]) {
																cube(size = [17.0, 17.0, 17.0]);
															}
														}
													}
												}
											}
										}
									}
									color(alpha = 1.0, c = "red") {
										translate(v = [0, -2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [-45, 0, 0]) {
													translate(v = [0, -17.0, 0]) {
														rotate(a = [0, 45, 0]) {
															translate(v = [0, 0, -8.5]) {
																translate(v = [-8.275353858384635, 0, 0]) {
																	cube(size = [17.0, 17.0, 17.0]);
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						translate(v = [0, -54.87580157860278, 0]) {
							translate(v = [0, 27.43790078930139, 0]) {
								rotate(a = [0, 0, 60]) {
									rotate(a = [0, 0, 60]) {
										translate(v = [0, 0, -4.5]) {
											difference() {
												cuboid(size = [33.10141543353854, 2.5, 17.0]);
												color(alpha = 1.0, c = "yellow") {
													translate(v = [0, 2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [45, 0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
												color(alpha = 1.0, c = "red") {
													translate(v = [0, -2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [-45, 0, 0]) {
																translate(v = [0, -17.0, 0]) {
																	rotate(a = [0, 45, 0]) {
																		translate(v = [0, 0, -8.5]) {
																			translate(v = [-8.275353858384635, 0, 0]) {
																				cube(size = [17.0, 17.0, 17.0]);
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
				translate(v = [-45.0, 0, 0]) {
					union() {
						translate(v = [0, 27.43790078930139, 0]) {
							rotate(a = [0, 0, 60]) {
								rotate(a = [0, 0, 60]) {
									translate(v = [0, 0, -4.5]) {
										difference() {
											cuboid(size = [33.10141543353854, 2.5, 17.0]);
											color(alpha = 1.0, c = "yellow") {
												translate(v = [0, 2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [45, 0, 0]) {
															rotate(a = [0, 45, 0]) {
																translate(v = [0, 0, -8.5]) {
																	translate(v = [-8.275353858384635, 0, 0]) {
																		cube(size = [17.0, 17.0, 17.0]);
																	}
																}
															}
														}
													}
												}
											}
											color(alpha = 1.0, c = "red") {
												translate(v = [0, -2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [-45, 0, 0]) {
															translate(v = [0, -17.0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						rotate(a = [0, 0, 60]) {
							translate(v = [0, 0, -4.5]) {
								difference() {
									cuboid(size = [33.10141543353854, 2.5, 17.0]);
									color(alpha = 1.0, c = "yellow") {
										translate(v = [0, 2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [45, 0, 0]) {
													rotate(a = [0, 45, 0]) {
														translate(v = [0, 0, -8.5]) {
															translate(v = [-8.275353858384635, 0, 0]) {
																cube(size = [17.0, 17.0, 17.0]);
															}
														}
													}
												}
											}
										}
									}
									color(alpha = 1.0, c = "red") {
										translate(v = [0, -2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [-45, 0, 0]) {
													translate(v = [0, -17.0, 0]) {
														rotate(a = [0, 45, 0]) {
															translate(v = [0, 0, -8.5]) {
																translate(v = [-8.275353858384635, 0, 0]) {
																	cube(size = [17.0, 17.0, 17.0]);
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						translate(v = [0, -54.87580157860278, 0]) {
							translate(v = [0, 27.43790078930139, 0]) {
								rotate(a = [0, 0, 60]) {
									rotate(a = [0, 0, 60]) {
										translate(v = [0, 0, -4.5]) {
											difference() {
												cuboid(size = [33.10141543353854, 2.5, 17.0]);
												color(alpha = 1.0, c = "yellow") {
													translate(v = [0, 2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [45, 0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
												color(alpha = 1.0, c = "red") {
													translate(v = [0, -2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [-45, 0, 0]) {
																translate(v = [0, -17.0, 0]) {
																	rotate(a = [0, 45, 0]) {
																		translate(v = [0, 0, -8.5]) {
																			translate(v = [-8.275353858384635, 0, 0]) {
																				cube(size = [17.0, 17.0, 17.0]);
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
				translate(v = [55.0, 0, 0]) {
					union() {
						translate(v = [0, 27.43790078930139, 0]) {
							rotate(a = [0, 0, 60]) {
								rotate(a = [0, 0, 60]) {
									translate(v = [0, 0, -4.5]) {
										difference() {
											cuboid(size = [33.10141543353854, 2.5, 17.0]);
											color(alpha = 1.0, c = "yellow") {
												translate(v = [0, 2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [45, 0, 0]) {
															rotate(a = [0, 45, 0]) {
																translate(v = [0, 0, -8.5]) {
																	translate(v = [-8.275353858384635, 0, 0]) {
																		cube(size = [17.0, 17.0, 17.0]);
																	}
																}
															}
														}
													}
												}
											}
											color(alpha = 1.0, c = "red") {
												translate(v = [0, -2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [-45, 0, 0]) {
															translate(v = [0, -17.0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						rotate(a = [0, 0, 60]) {
							translate(v = [0, 0, -4.5]) {
								difference() {
									cuboid(size = [33.10141543353854, 2.5, 17.0]);
									color(alpha = 1.0, c = "yellow") {
										translate(v = [0, 2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [45, 0, 0]) {
													rotate(a = [0, 45, 0]) {
														translate(v = [0, 0, -8.5]) {
															translate(v = [-8.275353858384635, 0, 0]) {
																cube(size = [17.0, 17.0, 17.0]);
															}
														}
													}
												}
											}
										}
									}
									color(alpha = 1.0, c = "red") {
										translate(v = [0, -2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [-45, 0, 0]) {
													translate(v = [0, -17.0, 0]) {
														rotate(a = [0, 45, 0]) {
															translate(v = [0, 0, -8.5]) {
																translate(v = [-8.275353858384635, 0, 0]) {
																	cube(size = [17.0, 17.0, 17.0]);
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						translate(v = [0, -54.87580157860278, 0]) {
							translate(v = [0, 27.43790078930139, 0]) {
								rotate(a = [0, 0, 60]) {
									rotate(a = [0, 0, 60]) {
										translate(v = [0, 0, -4.5]) {
											difference() {
												cuboid(size = [33.10141543353854, 2.5, 17.0]);
												color(alpha = 1.0, c = "yellow") {
													translate(v = [0, 2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [45, 0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
												color(alpha = 1.0, c = "red") {
													translate(v = [0, -2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [-45, 0, 0]) {
																translate(v = [0, -17.0, 0]) {
																	rotate(a = [0, 45, 0]) {
																		translate(v = [0, 0, -8.5]) {
																			translate(v = [-8.275353858384635, 0, 0]) {
																				cube(size = [17.0, 17.0, 17.0]);
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
				translate(v = [-55.0, 0, 0]) {
					union() {
						translate(v = [0, 27.43790078930139, 0]) {
							rotate(a = [0, 0, 60]) {
								rotate(a = [0, 0, 60]) {
									translate(v = [0, 0, -4.5]) {
										difference() {
											cuboid(size = [33.10141543353854, 2.5, 17.0]);
											color(alpha = 1.0, c = "yellow") {
												translate(v = [0, 2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [45, 0, 0]) {
															rotate(a = [0, 45, 0]) {
																translate(v = [0, 0, -8.5]) {
																	translate(v = [-8.275353858384635, 0, 0]) {
																		cube(size = [17.0, 17.0, 17.0]);
																	}
																}
															}
														}
													}
												}
											}
											color(alpha = 1.0, c = "red") {
												translate(v = [0, -2.5, 0]) {
													translate(v = [0, 0, -9.75]) {
														rotate(a = [-45, 0, 0]) {
															translate(v = [0, -17.0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						rotate(a = [0, 0, 60]) {
							translate(v = [0, 0, -4.5]) {
								difference() {
									cuboid(size = [33.10141543353854, 2.5, 17.0]);
									color(alpha = 1.0, c = "yellow") {
										translate(v = [0, 2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [45, 0, 0]) {
													rotate(a = [0, 45, 0]) {
														translate(v = [0, 0, -8.5]) {
															translate(v = [-8.275353858384635, 0, 0]) {
																cube(size = [17.0, 17.0, 17.0]);
															}
														}
													}
												}
											}
										}
									}
									color(alpha = 1.0, c = "red") {
										translate(v = [0, -2.5, 0]) {
											translate(v = [0, 0, -9.75]) {
												rotate(a = [-45, 0, 0]) {
													translate(v = [0, -17.0, 0]) {
														rotate(a = [0, 45, 0]) {
															translate(v = [0, 0, -8.5]) {
																translate(v = [-8.275353858384635, 0, 0]) {
																	cube(size = [17.0, 17.0, 17.0]);
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						translate(v = [0, -54.87580157860278, 0]) {
							translate(v = [0, 27.43790078930139, 0]) {
								rotate(a = [0, 0, 60]) {
									rotate(a = [0, 0, 60]) {
										translate(v = [0, 0, -4.5]) {
											difference() {
												cuboid(size = [33.10141543353854, 2.5, 17.0]);
												color(alpha = 1.0, c = "yellow") {
													translate(v = [0, 2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [45, 0, 0]) {
																rotate(a = [0, 45, 0]) {
																	translate(v = [0, 0, -8.5]) {
																		translate(v = [-8.275353858384635, 0, 0]) {
																			cube(size = [17.0, 17.0, 17.0]);
																		}
																	}
																}
															}
														}
													}
												}
												color(alpha = 1.0, c = "red") {
													translate(v = [0, -2.5, 0]) {
														translate(v = [0, 0, -9.75]) {
															rotate(a = [-45, 0, 0]) {
																translate(v = [0, -17.0, 0]) {
																	rotate(a = [0, 45, 0]) {
																		translate(v = [0, 0, -8.5]) {
																			translate(v = [-8.275353858384635, 0, 0]) {
																				cube(size = [17.0, 17.0, 17.0]);
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		cuboid(rounding = 10, size = [120, 90, 30]);
	}
	translate(v = [-50.0, 35.0, -14.5]) {
		rotate(a = [180, 0, 0]) {
			color(alpha = 1.0, c = "#8080ff") {
				text3d(direction = "ltr", font = "SF Mono:style=Heavy", h = 1, language = "en", script = "latin", size = 5, text = "DFG 2025");
			}
		}
	}
}
