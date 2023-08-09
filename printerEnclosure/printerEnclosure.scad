include <../libs/triangles.scad>;
include <../libs/butt_hinges.scad>;

$fs=0.01;

table_leg_width = 50.1;
table_base_width = 550;

module screw(length = 24) {
    // 16, 20, 24, 45   x 3.8
    cylinder(length, d=2.8, center=true);
    translate([0, 0, length/2])
        cylinder(4.5, 2.8/2, 7.85/2);
}

module tableLeg() {
    height = 400;
    cube([table_leg_width, table_leg_width, height]);
}

module tableBase() {
    height = 50;
    cube([table_base_width, table_base_width, height]);
}
module label(text) {
    rotate([90, 0, 0]) 
        text(str(text, "B"), 50);
    translate([0, 0, 350])
        rotate([90, 0, 0])
            text(str(text, "T"), 50);
}

module fan() {
    width = 120;
    thickness = 25;
    color([0,0,0])
        cube([width, thickness, width]);
}
module temp_controller() {
    color([0,0,0])
        cube([145, 20, 105]);
}

module wire() {
    diameter = 7;
    translate([0, 0, diameter])
        rotate([0, 90, 0])
            cylinder(100, diameter, diameter);
}

module table(space_below = 0, space_above = 0, base = false) {
    space_below = base ? (50 + space_below) : space_below;
    // base
    if (base == true) {
        color([0, 0.5, 1, 0.2])
            tableBase();
    }
    total_height = space_below + space_above + 400;
    
    // legs and top
    color([0, 0, 1, 0.4]) {
        translate([0, 0, space_below]) {
            tableLeg();
            label("FL");
            
            translate([table_base_width-table_leg_width, 0]) {
                tableLeg();
                label("FR");
            }
            
            translate([0, table_base_width-table_leg_width]) {
                tableLeg();
                label("BL");
            }
            
            translate([table_base_width-table_leg_width, table_base_width-table_leg_width]) {
                tableLeg();
                label("BR");
            }
        }
        
        translate([0, 0, total_height])
            tableBase();
    }
    
    // back plywood
    translate([table_leg_width, table_base_width - corner_brace_width]) {
        rotate([90, 0, 0]) {
            color([0, 1, 0, 1])
                cube([table_base_width - table_leg_width - table_leg_width, total_height, plywood_thickness]);
            color([1, 0, 1, 1])
                text(str(table_base_width - table_leg_width - table_leg_width, " x ", total_height), 50);
        }
    }
    
    // right plywood
    translate([table_base_width - plywood_thickness - corner_brace_width, table_leg_width]) {
        rotate([90, 0, 90]) {
            color([0, 1, 0, 1])
                cube([table_base_width - table_leg_width - table_leg_width, total_height, plywood_thickness]);
            color([1, 0, 1, 1])
                text(str(table_base_width - table_leg_width - table_leg_width, " x ", total_height), 50);
        }
    }
    
    // left glass
    /*translate([corner_brace_width, table_leg_width]) {
        rotate([90, 0, 90]) {
            color([0, 0.5, 1, 0.4])
                cube([table_base_width - table_leg_width - table_leg_width, total_height, plexiglass_thickness]);
            color([1, 0, 1, 1])
                text(str(table_base_width - table_leg_width - table_leg_width, " x ", total_height), 50);
        }
    }*/
    
    // front glass
    /*translate([table_leg_width, plexiglass_thickness]) {
        rotate([90, 0, 0]) {
            color([0, 0.5, 1, 0.4])
                cube([table_base_width - table_leg_width - table_leg_width, total_height, plexiglass_thickness]);
            color([1, 0, 1, 1])
                text(str(table_base_width - table_leg_width - table_leg_width, " x ", total_height), 50);
        }
    }*/
    
    // fans
    translate([table_base_width, table_base_width-table_leg_width - 120]) {
        rotate([0, 0, 90])
            fan();
        translate([0,0,total_height-120])
            rotate([0,0,90])
                fan();
    }
    
    // controller
    translate([table_base_width, (table_base_width/2)-table_leg_width-120, total_height / 2]) 
        rotate([0, 0, 90])
            temp_controller();
    
