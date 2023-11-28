width = 13.67;
length = 29.20;
depth = 3.84;

wall_thickness = 1.5;

//cut in half

difference() {
union() {
    difference() {
        cube([width + wall_thickness*2, length+ wall_thickness*2, depth+ wall_thickness*2]);

        // main body cutout
        translate([wall_thickness, wall_thickness, wall_thickness]) {
                cube([width, length, depth]);

        }
        
        // USB A port
        usb_width = 12.05;
        usb_length = 18.95;
        usb_depth = 4.5;
        
        translate([(width + wall_thickness*2)/2, -usb_length/2+wall_thickness, (depth+ wall_thickness*2)/2])
            cube([usb_width, usb_length, usb_depth], center=true);
        
        // USB C port
        usc_width = 6.84;
        usc_length = 10.6;
        usc_depth = 3.12;
        
        translate([(width + wall_thickness*2)/2, usc_length/2+length+wall_thickness, (depth+ wall_thickness*2)/2])
            cube([usc_width, usc_length, usc_depth], center=true);
    }

    translate([wall_thickness/2, length])
        rotate([90, 0, -90])
            linear_extrude(wall_thickness)
                text("32GB", size = 5);

    translate([width+wall_thickness*2+wall_thickness/2, wall_thickness*2])
        mirror([0,1,0])
            rotate([90,0,-90])
                linear_extrude(wall_thickness)
                    text("32GB", size = 5);
}

mirror([0,0,1])
    #translate([-5,-5, -depth/2])
        cube([40, 60, 8]);

/*#translate([-5,-5, depth/2])
    cube([40, 60, 8]);*/
}