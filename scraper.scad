$fa=1;

module scraper() {
    difference() {
        cube([70, 30, 5]);

        translate([0, 0, 0])
            rotate([15, 0, 0])
                cube([70, 30, 5]);
        
        translate([0, 0, 2.5])
            rotate([5, 0, 0])
                cube([70, 30, 5]);
        
        for(i=[15:20:60]) {
            translate([i, 15, 0])
                rotate([0, 0, 30])
                    cylinder(5, 8, 8, $fn=3);
        }
    }
}

module handle() {
    translate([35, 30, 2.5])
        difference() {
            rotate([-90, 0, 0])
                cylinder(102, 7, 7);
            
            translate([-7.5, 0, 2.5])
                cube([15, 102, 10]);
            
            translate([-7.5, 0, -12.5])
                cube([15, 102, 10]);
        }
}


module affordances() {
    translate([0, 30, 0]) {     
        difference() {
            cube([30, 30, 5]);
            translate([0, 30, 0])
                cylinder(5, 30, 30);
        }

        translate([40, 0, 0])
            difference() {
            cube([30, 30, 5]);
            translate([30, 30, 0])
                cylinder(5, 30, 30);
        }
    }
}

module main_body() {
    scraper();
    handle();
    affordances();
}

difference() {
    main_body();
    
    // thumb place
    translate([15, 42, 19])
        rotate([0, 90, 0])
            cylinder(40, 15, 15);
    
    // speed holes
    translate([35, 50, -5])
        for(i=[15:20:75]) {
            translate([2, i, 0])
                rotate([0, 0, 180])
                    cylinder(50, 6, 6, $fn=3);
            translate([-2, i-10, 0])
                cylinder(50, 6, 6, $fn=3);
        }
}