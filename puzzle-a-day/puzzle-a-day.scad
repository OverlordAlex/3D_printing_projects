module L_piece(size = 14.9, roundover = 1) {
    // roundover is added to both sides
    roundoverTwice = roundover * 2 ;
    minkowski() {
        union() {
            translate([roundover, roundover]) {
                // overlap to ensure no gaps
                square([size - roundoverTwice, size * 4 - roundoverTwice]);
                square([size * 2 - roundoverTwice, size - roundoverTwice]);
            }
        }
        
        circle(roundover, $fn=360);
    }
}

module N_piece(size = 14.9, roundover = 1) { 
    // roundover is added to both sides
    roundoverTwice = roundover * 2 ;
    mirror([0, 1, 0]) { // flip because we need N not S
        minkowski() {
            union() {
                translate([roundover, roundover]) {
                    // overlap to ensure no gaps
                    square([size - roundoverTwice, size * 3 - roundoverTwice]);
                    square([size * 2 - roundoverTwice, size - roundoverTwice]);
                    translate([size, -size]) {
                        square([size - roundoverTwice, size * 2 - roundoverTwice]);
                    }
                }
            }
            
            circle(roundover, $fn=360);
        }
    }
}

module U_piece(size = 14.9, roundover = 1) {
    // roundover is added to both sides
    roundoverTwice = roundover * 2 ;
    minkowski() {
        union() {
            translate([roundover, roundover]) {
                // overlap to ensure no gaps
                square([size - roundoverTwice, size * 3 - roundoverTwice]);
                square([size * 2 - roundoverTwice, size - roundoverTwice]);
                translate([0, size * 2]) {
                    square([size * 2 - roundoverTwice, size - roundoverTwice]);
                }
            }
        }
        
        circle(roundover, $fn=360);
    }
}

module Z_piece(size = 14.9, roundover = 1) {
    // roundover is added to both sides
    roundoverTwice = roundover * 2 ;
    minkowski() {
        union() {
            translate([roundover, roundover]) {
                // overlap to ensure no gaps
                square([size - roundoverTwice, size * 3 - roundoverTwice]); // long side 1x3
                square([size * 2 - roundoverTwice, size - roundoverTwice]); // short side 2x1
                translate([-size, size * 2]) {
                    square([size * 2 - roundoverTwice, size - roundoverTwice]); // short side 2x1
                }
            }
        }
        
        circle(roundover, $fn=360);
    }
}

module V_piece(size = 14.9, roundover = 1) {
    // roundover is added to both sides
    roundoverTwice = roundover * 2 ;
    minkowski() {
        union() {
            translate([roundover, roundover]) {
                // overlap to ensure no gaps
                square([size - roundoverTwice, size * 3 - roundoverTwice]);
                square([size * 3 - roundoverTwice, size - roundoverTwice]);
            }
        }
        
        circle(roundover, $fn=360);
    }
}

module P_piece(size = 14.9, roundover = 1) {
    // roundover is added to both sides
    roundoverTwice = roundover * 2 ;
    minkowski() {
        union() {
            translate([roundover, roundover]) {
                // overlap to ensure no gaps
                square([size * 2 - roundoverTwice, size * 2 - roundoverTwice]);
                translate([0, size]) { // actually a mirror P
                    square([size * 3 - roundoverTwice, size - roundoverTwice]);
                }
            }
        }
        
        circle(roundover, $fn=360);
    }
}

module Y_piece(size = 14.9, roundover = 1) {
    // roundover is added to both sides
    roundoverTwice = roundover * 2 ;
    minkowski() {
        union() {
            translate([roundover, roundover]) {
                // overlap to ensure no gaps
                square([size * 4 - roundoverTwice, size - roundoverTwice]);
                translate([size, -size]) { // a mirror Y
                    square([size - roundoverTwice, size * 2 - roundoverTwice]);
                }
            }
        }
        
        circle(roundover, $fn=360);
    }
}

Y_piece();