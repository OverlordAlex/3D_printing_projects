include <triangleLib.scad>;
$fa=0.01;

// inner diameter 8 mm (but thinner?)
// OD 22mm
// thickness 7mm
// inner race ends at 11mm OD
ID = 8;
OD = 22;
width = 7;
raceOD = 11;

// 100mm between touches
// 20mm height for safety 
length = 100;

// bearing
/*translate([0, 0, width+0.5])
    linear_extrude(width)
        circle(d = OD);  */

/*        
// bearing pin
linear_extrude(width * 3 + 1.0 + 0.05)
    circle(d = ID - 0.05);

translate([(OD-(OD/2 + raceOD))/2 , 0])
    linear_extrude(width + 0.5)
        circle(d = raceOD);
  
// far side        
translate([0, length]) {
    // bearing pin
    linear_extrude(width * 3 + 1.0 + 0.05)
        circle(d = ID - 0.05);
    translate([(OD-(OD/2 + raceOD))/2 , 0])
        linear_extrude(width + 0.5)
           circle(d = raceOD);
}

difference() {
    union() {
        hull() {
            // bearing side capture
            linear_extrude(width)
                translate([-OD/6 , 0])
                    circle(d = OD);
            
            // far side        
            translate([0, length]) {

                // bearing side capture
                linear_extrude(width)
                    translate([-OD/6, 0])
                        circle(d = OD);
                
            }

            // connect sides 
            translate([0, -OD/2]) {
                cube([OD*2/3, length + OD, width]);
            }
        }
        translate([OD*2/3, -OD/2, width])
            rightAngleTriangle(ID, -ID, width/2);
    }
    
    // cut out middle
    translate([-40, (length + OD)/2-OD/2])
            cylinder(width, d=length+5);
    
    // cut out screw
    translate([OD*3/4, -OD/6, width*3/4])
        rotate([0, -90, 60]) {
            // 16, 20, 24, 45   x 3.8
            cylinder(16, d=2.8, center=true);
            translate([0, 0, 16/2])
                cylinder(4.5, 2.8/2, 7.85/2);
        }
}*/

///////////////////////////////////////////////////
translate([0, length, width * 3 + 1.0 + 0.15]) {
    rotate([180, 0, 0]) {
        difference() {
            union() {
                hull() {
                    // bearing side capture
                    linear_extrude(width)
                        translate([-OD/6 , 0])
                            circle(d = OD);
                    
                    // far side        
                    translate([0, length]) {

                        // bearing side capture
                        linear_extrude(width)
                            translate([-OD/6, 0])
                                circle(d = OD);
                        
                    }

                    // connect sides 
                    translate([0, -OD/2]) {
                        cube([OD*2/3, length + OD, width]);
                    }
                }
                // race supports
                translate([(OD-(OD/2 + raceOD))/2 , 0])
                    linear_extrude(width + 0.5)
                        circle(d = raceOD);   
                
                translate([0, length])
                    translate([(OD-(OD/2 + raceOD))/2 , 0])
                        linear_extrude(width + 0.5)
                            circle(d = raceOD);  
                
                // screw hole
                translate([OD*2/3, -OD/2, width])
                    rightAngleTriangle(ID, -ID, width/2);
            }
            
            // cut out middle
            translate([-40, (length + OD)/2-OD/2])
                    cylinder(width, d=length+5);

            // screw hole
            translate([OD*3/4, -OD/6, width*3/4])
                rotate([0, -90, 60]) {
                    // 16, 20, 24, 45   x 3.8
                    cylinder(16, d=2.8, center=true);
                    translate([0, 0, 16/2])
                        cylinder(4.5, 2.8/2, 7.85/2);
                }
        
            // bearing pin
            linear_extrude(width * 3 + 1.0 )
                circle(d = ID+0.05);
            translate([0, length]) {
                linear_extrude(width * 3 + 0.1)
                    circle(d = ID+0.05);
            }
        }     
    }
}