    // wire escape
    translate([table_base_width - table_leg_width, table_base_width - table_leg_width/2])
        wire();
}

// everything to happen inside the footprint

plywood_thickness = 16;
plexiglass_thickness = 4;
top_height = 50;
bottom_height = top_height;
corner_brace_width = 2;

table_attach_tab_size = 12;

module tableAttachTab(hole = false) {
    if (hole) {
        intersection() {
            translate([table_attach_tab_size/2, table_attach_tab_size/2, -14.5])
                screw(24);
            cube([table_attach_tab_size, table_attach_tab_size, corner_brace_width]);
            }
    } else {
        difference() {
            cube([table_attach_tab_size, table_attach_tab_size, corner_brace_width]);
            translate([table_attach_tab_size/2, table_attach_tab_size/2, -14.5])
                screw(24);
        }
    }
    
 
}

module BLT() {
    cube([table_leg_width, table_leg_width, top_height]);
    
    // plywood
    translate([table_leg_width, table_leg_width - corner_brace_width, top_height])
        rotate([-90, 0, 0]) 
            rightAngleTriangle(top_height, top_height, corner_brace_width);
    translate([table_leg_width, table_leg_width - corner_brace_width*2 - plywood_thickness, top_height])
        rotate([-90, 0, 0]) 
            rightAngleTriangle(top_height, top_height, corner_brace_width);
        
        
    // plexiglass
    translate([0, 0, top_height])
        rotate([-90, 0, -90]) 
            rightAngleTriangle(top_height, top_height, corner_brace_width);
    
    translate([plexiglass_thickness + corner_brace_width, 0, top_height])
        rotate([-90, 0, -90]) 
            rightAngleTriangle(top_height, top_height, corner_brace_width);
            
    plexi_holder_width = plexiglass_thickness + corner_brace_width*2;
    plexiglas_side = table_leg_width - plexi_holder_width;
    
    ply_holder_width = plywood_thickness + corner_brace_width*2;
    ply_side = table_leg_width - ply_holder_width;

    // tabs to attach to leg
    translate([plexi_holder_width-corner_brace_width, -corner_brace_width, - table_attach_tab_size])
        cube([plexiglas_side + corner_brace_width, corner_brace_width, top_height + table_attach_tab_size]);
        
    difference() {
        translate([table_leg_width, -corner_brace_width, - table_attach_tab_size]) {
            cube([corner_brace_width, ply_side + corner_brace_width*2, top_height + table_attach_tab_size]);
        }
        
        translate([table_leg_width, ply_side - table_attach_tab_size]) {
            rotate([0, 90, 0]) {
                tableAttachTab(true);
            }
        }
    }
    
    // tabs to attach to top
    translate([plexi_holder_width, -table_attach_tab_size - corner_brace_width, top_height])
        mirror([0,0,1]) tableAttachTab();
    translate([table_leg_width + corner_brace_width, table_leg_width - ply_holder_width - table_attach_tab_size, top_height])
        mirror([0,0,1]) tableAttachTab();
    
}

module BLB() {
    translate([0, 0, bottom_height])
    mirror([0, 0, 1])
        BLT();
}


module FLB() {
    cube([table_leg_width, table_leg_width, bottom_height]);
    
    // side plexi
    translate([corner_brace_width, table_leg_width])
        rotate([0, -90, 0])
            rightAngleTriangle(top_height, top_height, corner_brace_width);
    translate([2*corner_brace_width + plexiglass_thickness, table_leg_width])
        rotate([0, -90, 0])
            rightAngleTriangle(top_height, top_height, corner_brace_width);
    
    // front plexi, only supported on the one side
    translate([table_leg_width, plexiglass_thickness])
        rotate([0, -90, -90])
            rightAngleTriangle(top_height, top_height, corner_brace_width);
    
    side_plexi_holder_width = plexiglass_thickness + corner_brace_width*2;
    plexiglas_side = table_leg_width - side_plexi_holder_width;
    
