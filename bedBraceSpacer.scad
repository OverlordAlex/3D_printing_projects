// wooden part
/// width = 50
/// distance between = 70
/// height = 11.2

// metal frame
/// width = 32
/// height = 4.5

// update v2 
/// half width, less height, bigger jaws

totalLength = 10 + 50 + 10 + 50 + 10 + 50 + 10;
woodDepth = 12;
cutout = 5;
legDepth = 10 + cutout*2;

difference() {
    union() {
        /*intersection() {
            translate([0, 10/2, 0])
                rotate([0, 90, 0])
                    cylinder(totalLength, 10/2, 10/2);*/
            
            cube([10 + 50 + 10 + 50 + 10 + 50 + 10, 10, 5]);
        /*}*/

        translate([0, 0, -legDepth])
            cube([5, 10, legDepth]);
            
        translate([50 + 5, 0, -legDepth])
            cube([5, 10, legDepth]);
            
        translate([totalLength-5, 0, -legDepth])
            cube([5, 10, legDepth]);
            
        translate([totalLength-5-50-5, 0, -legDepth])
            cube([5, 10, legDepth]);
    }
        
    translate([0, 0, -legDepth+cutout])
        cube([totalLength, 5, cutout]);
}