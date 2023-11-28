$fa=1;

scale([0.5, 0.5, 0.75]) {
    difference() {
        union() {
            // handle
            minkowski() {
                difference() {
                    cylinder(10, 125, 125, center=true);
                    cylinder(10, 105, 105, center=true);
                    
                    translate([0, 100, 0])
                        cube([400, 200, 10], center=true);
                }
                sphere(5);
            }

            // bag holder
            minkowski() {
                translate([0, 10, 0])
                    cube([250, 20, 10], center=true);
                sphere(5);
            }
        }

        //slit
        translate([-25, 0, 0])
            rotate([0, 0, 45])
                cube([100, 2, 30], center=true);
        
        translate([0, -45, 0])
        cylinder(30, 45, 45, center=true);
    }
}