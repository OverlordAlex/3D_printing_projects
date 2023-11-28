
// lower bobbin threads
module lowerSpool(x, y, wallThick, boxHeight) {
    spoolDiam = 20.45;
    spoolRad = spoolDiam / 2;
    spoolHeight = 11.45;
    doubleWall = wallThick * 2;
    
    translate([x, y, 0]) {
        rotate([90, 0, 0]) {
            difference() {
                // the holding box
                cube([spoolDiam + doubleWall, boxHeight, spoolHeight + doubleWall]);
                // cutout for the thread
                translate([spoolDiam / 2 + wallThick, spoolDiam / 2 + wallThick, wallThick]) {
                    cylinder(spoolHeight, r=spoolRad);
                }
                // finger grab cutouts
                translate([spoolDiam / 2 + wallThick, spoolDiam / 2 + wallThick * 4, 0]) {
                    cylinder(spoolHeight + doubleWall, r=spoolRad);
                }
            }
        }   
    }
}

// thin but long spool of thread
module normalSpool(x, y, wallThick, boxHeight) {
    spoolDiam = 19.3;
    spoolRad = spoolDiam / 2;
    spoolHeight = 56;
    doubleWall = wallThick * 2;
    
    translate([x, y, 0]) {
        difference() {
            // the holding box
            rotate([90, 0, 0]) {
                cube([spoolDiam + doubleWall, boxHeight, spoolHeight + doubleWall]);
            }
            // cutout for the thread
            rotate([90, 0, 0]) {
                translate([spoolDiam / 2 + wallThick, spoolDiam / 2 + wallThick, wallThick]) {
                    cylinder(spoolHeight, r=spoolRad);
                }
            }
            // finger grab cutouts
            translate([-spoolRad, -spoolHeight/2 - wallThick, 30]) {
                    rotate([0, 90, 0]) {
                        cylinder((spoolRad + doubleWall) * 3, r = 24);
                    }
                }
        }  
    } 
}

wallThickness = 1;
boxHeight = 12;

thinThreadWidth = 19.3;
thinThreadHeight = 56;
lowerBobbinWidth = 20.45;
totalWidth = 2 * thinThreadWidth + lowerBobbinWidth + 6 * wallThickness;
totalHeight = thinThreadHeight + 2 * wallThickness;

intersection() {
   
    translate([0, -totalHeight, 0]) {
        cube([totalWidth, totalHeight, boxHeight]);
    }

    union() {
        normalSpool(0, 0, wallThickness, boxHeight);
        translate([19.3+wallThickness*2, 0 , 0]) {
            lowerSpool(0, 0 , wallThickness, boxHeight);
            
                translate([0, -56  + 11.45 , 0]) {
                    lowerSpool(0, 0 , wallThickness, boxHeight);
            }
        }
        normalSpool(19.3+20.45+4, 0, wallThickness, boxHeight);
    }
}