    // tab to attach to leg
    translate([side_plexi_holder_width - corner_brace_width, table_leg_width]) {
        difference() {
            cube([plexiglas_side + 2*corner_brace_width, corner_brace_width, bottom_height + table_attach_tab_size]);  
        
            translate([0,0,bottom_height + table_attach_tab_size])
                rotate([-90, 0, 0]) {
                        tableAttachTab(true);
                }
        }
    }
    // spacer plate to bring side thickness out
    translate([table_leg_width, plexiglass_thickness])
        cube([corner_brace_width, table_leg_width-plexiglass_thickness, bottom_height]);  

    
    // tabs to attach to the bottom
    translate([side_plexi_holder_width, table_leg_width + corner_brace_width])
        tableAttachTab();
    translate([table_leg_width + corner_brace_width, corner_brace_width + plexiglass_thickness])
        tableAttachTab();
    
    translate([table_leg_width, table_leg_width, bottom_height])
        rotate([0, -90, 180])
            rightAngleTriangle(table_leg_width - plexiglass_thickness , table_attach_tab_size, corner_brace_width);
}

module FLT() {
    translate([0, 0, bottom_height])
    mirror([0, 0, 1])
        FLB();
}


module FRB() {
    cube([table_leg_width, table_leg_width, bottom_height]);
    
    //side plywood
    translate([table_leg_width, table_leg_width])
        rotate([0, -90, 0])
            rightAngleTriangle(bottom_height, bottom_height, corner_brace_width);
    translate([table_leg_width - corner_brace_width - plywood_thickness, table_leg_width])
        rotate([0, -90, 0])
            rightAngleTriangle(bottom_height, bottom_height, corner_brace_width);
    
    // hinge
    difference() {
        translate([0, -6])
            cube([table_leg_width, 6, bottom_height]);
        
        // cutout where the hinge will be
        translate([0, -6, bottom_height/2]) {
            rotate([90, 0, 00]) {
                //main();
                hinge_leaf(0);
                //hinge_leaf(1);
            }
        }
        
        // cleanup leftoever material
        translate([0, -6, 4])
            cube([table_leg_width/2, 6, bottom_height-8]);
    }
    // hinge extra triangle to leg
    translate([table_leg_width, 0, bottom_height])
        mirror([0,1,0])
            rotate([0, -90, 0])
                rightAngleTriangle(6, 6, table_leg_width);
    
    // plexiglass stop
    translate([0, plexiglass_thickness + corner_brace_width])
        rotate([0, -90, 90])
            rightAngleTriangle(bottom_height, bottom_height, corner_brace_width);  
  
    ply_holder_width = plywood_thickness + corner_brace_width*2;
    ply_side = table_leg_width - ply_holder_width;
    
    // tab to attach to leg
    translate([0, table_leg_width]) {
        difference() {
            cube([ply_side + corner_brace_width, corner_brace_width, bottom_height + table_attach_tab_size]);  
        
            translate([0, 0, bottom_height + table_attach_tab_size])
                rotate([-90, 0, 0]) {
                        tableAttachTab(true);
                }
        }
    }
    translate([0, plexiglass_thickness])
        cube([corner_brace_width, table_leg_width - plexiglass_thickness, bottom_height + table_attach_tab_size]);
    
    // tabs to attach to bottom
    translate([-table_attach_tab_size, plexiglass_thickness + corner_brace_width])
        tableAttachTab();
    translate([ply_side - table_attach_tab_size, table_leg_width + corner_brace_width])
        tableAttachTab();
}

module FRT() {
    
