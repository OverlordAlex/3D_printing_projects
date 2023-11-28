$fa = 1;
$fs = 0.4;

// mm
size=50;
height=40;

numpots_x=2;
numpots_y=2;

for (xpots=[0:1:numpots_x-1]) {
    for (ypots=[0:1:numpots_y-1]) {
        
        translate([xpots*size,ypots*size,0]) {
            
            difference() {
                // base
                intersection() {
                    translate([0, 0, 0]) {
                        cube([size,size,height]);
                    }
                    translate([size/2, size/2, 0]) {
                        cylinder(height, size, size/1.8);
                    }
                }

                /// cutout holder
                translate([size/2, size/2, 5]) {
                    // main
                    cylinder(36, 18, 18);
                    
                    // bevel
                    cylinder(36, 1, 22);
                }
                
                // cutout slider
                /*s_depth=5;
                s_height=5;
                translate([0, 0, height/4+s_height]) {
                    cube([size, s_depth, s_height/2]);
                }
                translate([0, s_depth/2, height/4+s_height/2]) {
                    cube([size, s_height/2, s_height/2]);
                }*/
                
            }
        }
    }
}