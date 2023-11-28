

thinThreadHeight = 57.5;
thinThreadDiam = 19.3;
thinThreadRad = thinThreadDiam / 2;

lowerBobbinDiam = 20.45;
lowerBobbinRad = lowerBobbinDiam / 2;
lowerBobbinHeight = 11.45;

wallThickness = 1;
doubleWall = wallThickness * 2;

boxHeight = thinThreadDiam / 2;

totalWidth = (2 * thinThreadDiam) + lowerBobbinDiam + (3 * doubleWall);
totalHeight = thinThreadHeight + (doubleWall);
 

module twoThinTwoBobbin(x, y, z) { 
    translate([x, y, z]) {
        difference() {
            cube([totalHeight, totalWidth , boxHeight]);

            // cutout for the left thread holder
            translate([wallThickness, wallThickness + thinThreadRad, wallThickness + thinThreadRad]) {
                rotate([0, 90, 0]) {
                    cylinder(thinThreadHeight, r=thinThreadRad);
                }
                
            }

            // cutout for the right thread holder
            translate([wallThickness, totalWidth - wallThickness - thinThreadRad, wallThickness + thinThreadRad]) {
                rotate([0, 90, 0]) {
                    cylinder(thinThreadHeight, r=thinThreadRad);
                }
            }
            
            // cut a finger grab through the width for the thin bobbins
            breakoutTransferseWidth = ((totalHeight - (2*lowerBobbinHeight)) - (8*doubleWall));
            translate([totalHeight/2 - breakoutTransferseWidth/2, 0, boxHeight]) {
                rotate([270, 0, 0]) {
                        cylinder(totalWidth, r=2*doubleWall);
                }
            }
            translate([totalHeight/2 + breakoutTransferseWidth/2, 0, boxHeight]) {
                rotate([270, 0, 0]) {
                        cylinder(totalWidth, r=2*doubleWall);
                }
            }    
            
            translate([totalHeight/2, totalWidth / 2, boxHeight]) {
                cube([breakoutTransferseWidth, totalWidth, 4*doubleWall], center=true);
            }

            
            
            // cutout for the top bobbin
            translate([doubleWall, totalWidth / 2, wallThickness + thinThreadRad]) {
                rotate([0, 90, 0]) {
                    cylinder(lowerBobbinHeight, r=lowerBobbinRad);
                }
            }
            
            // cutout for the bottom bobbin
            translate([totalHeight - (doubleWall + lowerBobbinHeight), totalWidth / 2, wallThickness + thinThreadRad]) {
                rotate([0, 90, 0]) {
                    cylinder(lowerBobbinHeight, r=lowerBobbinRad);
                }
            }
            
            // cutout finger grabbers for the smaller bobbins
            translate([0, totalWidth / 2 - 2*doubleWall, boxHeight]) {
                rotate([0, 90, 0]) {
                    cylinder(totalHeight, r=2*doubleWall); 
                }
            }        
            translate([0, totalWidth / 2 + 2*doubleWall, boxHeight]) {
                rotate([0, 90, 0]) {
                    cylinder(totalHeight, r=2*doubleWall); 
                }
            }   
            translate([totalHeight / 2, totalWidth / 2, boxHeight]) {
                cube([totalHeight, 4*doubleWall, 4*doubleWall], center = true);
            }    

            // cut out the center
            translate([totalHeight / 2, totalWidth / 2, boxHeight]) {
                cube(boxHeight*2+wallThickness, center=true);
                
            }
            
        }
    }
}

twoThinTwoBobbin(0, 0, 0);
difference() {
    twoThinTwoBobbin(0, totalWidth, 0);
    translate([0, totalWidth + thinThreadDiam + doubleWall, 0])
        cube([100, 100 , 45]);
}


           
        