    difference() {
        union() {
            translate([0, 0, bottom_height]) {
                mirror([0, 0, 1]) {
                        cube([table_leg_width, table_leg_width, bottom_height]);
            
                        //side plywood
                        translate([table_leg_width, table_leg_width])
                            rotate([0, -90, 0])
                                rightAngleTriangle(bottom_height, bottom_height, corner_brace_width);
                        translate([table_leg_width - corner_brace_width - plywood_thickness, table_leg_width])
                            rotate([0, -90, 0])
                                rightAngleTriangle(bottom_height, bottom_height, corner_brace_width);
                        
                        // hinge
                        difference() {
                            translate([0, -6])
                                cube([table_leg_width, 6, bottom_height]);
                            
                            // cutout where the hinge will be
                            translate([0, -6, bottom_height/2]) {
                                rotate([90, 0, 00]) {
                                    //main();
                                    hinge_leaf(0);
                                    //hinge_leaf(1);
                                }
                            }
                            
                            // cleanup leftoever material
                            translate([0, -6, 4])
                                cube([table_leg_width/2, 6, bottom_height-8]);
                        }
                        // hinge extra triangle to leg
                        translate([table_leg_width, 0, bottom_height])
                            mirror([0,1,0])
                                rotate([0, -90, 0])
                                    rightAngleTriangle(6, 6, table_leg_width);
                        
                        // plexiglass stop
                        difference() {
                            translate([0, plexiglass_thickness + corner_brace_width])
                                rotate([0, -90, 90])
                                    rightAngleTriangle(table_attach_tab_size + corner_brace_width, table_attach_tab_size + corner_brace_width, corner_brace_width);  
                        
                            translate([-table_attach_tab_size - corner_brace_width, plexiglass_thickness])
                            cube(corner_brace_width);
                        }
                        ply_holder_width = plywood_thickness + corner_brace_width*2;
                        ply_side = table_leg_width - ply_holder_width;
                        
                        // tab to attach to leg
                        translate([0, table_leg_width]) {
                            difference() {
                                cube([ply_side + corner_brace_width, corner_brace_width, bottom_height + table_attach_tab_size]);  
                            
                                translate([0, 0, bottom_height + table_attach_tab_size])
                                    rotate([-90, 0, 0]) {
                                            tableAttachTab(true);
                                    }
                            }
                        }
                        translate([0, plexiglass_thickness])
                            cube([corner_brace_width, table_leg_width - plexiglass_thickness, bottom_height + table_attach_tab_size]);
                        
                        // tabs to attach to bottom
                        translate([-table_attach_tab_size, plexiglass_thickness ])
                            tableAttachTab();
                        translate([ply_side - table_attach_tab_size, table_leg_width + corner_brace_width])
                            tableAttachTab();
                }
            }

            translate([-box_width, table_leg_width + corner_brace_width - (17.5 + corner_brace_width), -table_attach_tab_size]) 
                // TODO print me separate! - warning - make sure hangers are included!!
                temp_modulator();
        }
        
        box_width = 68.5 + 2*corner_brace_width;
        depth = 17.5/3 + corner_brace_width + 0.1;
        // cut out hangers for the box
        translate([-box_width, table_leg_width - depth/2 + corner_brace_width, -table_attach_tab_size]) {
            translate([68.5+corner_brace_width+0.1, 0, 42.3/4 + 6])
                hanger(0.5);
            
            translate([68.5+corner_brace_width+0.1, 0, 42.3*3/4 + 6])
                hanger(0.5);
        }
    }
        
} 

module BRT() {
    cube([table_leg_width, table_leg_width, bottom_height]);
            
    //side plywood
    translate([0, bottom_height - corner_brace_width, bottom_height])
        rotate([-90, 90, 0])
            #rightAngleTriangle(bottom_height, bottom_height, corner_brace_width);

    translate([0, bottom_height - corner_brace_width - plywood_thickness - corner_brace_width, bottom_height])
        rotate([-90, 90, 0])
            #rightAngleTriangle(bottom_height, bottom_height, corner_brace_width);
    
    // brace for leg attachment
    plywood_length = table_leg_width - corner_brace_width*2 - plywood_thickness;
    difference() {
        translate([-corner_brace_width, -corner_brace_width, -table_attach_tab_size])
            cube([corner_brace_width, plywood_length + corner_brace_width, bottom_height + table_attach_tab_size]);
        
        translate([0, plywood_length-table_attach_tab_size, -table_attach_tab_size])
            rotate([0, -90, 0]) 
                tableAttachTab(true);
            
    }
    
    // top attach tabs
    translate([table_attach_tab_size/2, -table_attach_tab_size, bottom_height])
        mirror([0,0,1]) tableAttachTab();
    
    
    translate([-table_attach_tab_size-corner_brace_width, plywood_length-table_attach_tab_size, bottom_height])
    mirror([0,0,1]) tableAttachTab();
    
