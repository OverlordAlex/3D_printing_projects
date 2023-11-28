$fa = 1;
$fs = 0.4;

// registrations
#union() {
translate([0, 0, 4.5])
    cube([11.8, 11.8, 2]);

translate([6, 6, 1.5])    
    cylinder(3, 4.5, 5);

translate([0, 0, 4.5]) {
    // 7cm to top edge
    translate([0, -70])
        mirror([1, 0, 0])
            rotate([0,0,90]) {
                cube([70, 10, 2]);
                rotate([0, 90, 0])
                    cube([7.5, 10, 2]);
            }

    // 11cm to left edge
    translate([-110, 0]) {
        cube([110, 10, 2]);
        rotate([0, 90, 0])
            cube([7.5, 10, 2]);
    }
}
}


// main form

translate([6, 6, 1.5])
    difference() {
        translate([-6,-6])
            cube([12, 12, 3]);
        cylinder(3, 4.6, 5);
    }


// stick position/support
translate([42, 204-10, 3]){
    // 17.75 popsickle stick width
    difference() {
        cube([20, 20, 6], true);
        cube([18, 20, 6], true);
    }
}

// ice cream, with stick
// [80,200,2]
difference() {
    cube([84,204,6]);
    
    translate([0,0,1.5])
        cube([12, 12, 4.51]);
   
    translate([2,42])
        cube([80,160,6]);
    translate([42, 42])
        cylinder(6, 40, 40, false);
}

