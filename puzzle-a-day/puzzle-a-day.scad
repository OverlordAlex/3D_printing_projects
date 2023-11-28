module l_piece(size = 14.9, roundover = 1) {
    // roundover is added to both sides
    roundoverTwice = roundover * 2 ;
    minkowski() {
        union() {
            translate([roundover, roundover]) {
                // overlap the two to ensure no gaps
                square([size - roundoverTwice, size * 4 - roundoverTwice]); // long side 1x4
                square([size * 2 - roundoverTwice, size - roundoverTwice]); // short side 2x1
            }
        }
        
        circle(roundover, $fn=360);
    }
}



l_piece();