    // TODO print separately, including fan!
    // brace for fan
    /*size_to_fan_brace = table_leg_width - 25;
    difference() { // remove what will be the table brace
        translate([0, -corner_brace_width, -table_attach_tab_size]) 
            cube([size_to_fan_brace, corner_brace_width, bottom_height + table_attach_tab_size]);
        
        // cutout for tab
        translate([table_attach_tab_size/2, -corner_brace_width, bottom_height-corner_brace_width-0.1])
            cube([table_attach_tab_size, corner_brace_width, corner_brace_width+0.1]); // lil bit of tolerance
    }
    translate([size_to_fan_brace, 0, -table_attach_tab_size]) 
        rotate([-90, 0, 180])
            rightAngleTriangle(size_to_fan_brace, size_to_fan_brace, corner_brace_width);
    translate([table_leg_width - 25, -corner_brace_width, -(120-bottom_height)])
        cube([25, corner_brace_width, 120]);
    
    // the fan itself
    translate([table_leg_width - corner_brace_width, 0, bottom_height])
        rotate([0,90,-180])
            fan_housing();*/
}

module fan_housing() {
    width = 120;
    thickness = 25;
    ID = 16;
    fan_extrakerf = 4;
    thickness_tolerance = 0.1;
    existing = (thickness - ID) / 2 + thickness_tolerance;
    
    translate([0, 0, -existing]) {
        intersection() {
            difference() {
                cube([width, width, thickness]);
                
                translate([width/2, width/2])
                    cylinder(h = thickness, d = width + fan_extrakerf);
                
                // cut the top and bottom plastics
                cube([width, width, existing]);
                translate([0, 0, existing + ID - thickness_tolerance])
                    cube([width, width, existing]);
                
                // cut a fan holder slot
                distance = sqrt(60 * 60) - 40;
                translate([distance - sqrt(50), distance - sqrt(50), thickness/2])
                    rotate([0,0,45])
                        cube([10, 2.5, thickness], center=true);
                
                translate([width-(distance - sqrt(50)), distance - sqrt(50), thickness/2])
                    rotate([0,0,-45])
                        cube([10, 2.5, thickness], center=true);
            }
            
            // TODO /2 both for a single segment
            cube([width, width/2, thickness]);
        }
    }
    
}

module wireclip(r=3.75, thickness=2) {
    difference() {
            union() {
                difference() {
                    circle(r);
                    translate([thickness/2, 0])
                        circle(r - thickness/2 + 0.1);
                }
                translate([-r / 2, -r])
                    square([r / 2, r * 2]);
            }
            
            translate([-r , -r])
                square([r / 2, r * 2]);
    }
}

module top_wire_route(depth, thickness) {
    
    wire_width = 3.75;
    
    difference() {
        cube([68.5 + 2*thickness, depth, thickness]);
        
        // registration edge
        translate([0, depth - thickness - 0.01])
            cube([68.5 + 2*thickness - 8, thickness + 0.01, thickness]);
    }

    // from device
    translate([wire_width + 6.5, depth/3, thickness])
        rotate([0, -90, 90])
            linear_extrude(depth/3)
                wireclip(wire_width, thickness);
    
    // corner transition
    translate([wire_width + 6.5 + thickness*2, depth/3, thickness])
        rotate([0, 0, 90])
            rotate_extrude(angle=90)
                translate([thickness*2, 0, 0])
                    rotate([0, 0, 90])
                        wireclip();
    
    // to end
    rest= 68.5 - (2*thickness + 6.5 + wire_width + thickness*2);
    translate([rest + 6.5 + wire_width + thickness*2, depth/3 + thickness *2, thickness])
        rotate([0, -90, 0])
            linear_extrude(rest)
                wireclip(wire_width, thickness);
                        
    // corner transition
    translate([rest+ 6.5 + wire_width + thickness*2, depth/3+wire_width*2+0.5, thickness])
        rotate([0, 0, 270])
            rotate_extrude(angle=90)
                translate([thickness*2, 0, 0])
                    rotate([0, 0, 90])
                        wireclip();
                        
