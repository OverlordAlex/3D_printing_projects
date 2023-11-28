/*
36mm long
30mm wide 
13.5mm tallest
2.8 deep
*/
difference() {
    cube([40, 34, 5]);
    translate([2,2,2])
        cube([36, 30, 3]);
    
    translate([20, 17, 0])
        #cube([20, 11, 4], center=true);
}

