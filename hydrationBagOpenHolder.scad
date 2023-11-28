difference() {
    translate([0, 0, 2])
    minkowski() {
        linear_extrude(6) 
            hull() {
                translate([10, 0])
                    circle(d = 20);

                translate([70/2, 0])
                    circle(d = 35);

                translate([70-10, 0])
                    circle(d = 20);
            }

        sphere(2);
    }

    linear_extrude(10) { 
        translate([10, 0])
            circle(d = 12);

        translate([70/2, 0])
            circle(d = 25);

        translate([70-10, 0])
            circle(d = 12);
        
        translate([18, 8])
            circle(d = 6);
        translate([18, -8])
            circle(d = 6);
        
        translate([70-18, 8])
            circle(d = 6);
        translate([70-18, -8])
            circle(d = 6);
    }
}