include <helm_parameters.scad>

$fn = 64;

module mx_cutout_2d() {
    square([mx_cutout, mx_cutout], center = true);
}

module ec11_cutout_2d() {
    circle(d = ec11_bushing);
}

module m2_through_2d() {
    circle(d = m2_hole);
}

module helm_plate() {
    difference() {
        cube([plate_width, plate_depth, plate_thickness]);

        // 2x3 MX cutouts
        for (x = key_centers_x, y = key_centers_y)
            translate([x, y, -1])
                linear_extrude(height = plate_thickness + 2)
                    mx_cutout_2d();

        // EC11 bushing cutout
        translate([encoder_x, encoder_y, -1])
            linear_extrude(height = plate_thickness + 2)
                ec11_cutout_2d();

        // M2 screw through-holes
        for (p = screw_positions)
            translate([p[0], p[1], -1])
                linear_extrude(height = plate_thickness + 2)
                    m2_through_2d();
    }
}

helm_plate();
