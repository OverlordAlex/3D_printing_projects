module rightAngleTriangle(side1, side2, height=0) {
    points = [[0, 0], [0, side1], [side2, 0]];
    
    if (height > 0) {
        linear_extrude(height)
            polygon(points);
    } else {
        polygon(points);
    }
}

module rightAngleTriangleByHypotenuse(hypotenuse, height=0) {
    sideLength = hypotenuse/sqrt(2);
    points = [[0, 0], [0, sideLength], [sideLength, 0]];
    
    if (height > 0) {
        linear_extrude(height)
            polygon(points);
    } else {
        polygon(points);
    }
}

module equilateralTriangleCentered(sideLength, height=0) {
    translate([sideLength/2, 0])
        equilateralTriangle(sideLength, height);
}

module equilateralTriangle(sideLength, height=0) {
    if (height > 0) {
        cylinder(height, sideLength, sideLength, $fn=3);
    } else {
        circle(sideLength, $fn=3);
    }
}

module diamond(sideLength, height=0) {
    rhombus(sideLength, sideLength, height);
}

module rhombus(longside, shortside, height=0) {
    rhomboid(longside, shortside, 60, height);
}

module rhomboid(longside, shortside, angle, height=0, center=false) {
    centerx = center ? -(longside + shortside*cos(angle))/2 : 0;
    centery = center ? -(shortside * sin(angle))/2 : 0;
    echo(centerx);
    echo(centery);
    
    points = [[0, 0], [longside, 0], [longside + shortside*cos(angle), shortside*sin(angle)], [shortside*cos(angle), shortside*sin(angle)]];

    translate([centerx, centery]) {
        if (height > 0) {
            linear_extrude(height)
                polygon(points);
        } else {
            polygon(points);
        }
    }
}



