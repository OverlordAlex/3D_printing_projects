$fa = 1;
$fs = 0.4;

//mm
length=100;
width=50;
height=40;



difference() {

    cube([width,length,height]);

    // 45 face
    rotate([45,0,0])
        cube([width, length, width]);
    translate([width/2, width, -3])
        rotate([45, 0, 0])
            cylinder(length/2, 4, 7);
            rotate([45, 0, 0])
    translate([width/2, width/4, -1])
        linear_extrude(1)
            text("45", halign="center");
   
    // back 30 face
    translate([width, length, 0])
        rotate([30, 0, 180])
            cube([width, length, width]);
    translate([width/2, width-5, -3])
        rotate([30, 0, 180])
            cylinder(length/2, 4, 7);
    translate([width/2, 2*width-10, 5])
        rotate([30, 0, 180])
            linear_extrude(1)
                text("30", halign="center");
                
    // cut out the sides            
    rotate([0,-60,0])
        cube([width, length, width]);
    translate([width, length, 0])
        rotate([0,-60,180])
            cube([width, length, width]);
   
   // flatten top
   translate([0,0,height-8])
    cube([width, length, width]);
}
