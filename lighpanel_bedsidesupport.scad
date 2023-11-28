// holder
translate([4, 0])
    difference() {
        cube([17, 18, 20]);
        translate([0, 2, 0]) {
            cube([15, 18, 20]);
        }
    }

// back support
mainObj = [
    [-60, 0],
    [5, 0],
    [0, 60]
];

difference() {
    linear_extrude(20) {
        polygon(mainObj);
    }
    
    translate([55, 35]) {
        cylinder(20, 58, 58);
    }
    
    translate([-80, 80]) {
        cylinder(20, 80, 80);
    }
    
    translate([-25, -70]) {
        cylinder(20, 75, 75);
    }
    
    translate([-28, 60, 52]) {
        rotate([90, 0, 0]) {  
            cylinder(60, 40, 40);
        }
    }
    
    translate([-28, 60, -32]) {
        rotate([90, 0, 0]) {  
            cylinder(60, 40, 40);
        }
    }

}


