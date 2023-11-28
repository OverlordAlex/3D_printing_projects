include <libs/triangles.scad>;

$fa=1;

bracketDepth = 1.85*2;
bracketlength = 99.8;
bracketWidth = 19.15;

OD = 110;
ID = 103.2; //.5
pipeThickness = (OD-ID)/2;

holeDiam = 4.55;
holeChamfer = 7.45;

module bracketArm() {  
    //holes
    // 7.75
    // 44.25
    // 80.7
    difference() {
        cube([bracketlength, bracketWidth, bracketDepth]);
        translate([bracketlength -(7.75 + holeDiam/2), bracketWidth/2]) {
            cylinder(bracketDepth, holeDiam/2, holeDiam/2);
            translate([0, 0, bracketDepth/2])
                cylinder(bracketDepth/2, holeChamfer/2, holeChamfer/2);
        }
        
        translate([bracketlength -(44.25 + holeDiam/2), bracketWidth/2]) {
            cylinder(bracketDepth, holeDiam/2, holeDiam/2);
            translate([0, 0, bracketDepth/2])
                cylinder(bracketDepth/2, holeChamfer/2, holeChamfer/2);
        }
        
        translate([bracketlength -(80.7 + holeDiam/2), bracketWidth/2]) {
            cylinder(bracketDepth, holeDiam/2, holeDiam/2);
            translate([0, 0, bracketDepth/2])
                cylinder(bracketDepth/2, holeChamfer/2, holeChamfer/2);
        }
    }
}

module bracket() {
    bracketArm();
    translate([bracketDepth, 0])
        rotate([0, -90, 0])    
            bracketArm();
}

module pipe() {
    pipeLength = 1000;
    
    difference() {
        cylinder(pipeLength, OD/2, OD/2);
        cylinder(pipeLength, ID/2, ID/2);
    }
}

module innerRing() {
    printThickness = 4;
    difference() {
        cylinder(8, ID/2, ID/2-0.2);
        cylinder(8, ID/2-printThickness, ID/2-printThickness);
    }
    for (angle = [0:120:360]) {
        rotate([0, 0, angle])
            translate([ID/2 - pipeThickness-10, -bracketWidth/2-5]) {
                difference() {
                    union() {
                        cube([10, bracketWidth+10, 8]);
                    }
                    #rightAngleTriangle(8, 10, 12);
                    translate([0, bracketWidth+10, 8])
                        rotate([180, 0, 0])
                            rightAngleTriangle(8, 10, 8);
                    
                    
                }
            }
    }
    

}



/*for (angle = [0:120:360]) {
    rotate([0, 0, angle])
        translate([ID/2 - pipeThickness, -bracketWidth/2]) {
            bracket();
        }
}
translate([0, 0, 80.7+2.55])
    difference() {
        innerRing();
        
        for (angle = [0:120:360]) {
            rotate([0, 0, angle]) {
                translate([ID/2 - pipeThickness - 24, 0, 4]) {
                    rotate([0, 90, 0])
                        cylinder(32, 1.75, 1.75);
                }
                 translate([ID/2 - pipeThickness, -bracketWidth/2])
                    bracket();
            }
        }
    }*/
    
//pipe();
    
difference() {
    translate([OD/2 + pipeThickness, -bracketWidth/2]) {
        translate([bracketDepth, 0]) {
                    translate([-3.7, -5, 0]){
                        difference() {
                            cube([7, bracketWidth+10, 10]);
                            translate([0, 4.9, 0])
                            cube([bracketlength, bracketWidth+0.2, bracketDepth]);
                        }
                    }
            
                rotate([0, -90, 0]) {
                    
                    
                    difference() {
                        translate([7,0])
                            cube([bracketlength-10, bracketWidth, bracketDepth]);
                        translate([bracketlength -(7.75 + holeDiam/2), bracketWidth/2]) {
                            cylinder(bracketDepth, holeDiam/2, holeDiam/2);
                            /*translate([0, 0, bracketDepth/2])
                                cylinder(bracketDepth/2, holeChamfer/2, holeChamfer/2);*/
                        }
                        
                        translate([bracketlength -(44.25 + holeDiam/2), bracketWidth/2]) {
                            cylinder(bracketDepth, holeDiam/2, holeDiam/2);
                            /*translate([0, 0, bracketDepth/2])
                                cylinder(bracketDepth/2, holeChamfer/2, holeChamfer/2);*/
                        }
                        
                        translate([bracketlength -(80.7 + holeDiam/2), bracketWidth/2]) {
                            cylinder(bracketDepth, holeDiam/2, holeDiam/2);
                            /*translate([0, 0, bracketDepth/2])
                                cylinder(bracketDepth/2, holeChamfer/2, holeChamfer/2);*/
                        }
                    
                }
            }
        }
    }      
}


