// A4 - 416 589
//$fa = 36;
//$fs = 0.4;
/*$fn=10;

translate([0, 0, 100]) {

    difference() {
        scale([0.25, 0.25, 0.1]) {
            surface(file = "1.png", invert = true);
        }
        translate([0, 0, -15])
            cube([416, 589, 10]);
    }

    difference() {
        scale([0.25, 0.25, 0.2]) {
            surface(file = "2.png", invert = true);
        }
        translate([0, 0, -25])
            cube([416, 589, 20]);
    }

    difference() {
        scale([0.25, 0.25, 0.3]) {
            surface(file = "3.png", invert = true);
        }
        translate([0, 0, -35])
            cube([416, 589, 30]);
    }

    difference() {
        scale([0.25, 0.25, 0.4]) {
            surface(file = "4.png", invert = true);
        }
        translate([0, 0, -45])
            cube([416, 589, 40]);
    }
}*/
difference() {
    //translate([0, 0, 0])
        //scale([0.25, 0.25, 0.01]) 
                 
    
    //scale([0.25, 0.25, 0.01]) ]
    //translate([0, 0, 100])
        surface(file = "invert.png", invert = false);
        
 cube([416, 589, 1]);  
}