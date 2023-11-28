module taper_triangle(base=50, height=50, depth=10) {
    tri_points = [
        // bottom 3
        [0, 0, 0],
        [base, 0, 0],
        [base/2, height, 0],
        
        // top 2
        [0, 0, depth],
        [base, 0, depth]
    ];
    tri_faces = [
        [0, 1, 2], // bottom
        [0, 3, 4, 1], // back
        [2, 3, 0], // near
        [1, 4, 2], // far
        [3, 2, 4], // top
    ];
    polyhedron(tri_points, tri_faces, 4);
}

module ra_triangle(sidea=50, sideb=50, depth=10) {
    tri_points = [
        // base
        [0, 0, 0], 
        [0, 0, 0], 
        [0, 0, 0], 
    ]
}

module triangle(base=50, height=50, depth=10) {
    tri_points = [
        // bottom 3
        [0, 0, 0],
        [base, 0, 0],
        [base/2, height, 0],
        
        // top 3
        [0, 0, depth],
        [base, 0, depth],
        [base/2, height, depth],
    ];
    tri_faces = [
        [0, 1, 2], // bottom
        [0, 3, 4, 1], // back
        [2, 5, 3, 0], // near
        [1, 4, 5, 2], // far
        [3, 5, 4], // top
    ];
    polyhedron(tri_points, tri_faces, 4);
}

module eq_triangle(base=50, depth=10) {
    triangle(base, (sqrt(3)/2)*base, depth);
}


//$fa = 1;
//$fs = 0.4;

b_width = 50;
b_height = 10;
c_height = 35;

//base 
cube([b_width, b_width, b_height]);

// connector
translate([b_width/4, 0, b_height]) {
    cube([b_width/2, 5, c_height], false);
}
translate([0, 5, b_height+c_height]) {
    rotate([90, 60, 0]) {
        eq_triangle(b_width/4, b_height/2);
    }
}


// top
translate([0, 0, b_height+c_height]) {
    
    difference() {
        cube([50, 50, b_height]);
        // cuts
        translate([b_width/2, 0, b_height+2]) {
            rotate([0,180,0]) {
                taper_triangle(base=b_width, height=b_width, depth=b_height);
            }
        }
        translate([b_width+b_width/2, 0, b_height+2]) {
            rotate([0,180,0]) {
                taper_triangle(base=b_width, height=b_width, depth=b_height);
            }
        }
        translate([b_width*1.5, 0, b_height+1]) {
            rotate([0,180,0]) {
                taper_triangle(base=b_width*2, height=b_width*2, depth=b_height);
            }
        }
        // split
        translate([0, b_width, b_height]) {
            rotate([180,0,0]) {
                eq_triangle(base=b_width, depth=b_height);
            }
        }
    }  
}