    // and out
    translate([rest + 6.5 + 2*wire_width + thickness*2+0.25, depth - wire_width*1/32 - 0.02, thickness])
        rotate([0, -90, 90])
            linear_extrude(depth/4)
                wireclip(wire_width, thickness);

}

module back_wire_route(length, thickness) {
    wire_width = 1.8;
    total_width = wire_width * 1.5 * 4 + wire_width/2;
    
    translate([-thickness/2, wire_width, wire_width/2])
        rotate([0, -90, 0]) {
            linear_extrude(length) {
                wires=4;
                for (i = [0:wires-1]) {
                    translate([0, i * (wire_width*1.5)]) {
                         wireclip(wire_width, thickness);
                    }
                }
            }
        }

    translate([-thickness/2, total_width])
        mirror([1,0,0])
            rotate([0, -90, 90])
                rightAngleTriangle(thickness/2, thickness/2, total_width);
    
    translate([-length - thickness/2, total_width ])
        rotate([0, -90, 90])
            rightAngleTriangle(thickness/2, thickness/2, total_width);

    
}


module hanger(tolerance = 0) {
    depth = 17.5/3 + corner_brace_width + tolerance;
    cube([table_leg_width/2, depth/2, depth/2]);

    translate([0, depth/2, depth/2])
        rotate([0,-90,180])
            rightAngleTriangle(depth/2, depth/2, table_leg_width/2);
            
    rotate([0,-270,0])
        rightAngleTriangle(depth/2, depth/2, table_leg_width/2);
}

module temp_modulator() {
    
    tolerance = 0.1;
    thickness = corner_brace_width;
    depth = 17.5 + thickness;
    
    difference() {
        cube([68.5 + 2*thickness, depth, 42.3 + 2*thickness]);
        
        // main board
        translate([thickness, 0, thickness])
            cube([68.5+tolerance, 17.5+tolerance, 42.3+tolerance]);
        
        // wire cutout
        translate([0, 0, 11 + thickness]) {
            cube([thickness, 15.5+tolerance, 20]);
        
            translate([thickness, 15.5+tolerance+thickness, 0])
                linear_extrude(20)
                    rotate([0,0,180])
                        difference() {
                            translate([0,-thickness])
                                square([thickness, thickness*2]);
                            circle(thickness-0.00001); // weird scad bug?
                        }
        }
    }
    
    // hangers
    translate([68.5+thickness+tolerance, depth - (17.5/3 + corner_brace_width)/2, 42.3/4 + 6])
        hanger();
    
    translate([68.5+thickness+tolerance, depth - (17.5/3 + corner_brace_width)/2, 42.3*3/4 + 6])
        hanger();
    
    
    translate([0,0,42.3 + 2*thickness]) {
        // TODO print separate!
        top_wire_route(depth, thickness);
        
        // registration edge 
        translate([0, depth - thickness])
            cube([68.5 + 2*thickness - 8.1, thickness, thickness]);
    }
    
    // TODO print separate
    // wire thickness is complicated, magic number since it doesnt matter
    translate([68.5 + 2*thickness, depth, (42.3 + 2*thickness + 11.7)/2])
        rotate([-90, 0, 0])
            back_wire_route(68.5, thickness);
    
}

//table(space_below = bottom_height, space_above = top_height, base = false );

translate([0, table_base_width - table_leg_width, 400 + 50])
    BLT(); // printed!

translate([0, table_base_width - table_leg_width])
    BLB(); // printed!


FLB(); // printed!

translate([0, 0, 400 + 50])
    FLT(); // in progress printing


translate([table_base_width - table_leg_width, 0])
    FRB();

translate([table_base_width - table_leg_width, 0, 400 + 50])
    FRT();


translate([table_base_width - table_leg_width, table_base_width - table_leg_width, 400 + 50])
    BRT();


// TODO design
////  BackRightBottom
////  

// TODO test prints
//// cable routers - can the cable go in, and is it held in place
//// fan mount - should be a tight tolerance fit

// TODO prints
////  FrontRightBottom
////  FrontRightTop
////    temp_modulator
////    top_wire_route
////    back_wire_route
////  Hinge * 2
////  cable management - use the 4 wire back temp module to print cable management
////                     can be used to test teh bigger module!
////  BackRightTop
////      fan mount















