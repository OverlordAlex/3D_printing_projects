module spiral() {
    cube([30, 0.3, 0.3]);

    translate([30, 0])
        cube([0.3, 30, 0.3]);
        
    translate([0, 30])   
        cube([30.3, 0.3, 0.3]);

    translate([0, 5])     
        cube([0.3, 25, 0.3]);
        
    translate([0, 5])     
        cube([25, 0.3, 0.3]);
        
    translate([25, 5])     
        cube([0.3, 20, 0.3]);
        
    translate([5, 25])     
        cube([20.3, 0.3, 0.3]);    
        
    translate([5, 10])     
        cube([0.3, 15, 0.3]);
        
    translate([5, 10])     
        cube([10, 0.3, 0.3]);
        
    translate([15, 10])     
        cube([0.3, 10, 0.3]);
}

spiral();

translate([180, 180])
    spiral();

translate([0, 180])
    spiral();

translate([180, 0])
    spiral();
