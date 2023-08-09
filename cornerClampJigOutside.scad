include <triangleLib.scad>;

// 5cm clamping surface
// able to be used on internal and external corners

clampingSurface = 50;
width = 30;

sideLength = clampingSurface + width + (clampingSurface / sqrt(2));
height = 20;


difference() {
    union() {
        cube([sideLength, width, height]);
        cube([width, sideLength, height]);
        /*translate([width, width, 0])
            rightAngleTriangleByHypotenuse(clampingSurface, height);*/
        }
    #rightAngleTriangleByHypotenuse(clampingSurface/1.5, height);
        
    translate([width*2, width/2]) {
        for (i = [0:1:2]) {
            echo(i);
            translate([i * 20, 0])
                cylinder(height, width/4, width/4);
        }
    }
    translate([width/2, width*2]) {
        for (i = [0:1:2]) {
            echo(i);
            translate([0, i * 20])
                cylinder(height, width/4, width/4);
        }
    }
    
    // TODO cutout inside clamping corner
    // I think I need a 90 degree inside to clamp outside the corner
    translate([0, 0, height/4])
        cube([width*3, width*3, height/2]);
    
    // cut this badboy in half
   /* translate([0, 0, height/2])
        cube([sideLength,sideLength,height]);*/
}




