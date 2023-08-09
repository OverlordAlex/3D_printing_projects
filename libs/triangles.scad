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







