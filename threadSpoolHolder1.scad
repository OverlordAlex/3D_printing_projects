
module lowerSpool(x, y, wallThick){
    spoolDiam = 20.45;
    spoolRad = spoolDiam / 2;
    spoolHeight = 11.45;
    doubleWall = wallThick * 2;
    
    rotate([90, 0, 0]) {
        difference() {
            cube([spoolDiam + doubleWall, spoolRad + doubleWall, spoolHeight + doubleWall]);

            translate([spoolDiam / 2 + wallThick, spoolDiam / 2 + wallThick, wallThick]) {
                cylinder(spoolHeight, r=spoolRad);
            }
            
            translate([spoolDiam / 2 + wallThick, spoolDiam / 2 + wallThick * 4, 0]) {
                cylinder(spoolHeight + doubleWall, r=spoolRad);
            }
        }
    }   
}

module normalSpool(x, y, wallThick) {
    spoolDiam = 19.3;
    spoolRad = spoolDiam / 2;
    spoolHeight = 56;
    doubleWall = wallThick * 2; 
    
    rotate([90, 0, 0]) {
        difference() {
            cube([spoolDiam + doubleWall, spoolRad + doubleWall, spoolHeight + doubleWall]);

            translate([spoolDiam / 2 + wallThick, spoolDiam / 2 + wallThick, wallThick]) {
                cylinder(spoolHeight, r=spoolRad);
            }
            
            translate([spoolDiam / 2 + wallThick, spoolDiam / 2 + wallThick * 4, 0]) {
                cylinder(spoolHeight + doubleWall, r=spoolRad);
            }
        }
    }   
}

wallThickness=1;

normalSpool(0, 0, wallThickness);

translate([19.3+wallThickness*2, 0 , 0]) {
    lowerSpool(0, 0 , wallThickness);
    
        translate([0, -56  + 11.45 , 0]) {
        lowerSpool(0, 0 , wallThickness);
    }
}